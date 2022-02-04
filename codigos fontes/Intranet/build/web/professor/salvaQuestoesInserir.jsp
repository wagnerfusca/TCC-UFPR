<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="banco" scope="page" class="Intranet.BancoQuestoes" /><jsp:setProperty name="banco" property="*" />
<%
String pergunta = request.getParameter("pergunta");
String certa = request.getParameter("certa");
String comentario_certa = request.getParameter("conteudo");
String errada1 = request.getParameter("erro1");
String errada2 = request.getParameter("erro2");
String errada3 = request.getParameter("erro3");
String errada4 = request.getParameter("erro4");
String cod = request.getParameter("cod");
if (cod!=null){
//ATUALIZAR 
    int codPergunta = Integer.parseInt(cod);
    boolean inserido = banco.InserePergunta(pergunta,certa,errada1,errada2,errada3,errada4,comentario_certa,codPergunta);
    if (inserido){   
        response.sendRedirect("discQuestoesAbrir.jsp?cod="+cod+"&msg=salvo");
    }else{ 
        response.sendRedirect("discQuestoesAbrir.jsp?cod="+cod+"&msg=erro");
    } 
}else{
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    //PEGA O CODIGO DA TABELA BANCO_QUESTOES PARAR INSERIR NAS PERGUNTAS E RESPOSTAS..
    ResultSet rs = banco.BuscarCodBancoQuestoes(codDisciplinaVirtual);
    while (rs.next()){
       int codBancoQuestoes = rs.getInt("cod_banco_questoes");
        boolean inserido = banco.InserePergunta(pergunta,certa,errada1,errada2,errada3,errada4,comentario_certa,codBancoQuestoes);
        if (inserido){   
            response.sendRedirect("discQuestoesInserir.jsp?msg=salvo");
         }else{ 
            response.sendRedirect("discQuestoesInserir.jsp?msg=erro");
         } 
        break;
     }//while   
}%>
