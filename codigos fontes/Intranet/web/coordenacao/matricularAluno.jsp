<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="curso" scope="page" class="Intranet.Curso" /><jsp:setProperty name="curso" property="*" />
<jsp:useBean id="grade" scope="page" class="Intranet.GradeHoraria" /><jsp:setProperty name="grade" property="*" />
<jsp:useBean id="aluno" scope="page" class="Intranet.Aluno" /><jsp:setProperty name="aluno" property="*" />
<jsp:useBean id="turma" scope="page" class="Intranet.Turmas" /><jsp:setProperty name="turma" property="*" />
<jsp:useBean id="banco" scope="page" class="Intranet.BancoQuestoes" /><jsp:setProperty name="banco" property="*" />
<%
String codGrade = request.getParameter("grade");
String codCurso = request.getParameter("curso");
if ((codGrade!=null)&&(codCurso!=null)){
    String codAluno = request.getParameter("aluno");
    if (codAluno!=null){
        int intAluno= Integer.parseInt(codAluno); 
        String contador = request.getParameter("contador");
        int intcontador= Integer.parseInt(contador); 
        int cont1=0;
        int inserido1=0;
        int naoinserido=0;
        ResultSet rs6 = aluno.buscarAluno(codCurso);//buscar o cod pessoa
        while (rs6.next()){
             int codigoAluno =rs6.getInt("cod_aluno"); 
             if (intAluno==codigoAluno){     
                 int codPessoa= rs6.getInt("cod_pessoa"); 
                   while(cont1 <= intcontador){
                        String checkbox = Integer.toString(cont1);
                        String codTurma= request.getParameter(checkbox);
                        if (codTurma!=null){
                            int cont2= cont1+10;
                            int cont3= cont1+100;
                        String disciplina = Integer.toString(cont2);
                        String mono = Integer.toString(cont3);
                        String codDisciplina= request.getParameter(disciplina);
                        String monoProjeto= request.getParameter(mono);
                        
                        boolean inserido = aluno.alunoMatricular(codTurma,intAluno,codDisciplina,codPessoa);
                        if (inserido){
                           ResultSet rs22 = aluno.buscarCodMatriculado(codTurma,intAluno,codDisciplina,codPessoa);
                           int codMatriculado = 0;
                           int codDiscVirtual = 0;
                           while (rs22.next()){
                                codMatriculado = rs22.getInt("cod_matriculado");
                           }
                           ResultSet rs23 = aluno.buscarCodDisciplinaVirtual(codTurma);
                           while (rs23.next()){
                               codDiscVirtual = rs23.getInt("cod_disciplina_virtual");
                           }
                            boolean inserido3 = aluno.alunoMatricularVirtual(codDiscVirtual,codMatriculado,monoProjeto);
                            boolean inserido4 = banco.CriarBancoQuestao(codDiscVirtual);
                            
                            inserido1++;
                        }else{
                           naoinserido++;
                        }    
                    }//codTurma!=null
                cont1++;
               }
             }
         break;    
        }
    if ((naoinserido==0)&&(inserido1>0)){
   %>
<script language="JavaScript">
            alert ("Aluno matriculado com sucesso");
            
        </script>
<%  }else{%>
<script language="JavaScript">
            alert ("Aluno não foi matriculado ");
        </script>
<%      }
    }//cdoaluno!=null
}  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
        function Atualizar()
        {
            document.form1.action="matricularAluno.jsp"
            document.form1.submit();
           }
            function Verifica(){
      
         if(document.form1.cueso.value==""){
		alert("Erro! Selecione o CURSO!");
		document.form1.curso.focus();
		return false;
	}    
        
        if(document.form1.grade.value==""){
		alert("Erro! Selecione uma GRADE!");
            document.form1.grade.focus();
		return false;
	}     if(document.form1.aluno.value==""){
		alert("Erro! Selecione um ALUNO!");
            document.form1.aluno.focus();
		return false;
	}   
        return true;
    } 
        </script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Matricular aluno
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="matricularAluno.jsp" onSubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Selecione o curso:</span><br />
        <select name="curso" class="input" id="curso" onChange="Atualizar()">
          <option value="">Selecione</option>
          <% 
                                Object Coordenacao =sessao.getAttribute("codCoord");
                                   String codCoordenacao = Coordenacao.toString() ;
                                ResultSet rs = curso.BuscarCurso(codCoordenacao);
                                   while (rs.next()){
                                   String codigoCurso =rs.getString("cod_curso");
                                   if (codCurso!=null){
                                        if (codCurso.equals(codigoCurso)){     %>
          <option value="<%=codigoCurso%>" selected><%=rs.getString("nome_curso")%></option>
          <%}}%>
          <option value="<%=codigoCurso%>"><%=rs.getString("nome_curso")%></option>
          <%}%>
        </select>
      </p>
    </div>
    <% if (codCurso!=null){%>
    <div class="edit">
      <p><span class="letra_form">Grade:</span><br />
        <select name="grade" class="input" id="grade" onChange="Atualizar()">
          <option value="">Selecione</option>
          <%     
                            ResultSet rs1 = grade.BuscarGrade(codCurso);
                            while (rs1.next()){
                                int codigoGrade =rs1.getInt("cod_grade"); 
                                if (codGrade!=null){
                                   int intGrade= Integer.parseInt(codGrade); 
                                   if (intGrade==codigoGrade){     %>
          <option value="<%=codigoGrade%>" selected><%=rs1.getString("nome_grade")%></option>
          <%}}%>
          <option value="<%=codigoGrade%>"> <%=rs1.getString("nome_grade")%></option>
          <%} %>
        </select>
      </p>
    </div>
    <%}%>
    <% if (codGrade!=null){%>
    <div class="edit">
      <p><span class="letra_form">Aluno:</span><br />
        <select name="aluno" class="input" id="aluno" >
          <option value="">Selecione</option>
          <%     
                            ResultSet rs1 = aluno.buscarAluno(codCurso);
                            while (rs1.next()){
                                int codigoAluno =rs1.getInt("cod_aluno");
                             %>
          <option value="<%=codigoAluno%>"> <%=rs1.getString("nome_pessoa")%></option>
          <%} %>
        </select>
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Matricular:</span><br />
      <table border="1">
        <tr>
          <td width="5%"></td>
          <td width="35%" class="letra_form">Disciplina</td>
          <td width="15%" class="letra_form">Período</td>
          <td width="15%" class="letra_form">Sala</td>
          <td width="15%" class="letra_form">Horário</td>
          <td width="15%" class="letra_form">Monografia ou Projeto final?:</td>
        </tr>
        <% int contador1 = 0;    
                            int contador2 = 10;
                            int contador3 = 100;
                            ResultSet rs2 = turma.BuscarTurmas(codGrade);
                            while (rs2.next()){%>
        <tr>
          <td width="5%"><input name="<%=contador1%>" type="checkbox" value="<%=rs2.getString("cod_turma")%>">
          </td>
          <td width="35%"><input type="hidden" name="<%=contador2%>" value="<%=rs2.getString("cod_disciplina")%>">
            <%=rs2.getString("cod_disciplina")%>-<%=rs2.getString("nome_disciplina")%> </td>
          <td width="15%"><%=rs2.getString("periodo_disciplina")%></td>
          <td width="15%"><%=rs2.getString("sala")%></td>
          <td width="15%"><%=rs2.getString("horario")%></td>
          <td width="15%"><select name="<%=contador3%>" class="input">
              <option value="F" >Não</option>
              <option value="T">Sim</option>
            </select></td>
        </tr>
        <%
                            contador1++;
                            contador2++;
                            contador3++;
                           } 
                          contador1--;
                          contador2--;
                           contador3--; 
%>
        <input type='hidden' name="contador" value="<%=contador1%>">
      </table>
      </p>
    </div>
    <%}%>
    <div class="button" id="botao">
      <div align="center">
        <input name="enviar" type="submit" id="enviar" value="Enviar" />
      </div>
    </div>
  </div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
