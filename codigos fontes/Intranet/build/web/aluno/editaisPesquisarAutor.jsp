<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="edital" scope="page" class="Intranet.Edital" /><jsp:setProperty name="edital" property="*" />
<%@page import="java.lang.String"%>
<%

String nome = request.getParameter("busca_edital");
java.util.Date data33 =null;
    java.util.Date data31 =null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.busca_edital.value==""){
		alert("Erro! Voc? deve digitar o nome ou parte do nome do autor desejado!");
		document.form1.busca_edital.focus();
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
<p align="left" class="titulo_form">Pesquisar edital por autor
<hr align="left" class="titulo_form">
</p>
<form id="form1" name="form1" method="post" action="editaisPesquisarAutor.jsp" onsubmit="return Verifica(this)">
  <p align="left" class="edit"><span class="letra_form">Pesquisar por:</span>
    <input name="busca_edital" type="text" id="busca_edital" size="40" maxlength="40" />
    <input name="pesquisar" type="submit" id="pesquisar" value="Pesquisar" />
  </p>
  <br />
  <br />
  <div class="edit">
    <table width="540" border="1" >
      <%
        if (nome!=null){
            nome = nome.toUpperCase();
            ResultSet rs = edital.BuscarEditalAutor(nome);
            %>
      <tr>
        <td width="40%" class="letra_form">T?tulo: </td>
        <td width="15%" class="letra_form">Inserido em: </td>
        <td width="15%" class="letra_form">V?lido at?: </td>
        <td width="30%" class="letra_form">Inserido por: </td>
      </tr>
      <%        while (rs.next()){%>
      <tr>
        <td width="40%" class="letra_form"><a href="javascript:window.open('editalAbrir.jsp?cod=<%=rs.getString("cod_edital") %>','janela1','width=400,height=200,scrollbars=yes');void(null)"> <%=rs.getString("titulo_edital") %></a></td>
        <td width="15%" class="letra_form"><%
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
        <td width="15%" class="letra_form"><%
        SimpleDateFormat formatador2 = new SimpleDateFormat("yyyy-MM-dd");  
        String data2=rs.getString("data_validade") ;
        try {
 		data31 = formatador2.parse(data2);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador2.applyPattern("dd/MM/yyyy"); 
        String dataValidade = formatador2.format(data31);
        out.println(dataValidade); %>
        </td>
        <td width="30%" class="letra_form"><%=rs.getString("nome_pessoa") %></td>
      </tr>
      <%}%>
    </table>
  </div>
  <%
     }

%>
</form>
<hr class="titulo_form">
<p align="center" class="path">? Universidade Federal do Paran? 2005 - Pol?tica de Privacidade</p>
</body>
</html>
