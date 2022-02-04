<%@ page import="java.util.*,chat.*,java.text.*"%>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<jsp:useBean id="omod" scope="application" class="chat.Perguntas" />
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

<%//Lista todas as perguntas do objeto ochat e as deleta
for (int i = ochat.getPerguntas().size()-1; i > -1;i--)
{
    chat.Pergunta item = (chat.Pergunta)ochat.getPerguntas().get(i);
			  ochat.removePergunta(item);
}
//Lista todas as perguntas do objeto omod e as deleta
for (int i = omod.getPerguntas().size()-1; i > -1;i--)
{
    chat.Pergunta item = (chat.Pergunta)omod.getPerguntas().get(i);
			  omod.removePergunta(item);
}
		
//Lista todos os usuarios do objeto ochat e os deleta
	for (int i = ochat.getUsuarios().size()-1; i > -1;i--)
	  {
		chat.Usuario listausuario = (chat.Usuario)ochat.getUsuarios().get(i);
		 ochat.removeUsuario(listausuario);
	  }

response.sendRedirect("gravlog.jsp");	// vai para pagina gravalog.jsp para fazer o armazenamento das mensagens
											//que ainda nao tinham sido armazenadas.	
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Chat</title>
</head>
<body>
</body>
</html>