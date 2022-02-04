<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<jsp:useBean id="admin" scope="page" class="Intranet.Admin" /><jsp:setProperty name="admin" property="*" />
<jsp:useBean id="dep" scope="page" class="Intranet.Departamento" /><jsp:setProperty name="dep" property="*" />
<jsp:useBean id="pessoa" scope="page" class="Intranet.Pessoa" /><jsp:setProperty name="pessoa" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String senha = request.getParameter("senha");
String codigo = request.getParameter("codigo");
String departamento = request.getParameter("departamento");
String nome = request.getParameter("nome");
String nomeCoordenador = request.getParameter("nomecoordenador");

if ((codigo!=null)&& (nome!=null)&&(nomeCoordenador!=null)&&(departamento!=null)&&(senha!=null)){
    codigo = codigo.toUpperCase();
    nome = nome.toUpperCase();
    nomeCoordenador = nomeCoordenador.toUpperCase();
   String tipo = "COORD";

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
        boolean inserido2 = admin.CriarCoordenacao(codigo,nome,departamento,nomeCoordenador,codPessoa);

                 if (inserido2){%>
<script language="JavaScript">
            alert ("Coordenação inserida com sucesso");
        </script>
<%  }else{%>
<script language="JavaScript">
            alert ("Coordenação não foi Inserida ");
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.codigo.value==""){
		alert("Erro! Digite o CÓDIGO da Coordenação");
		document.form1.codigo.focus();
		return false;
	}    
	if(document.form1.nome.value==""){
		alert("Erro! Digite o NOME da Coordenação");
		document.form1.nome.focus();
		return false;
	}    
	if(document.form1.departamento.value==""){
		alert("Erro! Digite o departamento em que esta coordenação está vinculada");
		document.form1.departamento.focus();
		return false;
	}    
	if(document.form1.nomecoordenador.value==""){
		alert("Erro! Digite o NOME do Coordenador");
		document.form1.nomecoordenador.focus();
		return false;
	}    
	if(document.form1.senha.value==""){
		alert("Erro! Digite uma SENHA!");
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
<p align="left" class="titulo_form">Criar coordenação
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="criarCoordenacao.jsp" onsubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Código Coordenação</span><br />
        <input name="codigo" type="text" id="codigo" size="10" maxlength="14" />
        Será usado também como nome do usuário </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Nome Coordenação:</span><br />
        <input name="nome" type="text" id="nome" size="30" maxlength="25" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Departamento Vinculado:</span><br />
        <label>
        <select name="departamento" class="input" id="departamento">
          <option value="">Selecione</option>
          <%                       ResultSet rs = dep.BuscarDepartamento();
                                   while (rs.next()){%>
          <option value="<%=rs.getString("cod_departamento")%>"> <%=rs.getString("nome_departamento")%></option>
          <%}%>
        </select>
        </label>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Nome Coordenador:</span><br />
        <label>
        <input name="nomecoordenador" type="text" id="nomecoordenador" size="30" maxlength="25" />
        </label>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Senha:</span><br />
        <input name="senha" type="password" id="senha" size="15" maxlength="10" />
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
