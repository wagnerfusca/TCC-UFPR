<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@include file = "validaSessao.jsp"  %>
<jsp:useBean id="disc" scope="page" class="Intranet.DisciplinaVirtual" />
<jsp:setProperty name="disc" property="*" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" media="all">
<body class="fundo_azul_escuro" >
<div class="menu1">

<%
    HttpSession sessao1 = request.getSession();
    Object codDisciplina1 = sessao1.getAttribute("codDisciplina");
    
    String codDisciplina = request.getParameter("cod");
    String nomeDisciplina = request.getParameter("nome");
    String projetomono = request.getParameter("projetomono");
    
    if ((codDisciplina!=null)&& (nomeDisciplina!=null)&& (projetomono!=null)){
        sessao1.removeAttribute("codDisciplina");
        sessao1.removeAttribute("nomeDisciplina");
        sessao1.setAttribute("codDisciplina", codDisciplina);
        sessao1.setAttribute("nomeDisciplina", nomeDisciplina);
        codDisciplina1 = sessao1.getAttribute("codDisciplina");
   }
   Object Aluno = sessao1.getAttribute("codAluno");
   String strAluno = Aluno.toString();
   int codAluno = Integer.parseInt(strAluno);
   if (codDisciplina1==null){
   %>
<p align="left" class="titulo_menu">Selecione uma disciplina</p>
	<p align="left">
     <% ResultSet rs = disc.PesqDisciplinaVirtualMatriculado(codAluno);
        while (rs.next()){
     %>
     <a href="frame_menu_disc.jsp?cod=<%=rs.getInt("cod_disciplina_virtual")%>&nome=<%=rs.getString("nome_disciplina_virtual") %>&projetomono=<%=rs.getString("projeto_mono") %>"> 
            <%=rs.getString("nome_disciplina_virtual") %></a></br>
 <% }%>
     </p>
   <%}else{%>
	<p align="left" class="titulo_menu"><%=session.getAttribute("nomeDisciplina")%></p>
<%if (projetomono.equals("F")){%>	
        <p align="left">
	        <a href="discAbrir.jsp" target="frame_main" class="navwhite">Visualizar Informes</a><br>
                <a href="discCronograma.jsp" target="frame_main" class="navwhite">Cronograma e Tarefas</a><br>
		<a href="../chat3/login.jsp" target="blank" class="navwhite">Chat </a><br>
		<a href="discForumMostrar.jsp" target="frame_main" class="navwhite">Acessar o Fórum</a><br>
		<a href="discArquivos.jsp" target="frame_main" class="navwhite">Arquivos e Publicações </a><br>
		<a href="discLink.jsp" target="frame_main" class="navwhite">Links Indicados</a><br>
                <a href="discQuestoes.jsp" target="frame_main" class="navwhite">Responder Questões</a><br><br>
		<a href="discMostrar.jsp" target="frame_menu" class="navwhite" onclick="disc()">Mudar de Disciplina</a><br>
	</p>
	<%}else{%>
	<p align="left">
	        <a href="discAbrir.jsp" target="frame_main" class="navwhite">Informes do Orientador</a><br>
	        <a href="discCronograma.jsp" target="frame_main" class="navwhite">Cronograma e Tarefas</a><br><br>  
	        <a href="discMostrar.jsp" target="frame_menu" class="navwhite" onclick="disc()">Mudar de Disciplina</a><br>
	        
	</p>
<%  } 
   }%>	
</div>
</body>
</head>
</html>
