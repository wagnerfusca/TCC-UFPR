<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="edital" scope="page" class="Intranet.Edital" /><jsp:setProperty name="edital" property="*" />
<%
String titulo = request.getParameter("titulo");
String data2 = request.getParameter("validade");
String conteudo = request.getParameter("conteudo");
String dataHoje,dataValidade;
java.util.Date dataHoje1 = new java.util.Date();
java.util.Date data33 = null;
    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
    try {
 			data33 = formatador.parse(data2);
                      } catch (ParseException e) {
 			e.printStackTrace();
                    }
    formatador.applyPattern("yyyy-MM-dd"); 
    dataHoje = formatador.format(dataHoje1);
    dataValidade = formatador.format(data33);

        Object codPessoa = sessao.getAttribute("codPessoa");
        String codPessoa1 = codPessoa.toString() ;
        int autor = Integer.parseInt(codPessoa1);
        
        boolean inserido = edital.InsereEdital(titulo,conteudo,dataValidade,dataHoje,autor);
        if (inserido){   
            response.sendRedirect("editalInserir.jsp?msg=salvo");
         }else{ 
            response.sendRedirect("editalInserir.jsp?msg=erro");
        }    
%>
