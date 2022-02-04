<%@ page import="java.util.*,java.io.*,chat.*,java.text.*"%>
<jsp:useBean id="olog" scope="application" class="chat.Perguntas" />
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
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
<html>
<head>
<% 	

//Grava log de mensagens
  Date datalog = new Date();
//Cria um arquivo logperg.txt e armazena na pastas atual(realpath)
  FileWriter writer = new FileWriter(new File(getServletContext().getRealPath("logperg.txt")),true); 
  PrintWriter logperg = new PrintWriter(writer,true);
  logperg.println("Log armazenado no dia : " + datalog);
  for (int i = olog.getPerguntas().size()-1; i > -1;i--)
  {
      chat.Pergunta item = (chat.Pergunta)olog.getPerguntas().get(i);
	  if ((item.getTexto() != null) && (item.getTexto() != " "))
	  {
  logperg.print(item.getData()+ " - ");
  logperg.print(olog.arrumaEspaco(item.getUsuario().getArea(),6));
  logperg.print(olog.arrumaEspaco(item.getUsuario().getNome(),20)+ " - ");
  logperg.println(item.getTexto());
	  }
  }
  logperg.close();
  writer.close();
//Gravar log de usuarios
//Cria um arquivo loguser.txt e armazena na pastas atual(realpath)
  FileWriter writeruser = new FileWriter(new File(getServletContext().getRealPath("loguser.txt")),true);
  PrintWriter loguser = new PrintWriter(writeruser,true);
  loguser.println("Log armazenado no dia : " + datalog);
  for (Iterator i = olog.getUsuarios().iterator(); i.hasNext(); )
  {
     chat.Usuario logusuarios = (chat.Usuario)i.next();
	 loguser.print(logusuarios.getArea());	
	 loguser.print(olog.arrumaEspaco(logusuarios.getNome(),20) + " - ");
	 loguser.println(logusuarios.getIp());
  }
  loguser.close();
  writeruser.close();
  //Lista todas as perguntas do objeto olog e as deleta
  for (int i = olog.getPerguntas().size()-1; i > -1;i--)
 {
      chat.Pergunta item = (chat.Pergunta)olog.getPerguntas().get(i);
  	    olog.removePergunta(item);
  }

  //Lista todos os usuarios do objeto ochat e as deleta
  for (int i = olog.getUsuarios().size()-1; i > -1;i--)
  {
      chat.Usuario logusuarios = (chat.Usuario)olog.getUsuarios().get(i);
      int cont=0;
	  for (int x = ochat.getUsuarios().size()-1; x > -1;x--)
	  { 
			chat.Usuario chatusuarios = (chat.Usuario)ochat.getUsuarios().get(x);
			 if (logusuarios.getNome().equals(chatusuarios.getNome())) //Se o usuario ainda estiver logado nao deletar
				 {
				   cont=1;
				 }
	  }
		 if (cont == 0)
		 {
		   olog.removeUsuario(logusuarios);	 
	      }
	}
  
	response.sendRedirect("logok.jsp"); //vai para a pagina logok.jsp
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
</body>
</html>