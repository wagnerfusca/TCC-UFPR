<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="cronograma" scope="page" class="Intranet.CronogramaTarefa" />
<jsp:setProperty name="cronograma" property="*" />
<%
    java.util.Date data33 =null;
    java.util.Date data31 =null;
    String cod = request.getParameter("cod");
    String tipo = request.getParameter("tipo");
    
    if (cod!=null){
    int codTarefa = Integer.parseInt(cod);
      ResultSet rs= cronograma.AbrirTarefa(codTarefa);
      while (rs.next()){
          
     %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarefa <%=rs.getInt("cod_cronograma") %> </title>
     <link href="../LayPic/estilo.css" rel="stylesheet" type="text/css">
    </head>
    <body class="fundo_form">
<table>
     <tr>
        <td class="letra_form">T�tulo: <%=rs.getString("titulo_tarefa") %> </td>
   </tr> 
<%if (tipo!=null) {%>
<tr>     <td width="10%" class="letra_form">V�lido at�:
   <%
         SimpleDateFormat formatador2 = new SimpleDateFormat("yyyy-MM-dd");  
        String data2=rs.getString("data_limite") ;
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
<%}%> 
<tr>    <td width="30%" class="letra_form">Inserido por:
    <%=rs.getString("nome_pessoa")%> em <%
         SimpleDateFormat formatador1 = new SimpleDateFormat("yyyy-MM-dd");  
        String data1=rs.getString("data_tarefa");
        try {
 		data33 = formatador1.parse(data1);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador1.applyPattern("dd/MM/yyyy"); 
        String dataInsercao = formatador1.format(data33);
        out.println(dataInsercao); %>
         </td>
   </tr> 
   <tr>    <td class="letra_form">Conte�do:<%=rs.getString("conteudo_tarefa") %></td>
   </tr> 
   <tr>  <td class="letra_form">Arquivo: 
   
<% byte [] arquivo =rs.getBytes("arquivo");
    if (arquivo.length > 0){
    %><a href="abrirAnexo.jsp?cod=<%=cod%>&tipo=<%=rs.getString("tipo_anexo")%>&tipoclasse=cronograma" target="_blank">Clique aqui para acessar o arquivo</a>
<%    }else{%>
    n�o possui arquivos
    <%}
 %></td>
   </tr> 
  <tr>    <td ><br><br><center><a href="discCronResponder.jsp?cod=<%=rs.getInt("cod_cronograma")%>">RESPONDER </a></td>

   </body>
</html>
<%}}%>