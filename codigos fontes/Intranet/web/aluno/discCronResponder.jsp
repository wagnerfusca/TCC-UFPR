<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="cronograma" scope="page" class="Intranet.CronogramaTarefa" /><jsp:setProperty name="cronograma" property="*" />
<jsp:useBean id="arquivo" scope="page" class="Intranet.Arquivo" /><jsp:setProperty name="arquivo" property="*" />
<%String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Tarefa não foi respondida com sucesso ");
        </script>
<%   }else{%>
<script language="JavaScript">
             alert ("Tarefa respondida com sucesso");
             window.close();
        </script>
<% }
}
String cod = request.getParameter("cod");
if (cod!=null){
    int codTarefa = Integer.parseInt(cod);
      ResultSet rs= cronograma.AbrirTarefa(codTarefa);
      while (rs.next()){
          String nomeDestinatario = rs.getString("nome_pessoa");
          int codDestinatario = rs.getInt("cod_pessoa");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Responder tarefa</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
        
         function Verifica(){
        if(document.form1.titulo.value==""){
		alert("Erro! O campo TITULO deve ser preenchido!");
		document.form1.titulo.focus();
		return false;
	}    
        
	if(document.form1.conteudo.value==""){
		alert("Erro! O campo CONTEÚDO tem que ser preenchido!");
		document.form1.conteudo.focus();
		return false;
	}    
        return true;
    } </script>
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Responder Tarefa</p>
<hr align="left" class="titulo_form" />
<form action="salvadiscCronResposta.jsp" name="form1" id="form1" method="post" enctype="multipart/form-data" onSubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Título:</span><br />
        <input name="titulo" type="text" id="titulo" size="60" maxlength="60" />
      </p>
    </div>
  </div>
  <div class="edit">
    <p><span class="letra_form">Resposta de: </span> <%=sessao.getAttribute("nome")%><br />
    </p>
  </div>
  <div class="edit"><span class="letra_form">Para</span> <%=nomeDestinatario%><br />
    <br />
  </div>
  </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Conte&uacute;do:</span><br />
      <textarea name="conteudo" cols="50" rows="5" class="input" id="conteudo"></textarea>
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Tipo Arquivo:</span>
     <select name="tipoarq" id="tipoarq" class="input">
        <option vaiue="">Selecione </option>
        <%   ResultSet rs3 = arquivo.buscarTipo();
                                    while (rs3.next()){%>
        <option value="<%=rs3.getString("tipoarquivo")%>"><%=rs3.getString("tipoarquivo")%> - <%=rs3.getString("descricao")%></option>
        <%}%>
      </select>
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Anexo:</span><br />
      <label>
      <input name="anexo" type="file" class="input" id="anexo" size="50" />
      </label>
    </p>
  </div>
  <div class="button" id="botao">
    <div align="center">
      <input type="submit"  value="Enviar" />
    </div>
  </div>
  </div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
<%}}%>
