<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<jsp:useBean id="turma" scope="page" class="Intranet.Turmas" /><jsp:setProperty name="turma" property="*" />
<jsp:useBean id="grade" scope="page" class="Intranet.GradeHoraria" /><jsp:setProperty name="grade" property="*" />
<jsp:useBean id="curso" scope="page" class="Intranet.Curso" /><jsp:setProperty name="curso" property="*" />
<jsp:useBean id="prof" scope="page" class="Intranet.Professor" /><jsp:setProperty name="prof" property="*" />
<%
String codigo = request.getParameter("codigo");
String nome = request.getParameter("nome");
String sala = request.getParameter("sala");
String horario = request.getParameter("horario");

String codGrade = request.getParameter("grade");
String codCurso = request.getParameter("curso");

String codGradeDisc = request.getParameter("disciplina");
String codProfessor = request.getParameter("professor");
String codDepartamento = request.getParameter("departamento");

if ((codigo!=null)&& (nome!=null)&& (sala!=null)&& (horario!=null)&& (codGradeDisc!=null)&& (codProfessor!=null)){
    codigo = codigo.toUpperCase();
    nome = nome.toUpperCase();
    sala = sala.toUpperCase();
    int intGrade= Integer.parseInt(codGradeDisc); 
    int intProfessor= Integer.parseInt(codProfessor); 

    boolean inserido = turma.criaTurma(codigo,nome,sala,horario,intGrade,intProfessor);
     if (inserido){
        boolean inserido2 = turma.criaTurmaVitual(codigo,nome,intProfessor);
        if (inserido2)
            response.sendRedirect("criarTurma.jsp?msg=salvo");
        
      }else{ 
                response.sendRedirect("criarTurma.jsp?msg=erro");
         }
}
%>
