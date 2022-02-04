<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%
  String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Curso não foi criado ");
        </script>
<%  }else{%>
<script language="JavaScript">
            alert ("Curso criado  com sucesso");
       </script>
<%}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.codigo.value==""){
		alert("Erro! O campo CÓDIGO deve ser preenchido!");
		document.form1.codigo.focus();
		return false;
	}    
        
         if(document.form1.nome.value==""){
		alert("Erro! Digite o NOME da disciplina!");
		document.form1.nome.focus();
		return false;
	}    
        
        if(document.form1.versao.value==""){
		alert("Erro! Digite a VERSÃO!");
            document.form1.versao.focus();
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
<p align="left" class="titulo_form">Cadastrar curso
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="salvaCurso.jsp" onSubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Código do curso:</span><br />
        <input name="codigo" type="text" id="codigo" size="10" maxlength="10" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Nome do Curso:</span><br />
        <input name="nome" type="text" id="nome" size="30" maxlength="25" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Versão do curso:</span><br />
        <input name="versao" type="text" id="versao" size="20" maxlength="15" />
        Ex: Autorizado, Reconhecido </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Coordenação vinculada:</span><%=sessao.getAttribute("nome")%>
        <input type="hidden" name="coordenacao" value="<%=sessao.getAttribute("codCoord")%>">
        <input type="hidden" name="departamento" value="<%=sessao.getAttribute("codDepartamento")%>">
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
