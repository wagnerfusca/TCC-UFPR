<%@ page import="java.util.*,chat.*,java.text.*" %>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<jsp:useBean id="olog" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%

     String senha = request.getParameter("senha"); 
     String nome = "Administrador";
	 String area = "COPEL - ";
	 String ip   = request.getRemoteAddr(); 
	 if  (senha != null && senha.equals("inicio"))
	 {
		 usuario.setNome(nome);
         usuario.setArea(area);
         usuario.setIp(ip);
         usuario.setSenha(senha);
         ochat.addUsuario(usuario);
         olog.addUsuario(usuario);         
		 response.sendRedirect("modmain.jsp");
      }												%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="incl/nstl.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Intranet Copel-->CHAT</title>
<script type="text/javascript" src="incl/inx.js"></script>
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
<body onLoad="document.all.senha.focus()">
<form action="" method="post">
  <table align="center" class="tbl" width="35%"><tr><td align="center" valign="middle">
<table border="0" width="100%" cellpadding="1" cellspacing="2"><tr><td class="c">
<table border="0" width="100%" cellpadding="0" cellspacing="0"><tr><td bgcolor="#ffffff">
<table border="0" width="100%" cellpadding="5" cellspacing="1">
<tr><td class="c" align="center" bgcolor="#A09CA0">Digite a senha para entra no modo Administrador</td></tr><tr><td class="b">
<table border="0" cellpadding="1" cellspacing="1">
<tr><td rowspan="1" valign="center" align="center" nowrap><b>Usuario: Administrador <script type="text/javascript">df()</script></b></td></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr><td>
<b>Senha: </b><input type="password" size="20" name="senha" maxlength="10"></td>
<td> </td></tr>
<tr><td><br></td></tr>
<tr><td align="center"><div align="center">
<input type="submit" value=" OK " class="ib"> <BR> <BR>
<a href="login.jsp"> Voltar para tela de Login</a>
</div></td></tr>
</table></td></tr>
</div></td></tr>
</table></td></tr></table></td></tr>
</table></td></tr></table></form>
</body></html>
