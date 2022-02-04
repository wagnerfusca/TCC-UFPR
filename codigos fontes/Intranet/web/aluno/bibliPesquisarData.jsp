<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="biblio" scope="page" class="Intranet.BibliotecaDigital" /><jsp:setProperty name="biblio" property="*" />
<%
    String diainicio = request.getParameter("diainicio");
    String mesinicio = request.getParameter("mesinicio");
    String anoinicio = request.getParameter("anoinicio");
    String diafim = request.getParameter("diafim");
    String mesfim = request.getParameter("mesfim");
    String anofim = request.getParameter("anofim");
    
    String datainicio = anoinicio+"-"+mesinicio+"-"+diainicio;
    String datafim = anofim+"-"+mesfim+"-"+diafim;
    
    java.util.Date data33 =null;
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.diainicio.value==""){
		alert("Erro! O campo DIA deve ser preenchido!");
		document.form1.diainicio.focus();
		return false;
	}    
        
         if(document.form1.anoinicio.value==""){
		alert("Erro! O campo ANO deve ser preenchido!");
		document.form1.anoinicio.focus();
		return false;
	}    
        
        if(document.form1.diafim.value==""){
		alert("Erro! O campo DIA deve ser preenchido!");
		document.form1.diafim.focus();
		return false;
	}    
        
        if(document.form1.anofim.value==""){
		alert("Erro! O campo ANO deve ser preenchido!");
		document.form1.anofim.focus();
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
<p align="left" class="titulo_form">Pesquisar monografia/projetos por data
<hr align="left" class="titulo_form">
</p>
<form id="form1" name="form1" method="post" action="bibliPesquisarData.jsp" onsubmit="return Verifica(this)">
  <span class="letra_form">Pesquisar por:</span><br />
  <br />
  <br />
  <div class="edit"> Data Inicio:
    <input name="diainicio" type="text" class="input" id="diainicio" size="3" maxlength="2" />
    <select name="mesinicio" class="input">
      <option value="01">Janeiro</option>
      <option value="02">Fevereiro</option>
      <option value="03">Março</option>
      <option value="04">Abril</option>
      <option value="05">Maio</option>
      <option value="06">Junho</option>
      <option value="07">Julho</option>
      <option value="08">Agosto</option>
      <option value="09">Setembro</option>
      <option value="10">Outubro</option>
      <option value="11">Novembro</option>
      <option value="12">Dezembro</option>
    </select>
    <input name="anoinicio" type="text" class="input" id="anoinicio" size="5" maxlength="4" />
    <br>
    Data Final   :
    <input name="diafim" type="text" class="input" id="diafim" size="3" maxlength="2" />
    <select name="mesfim" class="input">
      <option value="01">Janeiro</option>
      <option value="02">Fevereiro</option>
      <option value="03">Março</option>
      <option value="04">Abril</option>
      <option value="05">Maio</option>
      <option value="06">Junho</option>
      <option value="07">Julho</option>
      <option value="08">Agosto</option>
      <option value="09">Setembro</option>
      <option value="10">Outubro</option>
      <option value="11">Novembro</option>
      <option value="12">Dezembro</option>
    </select>
    <input name="anofim" type="text" class="input" id="anofim" size="5" maxlength="4" />
    <input name="pesquisar" type="submit" id="pesquisar" value="Pesquisar" />
  </div>
  <br />
  <br />
  <div class="edit">
    <table width="97%" border="1" >
      <%
        if ((diainicio!=null) && (diafim!=null)){
            ResultSet rs = biblio.BuscarBiblioData(datainicio, datafim);
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
