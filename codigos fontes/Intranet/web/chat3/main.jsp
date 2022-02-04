<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<% 
//Se o nome de usuario ou a area forem nulos volta para a tela de login
if ( (usuario.getNome() == null || usuario.getNome().equals(""))  )
{
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>CHAT</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset rows="*,75" cols="*" framespacing="0" frameborder="NO" border="0">
  <frame marginheight="0" src="chat.jsp" name="chat" scrolling="auto" noresize >
  <frame src="" name="" scrolling="no">
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
