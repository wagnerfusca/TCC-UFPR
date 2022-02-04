<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="pessoa" scope="page" class="Intranet.Pessoa" />
<jsp:setProperty name="´pessoa" property="*" />

<%String msg = request.getParameter("msg");
    if (msg!=null){
       if (msg.equals("erro")){%>
        <script language="JavaScript">
            alert ("Usuário e/ou senha inválidos, tente novamente");
        </script>
<%   } }     %>
<html>
<head>
<title>.: Intranet Acadêmica - Universidade Federal do Paraná :.</title>
<link rel="stylesheet" type="text/css" href="/portal.css">
<style type="text/css">
    <!--
    body {
        background-color: #006699;
    }

    h3 {
        color: black;
    }

    #portal_corpo {
        width: 500px;
        margin: 1em auto;
        border: 1px solid #213860;
        padding: 1em;
        background-color: white;
    }
    #portal_login {
        margin-top: 1em;
        border: 1px solid #213860;
        padding: 1em;
        background-color: #ededed;
    }
    -->
    </style>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.usuario.value==""){
		alert("Erro! O campo USUÁRIO tem que ser preenchido!");
		document.form1.usuario.focus();
		return false;
	}    
     if(document.form1.senha.value==""){
		alert("Erro! Campo SENHA em branco, por favor digite uma senha válida!");
		document.form1.senha.focus();
		return false;
	}
        if(document.form1.tipo.value==""){
		alert("Erro! Selecione abaixo o tipo do login!");
		document.form1.tipo.focus();
		return false;
	}

        return true;
    } 
    </script>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all">
<style type="text/css">
<!--
.style1 {font-size: 18pt}
.style2 {font-size: 20px}
-->
		</style>
</head>
<body>
<table id="portal_corpo" cellpadding="10" cellspacing="0">
  <tr valign="top">
    <td rowspan="2" width="120"><a href="http://www.ufpr.br"><img src="LayPic/ufpr_logo.jpg" width="178" height="134"></a></td>
    <td class="titulo_form style1"><br>
      Intranet Acad&ecirc;mica </td>
  </tr>
  <tr valign="top">
    <td><h3>
        <style type="text/css">
<!--
.style2 {
	color: #FF0000;
	font-weight: bold;
}
-->
					</style>
        <strong>Bem-vindo </strong></h3>
      <p class="letra_form"> Bem-vindo &agrave; Intranet Acad&ecirc;mica da UFPR.</p>
      <p align="justify" class="letra_form">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A Intranet tem como objetivo disponibilizar aos alunos, professores e funcion&aacute;rios da Universidade Federal do Paraná acesso aos diversos serviços de seu interesse em um único lugar e com uma única identificação.</p>
      <span class="letra_form">
      <!--
<p>Em breve, neste Portal, você poderá acessar suas informações armazenadas nas bases de dados institucionais, incluindo os dados cadastrais, as consultas ao desempenho acadêmico, a participação em projetos a integralização curricular, entre outros.</p>
-->
      </span>
      <p align="justify" class="letra_form">Para utilizar a Intranet Acad&ecirc;mica entre com sua identificação e senha nos campos abaixo.</p>
      <form id="portal_login" method="post" action="logon.jsp" name="form1" onsubmit="return Verifica(this)">
        <h3 style="border-bottom: 1px solid gray;">Acesso &agrave; Intranet Acad&ecirc;mica </h3>
        <table width="249" cellpadding="5" cellspacing="0">
          <tr valign="top">
            <td width="202" nowrap><span class="letra_form">Sua identificação</span><br>
              <input type="text" name="usuario" size="15" value="">
              <br>
              <span class="letra_form">Sua senha</span><br>
              <input type="password" name="senha" size="15" >
              <br>
              <span class="letra_form">Selecione</span><br>
              <select name="tipo" class="input">
                <option value="">Selecione</option>
              <%ResultSet rs = pessoa.BuscaTipo();
                 while (rs.next()){   %>
                 <option value="<%=rs.getString("TipoPessoa")%>"><%=rs.getString("Descricao")%></option>
               <% }%>
              </select>
              <br>
              <br>
              <input type="submit" value="Entrar">
            </td>
        </table>
      </form></td>
  </tr>
  <tr valign="top">
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
