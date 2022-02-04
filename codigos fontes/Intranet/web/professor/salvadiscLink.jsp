<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="link" scope="page" class="Intranet.Link" /><jsp:setProperty name="link" property="*" />
<jsp:useBean id="mat" scope="page" class="Intranet.MaterialApoio" /><jsp:setProperty name="mat" property="*" />
<%
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    
String titulo = request.getParameter("titulo");
String conteudo = request.getParameter("conteudo");
String link1 = request.getParameter("link");

String dataHoje;
java.util.Date dataHoje1 = new java.util.Date();

    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
    formatador.applyPattern("yyyy-MM-dd"); 
    dataHoje = formatador.format(dataHoje1);
    
  String tipo = "LINK";
  int codMaterial = 0;
    boolean inserido = mat.InsereMaterial(titulo,conteudo,dataHoje,tipo,codDisciplinaVirtual);
    if (inserido){   
            ResultSet rs = mat.BucarCodMaterial(titulo,conteudo,dataHoje,tipo,codDisciplinaVirtual);
            while (rs.next()){
                codMaterial = rs.getInt("cod_material");
            }
            boolean inserido2 = link.InsereLink(codMaterial, link1);
                if (inserido2)
                    response.sendRedirect("discLinkInserir.jsp?msg=salvo");
            
         }else{ 
            response.sendRedirect("discLinkInserir.jsp?msg=erro");
        }    
%>
