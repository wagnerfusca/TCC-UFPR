<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page session="true" %>
<%@page import="javax.servlet.http.*"%>
<%@ include file = "validaSessao.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Intranet Acad�mica - Universidade Federal do Paran? :.</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Bem vindo professor(a) <%=sessao.getAttribute("nome")%> !!!
<hr align="left" class="titulo_form">
<div class="edit">
<div align="left"><span class="form"><br>
  Acesso os links acima para :<br>
  <br>
  <br>
  --> conferir editais da UFPR <br>
  <br>
  --> buscar monografias e projetos publicados na biblioteca digital em formato eletr�nico <br>
  <br>
  --> acessar documentos e formul�rios enviados a voc� por coordena��es ou departamentos <br>
  <br>
  --> diversas fun��es em disciplinas por voc� ministrada </span><br>
  <br>
</div>
<hr class="titulo_form">
<p align="center" class="path">� Universidade Federal do Paran� 2005 - Pol�tica de Privacidade</p>
</body>
</html>
