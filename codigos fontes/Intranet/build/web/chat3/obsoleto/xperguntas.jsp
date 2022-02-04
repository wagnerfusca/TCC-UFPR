<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<%%>
<%
String perg = request.getParameter("pergunta");
if ( perg != null && !perg.equals(""))
   ochat.addPergunta( new chat.Pergunta(usuario,perg));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>CHAT</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css_intranetst.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="form1" method="post" action="">
  <textarea name="pergunta" cols="80" id="pergunta"></textarea>
  <input type="submit" name="Enviar" value="Enviar">
</form>
</body>
</html>
