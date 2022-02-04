<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<jsp:useBean id="curso" scope="page" class="Intranet.Curso" /><jsp:setProperty name="curso" property="*" />
<%
  String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Grade não foi criada ");
        </script>
<%  }else{%>
<script language="JavaScript">
            alert ("Grade criada com sucesso");
   
        </script>
<%}
  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
    function Verifica(){
      if(document.form1.curso.value==""){
		alert("Erro! Selecione o Curso!");
            document.form1.curso.focus();
		return false;
	}   
         if(document.form1.nome.value==""){
		alert("Erro! Digite o NOME da grade!");
		document.form1.nome.focus();
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
<p align="left" class="titulo_form">Criar grade
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="salvaGrade.jsp" onSubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Curso:</span><br />
        <select name="curso" class="input" id="curso">
          <option value="">Selecione </option>
          <%                       Object Coordenacao =sessao.getAttribute("codCoord");
                                   String codCoordenacao = Coordenacao.toString() ;
                                   ResultSet rs = curso.BuscarCurso(codCoordenacao);
                                   while (rs.next()){%>
          <option value="<%=rs.getString("cod_curso")%>"> <%=rs.getString("nome_curso")%></option>
          <%}%>
        </select>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Nome Grade:</span><br />
        <input name="nome" type="text" id="nome" size="40" maxlength="50" />
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
