<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="form" scope="page" class="Intranet.Formularios" /><jsp:setProperty name="form" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Visualizar documentos e formulários
<hr align="left" class="titulo_form">
<table width="97%" border="1" >
  <%
    java.util.Date data33 =null;
    java.util.Date data31 =null;
    java.util.Date dataHoje1 = new java.util.Date();
    
    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
    formatador.applyPattern("yyyy-MM-dd"); 
    String dataHoje = formatador.format(dataHoje1);
    
    Object codPessoa = sessao.getAttribute("codPessoa");
    String codPessoa1 = codPessoa.toString() ;
    int destinatario = Integer.parseInt(codPessoa1);
        
 
    ResultSet rs = form.VisualizaDoc(destinatario,dataHoje);
%>
  <tr>
    <td width="40%" class="letra_form">Título </td>
    <td width="15%" class="letra_form">Inserido em:</td>
    <td width="15%" class="letra_form">Válido até:</td>
    <td width="30%" class="letra_form">Enviado por:</td>
  </tr>
  <% while (rs.next()){%>
  <tr>
    <td width="50%" class="letra_form"><a href="javascript:window.open('formAbrir.jsp?cod=<%=rs.getString("cod_form") %>','janela1','width=600,height=500,scrollbars=yes');void(null)"> <%=rs.getString("titulo") %></a></td>
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
        out.println(dataInsercao);%>
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
    </td>
  </tr>
  <%}
%>
</table>
<hr class="titulo_form">
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
