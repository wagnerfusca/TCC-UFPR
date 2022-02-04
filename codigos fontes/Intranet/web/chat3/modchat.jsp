<%@ page import="java.util.*,chat.*,java.text.*"%>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<jsp:useBean id="omod" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<%
// Se o usuario nao for Administrador vai para proibido.jsp
if (usuario.getSenha() == null || usuario.getSenha().equals(""))
	
   {
	response.sendRedirect("proibido.jsp");
	}
//Se o nome de usuario ou a area forem nulos volta para a tela de login
if ( (usuario.getNome() == null || usuario.getNome().equals("")) || (usuario.getArea() == null || usuario.getArea().equals("")))
{
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="incl/nstl.css">
<script>
function deletar()
{
	if(document.all.check == undefined) 
      {
      }     
	  else
	{
			document.form1.action = "moderamsg.jsp";
			document.form1.submit();
	}

}
function aceitar()
{
      if(document.all.check == undefined) 
      {
      }     
	  else
  	{
	     document.form1.action = "aceitamsg.jsp";
	     document.form1.submit();
      }
}
</script>
<script type="text/javascript" src="incl/modcff.js"></script>
<title>CHAT</title>
<style type="text/css">
body{font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;color:#000000;background-color:#eeeeee}
.p{background-color:#ffffff}
.c{font-size:12px;font-weight:bold;color:#ffffff;background-color:#A09CA0}
.d{font-size:12px;font-weight:bold;color:#0000ff;background-color:#A09CA0}
.y{color:#333333;background-color:transparent}
A:link{color:#333333;background-color:transparent}
A:visited{color:#333333;background-color:transparent}
A:hover{color:#aaaaaa;background-color:transparent}
A:active{color:#aaaaaa;background-color:transparent}</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</head>
<body onLoad="rfr()" onUnload="unl()">  
<table width="100%" height="100%" border="0">
  <tr> 
    <td height="16" colspan="2" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="c" colspan="4" align="center">CHAT</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td width="80%" height="100%" valign="top">
    <div id="Layer1" style="width:100%; height:50%; z-index:2; overflow:auto;">
    <table width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td class="c" colspan="4" align="center">Mensagens Enviadas Para o Moderador</td>
        </tr>  
        <tr> 
          <td width="2%" class="f" nowrap align="center">Check</td>
		  <td width="19%" class="f" nowrap>&nbsp;Data / Hora&nbsp;</td>
          <td width="19%" class="f">&nbsp;Nome-&Aacute;rea&nbsp;</td>
          <td width="60%" class="f">&nbsp;Mensagem&nbsp;</td>
		</tr> 
          <%	  
          		   for (int i = ochat.getPerguntas().size()-1; i > -1;i--)
				      {
					      chat.Pergunta item = (chat.Pergunta)ochat.getPerguntas().get(i);
		  %>
        <tr class="b"> 
        <form action="#" name="form1" method="post">
        	<td width="2%" align="center"> <input type="checkbox" name="check" value=<%=i %>></td>
		  <td width="19%"><%=item.getData() %></td>
          <td width="19%"><%= item.getUsuario().getArea()  %><%= item.getUsuario().getNome() %></td>
          <td width="60%"> <%= item.getTexto()%></td>
        </tr>   
        <%
					  }
        %>				  
      </table>
      </div>
      <input type="button" value="Deletar" name="b1" onclick='deletar()' /> &nbsp;&nbsp;
 	  <input type="button" value="Aceitar" name="b2" onclick='aceitar()' /></input></form>
          <div id="Layer3" style="width:100%; height:46%; z-index:2; overflow:auto;">
          <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="d" colspan="4" align="center">Mensagens Postadas no CHAT</td>
        </tr>
      </table>
          <table width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td width="20%" class="f" nowrap>&nbsp;Data / Hora&nbsp;</td>
          <td width="20%" class="f">&nbsp;Nome-&Aacute;rea&nbsp;</td>
          <td width="60%" class="f">&nbsp;Mensagem&nbsp;</td>
		</tr> 
          <%       //Le a lista de perguntas do objeto ochat e coloca dentro da tabela
          		   for (int i = omod.getPerguntas().size()-1; i > -1;i--)
				      {
					      chat.Pergunta item = (chat.Pergunta)omod.getPerguntas().get(i);
		  %>
        <tr class="b"> 
          <td width="20%"><%=item.getData() %></td>
          <td width="20%"><%= item.getUsuario().getArea()  %><%= item.getUsuario().getNome() %></td>
          <td width="60%"> <%= item.getTexto() %></td>
        </tr>   
        <%
					  }
        %>				  
      </table>
      </div></td>
    <td width="20%" height="100%" valign="top">
    <div id="Layer2" style="width:100%; height:100%; z-index:2; overflow:auto;">
    <table width="100%" border="0" cellpadding="2" cellspacing="1">
		<tr>
          <td class="f" nowrap>&nbsp;Usu&aacute;rios Online&nbsp;</td>
		</tr>      
           <%
			  for (Iterator i = ochat.getUsuarios().iterator(); i.hasNext(); )
				  {
				     chat.Usuario listausuarios = (chat.Usuario)i.next();
		  %>
	    <tr>
          <td class="a">          
                <%= listausuarios.getArea()  %>&nbsp;
         
 		   <% 
   			      if (listausuarios == usuario)
			         {
	   	   %>
              <font color="#FF0000"><b> <%= usuario.getNome() %></b></font>
              <%
					 } 
   			      if (listausuarios != usuario)
				  { 
			%>	   	
				<b><%=listausuarios.getNome()%></b>
	 <%
				  }
	 		}
	  %>
     </td>
     </tr>
      </table>
      </div>
      </td>
  </tr>
</table>
</body>
</html>