<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="arquivo" scope="page" class="Intranet.ArquivoPubl" /><jsp:setProperty name="arquivo" property="*" />
<jsp:useBean id="cronograma" scope="page" class="Intranet.CronogramaTarefa" /><jsp:setProperty name="cronograma" property="*" />
<jsp:useBean id="edital" scope="page" class="Intranet.EditalDisciplina" /><jsp:setProperty name="edital" property="*" />
<jsp:useBean id="biblio" scope="page" class="Intranet.BibliotecaDigital" /><jsp:setProperty name="biblio" property="*" />
<jsp:useBean id="form" scope="page" class="Intranet.Formularios" /><jsp:setProperty name="form" property="*" />
<%
String cod = request.getParameter("cod");
String tipo = request.getParameter("tipo");
String tipoclasse = request.getParameter("tipoclasse");
if (cod!=null){
    int codigo = Integer.parseInt(cod);
    ResultSet rs = null;
    
    if (tipoclasse.equals("arquivo")){ 
         rs= arquivo.AbrirArq(codigo);
    }
    if (tipoclasse.equals("edital")){ 
        rs= edital.AbrirArq(codigo);
    }
    if (tipoclasse.equals("biblio")){ 
         rs= biblio.AbrirMono(codigo);
    }
    if (tipoclasse.equals("cronograma")){ 
         rs= cronograma.AbrirArq(codigo);
    }
    if (tipoclasse.equals("form")){ 
         rs= form.AbrirDoc(codigo);
    }
       while (rs.next()){
          byte [] arquivo1 =rs.getBytes("arquivo");
        // aqui deve ser configurado direito, baseado no tipo do arquivo
          ServletOutputStream op = response.getOutputStream();
           response.setContentType("application/x-download");
	   response.setHeader("Content-Disposition", "attachment; filename="+"arquivo"+"."+tipo);
	   op.write( arquivo1);
           op.flush();
           op.close();
       }
    }

 %>
