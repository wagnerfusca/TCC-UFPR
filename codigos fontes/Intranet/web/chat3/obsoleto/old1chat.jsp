<%@ page import="java.util.*,chat.*,java.text.*"%>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="incl/nstl.css">
<script type="text/javascript" src="incl/cff.js"></script>
<title>CHAT</title>
<style type="text/css">
body{font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;color:#000000;background-color:#ffffff}
.p{background-color:#ffffff}
.c{font-size:12px;font-weight:bold;color:#ffffff;background-color:#A09CA0}
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
        
<table width="100%" height="277" border="0">
  <tr> 
    <td height="16" colspan="2" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="c" colspan="4" align="center">CHAT</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td width="80%" height="239" valign="top">
    <table width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td width="20%" class="f" nowrap>&nbsp;Data / Hora&nbsp;</td>
          <td width="20%" class="f">&nbsp;Nome-&Aacute;rea&nbsp;</td>
          <td width="60%" class="f">&nbsp;Mensagem&nbsp;</td>
		</tr> 
          <%
                   for (Iterator i = ochat.getPerguntas().iterator(); i.hasNext(); )
					  {
					     chat.Pergunta item = (chat.Pergunta)i.next();
				  %>
        <tr class="b"> 
          <td width="20%"><%=item.getData() %></td>
          <td width="20%"><%= item.getUsuario().getArea()  %><%= item.getUsuario().getNome() %><img src="pics/w1.gif" width="11" height="14" alt=""></td>
          <td width="60%"> <%= item.getTexto() %></td>
        </tr>   
        <%
					  }
				  %>
      </table></td>
    <td width="20%" valign="top">
    <table width="100%" border="0" cellpadding="2" cellspacing="1">
		<tr>
          <td class="f" nowrap>&nbsp;Usu&aacute;rios Online&nbsp;</td>
		</tr>       
           <%
			  for (Iterator i = ochat.getUsuarios().iterator(); i.hasNext(); )
				  {
				     chat.Usuario usuario = (chat.Usuario)i.next();
		  %>
	    <tr>
          <td class="a"><%= usuario.getArea()  %>&nbsp;<b><%= usuario.getNome()  %></b></td>
        </tr>
    
		  <%
   				}

		  %>
      </table></td>
  </tr>
</table>
</body>
</html>