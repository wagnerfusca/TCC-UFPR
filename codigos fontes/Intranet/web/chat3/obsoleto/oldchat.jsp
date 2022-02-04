<%@ page import="java.util.*,chat.*,java.text.*"%>
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<%
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy-hh:mm");
    System.out.println(sdf.format(date)); 
%>
    
    
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
</head>
<body onLoad="rfr()" onUnload="unl()">
<table width="100%" class="tbl"><tr><td align="Top" valign="bottom">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr><td class="p">
<table border="0" width="100%" cellpadding="5" cellspacing="1">
              <tr>
                <td class="c" colspan="4" align="center">CHAT</td>
              </tr>
<tr><td width="10%" class="f" nowrap>&nbsp;Data / Hora&nbsp;</td>
<td width="10%" align="right" class="f">&nbsp;Nome-&Aacute;rea&nbsp;</td>
<td width="70%" class="f">&nbsp;Mensagem&nbsp;</td>
<td width="10%" class="f" nowrap>&nbsp;Usu&aacute;rios Online&nbsp;</td></tr>

<div id="Layer1" style="position:absolute; width:80%; z-index:1; left: 0px; top: 0px; overflow:scroll;">
  <table width="100%" border="0" >
<%

  for (Iterator i = ochat.getPerguntas().iterator(); i.hasNext(); )
  {
     chat.Pergunta item = (chat.Pergunta)i.next();
%>
 <tr class="b"><td nowrapw >Jun 28, 15:35</td><td class="e" nowrap><%= item.getUsuario().getNome() %><img src="pics/w1.gif" width="11" height="14" alt=""></td><td> <%= item.getTexto() %></td></tr>
<%
  }
%>
</table>
</div>
</body>
</html>