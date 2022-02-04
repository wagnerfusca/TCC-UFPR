<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="banco" scope="page" class="Intranet.BancoQuestoes" /><jsp:setProperty name="banco" property="*" />
<%
String cod = request.getParameter("cod");
if (cod!=null){
  int codPergunta = Integer.parseInt(cod);
  ResultSet rs= banco.AbrirQuestoes(codPergunta);
  while (rs.next()){
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
<p align="left" class="titulo_form">Visualizar questão
<hr align="left" class="titulo_form" />
</p>
<div>
  <div class="edit">
    <p><span class="letra_form">Pergunta:</span> <%=rs.getString("pergunta")%> </p>
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
    <p><span class="letra_form">Resposta Certa:</span><br />
      <%=rs.getString("resposta_certa")%> </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Comentários sobre a resposta certa:</span><br />
      <%=rs.getString("conteudo_resposta")%> </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Resposta errada 1</span><br />
      <%=rs.getString("resposta_errada1")%> </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Resposta errada 2:</span><br />
      <%=rs.getString("resposta_errada2")%> </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Resposta errada 3:</span><br />
      <%=rs.getString("resposta_errada3")%> </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Resposta errada 4:</span><br />
      <%=rs.getString("resposta_errada4")%> </p>
  </div>
  <div class="button" id="botao">
    <div align="center"> </div>
  </div>
</div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
<%
  break;
  }
}
%>
