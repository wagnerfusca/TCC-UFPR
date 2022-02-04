<%@ page import="java.util.*,chat.*" %>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<%
      String nome = request.getParameter("nome");
      if ( nome != null )
      {
         usuario.setNome(nome);
         ochat.addUsuario(usuario);
         response.sendRedirect("chat.jsp");
      }
      
%>

<html>
<head>
<title>CHAT-->Login</title>
</head>
<body>
<form method="post"  >
 Nome : <input type="text" name="nome" value="" />
<br>
<br>
  <input name="Entrar" value="Entrar" type="submit" >
</form>
</body>
</html>
