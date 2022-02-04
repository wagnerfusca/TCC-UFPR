<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.lang.String"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="grade" scope="page" class="Intranet.GradeHoraria" /><jsp:setProperty name="grade" property="*" />
<%
String nome = request.getParameter("nome");
String codCurso = request.getParameter("curso");
if ((nome!=null)&&(codCurso!=null)){
    nome = nome.toUpperCase();
    boolean inserido = grade.CriarGrade(nome,codCurso);
    if (inserido){
            response.sendRedirect("criarGrade.jsp?msg=salvo");
         }else{ 
                response.sendRedirect("criarGrade.jsp?msg=erro");
         }
}
%>
