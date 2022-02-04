<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="edital" scope="page" class="Intranet.Edital" /><jsp:setProperty name="edital" property="*" />
<%
java.util.Date data33 =null;
    java.util.Date data31 =null;
String cod = request.getParameter("cod");
    if (cod!=null){
    int codEdital = Integer.parseInt(cod);
      ResultSet rs= edital.AbrirEdital(codEdital);
      while (rs.next()){
     %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edital<%=rs.getString("cod_edital") %></title>
<link href="../LayPic/estilo.css" rel="stylesheet" type="text/css">
</head>
<body class="fundo_form">
<br>
<div>
  <div class="edit">
    <p><span class="letra_form">Título: <%=rs.getString("titulo_edital") %></span></p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Inserido em:
      <%SimpleDateFormat formatador1 = new SimpleDateFormat("yyyy-MM-dd");  
        String data1=rs.getString("data_insercao");
        try {
 		data33 = formatador1.parse(data1);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador1.applyPattern("dd/MM/yyyy"); 
        String dataInsercao = formatador1.format(data33);
        out.println(dataInsercao); %>
      -----  
      
      Válido até:
      <%SimpleDateFormat formatador2 = new SimpleDateFormat("yyyy-MM-dd");  
        String data2=rs.getString("data_validade") ;
        try {
 		data31 = formatador2.parse(data2);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador2.applyPattern("dd/MM/yyyy"); 
        String dataValidade = formatador2.format(data31);
        out.println(dataValidade); %>
      </span> </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Inserido por: <%=rs.getString("nome_pessoa") %></span></p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Conteúdo:<br>
      <%=rs.getString("conteudo_edital") %></span></p>
  </div>
</div>
</body>
</html>
<%}}%>
