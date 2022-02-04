<%@ page import="java.util.*,chat.*,java.text.*"%>
<jsp:useBean id="omod" scope="application" class="chat.Perguntas" />
<jsp:useBean id="ochat" scope="application" class="chat.Perguntas" />
<jsp:useBean id="usuario" scope="session" class="chat.Usuario" />
<%@ include file = "sessao.jsp" %>
<%  
    String num = request.getParameter("num");    
    String nome1 = request.getParameter("nome");
    int numero;
    if(nome1!=null)
         numero = Integer.parseInt(num);
    else
       numero = 0;
    
    String dialog = request.getParameter("dialogo");    
    if (dialog != null){
        Object msg = sessao2.getAttribute("questao");
        Object nome = sessao2.getAttribute("nome");
        if (msg==null){
            msg=" ";
            nome=" ";
        }
        String dialog3 = msg.toString();
        String nome3 = nome1.toString();
        dialog = dialog+"<br>"+dialog3;
        nome1 = nome1+"<br>"+nome3;
        sessao2.setAttribute("questao", dialog);
        sessao2.setAttribute("nome", nome1);
     }
    if(nome1!=null)
        numero++;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="incl/nstl.css">
<script type="text/javascript" src="incl/cff.js"></script>
<title>CHAT</title>
<style type="text/css">
body{font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;color:#000000;background-color:#eeeeee}
.p{background-color:#ffffff}
.c{font-size:12px;font-weight:bold;color:#ffffff;background-color:#A09CA0}
.y{color:#333333;background-color:transparent}
A:link{color:#333333;background-color:transparent}
A:visited{color:#333333;background-color:transparent}
A:hover{color:#aaaaaa;background-color:transparent}
A:active{color:#aaaaaa;background-color:transparent}</style>
<script language="JavaScript" type="text/JavaScript">

</script>
</head>
<body onLoad="rfr()" onUnload="unl()">  
<form action="chat.jsp" method="post" >
<table width="100%" height="90%" border="0">
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
    <div id="Layer1" style="width:100%; height:100%; z-index:2; overflow:auto;">
    <table width="100%" border="0" cellpadding="1" cellspacing="1">
        <tr> 
          <td width="20%" class="f">&nbsp;Nome</td>
          <td width="80%" class="f">&nbsp;Mensagem&nbsp;</td>
		</tr> 
<%if (dialog!=null){%>	
        <tr class="b"> 
          </td>
          <td width="20%" ><font color="#FF0000"><%=nome1%></td>
          <td width="60%"> <font color="#FF0000"> <%=dialog%>
          </td>
          
        </tr>   
        <%}%>
      </table>
      </div></td>
    <td width="20%" height="100%" valign="top">
    <div id="Layer2" style="width:100%; height:100%; z-index:2; overflow:auto;">
    <table width="100%" border="0" cellpadding="2" cellspacing="1">
		<tr>
          <td class="f" nowrap>&nbsp;Usu&aacute;rios Online&nbsp;</td>
		</tr>       
           <%//Le a lista de usuarios logados do objeto ochat e coloca dentro da tabela
			  for (Iterator i = ochat.getUsuarios().iterator(); i.hasNext(); )
				  {
				     chat.Usuario listausuarios = (chat.Usuario)i.next();
		  %>
	    <tr>
          <td class="a">
          &nbsp;
 		   <% 
   			      if (listausuarios == usuario)   //se o usuario for igual ao usuario da sessao mostra em vermelho e negrito
			         {
	   	   %>
              <font color="#FF0000"><b> <%= usuario.getNome() %></b></font>
              <%
					 } 
   			      if (listausuarios != usuario)
				  { 
			%>	   	
				<b>	  <%= listausuarios.getNome()  %></b>
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
<table align="center" border="0" width="100%">
	<tr>
		<td width="80%" colspan="3"><input type="text" name="dialogo" size="180" maxlength="180" class="ia">
		</td>
		<input type="hidden" name="num" value="<%=numero%>">
		<input type="hidden" name="nome" value="<%=usuario.getNome()%>">
		<td align="left"><input type="submit" value="Envia" class="ib">
		
		</td>
	</tr>
	<tr>
		<td colspan="4" nowrap> 
		</td>
	</tr>
	<tr>
  			<td valign="top" align="center" nowrap><b>
  			
    	    <a href="chat.jsp" title="Modo chat [Atualiza]">Atualizar</a> | 
	    <a href="sair.jsp" target="_parent">Sair</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
