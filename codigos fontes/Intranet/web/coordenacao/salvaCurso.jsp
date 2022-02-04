<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<jsp:useBean id="coord" scope="page" class="Intranet.Coordenacao" /><jsp:setProperty name="coord" property="*" />
<%
String codigo = request.getParameter("codigo");
String nome = request.getParameter("nome");
String versao = request.getParameter("versao");
String codCoordenacao = request.getParameter("coordenacao");

if ((codigo!=null)&& (nome!=null)&& (versao!=null)&& (codCoordenacao!=null)){
    codigo = codigo.toUpperCase();
    nome = nome.toUpperCase();
    versao = versao.toUpperCase();
    boolean inserido = coord.CriarCurso(codigo,codCoordenacao,versao,nome);
    if (inserido){
            response.sendRedirect("criarCurso.jsp?msg=salvo");
         }else{ 
            response.sendRedirect("criarCurso.jsp?msg=erro");
         }    
   
 }
%>
