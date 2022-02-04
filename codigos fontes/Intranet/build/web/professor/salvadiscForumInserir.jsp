<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="forum" scope="page" class="Intranet.Forum" /><jsp:setProperty name="forum" property="*" />
<%
     Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    
String titulo = request.getParameter("titulo");
String conteudo = request.getParameter("conteudo");

String dataHoje;
java.util.Date dataHoje1 = new java.util.Date();

    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
    formatador.applyPattern("yyyy-MM-dd"); 
    dataHoje = formatador.format(dataHoje1);
    
    boolean inserido = forum.InsereTopico(titulo,conteudo,dataHoje,codDisciplinaVirtual);
    if (inserido){   
        response.sendRedirect("discForumInserir.jsp?msg=salvo");
         }else{ 
            response.sendRedirect("discForumInserir.jsp?msg=erro");
        }    
%>
