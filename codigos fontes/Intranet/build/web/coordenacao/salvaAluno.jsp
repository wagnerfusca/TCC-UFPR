<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.lang.String"%>
<jsp:useBean id="pessoa" scope="page" class="Intranet.Pessoa" /><jsp:setProperty name="pessoa" property="*" />
<jsp:useBean id="coord" scope="page" class="Intranet.Coordenacao" /><jsp:setProperty name="coord" property="*" />
<%
String matricula = request.getParameter("matricula");
String nome = request.getParameter("nome");
String dia = request.getParameter("dia");
String mes = request.getParameter("mes");
String ano = request.getParameter("ano");
String codCurso = request.getParameter("curso");

if ((matricula!=null)&& (nome!=null)&& (dia!=null)&& (mes!=null)&& (ano!=null)&& (codCurso!=null)){
    matricula = matricula.toUpperCase();
    nome = nome.toUpperCase();
    String dataNascimento = ano+"-"+mes+"-"+dia; 
    String Nascimento = dia+"/"+mes+"/"+ano;   
    String tipo = "ALUNO";
    ResultSet rs2 = pessoa.VerificaLogin(matricula,tipo);
    int contador=0;
    while (rs2.next()){
        contador = rs2.getInt("contador");
    }
    if(contador==0){
        boolean inserido = pessoa.InserePessoa(matricula,nome,dataNascimento,Nascimento,tipo);
        if (inserido){
          ResultSet rs = pessoa.BuscarPessoa(matricula,nome,dataNascimento,tipo);
          while (rs.next()){
             int codPessoa = rs.getInt("cod_pessoa");
               boolean inserido2 = coord.CriarAluno(codPessoa,codCurso);
               if (inserido2){
                    response.sendRedirect("cadastrarAluno.jsp?msg=salvo");
                }else{ 
                    response.sendRedirect("cadastrarAluno.jsp?msg=erro");
                }
          }
        }else{ 
          response.sendRedirect("cadastrarAluno.jsp?msg=pessoa");
        }    
    }else{
         response.sendRedirect("cadastrarAluno.jsp?msg=contador");
    }

}
%>
