<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="banco" scope="page" class="Intranet.BancoQuestoes" /><jsp:setProperty name="banco" property="*" />
<%
String strPergunta = request.getParameter("codPergunta");
String resposta = request.getParameter("resp");
String strAluno = request.getParameter("codAluno");

int codPergunta= Integer.parseInt(strPergunta);
int codAluno = Integer.parseInt(strAluno);

    boolean inserido = banco.UpdateQuestao(codPergunta,codAluno,resposta);
    if (inserido){   
        boolean inserido2 = banco.UpdateStatus(codPergunta);
        
        response.sendRedirect("discQuestoesAbrir.jsp?msg=salvo&cod="+codPergunta);
        
         }else{ 
            response.sendRedirect("discQuestoesAbrir.jsp?msg=erro&cod="+codPergunta);
        }    
%>
<%=codPergunta%><%=codAluno%><%=resposta%>