<%@ page import="java.util.*,chat.*" %>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>CHAT</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="refresh" content="5; url=dialogos.jsp">
<link href="css_intranetst.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="Layer1" style="position:absolute; width:552px; height:350px; z-index:1; left: 22px; top: 13px; overflow:scroll;">
  <table width="518" border="1" >
    <%

  for (Iterator i = ochat.getPerguntas().iterator(); i.hasNext(); )
  {
     chat.Pergunta item = (chat.Pergunta)i.next();
%>
    <tr><td width="68"><%= item.getUsuario().getNome() %></td><td width="434"><%= item.getTexto() %> </td></tr>
    
<%
  }
%>
</table>
</div>

<div id="Layer2" style="position:absolute; width:200px; height:349px; z-index:2; left: 586px; top: 14px; overflow:auto;">
  <table width="100%" border="1">
  <%
  for (Iterator i = ochat.getUsuarios().iterator(); i.hasNext(); )
  {
     chat.Usuario usuario = (chat.Usuario)i.next();
  %>
    <tr>
      <td> <%= usuario.getArea()  %>/<%= usuario.getNome()  %></td>
      
    </tr>
    
<%
   }

%>

  </table>
</div>
</body>
</html>
