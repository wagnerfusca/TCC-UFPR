<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="arquivo" scope="page" class="Intranet.ArquivoPubl" /><jsp:setProperty name="arquivo" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Visualizar arquivos e publicações
<hr align="left" class="titulo_form">
<table  width="97%" border="0"  >
  <%
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    ResultSet rs = arquivo.BuscarArq(codDisciplinaVirtual);
%>
  <tr>
    <td width="30%" class="letra_form">Título </td>
    <td width="10%" class="letra_form">Arquivo:</td>
    <td width="50%" class="letra_form">Comentário:</td>
  </tr>
  <tr>
    <td colspan="3"><hr></td>
  </tr>
  <% while (rs.next()){%>
  <tr>
    <td width="30%" class="letra_form"><%=rs.getString("titulo_material") %></td>
    <td width="20%" class="letra_form"><a href="abrirAnexo.jsp?cod=<%=rs.getString("cod_arquivo")%>&tipo=<%=rs.getString("tipo_arquivo")%>&tipoclasse=arquivo" target="_blank" >Clique aqui</a> </td>
    <td width="50%" class="letra_form"><%=rs.getString("conteudo_material")%> </td>
    </td>
  </tr>
  <tr>
    <td colspan="3"><hr></td>
  </tr>
  <%}
%>
</table>
</table>
<hr class="titulo_form">
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
