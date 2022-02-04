<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<%
    String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Questão não foi inserida ");
        </script>
<%   }else{%>
<script language="JavaScript">
             alert ("Questão inserida com sucesso");
        </script>
<% }
    } 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/JavaScript">
     function Verifica(){
        if(document.form1.pergunta.value==""){
		alert("Erro! O campo PERGUNTA deve ser preenchido!");
		document.form1.pergunta.focus();
		return false;
	}    
	if(document.form1.certa.value==""){
		alert("Erro! O campo RESPOSTA CERTA deve ser preenchido!");
		document.form1.certa.focus();
		return false;
	}    
	if(document.form1.conteudo.value==""){
		alert("Erro! O campo CONTEÚDO tem que ser preenchido!");
		document.form1.conteudo.focus();
		return false;
	}    
	if(document.form1.erro1.value==""){
		alert("Erro! O campo RESPOSTA ERRADA 1 deve ser preenchido!");
		document.form1.erro1.focus();
		return false;
	} 
	if(document.form1.erro2.value==""){
		alert("Erro! O campo RESPOSTA ERRADA 2 deve ser preenchido!");
		document.form1.erro2.focus();
		return false;
	} 
	if(document.form1.erro3.value==""){
		alert("Erro! O campo RESPOSTA ERRADA 3 deve ser preenchido!");
		document.form1.erro3.focus();
		return false;
	} 
	if(document.form1.erro4.value==""){
		alert("Erro! O campo RESPOSTA ERRADA 4 deve ser preenchido!");
		document.form1.erro4.focus();
		return false;
	} 
	
        return true;
    } 
</script>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Inserir questão
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="salvaQuestoesInserir.jsp" onSubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Pergunta:</span>
        <input name="pergunta" type="text" id="pergunta" size="60" maxlength="60" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Inserido por: </span><%=sessao.getAttribute("nome")%><br />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Disciplina: </span><%=sessao.getAttribute("nomeDisciplina")%><br />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Resposta Certa:</span>
        <textarea name="certa" cols="60" rows="2" class="input" id="certa"></textarea>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Comentários para a resposta certa:</span><br />
        <textarea name="conteudo" cols="60" rows="5" class="input" id="conteudo"></textarea>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Resposta errada 1</span>
        <textarea name="erro1" cols="60" rows="2" class="input" id="erro1"></textarea>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Resposta errada 2:</span>
        <textarea name="erro2" cols="60" rows="2" class="input" id="erro2"></textarea>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Resposta errada 3:</span>
        <textarea name="erro3" cols="60" rows="2" class="input" id="erro3"></textarea>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Resposta errada 4:</span>
        <textarea name="erro4" cols="60" rows="2" class="input" id="erro4"></textarea>
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
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
