<%@ page import="java.util.*,java.text.*"%>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<%@ include file = "sessao.jsp"  %>

<%
//Se o nome de usuario ou a area forem nulos volta para a tela de login
/*if ( (usuario.getNome() == null || usuario.getNome().equals("")) )
{
	response.sendRedirect("login.jsp");
}*/
%>
<%
String dialog = request.getParameter("dialogo");
if ( dialog != null && !dialog.equals("")){
    String dialog1 = dialog;
    String dialog2 = dialog1 + dialog;
    sessao2.setAttribute("questao", dialog2);
   //ochat.addPergunta( new chat.Pergunta(usuario,dialog));   
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><link rel="stylesheet" type="text/css" href="incl/nstl.css">
<script type="text/javascript" src="incl/mdf.js">
</script>
<script>
function mostramsg()
 {       
       if(document.all.dialogo.value == "" )
       
       alert("Por favor.Digite a mensagem a ser submetida.");
      }
</script>
<style type="text/css">
body{font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;color:#000000;background-color:#eeeeee}
.p{background-color:#ffffff}
.c{font-size:12px;font-weight:bold;color:#ffffff;background-color:#A09CA0}
.y{color:#333333;background-color:transparent}
A:link{color:#333333;background-color:transparent}
A:visited{color:#333333;background-color:transparent}
A:hover{color:#aaaaaa;background-color:transparent}
A:active{color:#aaaaaa;background-color:transparent}
</style>
</head>
<body onLoad="document.all.dialogo.focus()">
<form action="insert.jsp" method="GET" onsubmit="mostramsg()">
<table align="center" border="0" width="100%">
	<tr>
		<td width="80%" colspan="3"><input type="text" name="dialogo" size="180" maxlength="180" class="ia">
		</td>
		<td align="left"><input type="submit" value="Envia" class="ib">
		</td>
	</tr>
	<tr>
		<td colspan="4" nowrap> 
		</td>
	</tr>
	<tr>
  			<td valign="top" align="center" nowrap><b>
    	    <a href="chat.jsp" target="chat" title="Modo chat [Atualiza]">Atualizar</a> | 
	    <a href="sair.jsp" target="_parent">Sair</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
