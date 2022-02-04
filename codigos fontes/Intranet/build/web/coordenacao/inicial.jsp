<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page session="true" %>
<%@page import="javax.servlet.http.*"%>
<%@ include file = "validaSessao.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.: Intranet Acadêmica - Universidade Federal do Paran? :.</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Bem vindo coordenação <%=sessao.getAttribute("nome")%> !!!
<hr align="left" class="titulo_form">
<div class="edit">
<div align="left"><span class="form"><br>
  Acesso os links ao lado para a :<br>
  <br>
  <br>
  --> criação de cursos que a coordenação disponibiliza <br>
  <br>
  --> criação de grades horários dos cursos <br>
  <br>
  --> Seleção de disciplinas que são ofertadas pelos departamentos as coordenações <br>
  <br>
  --> Inclusão das disciplinas selecionadas nas grades horárias já criadas <br>
  <br>
  --> Criação de turmas, vinculadas as grades horárias e disciplinadas ofertadas <br>
  <br>
  --> Cadastro de alunos que irão frequentar o curso <br>
  <br>
  --> Matricular alunos em turmas de um curso disponibilizado pela coordenação <br>
  <br>
  --> acesse nos links acima outras opções do sistema </span><br>
  <br>
</div>
<hr class="titulo_form">
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
