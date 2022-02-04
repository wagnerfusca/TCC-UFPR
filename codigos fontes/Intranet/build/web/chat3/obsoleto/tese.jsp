<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="JavaScript" type="text/javascript">
function ShowForm(DIV) {
document.getElementById(DIV).style.display = "";
document.getElementById("Nome").focus();
}
function HideForm(DIV) {
document.getElementById(DIV).style.display = "none";
}
</script>
</head>
<body>
<a href="javascript:ShowForm('Formulario');">Mostrar Formulário</a>&nbsp;<a href="javascript:HideForm('Formulario');">Ocultar Formulário</a><br>
<div id="Formulario" style="display: none;">
<form name="Teste">
Campo1: <input type="text" name="Nome" id="Nome" size="20">
<input type="submit" name="Enviar" value="Enviar">
</form>
</div>
Texto...
</body>
</html>