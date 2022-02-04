<%@ page import = "java.util.*,java.io.*,java.text.*" %>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" type="text/css" href="incl/nstl.css">
<script type="text/javascript" src="incl/cff.js"></script>
<title>Log de Usuarios</title>
</head>
<style type="text/css">
body{font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;color:#000000;background-color:#eeeeee}
.p{background-color:#ffffff}
.c{font-size:12px;font-weight:bold;color:#ffffff;background-color:#A09CA0}
.y{color:#333333;background-color:transparent}
A:link{color:#333333;background-color:transparent}
A:visited{color:#333333;background-color:transparent}
A:hover{color:#aaaaaa;background-color:transparent}
A:active{color:#aaaaaa;background-color:transparent}</style>
<body>
  <%
     FileReader reader = new FileReader(new File(getServletContext().getRealPath("loguser.txt")));
     BufferedReader leitor = new BufferedReader(reader);
     String linha = leitor.readLine(); %>
			 <table width="50%" border="0" cellpadding="0" cellspacing="0" align="center">
    			 <tr> 
   				    <td class="c" colspan="4" align="center">LOG</td>
  				 </tr>
			      <tr> 
          			<td width="100%" height="100%" valign="top">
<%	 while (linha != null) 
     {  
     	 String teste = linha.substring(0,1); 
         String arealog = linha.substring(0,5);
		 String nomelog = linha.substring(7,25);
		 String iplog = linha.substring(30);
		 if (teste.equals("L"))
			 { 
%>
		      <table width="100%" cellpadding="0">
		           <tr>&nbsp;
	        	   </tr>
				<tr class="b">	
					<td> <%= linha %></td>
				</tr>
				</table>
			  <table width="100%" border="0" cellpadding="1" cellspacing="1">
 			     <tr> 
			       <td width="30%" class="f" nowrap>&nbsp;Area&nbsp;</td>
			       <td width="40%" class="f">&nbsp;Nome&nbsp;</td>
			       <td width="30%" class="f">&nbsp;IP&nbsp;</td>
				</tr> 
		   	 </table>
<%		 
          	linha = leitor.readLine();
		 }
		 else {
%>
		<table width="100%" cellpadding="0">
		<tr class="b">	
		  <td width="30%"><%=arealog %></td>
          <td width="40%"><%= nomelog %></td>
          <td width="30%"> <%= iplog %></td>	
         </tr>
       </table>  
<%		  linha = leitor.readLine();	
		 }
     }
%>
<%	     
	 leitor.close();
	 reader.close();
%>

</body>
</html>