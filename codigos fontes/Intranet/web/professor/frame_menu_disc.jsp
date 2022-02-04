<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@ include file = "validaSessao.jsp"  %>
<jsp:useBean id="disc" scope="page" class="Intranet.DisciplinaVirtual" /><jsp:setProperty name="disc" property="*" />
<html>
<head>
<script language="JavaScript">
<!-- Hiding-->
  function disc() {
    parent.frame_menu.location.href="discMostrar.jsp";
    parent.frame_main.location.href="inicial_disc.jsp";
}
</script>
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
    
    
    if ((codDisciplina!=null )&& (nomeDisciplina!=null)&& (projetomono!=null)){
        sessao1.removeAttribute("codDisciplina");
        sessao1.removeAttribute("nomeDisciplina");
        sessao1.setAttribute("codDisciplina", codDisciplina);
        sessao1.setAttribute("nomeDisciplina", nomeDisciplina);
        codDisciplina1 = sessao1.getAttribute("codDisciplina");
   }
   Object professor = sessao1.getAttribute("codProfessor");
   String strProfessor = professor.toString();
   int codProfessor = Integer.parseInt(strProfessor);
   if (codDisciplina1==null){
   %>
  <p align="left" class="titulo_menu">Selecione uma disciplina</p>
  <p align="left">
    <% ResultSet rs = disc.PesqDiscProfessor(codProfessor);
   while (rs.next()){
     %>
    <a href="frame_menu_disc.jsp?cod=<%=rs.getInt("cod_disciplina_virtual")%>&nome=<%=rs.getString("nome_disciplina_virtual") %>&projetomono=<%=rs.getString("projeto_mono")%>"> <%=rs.getString("nome_disciplina_virtual") %></a></br>
    <% }%>
  </p>
  <%}else{%>
  <%if (projetomono.equals("F")){%>
  <p align="left" class="titulo_menu"><%=session.getAttribute("nomeDisciplina")%></p>
  <p align="left"> <a href="discAbrir.jsp" target="frame_main" class="navwhite">1-Visualizar Informes</a><br>
    <a href="discEditalInserir.jsp" target="frame_main" class="navwhite">2-Inserir Informes</a><br>
    <a href="discCronograma.jsp" target="frame_main" class="navwhite">3-Visualizar Cronograma </a><br>
    <a href="discCronInserir.jsp" target="frame_main" class="navwhite">4-Inserir Tarefa no Cronograma </a><br>
    <a href="discCronEntregaAluno.jsp" target="frame_main" class="navwhite">5-Visualizar Tarefas respondida pelos alunos</a><br>
    <a href="../chat3/login.jsp" target="blank" class="navwhite">6-Chat </a><br>
    <a href="discForumMostrar.jsp" target="frame_main" class="navwhite">7-Acessar o Fórum</a><br>
    <a href="discForumInserir.jsp" target="frame_main" class="navwhite">8-Inserir tópico no Fórum</a><br>
    <a href="discArquivos.jsp" target="frame_main" class="navwhite">9-Arquivos e Publicações </a><br>
    <a href="discArquivoInserir.jsp" target="frame_main" class="navwhite">10-Inserir Arquivos e Publicações </a><br>
    <a href="discLink.jsp" target="frame_main" class="navwhite">11-Links Indicados</a><br>
    <a href="discLinkInserir.jsp" target="frame_main" class="navwhite">12-Inserir Links</a><br>
    <a href="discQuestoes.jsp" target="frame_main" class="navwhite">13-Banco de Questões</a><br>
    <a href="discQuestoesInserir.jsp" target="frame_main" class="navwhite">14- Inserir Questões</a><br>
    <br>
    <a href="discMostrar.jsp" target="frame_menu" class="navwhite" onClick="disc()">Mudar de Disciplina</a><br>
  </p>
  <%}else{%>
  <p align="left"> <a href="discAbrir.jsp" target="frame_main" class="navwhite">1-Visualizar Informes </a><br>
    <a href="discEditalInserir.jsp" target="frame_main" class="navwhite">2-Inserir Informes</a><br>
    <a href="discCronograma.jsp" target="frame_main" class="navwhite">3-Cronograma </a><br>
    <a href="discCronInserir.jsp" target="frame_main" class="navwhite">4-Inserir Cronograma </a><br>
    <a href="discCronEntregaAluno.jsp" target="frame_main" class="navwhite">5-Visualizar Tarefas-Alunos</a><br>
    <br>
    <a href="discMostrar.jsp" target="frame_menu" class="navwhite" onClick="disc()">Mudar de Disciplina</a><br>
  </p>
  <%} }%>
</div>
</body>
</head>
</html>
