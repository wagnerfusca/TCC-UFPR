<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="biblio" scope="page" class="Intranet.BibliotecaDigital" /><jsp:setProperty name="biblio" property="*" />
<jsp:useBean id="arquivo" scope="page" class="Intranet.Arquivo" /><jsp:setProperty name="arquivo" property="*" />
<%
String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Monografia/Projeto não foi inserido ");
        </script>
<% }  if (msg.equals("erro1")){%>
<script language="JavaScript">
            alert ("Monografia/Projeto não foi inserido ");
        </script>
<%   }else{%>
<script language="JavaScript">
             alert ("Monografia/Projeto inserido com sucesso");
        </script>
<% }
}%>
<script language="JavaScript" type="text/JavaScript">
     function Verifica(){
        if(document.form1.titulo.value==""){
		alert("Erro! O campo TITULO deve ser preenchido!");
		document.form1.titulo.focus();
		return false;
	}    
	if(document.form1.autor.value==""){
		alert("Erro! O campo AUTOR deve ser preenchido!");
		document.form1.autor.focus();
		return false;
	}    
	if(document.form1.assunto.value==""){
		alert("Erro! O campo ASSSUNTO deve ser preenchido!");
		document.form1.assunto.focus();
		return false;
	} 
	if(document.form1.conteudo.value==""){
		alert("Erro! O campo CONTEÚDO tem que ser preenchido!");
		document.form1.conteudo.focus();
		return false;
	}    
	if(document.form1.tipoarq.value==""){
		alert("Erro! O campo TIPO DO ARQUIVO tem que ser selecionado!");
		document.form1.tipoarq.focus();
		return false;
	}  
	if(document.form1.anexo.value==""){
		alert("Erro! O campo ANEXO tem que ser preenchido!");
		document.form1.anexo.focus();
		return false;
	}  
        return true;
    } 
 
   
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Inserir monografia/projeto</p>
<hr align="left" class="titulo_form" />
<form action="salvabibliInsere.jsp" name="form1" id="form1" method="post" enctype="multipart/form-data"  onsubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Título: </span>
        <input name="titulo" type="text" id="titulo" size="60" maxlength="60" />
      </p>
    </div>
    <input name="coordenacao" type="hidden" value="<%=sessao.getAttribute("codCoord")%>">
    <div class="edit">
      <p><span class="letra_form">Autor: </span>
        <input name="autor" type="text" >
        </input>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Assunto:</span>
        <input name="assunto" type="text" >
        </input>
      </p>
    </div>
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Conte&uacute;do:</span>
      <textarea name="conteudo" cols="60" rows="5" class="input" id="conteudo"></textarea>
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
    <p><span class="letra_form">Anexo:</span>
      <label>
      <input name="anexo" type="file" class="input" id="anexo" size="40"/>
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
