<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<%
    String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
         <script language="JavaScript">
            alert ("T�pico n�o foi inserido ");
        </script>
    <%   }else{%>
        <script language="JavaScript">
             alert ("T�pico inserido com sucesso");
        </script>    
    <% }
    } 
    %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/JavaScript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Inserir t�pico - f�rum
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="salvadiscForumInserir.jsp">
	<div>
		<div class="edit">
			<p><span class="letra_form">T�tulo:</span>
				<input name="titulo" type="text" id="titulo" size="60" maxlength="60" />
			</p>
		</div>
		<div class="edit">
			<p><span class="letra_form">Inserido por: </span><%=sessao.getAttribute("nome")%><br />
				</p>
		</div>
		<div class="edit">
			<p><span class="letra_form">Disciplina: </span><%=sessao.getAttribute("nomeDisciplina")%><br />
				</p>
		</div>
		
		<div class="edit">
			<p><span class="letra_form">Coment�rios:</span><br />
				<textarea name="conteudo" cols="60" rows="5" class="input" id="conteudo"></textarea>
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
<p align="center" class="path">� Universidade Federal do Paran� 2005 - Pol�tica de Privacidade</p>
</body>
</html>
