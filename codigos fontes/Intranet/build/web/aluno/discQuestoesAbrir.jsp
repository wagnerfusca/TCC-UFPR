<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ include file = "validaSessao.jsp"  %>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.math.*"%>
<jsp:useBean id="banco" scope="page" class="Intranet.BancoQuestoes" /><jsp:setProperty name="banco" property="*" />
<%
String msg = request.getParameter("msg");
if (msg!=null){
    if (msg.equals("erro")){%>
<script language="JavaScript">
      alert ("Questão não foi atualizada ");
    </script>
<%   }else{
        String strPergunta = request.getParameter("cod");
        int codPergunta1= Integer.parseInt(strPergunta);
        ResultSet rs1 = banco.BuscarQuestoesRespondida(codPergunta1);
        while (rs1.next()){
            String resposta = rs1.getString("resposta_selecionada");
            if (resposta.equals("c")){
             %>
<script language="JavaScript">
                 alert ("CERTA RESPOSTA");
                 window.close();
            </script>
<%
             }else{%>
<script language="JavaScript">
                     alert ("RESPOSTA INCORRETA");
                     window.close();
                </script>
<%           }
        }
   }
} 
String cod = request.getParameter("cod");
if (cod!=null){
  int codPergunta = Integer.parseInt(cod);
  ResultSet rs= banco.AbrirQuestoes(codPergunta);
  while (rs.next()){
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" type="text/JavaScript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="LayPic/estilo.css" rel="stylesheet" type="text/css" />
</head>
<body class="fundo_form">
<p align="left" class="titulo_form">Pergunta:</span> <%=rs.getString("pergunta")%>
<hr align="left" class="titulo_form" />
</p>
<form id="form1" name="form1" method="post" action="salvaQuestoesResponder.jsp">
  <% 
  //Array respostas[]={rs.getArray("resposta_certa"),rs.getArray("resposta_errada1"),rs.getArray("resposta_errada2"),rs.getArray("resposta_errada3"),rs.getArray("resposta_errada4")} ;
  /*salva os dados numa array,.,,[
   depois faz um radomize e pega o primeiro numero inteiro e 
  ve se ele é 0 ou 5 e a resposta certa é a primeira
  1 ou 6 - resposta certa na segunda opcao
 *2 ou 7 - resposta certa na terceira opcao
 *3 ou 8 - resposta certa na quarta opcao
 *4 ou 9 - resposta certa na quinta opcao
  radio button com valor c = correto
 *1 2 3 ou 4 é tudo errado
  */
  double randomize = Math.random();
   String Num = String.valueOf(randomize);
   String strNum=Num.substring(2,3);
   %>
  <input type="hidden" name="codPergunta" value="<%=rs.getInt("cod_pergunta")%>">
  <input type="hidden" name="codAluno" value="<%=sessao.getAttribute("codAluno")%>">
  <%if ((strNum.equals("0")) || (strNum.equals("5"))){%>
  <div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="c">
      a)<%=rs.getString("resposta_certa")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="1">
      b)<%=rs.getString("resposta_errada1")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="2">
      c)<%=rs.getString("resposta_errada2")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="3">
      d)<%=rs.getString("resposta_errada3")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="4">
      e)<%=rs.getString("resposta_errada4")%></span>
    <hr align="left"  />
    </p>
  </div>
  <%}%>
  <%if ((strNum.equals("1")) || (strNum.equals("6"))){%>
  <div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="1">
      a)<%=rs.getString("resposta_errada1")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="c">
      b)<%=rs.getString("resposta_certa")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="2">
      c)<%=rs.getString("resposta_errada2")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="3">
      d)<%=rs.getString("resposta_errada3")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="4">
      e)<%=rs.getString("resposta_errada4")%></span>
    <hr align="left"  />
    </p>
  </div>
  <%}%>
  <%if ((strNum.equals("2")) || (strNum.equals("7"))){%>
  <div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="1">
      a)<%=rs.getString("resposta_errada1")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="2">
      b)<%=rs.getString("resposta_errada2")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="c">
      c)<%=rs.getString("resposta_certa")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="3">
      d)<%=rs.getString("resposta_errada3")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="4">
      e)<%=rs.getString("resposta_errada4")%></span>
    <hr align="left"  />
    </p>
  </div>
  <%}%>
  <%if ((strNum.equals("3")) || (strNum.equals("8"))){%>
  <div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="1">
      a)<%=rs.getString("resposta_errada1")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="2">
      b)<%=rs.getString("resposta_errada2")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="3">
      c)<%=rs.getString("resposta_errada3")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="c">
      d)<%=rs.getString("resposta_certa")%></span>
    <hr align="left"  />
    </p>
  </div>
  <div class="edit">
    <p><span class="letra_form">
      <input type="radio" name="resp" value="4">
      e)<%=rs.getString("resposta_errada4")%></span>
    <hr align="left"  />
    </p>
  </div>
  <%}%>
  <%if ((strNum.equals("4")) || (strNum.equals("9"))){%>
  <div>
    <div class="edit">
      <p><span class="letra_form">
        <input type="radio" name="resp" value="1">
        a)<%=rs.getString("resposta_errada1")%></span>
      <hr align="left"  />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">
        <input type="radio" name="resp" value="2">
        b)<%=rs.getString("resposta_errada2")%></span>
      <hr align="left"  />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">
        <input type="radio" name="resp" value="3">
        c)<%=rs.getString("resposta_errada3")%></span>
      <hr align="left"  />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">
        <input type="radio" name="resp" value="4">
        d)<%=rs.getString("resposta_errada4")%></span>
      <hr align="left"  />
      </p>
    </div>
    <div class="edit">
      <p><span class="letra_form">
        <input type="radio" name="resp" value="c">
        e)<%=rs.getString("resposta_certa")%></span>
      <hr align="left"  />
      </p>
    </div>
    <%}%>
    <div class="button" id="botao">
      <div align="center">
        <input name="enviar" type="submit" id="enviar" value="Responder" />
      </div>
    </div>
  </div>
</form>
<hr class="titulo_form" />
<p align="center" class="path">© Universidade Federal do Paraná 2005 - Política de Privacidade</p>
</body>
</html>
<%
  break;
  }
}
%>
