<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<jsp:useBean id="dep" scope="page" class="Intranet.Departamento" /><jsp:setProperty name="dep" property="*" />
<%

String codigo = request.getParameter("codigo");
String nome = request.getParameter("nome");
String periodo = request.getParameter("periodo");
String codDepartamento = request.getParameter("departamento");

if ((codigo!=null)&& (nome!=null)&& (periodo!=null)&& (codDepartamento!=null)){
    codigo = codigo.toUpperCase();
    nome = nome.toUpperCase();
    periodo= periodo.toUpperCase();
       
    boolean inserido = dep.CriarDisciplina(codigo,nome,periodo,codDepartamento);
    if (inserido){   
        response.sendRedirect("criarDisciplina.jsp?msg=salvo");
     }else{ 
        response.sendRedirect("criarDisciplina.jsp?msg=erro");
     }    
}%>
