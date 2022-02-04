<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="coord" scope="page" class="Intranet.Coordenacao" /><jsp:setProperty name="coord" property="*" />
<%
String codCurso = request.getParameter("curso");
String codDepartamento = request.getParameter("departamento");
String codDisciplina = request.getParameter("disciplina");
if ((codCurso!=null)&& (codDepartamento!=null)&&(codDisciplina!=null)){
    boolean inserido = coord.CadastrarDisciplina(codCurso,codDisciplina);
    if (inserido){  
            response.sendRedirect("cadastrarDisciplinaCurso.jsp?msg=salvo");
     }else{ 
            response.sendRedirect("cadastrarDisciplinaCurso.jsp?msg=erro");
     }
 }
%>
