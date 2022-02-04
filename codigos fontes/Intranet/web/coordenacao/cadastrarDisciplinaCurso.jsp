<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<jsp:useBean id="curso" scope="page" class="Intranet.Curso" /><jsp:setProperty name="curso" property="*" />
<jsp:useBean id="dep" scope="page" class="Intranet.Departamento" /><jsp:setProperty name="dep" property="*" />
<%
String codCurso = request.getParameter("curso");
String codDepartamento = request.getParameter("departamento");

if ((codCurso!=null)&& (codDepartamento!=null)){
    String codDisciplina = request.getParameter("disciplina");
}  
    String msg = request.getParameter("msg");
    if (msg!=null){
        if (msg.equals("erro")){%>
<script language="JavaScript">
                alert ("Disciplina não foi inserida ");
        </script>
<% }else{%>
<script language="JavaScript">
            alert ("Disciplina inserida com sucesso");
      </script>
<%  }    
}%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
    function Verifica(){
        if(document.form1.curso.value==""){
		alert("Erro! Selecione o Curso!");
            document.form1.curso.focus();
		return false;
	}    
	  if(document.form1.departamento.value==""){
		alert("Erro! Selecione um Departamento!");
		document.form1.departamento.focus();
		return false;
	}    
	if(document.form1.departamento.value!=""){
            if(document.form1.disciplina.value==""){
		alert("Erro! Selecione uma Disciplina!");
		document.form1.disciplina.focus();
		return false;
            }    
	}    
        return true;
    } 
        function Atualizar()
        {
            document.form1.action="cadastrarDisciplinaCurso.jsp"
            document.form1.submit();
           }
        </script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Cadastrar disciplina no curso
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="salvaDisciplinaCurso.jsp" onSubmit="return Verifica(this)">
  <div>
    <div class="edit"><span class="letra_form">Selecione o curso:</span><br />
      <select name="curso" id="curso">
        <option value="">Selecione</option>
        <%
                        Object Coordenacao =sessao.getAttribute("codCoord");
                                   String codCoordenacao = Coordenacao.toString() ;
                                   ResultSet rs = curso.BuscarCurso(codCoordenacao);
                                   while (rs.next()){
                                    String codigoCurso =rs.getString("cod_curso");
                               if (codCurso!=null){
                                 if (codCurso.equals(codigoCurso)){
                        %>
        <option value="<%=codigoCurso%>" selected><%=rs.getString("nome_curso")%></option>
        <%}}%>
        <option value="<%=codigoCurso%>"><%=rs.getString("nome_curso")%></option>
        <%
                          }%>
      </select>
    </div>
    <br>
    <div class="edit"><span class="letra_form">Selecione o departamento:</span><br />
      <select name="departamento" id="departamento" onChange="Atualizar()">
        <option value="">Selecione</option>
        <%             ResultSet rs1 = dep.BuscarDepartamento();
                                    while (rs1.next()){
                                        String codigoDepartamento =rs1.getString("cod_departamento");
                                   if (codDepartamento!=null){
                                        if (codDepartamento.equals(codigoDepartamento)){     %>
        <option value="<%=codigoDepartamento%>"selected><%=rs1.getString("nome_departamento")%></option>
        <%}
                                   }%>
        <option value="<%=codigoDepartamento%>"><%=rs1.getString("nome_departamento")%></option>
        <%
                                 }%>
      </select>
    </div>
    <% if (codDepartamento!=null){ %>
    <div class="edit">
      <p><span class="letra_form">Disciplina:</span><br />
        <label>
        <select name="disciplina" class="input" id="disciplina">
          <option value="">Selecione</option>
          <%                       ResultSet rs2 = dep.BuscarDisciplina(codDepartamento);
                                   while (rs2.next()){%>
          <option value="<%=rs2.getString("cod_disciplina")%>"> <%=rs2.getString("nome_disciplina")%></option>
          <%}%>
        </select>
        </label>
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
