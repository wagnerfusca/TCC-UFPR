<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.http.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="forum" scope="page" class="Intranet.Forum" /><jsp:setProperty name="forum" property="*" />
<%
    String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Tópico não foi inserido ");
        </script>
<%   }else{%>
<script language="JavaScript">
             alert ("Tópico inserido com sucesso");
        </script>
<% }
    } 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
<script language="JavaScript" type="text/JavaScript">
     function Verifica(){
        if(document.form1.post.value==""){
		alert("Erro! O campo POST deve ser preenchido!");
		document.form1.post.focus();
		return false;
	}    
	}
</script>
</head>
<body class="fundo_cinza">
<p align="left" class="titulo_form">Fórum
<hr align="left" class="titulo_form">
<table border="0" >
  <%
java.util.Date data33 =null;
int codTopico=0;
    String cod = request.getParameter("cod");
    if (cod!=null){
     codTopico = Integer.parseInt(cod); 
    ResultSet rs = forum.AbrirTopicos(codTopico);
%>
  <tr>
    <td width="35%" class="letra_form">Título </td>
    <td width="15%" class="letra_form">Inserido em:</td>
    <td width="50%" class="letra_form">Comentário:</td>
  </tr>
  <% while (rs.next()){%>
  <tr>
    <td width="35%" class="letra_form"><%=rs.getString("titulo_topico") %></td>
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
    <td width="50%" class="letra_form"><%=rs.getString("conteudo_topico")%> </td>
    </td>
  </tr>
  </tr>
  <td colspan="3"><hr></td>
  </tr>
  <%}
ResultSet rs1 = forum.AbrirPost(codTopico);
%>
  <tr>
    <td width="15%" class="letra_form">Inserido em:</td>
    <td width="30%"class="letra_form">Inserido por:</td>
    <td width="50%" class="letra_form">Comentário:</td>
  </tr>
  <% while (rs1.next()){%>
  <tr>
    <td width="15%" class="letra_form"><%SimpleDateFormat formatador1 = new SimpleDateFormat("yyyy-MM-dd");  
        String data1=rs1.getString("data_insercao");
        try {
 		data33 = formatador1.parse(data1);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador1.applyPattern("dd/MM/yyyy"); 
        String dataInsercao = formatador1.format(data33);
        out.println(dataInsercao);%>
    </td>
    <td width="30%" class="letra_form"><%=rs1.getString("nome_pessoa")%> </td>
    <td width="50%" class="letra_form"><%=rs1.getString("post")%> </td>
    </td>
  </tr>
  <tr>
    <td colspan="3"><hr></td>
  </tr>
  <%}}%>
  <tr>
    <td colspan="3"><hr></td>
  </tr>
  <form name="form1" action="salvaForumPost.jsp" method="post" onSubmit="return Verifica(this)">
    <tr>
      <td colspan="3" class="letra_form">Post:<br>
        <textarea name="post" cols="60" rows="5" class="input" id="post"></textarea>
        <input type="hidden" name="codForum" value="<%=codTopico%>">
        <input type="hidden" name="codPessoa" value="<%=sessao.getAttribute("codPessoa")%>">
        <input type="submit" value="Enviar">
  </form>
  </tb>
  </tr>
  
</table>
<hr class="titulo_form">
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
