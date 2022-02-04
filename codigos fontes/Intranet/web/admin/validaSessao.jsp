<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page session="true" %> 
<%@page import="javax.servlet.http.*"%>

<%
HttpSession sessao = request.getSession();
Object admin12 = sessao.getAttribute("url");
String url = request.getRequestURI();

//if ((url.substring(10,17)).equals(admin12)){
if ((url.substring(1,6)).equals(admin12)){
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