<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.*"%>

<%
HttpSession sessao = request.getSession();
    sessao.removeAttribute("nome");
    sessao.removeAttribute("logado");
    sessao.invalidate();
    response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //nao salva cache no servidor proxy

    response.sendRedirect("index.jsp");
    
%>