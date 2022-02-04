<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<% // Se o usuario nao for Administrador vai para proibido.jsp
if (usuario.getSenha() == null || usuario.getSenha().equals(""))
	
   {
	response.sendRedirect("proibido.jsp");
	}
//Se o nome de usuario ou a area forem nulos volta para a tela de login
if ( (usuario.getNome() == null || usuario.getNome().equals("")) || (usuario.getArea() == null || usuario.getArea().equals("")))
{
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>Intranet Copel-->CHAT</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<frameset rows="*,75" cols="*" framespacing="0" frameborder="NO" border="0">  <%-- divide a tela em 2 --%>
  <frame marginheight="0" src="modchat.jsp" name="chat" scrolling="auto" noresize > <%--frame do chat no modulo moderador --%>
  <frame src="modinsert.jsp" name="insert" scrolling="no"> <%--Frame do insert no modulo moderador --%>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
