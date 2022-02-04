<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page session="true" %> 
<%@page import="javax.servlet.http.*"%>


<%
HttpSession sessao2 = request.getSession();

 if ( (usuario.getNome() == null || usuario.getNome().equals("")) )
{
	response.sendRedirect("login.jsp");
     }%>