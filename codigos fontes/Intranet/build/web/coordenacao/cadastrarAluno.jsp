<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="curso" scope="page" class="Intranet.Curso" /><jsp:setProperty name="curso" property="*" />
<%
  String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
        <script language="JavaScript"> alert ("Aluno não foi Inserido "); </script>
        <% }else{
              if (msg.equals("salvo")){%>
                <script language="JavaScript"> alert ("Aluno inserido com sucesso");  </script>
            <%  }else{%>
                <script language="JavaScript"> alert ("Pessoa não foi inserida"); </script>
<%              }   
           }
    if(msg.equals("contador")){%>
    <script language="JavaScript">
               alert ("Já existe um usuário cadastrado com esse código. Escolha outro código e tente novamente");
    </script>
<%}}%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.matricula.value==""){
		alert("Erro! Digite a matricula do aluno!");
		document.form1.matricula.focus();
		return false;
	}    
        
         if(document.form1.nome.value==""){
		alert("Erro! Digite o NOME do aluno!");
		document.form1.nome.focus();
		return false;
	}    
        
        if(document.form1.dia.value==""){
		alert("Erro! Preencha o DIA!");
                document.form1.dia.focus();
		return false;
	}    
	if(document.form1.mes.value==""){
		alert("Erro! Preencha o MÊS!");
                document.form1.mes.focus();
		return false;
	}    
	if(document.form1.ano.value==""){
		alert("Erro! Preencha o ANO!");
                document.form1.ano.focus();
		return false;
	}    
	   if(document.form1.curso.value==""){
		alert("Erro! Selecione um CURSO para o aluno!");
                document.form1.curso.focus();
		return false;
	}   
       return true;
    } 
    </script>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Cadastar aluno
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="salvaAluno.jsp" onSubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Matrícula:</span><br />
        <input name="matricula" type="text" id="" size="10" maxlength="10" />
        Este será o login do professor no sistema </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Nome:</span><br />
        <input name="nome" type="text" id="nome" size="30" maxlength="30" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Data Nascimento:</span><br />
        <input name="dia" type="text" id="dia" size="3" maxlength="2" />
        /
        <input name="mes" type="text" id="mes" size="3" maxlength="2" />
        /
        <input name="ano" type="text" id="ano" size="5" maxlength="4" />
        Senha provisória do professor no sistema </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Curso Vinculado:</span><br />
        <label>
        <select name="curso" class="input" id="curso">
          <option value="">Selecione</option>
          <%Object Coordenacao =sessao.getAttribute("codCoord");
                                   String codCoordenacao = Coordenacao.toString() ;
                                   ResultSet rs = curso.BuscarCurso(codCoordenacao);
                                   while (rs.next()){%>
          <option value="<%=rs.getString("cod_curso")%>"> <%=rs.getString("nome_curso")%></option>
          <%}%>
        </select>
        </label>
      </p>
    </div>
    <div class="button" id="botao">
      <div align="center">
        <input name="enviar" type="submit" id="enviar" value="Enviar" />
      </div>
    </div>
  </div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
