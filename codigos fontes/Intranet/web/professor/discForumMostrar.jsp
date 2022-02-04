<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="forum" scope="page" class="Intranet.Forum" /><jsp:setProperty name="forum" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Fórum - Escolha um tópico abaixo
<hr align="left" class="titulo_form">
<table width="97%" border="1" >
  <%
    java.util.Date data33 =null;
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    ResultSet rs = forum.BuscarTopicos(codDisciplinaVirtual);
%>
  <tr>
    <td width="35%" class="letra_form">Título </td>
    <td width="15%" class="letra_form">Inserido em:</td>
    <td width="50%" class="letra_form">Comentário:</td>
  </tr>
  <% while (rs.next()){%>
  <tr>
    <td width="35%" class="letra_form"><a href="javascript:window.open('discForumAbrir.jsp?cod=<%=rs.getInt("cod_topico") %>','janela1','width=600,height=600,scrollbars=yes');void(null)""> <%=rs.getString("titulo_topico") %></a></td>
    <td width="15%" class="letra_form"><%SimpleDateFormat formatador1 = new SimpleDateFormat("yyyy-MM-dd");  
        String data1=rs.getString("data_insercao");
        try {
 		data33 = formatador1.parse(data1);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador1.applyPattern("dd/MM/yyyy"); 
        String dataInsercao = formatador1.format(data33);
        out.println(dataInsercao);%>
    </td>
    <td width="50%" class="letra_form"><%=rs.getString("conteudo_topico")%> </td>
    </td>
  </tr>
  <%}
%>
</table>
<hr class="titulo_form">
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
