<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="disc" scope="page" class="Intranet.DisciplinaVirtual" /><jsp:setProperty name="disc" property="*" />
<%
   // HttpSession sessao = request.getSession();
    String codCurso = null;
    sessao.setAttribute("codDisciplina", codCurso);
    response.sendRedirect("frame_menu_disc.jsp");%>
