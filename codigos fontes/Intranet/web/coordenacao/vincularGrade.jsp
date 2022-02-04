<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.String"%>
<jsp:useBean id="curso" scope="page" class="Intranet.Curso" /><jsp:setProperty name="curso" property="*" />
<jsp:useBean id="grade" scope="page" class="Intranet.GradeHoraria" /><jsp:setProperty name="grade" property="*" />
<%
String codGrade = request.getParameter("grade");
String codCurso = request.getParameter("curso");
String contador = request.getParameter("contador");
String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
            alert ("Grade não foi criada ");
        </script>
<%  }else{%>
<script language="JavaScript">
            alert ("Grade criada com sucesso");
        </script>
<%  }
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
        function Atualizar()
        {
            document.form1.action="vincularGrade.jsp"
            document.form1.submit();
           }
          
    function Verifica(){
        if(document.form1.curso.value==""){
		alert("Erro! Selecione o Curso!");
            document.form1.curso.focus();
		return false;
	}    
	  if(document.form1.grade.value==""){
		alert("Erro! Selecione uma GRADE !");
		document.form1.grade.focus();
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
<p align="left" class="titulo_form">Vincular grade-discplina
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="get" action="salvaVincularGrade.jsp" onSubmit="return Verifica(this)">
  <div>
    <div class="edit">
      <p><span class="letra_form">Selecione o curso:</span><br />
        <select name="curso" id="curso" onChange="Atualizar()">
          <option value="">Selecione</option>
          <% Object Coord =sessao.getAttribute("codCoord");
                                   String codCoor = Coord.toString() ;
                                   ResultSet rs = curso.BuscarCurso(codCoor);
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
      <p><span class="letra_form">Selecione a Grade a ser formada:</span><br />
        <select name="grade" id="grade" onChange="Atualizar()">
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
    <div class="edit"><br>
      <p><span class="letra_form">Selecione as disciplinas que irão compor a grade:</span><br />
      <table border="0">
        <tr>
          <td width="10%"></td>
          <td width="50%">Disciplina</td>
          <td width="25%">Período</td>
        </tr>
        <% int contador1 = 0;    
                            ResultSet rs2 = curso.BuscarCursoDisciplina(codCurso);
                            while (rs2.next()){%>
        <tr>
          <td width="10%"><input name="<%=contador1%>" type="checkbox" value="<%=rs2.getInt("cod_curso_disciplina")%>">
          </td>
          <td width="50%"><%=rs2.getString("cod_disciplina")%>-<%=rs2.getString("nome_disciplina")%> </td>
          <td width="25%"><%=rs2.getString("periodo_disciplina")%></td>
        </tr>
        <%
                            contador1++;
                           } 
                           contador1--;
                           
                           %>
        <input type='hidden' name="contador" value="<%=contador1%>">
      </table>
      </p>
    </div>
    <div class="button" id="botao">
      <div align="center">
        <input name="enviar" type="submit" id="enviar" value="Enviar" />
      </div>
    </div>
    <%}%>
  </div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
