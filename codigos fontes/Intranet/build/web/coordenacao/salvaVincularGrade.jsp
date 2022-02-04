<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<jsp:useBean id="grade" scope="page" class="Intranet.GradeHoraria" /><jsp:setProperty name="grade" property="*" />
<%

String codGrade = request.getParameter("grade");
String codCurso = request.getParameter("curso");
String contador = request.getParameter("contador");

if ((codGrade!=null)&&(codCurso!=null)&&(contador!=null)){
    int intGrade= Integer.parseInt(codGrade); 
    int intcontador= Integer.parseInt(contador); 
    int cont1=0;
    int inserido1=0;
    int naoinserido=0;
    while(cont1 <= intcontador){
        String checkbox = Integer.toString(cont1);
	String codDisciplina= request.getParameter(checkbox);
        if (codDisciplina!=null){
            int intDisciplina= Integer.parseInt(codDisciplina); 
            boolean inserido = grade.CriarGradeDisciplina(intGrade,intDisciplina);
            if (inserido){
                inserido1++;
            }else{
                naoinserido++;
            }    
        }//codDisciplina!=null
    cont1++;
   }
    if ((naoinserido==0)&&(inserido1>0)){
        response.sendRedirect("vincularGrade.jsp?msg=salvo");
     }else{ 
         response.sendRedirect("vincularGrade.jsp?msg=erro");
    }
}
%>
