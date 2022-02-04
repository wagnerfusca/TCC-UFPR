<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="biblio" scope="page" class="Intranet.BibliotecaDigital" /><jsp:setProperty name="biblio" property="*" />
<%@page import="java.lang.String"%>
<%

String nome = request.getParameter("busca_biblio");
java.util.Date data33 =null;
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.busca_biblio.value==""){
		alert("Erro! Você deve digitar o assunto ou parte do assunto desejado!");
		document.form1.busca_biblio.focus();
		return false;
	}    
        return true;
    } 
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Pesquisar monografia/projeto por assunto
<hr align="left" class="titulo_form">
</p>
<form id="form1" name="form1" method="post" action="bibliPesquisarAssunto.jsp" onsubmit="return Verifica(this)">
  <span class="letra_form">Pesquisar por:</span>
  <input name="busca_biblio" type="text" id="busca_biblio" size="40" maxlength="40" />
  <input name="pesquisar" type="submit" id="pesquisar" value="Pesquisar" />
  <br />
  <br />
  <div class="edit">
    <table width="97%" border="1" >
      <%
        if (nome!=null){
            nome = nome.toUpperCase();
            ResultSet rs = biblio.BuscarBiblioAssunto(nome);
    %>
      <tr>
        <td width="35%" class="letra_form">Título: </td>
        <td width="15%" class="letra_form">Inserido em: </td>
        <td width="20%" class="letra_form">Assunto: </td>
        <td width="30%" class="letra_form">Autor: </td>
      </tr>
      <%       while (rs.next()){%>
      <tr>
        <td width="35%"><a href="javascript:window.open('bibliAbrir.jsp?cod=<%=rs.getString("cod_monografia") %>','janela1','width=400,height=300,scrollbars=yes');void(null)"> <%=rs.getString("titulo_monografia") %></a> </td>
        <td width="15%"><%
        SimpleDateFormat formatador1 = new SimpleDateFormat("yyyy-MM-dd");  
        String data1=rs.getString("data_insercao");
        try {
 		data33 = formatador1.parse(data1);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador1.applyPattern("dd/MM/yyyy"); 
        String dataInsercao = formatador1.format(data33);
        out.println(dataInsercao); %>
        </td>
        <td width="20%"><%=rs.getString("assunto_monografia") %></td>
        <td width="30%"><%=rs.getString("autor_monografia") %></td>
      </tr>
      <%}%>
    </table>
  </div>
  <%}%>
</form>
<hr class="titulo_form">
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
