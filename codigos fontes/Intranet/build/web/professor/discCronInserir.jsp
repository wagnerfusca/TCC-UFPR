<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.http.*"%>
<%@include file = "validaSessao.jsp"  %>
<%@page import="java.lang.*"%>
<jsp:useBean id="cronograma" scope="page" class="Intranet.CronogramaTarefa" /><jsp:setProperty name="cronograma" property="*" />
<jsp:useBean id="arquivo" scope="page" class="Intranet.Arquivo" /><jsp:setProperty name="arquivo" property="*" />
<%
    String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Tarefa n?o foi inserida ");
        </script>
<%   }else{%>
<script language="JavaScript">
             alert ("Tarefa inserida com sucesso");
        </script>
<% }
    } 
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
        
         function Verifica(){
        if(document.form1.titulo.value==""){
		alert("Erro! O campo TITULO deve ser preenchido!");
		document.form1.titulo.focus();
		return false;
	}    
        if(document.form1.validade.value==""){
		alert("Erro! O campo VALIDADE deve ser preenchido!");
		document.form1.validade.focus();
		return false;
	}    
	if(document.form1.conteudo.value==""){
		alert("Erro! O campo CONTE?DO tem que ser preenchido!");
		document.form1.conteudo.focus();
		return false;
	}    
        return true;
    } 
 
    function formatar(src, mask) 
    {
      var i = src.value.length;
      var saida = mask.substring(0,1);
      var texto = mask.substring(i)
    if (texto.substring(0,1) != saida) 
      {
            src.value += texto.substring(0,1);
      }
    }
/* Exemplos:
CEP OnKeyPress="formatar(this, '#####-###')"
CPF OnKeyPress="formatar(this, '###.###.###-##')"
DATA OnKeyPress="formatar(this, '##/##/####')"*/
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Inserir tarefa
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" enctype="multipart/form-data" action="salvadiscCronInserir.jsp" onSubmit="return Verifica()">
  <div>
  <div class="edit">
    <p><span class="letra_form">Disciplina: </span><%=sessao.getAttribute("nomeDisciplina")%><br />
    </p>
  </div>
  <div>
    <div class="edit">
      <p><span class="letra_form">T?tulo:</span>
        <input name="titulo" type="text" id="titulo" size="60" maxlength="60" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Validade:</span>
        <input name="validade" type="text" id="validade" size="15" maxlength="10" OnKeyPress="formatar(this, '##/##/####')" />
        S? N?MEROS </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Inserido por: </span><%=sessao.getAttribute("nome")%><br />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Conte?do:</span><br />
        <textarea name="conteudo" cols="60" rows="3" class="input" id="conteudo"></textarea>
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
        <input name="anexo" type="file" class="input" id="anexo" size="50" maxlength="80" />
        </label>
      </p>
    </div>
    <div class="button" id="botao">
      <div align="center">
        <input name="enviar" type="submit" id="enviar" value="Enviar" />
      </div>
    </div>
  </div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">? Universidade Federal do Paran? 2005 - Pol?tica de Privacidade</p>
</body>
</html>
