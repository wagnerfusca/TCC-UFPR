<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<%
//Se o nome de usuario ou a area forem nulos volta para a tela de login
if ( (usuario.getNome() == null || usuario.getNome().equals("")) || (usuario.getArea() == null || usuario.getArea().equals("")))
{
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="incl/modcff.js">
</script>
<link rel="stylesheet" type="text/css" href="incl/nstl.css">
<style type="text/css">
body{font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;color:#000000;background-color:#ffffff}
.p{background-color:#ffffff}
.c{font-size:12px;font-weight:bold;color:#ffffff;background-color:#A09CA0}
.y{color:#333333;background-color:transparent}
A:link{color:#333333;background-color:transparent}
A:visited{color:#333333;background-color:transparent}
A:hover{color:#aaaaaa;background-color:transparent}
A:active{color:#aaaaaa;background-color:transparent}</style>
<title>...</title>
</head>
<body>
<div align="center">
<table class="tbl">
<tr><td align="center" valing="botton"><b>Você nao tem permissão para o acesso a este site.
<br>Volte para a tela do CHAT ou faça um novo LOGIN</b></td></tr>
<tr>
	<form action="main.jsp" method="post">
		<td valign="top"><input type="submit" value="CHAT" class="ib"></td>
	</form>
	<form action="sair.jsp" method="post">
		<td valign="top"><input type="submit" value="LOGIN" class="ib"></td>
	</form></tr>
</table>
</div>
</body>
</html>