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
<p align="left" class="titulo_form">Bem vindo coordena��o <%=sessao.getAttribute("nome")%> !!!
<hr align="left" class="titulo_form">
<div class="edit">
<div align="left"><span class="form"><br>
  Acesso os links ao lado para a :<br>
  <br>
  <br>
  --> cria��o de cursos que a coordena��o disponibiliza <br>
  <br>
  --> cria��o de grades hor�rios dos cursos <br>
  <br>
  --> Sele��o de disciplinas que s�o ofertadas pelos departamentos as coordena��es <br>
  <br>
  --> Inclus�o das disciplinas selecionadas nas grades hor�rias j� criadas <br>
  <br>
  --> Cria��o de turmas, vinculadas as grades hor�rias e disciplinadas ofertadas <br>
  <br>
  --> Cadastro de alunos que ir�o frequentar o curso <br>
  <br>
  --> Matricular alunos em turmas de um curso disponibilizado pela coordena��o <br>
  <br>
  --> acesse nos links acima outras op��es do sistema </span><br>
  <br>
</div>
<hr class="titulo_form">
<p align="center" class="path">� Universidade Federal do Paran� 2005 - Pol�tica de Privacidade</p>
</body>
</html>
