<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<jsp:useBean id="admin" scope="page" class="Intranet.Admin" /><jsp:setProperty name="admin" property="*" />
<jsp:useBean id="pessoa" scope="page" class="Intranet.Pessoa" /><jsp:setProperty name="pessoa" property="*" />
<%
String senha = request.getParameter("senha");
String codigo = request.getParameter("codigo");
String nome = request.getParameter("departamento");
String chefe = request.getParameter("chefe");

if ((codigo!=null)&& (nome!=null)&& (chefe!=null)&& (senha!=null)){
    codigo = codigo.toUpperCase();
    nome = nome.toUpperCase();
    String tipo = "DEP";

    ResultSet rs2 = pessoa.VerificaLogin(codigo,tipo);
    int contador=0;
    while (rs2.next()){
        contador = rs2.getInt("contador");
    }
    if(contador==0){
    boolean inserido = pessoa.InsereOrgao(codigo,nome,senha,tipo);
    if (inserido){
      ResultSet rs = pessoa.BuscarOrgao(codigo,nome,senha,tipo);
      while (rs.next()){
         int codPessoa = rs.getInt("cod_pessoa");
         boolean inserido2 = admin.CriarDepartamento(codigo,nome,codPessoa,chefe);
            if (inserido2){%>

<script language="JavaScript">
            alert ("Departamento inserida com sucesso");
        </script>
<%  }else{%>
<script language="JavaScript">
            alert ("Departamento não foi Inserida ");
        </script>
<%    }
  }
}else{%>
<script language="JavaScript">
            alert ("Pessoa não foi Inserida ");
        </script>
<%    }
     }else{//contador%>
    <script language="JavaScript">
               alert ("Já existe um usuário cadastrado com esse código. Escolha outro código e tente novamente");
        </script>
<%}}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.codigo.value==""){
		alert("Erro! O campo CÓDIGO tem que ser preenchido!");
		document.form1.codigo.focus();
		return false;
	}    
	if(document.form1.departamento.value==""){
		alert("Erro! Digite o NOME do departamento!");
		document.form1.departamento.focus();
		return false;
	}    
	if(document.form1.chefe.value==""){
		alert("Erro! Digite o nome do CHEFE DO DEPARTAMENTO!");
		document.form1.chefe.focus();
		return false;
	}    
	if(document.form1.senha.value==""){
		alert("Erro! Campo SENHA em branco!");
		document.form1.senha.focus();
		return false;
	}    
        return true;
    } 
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Criar departamento
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="criarDepartamento.jsp" onSubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Código:</span><br />
        <input name="codigo" type="text" id="codigo" size="10" maxlength="10" />
        Será usado também como nome do usuário </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Nome do Departamento:</span><br />
        <input name="departamento" type="text" id="departamento" size="30" maxlength="25" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Chefe de Departamento:</span><br />
        <input name="chefe" type="text" id="chefe" size="30" maxlength="25" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Senha:</span><br />
        <input name="senha" type="password" id="senha" size="30" maxlength="25" />
        Usado para validar o acesso no sistema </p>
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
