<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="forum" scope="page" class="Intranet.Forum" />
<jsp:setProperty name="forum" property="*" />

<%
String post = request.getParameter("post");
String codForum = request.getParameter("codForum");
String codPessoa = request.getParameter("codPessoa");

int codTopico = Integer.parseInt(codForum);
int pessoa = Integer.parseInt(codPessoa);

String dataHoje;
java.util.Date dataHoje1 = new java.util.Date();

    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
    formatador.applyPattern("yyyy-MM-dd"); 
    dataHoje = formatador.format(dataHoje1);
    
    boolean inserido = forum.InserePost(post,dataHoje,codTopico,pessoa);
    if (inserido){   
        response.sendRedirect("discForumAbrir.jsp?msg=salvo&cod="+codTopico);
         }else{ 
            response.sendRedirect("discForumAbrir.jsp?msg=erro&cod="+codTopico);
        }    
%>

