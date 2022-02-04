<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% // Faz o logoff do usuario
	ochat.removeUsuario(usuario); //remove o usuario do objeto ochat	
	session.removeAttribute("usuario"); // remove o usuario da sessao
	session.invalidate(); // invalida a sessao
	response.sendRedirect("login.jsp"); // vai para pagin de login

%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sair</title>
</head>
<body>

</body>
</html>