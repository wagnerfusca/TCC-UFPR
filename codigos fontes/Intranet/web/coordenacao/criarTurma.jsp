<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<jsp:useBean id="grade" scope="page" class="Intranet.GradeHoraria" /><jsp:setProperty name="grade" property="*" />
<jsp:useBean id="curso" scope="page" class="Intranet.Curso" /><jsp:setProperty name="curso" property="*" />
<jsp:useBean id="prof" scope="page" class="Intranet.Professor" /><jsp:setProperty name="prof" property="*" />
<%
/*String codigo = request.getParameter("codigo");
String nome = request.getParameter("nome");
String sala = request.getParameter("sala");
String horario = request.getParameter("horario");
*/
String codGrade = request.getParameter("grade");
String codCurso = request.getParameter("curso");
//String codDisciplina = request.getParameter("disciplina");

String codGradeDisc = request.getParameter("disciplina");
String codProfessor = request.getParameter("professor");
String codDepartamento = request.getParameter("departamento");
String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            
            alert ("Turma não foi criada. Digite outro codigo para Turma");
        </script>
<%  }else{%>
<script language="JavaScript">
            alert ("Turma criada com sucesso");
        </script>
<%}
  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
        function Atualizar()
        {
            document.form1.action="criarTurma.jsp"
            document.form1.submit();
           }
           
        function Verifica(){
        if(document.form1.codigo.value==""){
		alert("Erro! Digite o CODIGO da turma!");
            document.form1.codigo.focus();
		return false;
	}    
	  if(document.form1.nome.value==""){
		alert("Erro! Digite um NOME para a turma !");
		document.form1.nome.focus();
		return false;
	}     if(document.form1.sala.value==""){
		alert("Erro! Digite a em qual SALA haverá essa turma!");
		document.form1.sala.focus();
		return false;
	}     if(document.form1.horario.value==""){
		alert("Erro! Digite um HORÁRIO para esta turma !");
		document.form1.horario.focus();
		return false;
	}    
	 if(document.form1.curso.value==""){
		alert("Erro! Selecione o CURSO que abrigará esta turma !");
		document.form1.curso.focus();
		return false;
	}    
        if(document.form1.curso.value!=""){
            if(document.form1.grade.value==""){
		alert("Erro! Seleicone a GRADE que abrigará esta turma !");
		document.form1.grade.focus();
		return false;
            }  
            if(document.form1.grade.value!=""){
               if(document.form1.disciplina.value==""){
                    alert("Erro! Seleicone uma DISCIPLINA para esta turma !");
                    document.form1.disciplina.focus();
                    return false;
               }  
                if(document.form1.professor.value==""){
                    alert("Erro! Seleicone um PROFESSOR para esta turma !");
                    document.form1.professor.focus();
                    return false;
                }  
            }    
        }
        return true;
    } 
        </script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Criar turma
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="salvaTurma.jsp" onSubmit="return Verifica(this)">
  <div class="edit">
    <p><span class="letra_form">Selecione o curso:</span><br />
      <select name="curso" class="input" id="curso" onChange="Atualizar()">
        <option value="">Selecione</option>
        <% Object Coord =sessao.getAttribute("codCoord");
                                   String codCoor = Coord.toString() ;
                                   ResultSet rs = curso.BuscarCurso(codCoor);
                                   while (rs.next()){
                                   String codigoCurso =rs.getString("cod_curso");
                                   if (codCurso!=null){
                                        if (codCurso.equals(codigoCurso)){     %>
        <option value="<%=codigoCurso%>" selected><%=rs.getString("nome_curso")%></option>
        <%}
                                  }%>
        <option value="<%=codigoCurso%>"><%=rs.getString("nome_curso")%></option>
        <%}%>
      </select>
    </p>
  </div>
  <% if (codCurso!=null){%>
  <div class="edit">
    <p><span class="letra_form">Selecione a grade:</span><br />
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
    <%     
                           Object Coordenacao =sessao.getAttribute("codCoord");
                                   String codCoordenacao = Coordenacao.toString() ;
                                   ResultSet rs5 = curso.BuscarCurso(codCoordenacao);
                           while (rs5.next()){
                               String curso1 =rs5.getString("cod_curso");
                               //String departamento = rs5.getString("cod_departamento");
                               if (codCurso.equals(curso1)){%>
    
    <%   }
                           } %>
  </div>
  <% if (codGrade!=null){%>
  <div class="edit">
  <p><span class="letra_form">Selecione a disciplina para formar uma turma:</span><br />
  <table border="0">
  <select name="disciplina" class="input" id="disciplina" onChange="Atualizar()" >
    <option value="">Selecione</option>
    <%  
                        int intGrade= Integer.parseInt(codGrade); 
                        ResultSet rs2 = grade.BuscarDadosDisc(intGrade,codCurso);
                           while (rs2.next()){
                           int codigoGradeDisc =rs2.getInt("cod_grade_disciplina"); 
                                if (codGradeDisc!=null){
                                   int intGradeDisciplina= Integer.parseInt(codGradeDisc); 
                                   if (intGradeDisciplina==codigoGradeDisc){     %>
    <option value="<%=codigoGradeDisc%>" selected><%=rs2.getString("cod_disciplina")%>-<%=rs2.getString("nome_disciplina")%>-<%=rs2.getString("periodo_disciplina")%></option>
    <%}}%>
    <option value="<%=codigoGradeDisc%>"><%=rs2.getString("cod_disciplina")%>-<%=rs2.getString("nome_disciplina")%>-<%=rs2.getString("periodo_disciplina")%></option>
    <%}%>
  </select>
  </p>
  </div>
  <% if (codGradeDisc!=null){
                        String codDepartamento1=null;
                        int intGradeDisciplina1= Integer.parseInt(codGradeDisc); 
                        ResultSet rs10 = grade.BuscarDadosDiscProf(intGradeDisciplina1);
                        while (rs10.next()){
                            codDepartamento1=rs10.getString("cod_departamento");
                        }%>
  <p><span class="letra_form">Selecione o professor que irá ministrar as aulas:</span><br />
  <table border="0">
    <select name="professor" class="input" id="professor" >
      <option value="">Selecione</option>
      <%  ResultSet rs11 = prof.BuscarProfessor(codDepartamento1);
                            while (rs11.next()){%>
      <option value="<%=rs11.getInt("cod_professor")%>"><%=rs11.getString("Nome_pessoa")%></option>
      <%          }%>
    </select>
    <div class="edit">
      <p><span class="letra_form">Código:</span>
        <input name="codigo" type="text" id="codigo" size="10" maxlength="10" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Nome do Turma:</span>
        <input name="nome" type="text" id="nome" size="30" maxlength="25" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Sala:</span>
        <input name="sala" type="text" id="sala" size="15" maxlength="15" />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">Horário:</span>
        <input name="horario" type="text" id="horario" size="15" maxlength="15" />
      </p>
    </div>
    <%}%>
    </select>
    
    </p>
    </div>
    
    <div class="button" id="botao">
      <div align="center">
        <input name="enviar" type="submit" id="enviar" value="Enviar" />
      </div>
    </div>
    <% }
        }%>
    </tr>
    
  </table>
  </div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
