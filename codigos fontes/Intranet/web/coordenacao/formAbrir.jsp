<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.String"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="form" scope="page" class="Intranet.Formularios" /><jsp:setProperty name="form" property="*" />
<%
java.util.Date data33 =null;
java.util.Date data31 =null;
String cod = request.getParameter("cod");

if (cod!=null){
    int codForm = Integer.parseInt(cod);
      ResultSet rs= form.AbrirDoc(codForm);
      while (rs.next()){
          
     %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DOCUMENTO<%=rs.getString("cod_form") %></title>
<link href="../LayPic/estilo.css" rel="stylesheet" type="text/css">
</head>
<body class="fundo_form">
<table>
<tr>
  <td class="letra_form">Título: <%=rs.getString("titulo") %> </td>
</tr>
<tr>
  <td width="10%" class="letra_form">Válido até:
    <%
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
</tr>
<tr>
  <td width="30%" class="letra_form">Inserido por: <%=rs.getString("nome_pessoa") %> em
    <%
         SimpleDateFormat formatador1 = new SimpleDateFormat("yyyy-MM-dd");  
        String data1=rs.getString("data_insercao");
        try {
 		data33 = formatador1.parse(data1);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador1.applyPattern("dd/MM/yyyy"); 
        String dataInsercao = formatador1.format(data33);
        out.println(dataInsercao); %></td>
</tr>
<tr>
  <td class="letra_form">Conteúdo:<br>
    <%=rs.getString("conteudo") %></td>
</tr>
</tr>
<tr>
  <td class="letra_form">Arquivos
    <% byte [] arquivo =rs.getBytes("arquivo");
    if (arquivo.length > 0){
    %>
    <a href="abrirAnexo.jsp?cod=<%=cod%>&tipo=<%=rs.getString("tipo_arquivo")%>&tipoclasse=form" target="_blank">Clique aqui para abaixar o arquivo</a>
    <%    }else{%>
    Não possui arquivos
    <%}
 %></td>
</tr>
<tr>
  <td ><br>
    <br>
    <center>
    <a href="formResponder.jsp?cod=<%=rs.getString("cod_form")%>">RESPONDER FORMULÁRIO</a></td>
</tr>
</tr>
</body>
</html>
<%}}
%>
