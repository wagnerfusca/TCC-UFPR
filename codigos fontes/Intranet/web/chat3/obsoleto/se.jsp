<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<font size="4" id="font1" onclick="mostra()">
Clique aqui para exibir o texto oculto
</font>
<p>
<font size="3" id="font2" style="display: none" onclick="apaga()">
Clique sobre este texto para ocultá-lo
</font>

<script language="JavaScript">
<!--

function mostra() {

document.all.font2.style.display = "";

}

function apaga() {

document.all.font2.style.display = "none";

}

// -->
</script>

</body>
</html>