<%@ page import="java.util.*,chat.*,java.text.*"%>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<jsp:useBean id="olog" scope="application" class="chat.Perguntas" />
<jsp:useBean id="omod" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<%
// Se o usuario nao for Administrador vai para proibido.jsp
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
   String teste = request.getParameter("check");
    if (teste != null)  // testa para ver se existe checkbox marcados
	{    
       String[] checks = request.getParameterValues("check"); //Recebe todas os checkbox marcados
          for ( int x = 0; x < checks.length; x++ ) 
       {	
         if (checks[x] != null)  //verifica se é diferente de nulo
    	  {
	   	    int    ncheck   = Integer.parseInt(checks[x]);  //transforma o string para inteiro
		    chat.Pergunta item = (chat.Pergunta)ochat.getPerguntas().get(ncheck); //encontra o item.
		    // compara o item do objeto ochat com o itemlog do objeto olog. 
			omod.addPergunta( new chat.Pergunta(item.getUsuario(),item.getTexto()));
			olog.addPergunta( new chat.Pergunta(item.getUsuario(),item.getTexto()));
			ochat.removePergunta(item);
	      }
     }
	}
 response.sendRedirect("modchat.jsp");     //vai para pagina limpamsg.jsp
   
%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
</body>
</html>