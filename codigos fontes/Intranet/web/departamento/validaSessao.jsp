<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page session="true" %> 
<%@page import="javax.servlet.http.*"%>

<%
HttpSession sessao = request.getSession();
String url = request.getRequestURI();
Object dep12 = sessao.getAttribute("url");
//if ((url.substring(10,21)).equals(dep12)){
if ((url.substring(1,13)).equals(dep12)){
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