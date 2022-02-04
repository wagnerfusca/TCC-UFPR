<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="javax.servlet.http.*"%>
<%@include file = "validaSessao.jsp"  %>
<%@page import="java.lang.*"%>

<jsp:useBean id="cronograma" scope="page" class="Intranet.CronogramaTarefa" />
<jsp:setProperty name="cronograma" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
        function Atualizar()
        {
            document.form1.action="discCronograma.jsp"
            document.form1.submit();
           }
</script>           
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all" />
</head>
<%
   String mes1= request.getParameter("mes");
   String ano1= request.getParameter("ano");
   java.util.Date dataHoje1 = new java.util.Date();
   int mes =0;
   if ((mes1==null) && (ano1==null)){
        int ano = dataHoje1.getYear()+1900;
        mes = dataHoje1.getMonth()+1;
        ano1 = Integer.toString(ano);
        mes1 = Integer.toString(mes);
   }else{
       mes = Integer.parseInt(mes1);
   }    
   String dataInicio = ano1+"-"+mes1+"-"+"01";
    String dataFim = "0";
   if(mes==2){
      dataFim = ano1+"-"+mes1+"-"+"28";
   }
    if((mes==1)||(mes==3)||(mes==5)||(mes==7)||(mes==8)||(mes==10)||(mes==12)){
      dataFim = ano1+"-"+mes1+"-"+"31";
   }
   if((mes==4)||(mes==6)||(mes==9)||(mes==11)){
      dataFim = ano1+"-"+mes1+"-"+"30";  
   }
   
   java.util.Date data33 =null;
   java.util.Date data31 =null;
   
   Object codDisciplina1 = sessao.getAttribute("codDisciplina");
   String codDisciplina2 = codDisciplina1.toString();
   int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 

   ResultSet rs = cronograma.BuscarTarefaMes(dataInicio,dataFim,codDisciplinaVirtual);%>  
<body class="fundo_cinza">
<p align="left" class="titulo_form">Cronograma do mês:  <%String nomeMes = cronograma.Mes(mes);%> 
<%=nomeMes%>/<%=ano1%>

<hr align="left" class="titulo_form">
<table width="97%" border="1" >
<form id="form1" name="form1" method="get" >
<tr>
        <td width="30%" class="letra_form">Título </td>
        <td width="10%" class="letra_form">Inserido em:</td>
        <td width="10%" class="letra_form">Válido até:</td>
        <td width="30%" class="letra_form">Inserido por:</td>
   </tr>     
                <% while(rs.next()){%>
		<tr>
         <td width="30%" class="letra_form">
         <a href="javascript:window.open('discCronAbrir.jsp?cod=<%=rs.getString("cod_cronograma")%> ','janela1','width=600,height=400,scrollbars=yes');void(null)"> 
<%=rs.getString("titulo_tarefa")%> </a></td>
        <td width="10%" class="letra_form">
<%
        SimpleDateFormat formatador1 = new SimpleDateFormat("yyyy-MM-dd");  
        String data1=rs.getString("data_tarefa");
        try {
 		data33 = formatador1.parse(data1);
            } catch (ParseException e) {
                    e.printStackTrace();
            }
        formatador1.applyPattern("dd/MM/yyyy"); 
        String dataInsercao = formatador1.format(data33);
        out.println(dataInsercao);
        %>
        </td>
        <td width="10%" class="letra_form">
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
        out.println(dataValidade);
%>
</td>
        <td width="30%" class="letra_form"><%=rs.getString("nome_pessoa")%> </td>
    </td>
    </tr>
<%}
%>     
</table>
<hr class="titulo_form">
<table>
<tr>
<td width="99" class="letra_form">Digite o ano: 
  <input type="text" name="ano" size="5" maxlength="4"></td>
<td width="298" class="letra_form">Selecione outro mês desejado: 
            <select name="mes" class="input" onchange="Atualizar()">
                    <option value="">Selecione</option>
                   <option value="1">Janeiro</option>
                   <option value="2">Fevereiro</option>
                   <option value="3">Março</option>
                   <option value="4">Abril</option>
                   <option value="5">Maio</option>
                   <option value="6">Junho</option>
                   <option value="7">Julho</option>
                   <option value="8">Agosto</option>
                   <option value="9">Setembro</option>
                   <option value="10">Outubro</option>
                   <option value="11">Novembro</option>
                   <option value="12">Dezembro</option>
      </select>
    </td>
            
</tr>
</form>
</table>
<hr class="titulo_form"><p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>