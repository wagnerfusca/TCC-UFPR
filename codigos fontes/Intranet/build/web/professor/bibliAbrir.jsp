<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="biblio" scope="page" class="Intranet.BibliotecaDigital" /><jsp:setProperty name="biblio" property="*" />
<%
    java.util.Date data33 =null;
    java.util.Date data31 =null;
    String cod = request.getParameter("cod");
    if (cod!=null){
    int codigo = Integer.parseInt(cod);
      ResultSet rs= biblio.AbrirMono(codigo);
      while (rs.next()){
     %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Monografia<%=rs.getString("titulo_monografia") %></title>
<link href="../LayPic/estilo.css" rel="stylesheet" type="text/css">
</head>
<body class="fundo_form">
<br>
<div>
  <div class="edit">
    <p><span class="letra_form">Título: <%=rs.getString("titulo_monografia")%></span></p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Assunto: <%=rs.getString("assunto_monografia") %></span></p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Inserido por: <%=rs.getString("autor_monografia") %> em
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
        out.println(dataInsercao); %>
      </span></p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Conteúdo:<br>
      <%=rs.getString("conteudo_monografia") %></span></p>
  </div>
  <div class="edit">
    <p><span class="letra_form">Inserido pela coordenação: <%=rs.getString("nome_coordenacao")%></span></p>
  </div>
  <div class="edit">
    <p><span class="letra_form"> Arquivo: <a href="abrirAnexo.jsp?cod=<%=cod%>&tipo=<%=rs.getString("tipo_arquivo")%>&tipoclasse=biblio" target="_blank">Visualizar monografia/projeto</a></span></p>
  </div>
</div>
</body>
</html>
<%}}%>
