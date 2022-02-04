<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page session="true" %> 
<%@page import="javax.servlet.http.*"%>

<%
HttpSession sessao = request.getSession();
String url = request.getRequestURI();
Object prof12 = sessao.getAttribute("url");
//if ((url.substring(10,18)).equals(prof12)){
if ((url.substring(1,10)).equals(prof12)){
    if(sessao.getAttribute("logado")==null) {
        response.sendRedirect("../index.jsp");
    }else{
        if(sessao.getAttribute("logado").equals("true")){
        
        }else{
            response.sendRedirect("../index.jsp");
        }
    }
}else
      response.sendRedirect("../logoff.jsp");
%>