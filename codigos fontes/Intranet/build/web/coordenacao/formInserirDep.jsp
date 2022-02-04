<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="dep" scope="page" class="Intranet.Departamento" /><jsp:setProperty name="dep" property="*" />

<jsp:useBean id="arquivo" scope="page" class="Intranet.Arquivo" /><jsp:setProperty name="arquivo" property="*" />
<%
String msg = request.getParameter("msg");

    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Formulario não foi inserido ");
        </script>
<%   }else{%>
<script language="JavaScript">
             alert ("Formulario inserido com sucesso");
        </script>
<% }
}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script language="JavaScript" type="text/JavaScript">
       function Verifica(){
        if(document.form1.titulo.value==""){
		alert("Erro! O campo TITULO deve ser preenchido!");
		document.form1.titulo.focus();
		return false;
	}    
	if(document.form1.validade.value==""){
		alert("Erro! O campo VALIDADE deve ser preenchido!");
		document.form1.validade.focus();
		return false;
	}    
	if(document.form1.dep.value==""){
		alert("Erro! O campo DEPARTAMENTO tem que ser preenchido!");
		document.form1.dep.focus();
		return false;
	}
    if(document.form1.conteudo.value==""){
		alert("Erro! O campo CONTEÚDO tem que ser preenchido!");
		document.form1.conteudo.focus();
		return false;
	}    
	/*if(document.form1.tipoarq.value==""){
		alert("Erro! O campo TIPO DO ARQUIVO tem que ser selecionado!");
		document.form1.tipoarq.focus();
		return false;
	}  
	if(document.form1.anexo.value==""){
		alert("Erro! Selecione o ANEXO da mensagem!");
		document.form1.anexo.focus();
		return false;
	} */   
        return true;
    }
    function formatar(src, mask) 
    {
      var i = src.value.length;
      var saida = mask.substring(0,1);
      var texto = mask.substring(i)
    if (texto.substring(0,1) != saida) 
      {
            src.value += texto.substring(0,1);
      }
    }
/* Exemplos:
CEP OnKeyPress="formatar(this, '#####-###')"
CPF OnKeyPress="formatar(this, '###.###.###-##')"
DATA OnKeyPress="formatar(this, '##/##/####')"*/

</script>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Envio de documento/formulário para departamento</p>
<hr align="left" class="titulo_form" />
<form action="salvaformInserir.jsp" name="form1" id="form1" method="post" enctype="multipart/form-data" onSubmit="return Verifica(this)">
  <div>
  <div class="edit">
    <p><span class="letra_form">Título:</span>
      <input name="titulo" type="text" id="titulo" size="60" maxlength="60" />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Validade:</span>
      <input name="validade" type="text" id="validade" size="15" maxlength="10" OnKeyPress="formatar(this, '##/##/####')" />
      SÓ NÚMEROS </p>
  </div>
  <div class="edit">
    <input name="autor" type="hidden" value="<%=sessao.getAttribute("codPessoa")%>">
    </p>
  </div>
  <div class="edit">
  <p>
  <span class="letra_form">Para departamento: </span>
  <label>
  <select name="dep" class="input" id="dep" >
    <option value="">Selecione </option>
    <%ResultSet rs1 = dep.BuscarDepartamento();
                                    while (rs1.next()){%>
    <option value="<%=rs1.getInt("cod_pessoa")%>"><%=rs1.getString("nome_departamento")%></option>
    <%}%>
  </SELECT>
  <input name="tipo" type="hidden" value="DEPARTAMENTO">
  </input>
  </div>
  </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Conte&uacute;do:</span><br />
      <textarea name="conteudo" cols="70" rows="5" class="input" id="conteudo"></textarea>
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Tipo Arquivo:</span>
      <select name="tipoarq" id="tipoarq" class="input">
        <option vaiue="">Selecione </option>
        <%   ResultSet rs3 = arquivo.buscarTipo();
                                    while (rs3.next()){%>
        <option value="<%=rs3.getString("tipoarquivo")%>"><%=rs3.getString("tipoarquivo")%> - <%=rs3.getString("descricao")%></option>
        <%}%>
      </select>
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Anexo:</span>
      <label>
      <input name="anexo" type="file" class="input" id="anexo" size="50"  />
      </label>
    </p>
  </div>
  <div class="button" id="botao">
    <div align="center">
      <input type="submit"  value="Enviar" />
    </div>
  </div>
  </div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
