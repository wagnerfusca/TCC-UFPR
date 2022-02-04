<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="banco" scope="page" class="Intranet.BancoQuestoes" /><jsp:setProperty name="banco" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Quest�es cadastradas
<hr align="left" class="titulo_form">
<table border="0" width="97%">
  <%
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    ResultSet rs = banco.BuscarQuestoes(codDisciplinaVirtual);
%>
  <tr>
    <td width="70%" class="letra_form">Pergunta: </td>
    <td width="30%" class="letra_form">Status: </td>
  </tr>
  <% while (rs.next()){
    String status = rs.getString("status");
%>
  <tr>
    <td class="letra_form"><%if (status.equals("T")){%>
      <a href="javascript:window.open('discQuestoesAbrir.jsp?cod=<%=rs.getString("cod_pergunta") %>','janela1','width=600,height=600,scrollbars=yes');void(null)"><%=rs.getString("pergunta") %></td>
    <td width="30%" class="letra_form"> QUEST�O N�O RESPONDIDA
      <%}else{%>
      <%=rs.getString("pergunta") %> - Resposta correta: <%=rs.getString("resposta_certa")%></td>
    <td width="30%" class="letra_form"> QUEST�O RESPONDIDA
      <%}%>
    </td>
  </tr>
  <tr>
    <td colspan="2"><hr align="left" ></td>
  </tr>
  <%}%>
</table>
<hr class="titulo_form">
<p align="center" class="path">� Universidade Federal do Paran� 2005 - Pol�tica de Privacidade</p>
</body>
</html>
