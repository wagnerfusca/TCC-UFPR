<%@ page import="java.util.*,java.text.*"%>
<jsp:useBean id="omod" scope="application" class="chat.Perguntas" />
<jsp:useBean id="olog" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<%
// Se o usuario nao for Administrador vai para proibido.jsp
if (usuario.getSenha() == null || usuario.getSenha().equals(""))
	
   {
	response.sendRedirect("proibido.jsp");
	}
//Se o nome de usuario ou a area forem nulos volta para a tela de login
if ( (usuario.getNome() == null || usuario.getNome().equals("")) || (usuario.getArea() == null || usuario.getArea().equals("")))
{
	response.sendRedirect("login.jsp");
}%>
<%
String dialog = request.getParameter("dialogo");
if ( dialog != null && !dialog.equals(""))
   omod.addPergunta( new chat.Pergunta(usuario,dialog));
   olog.addPergunta( new chat.Pergunta(usuario,dialog));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><link rel="stylesheet" type="text/css" href="incl/nstl.css">
<script type="text/javascript" src="incl/mdf.js">
</script>
<style type="text/css">
body{font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;color:#000000;background-color:#eeeeee}
.p{background-color:#ffffff}
.c{font-size:12px;font-weight:bold;color:#ffffff;background-color:#A09CA0}
.d{font-size:12px;font-weight:bold;color:#ff0000}
.y{color:#333333;background-color:transparent}
A:link{color:#333333;background-color:transparent}
A:visited{color:#333333;background-color:transparent}
A:hover{color:#aaaaaa;background-color:transparent}
A:active{color:#aaaaaa;background-color:transparent}
</style>
</head>
<body onLoad="document.all.dialogo.focus()">
<form action="" method="post" >
<table align="center" border="0" width="100%">
	<tr>  
		<td colspan="1"><input type="text" name="dialogo" size="75" maxlength="100" class="ia">
		</td>
		<td align="right"><input type="submit" value="Envia" class="ib">
		</td>
	</tr>
	<tr>
  		<td valign="top" align="center"><b>
    	    <a href="modchat.jsp" target="chat" title="Modo chat [Atualiza]">Chat</a> |
    	    <a href="logchat.jsp" target="chat" title="Log do Chat">Histórico</a> | 
			<a href="limpachat.jsp" target="chat" title="Limpar chat">Limpar</a> |
			<a href="gravlog.jsp" target="chat" title="Armazena o log do chat">Gravar Log</a> |
			<a href="loguser.jsp" target="chat" title="Log dos usuários que entraram no chat">Usuários</a> |
			<a href="sair.jsp" target="_parent">Sair</a> </b>
		</td>	
	</tr>
		<tr>
		   <td align="center">
				<font class="d"> Mensagens oriundas do moderador são automaticamente aceitas no CHAT! </font>
		   </td>	
	</tr>
</table>
</form>
</body>
</html>