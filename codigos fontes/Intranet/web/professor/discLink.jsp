<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="link" scope="page" class="Intranet.Link" /><jsp:setProperty name="link" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Links Indicados
<hr align="left" class="titulo_form">
<table border="0" width="97%">
  <%
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    ResultSet rs = link.BuscarLinks(codDisciplinaVirtual);
%>
  <tr>
    <td width="30%" class="letra_form">Título </td>
    <td width="30%" class="letra_form">Endereço:</td>
    <td width="40%" class="letra_form">Comentário:</td>
  </tr>
  <tr>
    <td colspan="3"><hr></td>
  </tr>
  <% while (rs.next()){%>
  <tr>
    <td width="30%" class="letra_form"><%=rs.getString("titulo_material") %></td>
    <td width="30%" class="letra_form"><a href="<%=rs.getString("endereco_links")%>" target="_blank" >Clique aqui</a> </td>
    <td width="40%" class="letra_form"><%=rs.getString("conteudo_material")%> </td>
    </td>
  </tr>
  <tr>
    <td colspan="3"><hr></td>
  </tr>
  <%}
%>
</table>
<hr class="titulo_form">
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
