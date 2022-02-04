<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="pessoa" scope="page" class="Intranet.Pessoa" /><jsp:setProperty name="pessoa" property="*" />
<%
String senha = request.getParameter("senha");
String novasenha = request.getParameter("nova");
String confirmacao = request.getParameter("confirmacao");
     Object pessoa2 =sessao.getAttribute("codPessoa");
     String pessoa1 = pessoa2.toString();
     int codPessoa = Integer.parseInt(pessoa1);
    if ((senha!=null)&&(novasenha!=null)&&(confirmacao!=null)){
        boolean rs = pessoa.UpdateSenha(senha,novasenha,codPessoa);
     if (rs){
        %>
<script language="JavaScript">
            alert ("Senha foi alterada com sucesso");
        </script>
<%  } else{%>
<script language="JavaScript">
             alert ("Senha  não foi alterada com sucesso");
        </script>
<% }
}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/JavaScript">

function Verifica(){
	if(document.form1.senha.value==""){
		alert("Erro! Digite a sua senha atual");
		document.form1.senha.focus();
		return false;
	}
		if(document.form1.nova.value==""){
		alert("Erro! Digite uma nova senha.");
		document.form1.nova.focus();
		return false;
	}
		if(document.form1.confirmacao.value==""){
		alert("Erro! Digite novamente a nova senha");
		document.form1.confirmacao.focus();
		return false;
	}
	if(document.form1.confirmacao.value!=document.form1.nova.value){
		alert("Erro! A nova senha não confere com a confirmação da senha");
		document.form1.confirmacao.focus();
		return false;
	}
return true;
} 

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Alterar senha</p>
<hr align="left" class="titulo_form" />
<form action="AlterarSenha.jsp" name="form1" id="form1" method="post"  onsubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Senha atual:</span><br />
        <input name="senha" type="password" class="input" id="senha" size="15" maxlength="10" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Nova Senha:</span><br />
        <input name="nova" type="password" class="input" id="nova" size="15" maxlength="10" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Confirmação da Nova Senha:</span><br />
        <input name="confirmacao" type="password" class="input" id="confirmacao" size="15" maxlength="10" />
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
