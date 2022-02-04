<%@ page import="java.util.*,chat.*,java.text.*"%>
<jsp:useBean id="olog" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="incl/nstl.css">
<script type="text/javascript" src="incl/modcff.js"></script>
<title>Log de Usuário</title>
<style type="text/css">
body{font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;color:#000000;background-color:#ffffff}
.p{background-color:#ffffff}
.c{font-size:12px;font-weight:bold;color:#ffffff;background-color:#A09CA0}
.y{color:#333333;background-color:transparent}
A:link{color:#333333;background-color:transparent}
A:visited{color:#333333;background-color:transparent}
A:hover{color:#aaaaaa;background-color:transparent}
A:active{color:#aaaaaa;background-color:transparent}</style>
</head>
<body>
<table width="50%" class="tbl" align="center"><tr><td align="center" valign="middle">
<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr><td class="p">
<table border="0" width="100%" cellpadding="5" cellspacing="1">
<tr><td class="c" colspan="4" align="center">CHAT --> Log dos usuários que entraram no chat</td></tr>
<tr>
  <td width="30%" align="center" class="f">&nbsp;Área</td>
  <td width="40%" align="center" class="f">Nome</td>
  <td width="30%" align="center" class="f">IP</td></tr>
		<%
			  for (Iterator i = olog.getUsuarios().iterator(); i.hasNext(); )
				  {
				     chat.Usuario listausuarios = (chat.Usuario)i.next();
		  %>
	    <tr>
          <td class="a" align="center"> <%= listausuarios.getArea()  %>&nbsp;
		  <td class="a" align="center"><b><%= listausuarios.getNome()  %></b>
		  <td class="a" align="center"> <%= listausuarios.getIp()  %>&nbsp;
	 <%
				  }
	 %>
          
</table></td></tr>
</table>
<form action="limpauser.jsp" target="chat" method="post">
<input type="submit" value="Limpar Usuários" class="ib"></form>
</td></tr>
</table>
</body>
</html>
