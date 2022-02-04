<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="dep" scope="page" class="Intranet.Departamento" /><jsp:setProperty name="dep" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Relatório - Disciplinas Cadastradas
<hr align="left" class="titulo_form">
<br />
<div class="edit">
  <table width="540" border="1" >
  <%Object codDep=sessao.getAttribute("codDepartamento");
    String codDepartamento = codDep.toString();
    ResultSet rs = dep.RelatorioDisciplina(codDepartamento);
    %>
    <tr>
      <td width="10%" class="letra_form">Cod: </td>
      <td width="30%" class="letra_form">Nome Discplina </td>
      <td width="30%" class="letra_form">Departamento Vinculado: </td>
      <td width="30%" class="letra_form">Período: </td>
    </tr>
    <% while (rs.next()){%>
    <tr>
      <td width="10%" class="letra_form"><%=rs.getString("cod_disciplina") %></td>
      <td width="30%" class="letra_form"><%=rs.getString("nome_disciplina")%></td>
       <td width="30%" class="letra_form"><%=rs.getString("nome_departamento")%></td>
       <td width="30%" class="letra_form"><%=rs.getString("periodo_disciplina")%></td>
      </tr>
    <%}%>
  </table>
</div>
<hr class="titulo_form">
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>