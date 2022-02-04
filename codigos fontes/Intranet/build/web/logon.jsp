<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page session="true" %> 
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="javax.servlet.http.*"%>
<jsp:useBean id="coord" scope="page" class="Intranet.Coordenacao" />
<jsp:setProperty name="coord" property="*" />
<jsp:useBean id="dep" scope="page" class="Intranet.Departamento" />
<jsp:setProperty name="dep" property="*" />
<jsp:useBean id="aluno" scope="page" class="Intranet.Aluno" />
<jsp:setProperty name="aluno" property="*" />
<jsp:useBean id="prof" scope="page" class="Intranet.Professor" />
<jsp:setProperty name="prof" property="*" />
<jsp:useBean id="admin" scope="page" class="Intranet.Admin" />
<jsp:setProperty name="admin" property="*" />
<%
  String usuario = request.getParameter("usuario");
    String password = request.getParameter("senha");
    String tipo = request.getParameter("tipo");
    if ((usuario!=null)&&(password!=null)&&(tipo!=null)){
    HttpSession sessao = request.getSession();//cria sessao
    usuario = usuario.toUpperCase();
    
    if (tipo.equals("ALUNO")){ 
       ResultSet rs = aluno.login(usuario,password,tipo);
       while (rs.next()){
             String nome =rs.getString("nome_pessoa");
             String codCurso =rs.getString("cod_curso");
             int codAluno =rs.getInt("cod_aluno");
             int codPessoa =rs.getInt("cod_pessoa");
             String CodAluno = Integer.toString(codAluno);
             String CodPessoa = Integer.toString(codPessoa);
             sessao.setAttribute("url","aluno");
             sessao.setAttribute("nome", nome);
             sessao.setAttribute("codAluno", CodAluno);
             sessao.setAttribute("codPessoa", CodPessoa);
             sessao.setAttribute("curso", codCurso);
             
             sessao.setAttribute("logado", "true");
             response.sendRedirect("aluno/index.jsp");
        }
     }else{
        if (tipo.equals("PROF ")){ 
         ResultSet rs1 = prof.login(usuario,password,tipo);
         while (rs1.next()){
              int codProfessor =rs1.getInt("cod_professor");
               int codPessoa =rs1.getInt("cod_pessoa");
               String nome =rs1.getString("nome_pessoa");
               String titulacao =rs1.getString("titulacao_professor");
               
               String CodPessoa = Integer.toString(codPessoa);
               String CodProfessor = Integer.toString(codProfessor); 
             
               sessao.setAttribute("nome", nome);
               sessao.setAttribute("titulacao", titulacao);
               sessao.setAttribute("codPessoa", CodPessoa);
               sessao.setAttribute("codProfessor", CodProfessor);
               sessao.setAttribute("logado", "true");
               sessao.setAttribute("url","professor");
               response.sendRedirect("professor/index.jsp");
            }
        }else{
            if (tipo.equals("COORD")){ 
                ResultSet rs2 = coord.login(usuario,password,tipo);
                while (rs2.next()){
                    String codCoord =rs2.getString("cod_coordenacao");
                     
                     String codDepartamento =rs2.getString("cod_departamento");
                     String nome =rs2.getString("nome_coordenacao");
                     String coordenador =rs2.getString("nome_coordenador");
                     int codPessoa =rs2.getInt("cod_pessoa");
                     
                     String CodPessoa = Integer.toString(codPessoa);
                     
                     sessao.setAttribute("nome", nome);
             
                     sessao.setAttribute("coordenador", coordenador);
                     sessao.setAttribute("codCoord", codCoord);
                     sessao.setAttribute("codPessoa", CodPessoa);
                     sessao.setAttribute("codDepartamento", codDepartamento);
                     sessao.setAttribute("url","coordenacao");
                     sessao.setAttribute("logado", "true");
                     response.sendRedirect("coordenacao/index.jsp");
                 }
            }else{
                if (tipo.equals("DEP  ")){ 
                    ResultSet rs3 = dep.login(usuario,password,tipo);
                    while (rs3.next()){
                     String codDepartamento =rs3.getString("cod_departamento");
                     String nome =rs3.getString("nome_departamento");
                     String chefe =rs3.getString("chefe_departamento");
                     int codPessoa =rs3.getInt("cod_pessoa");
                     
                     String CodPessoa = Integer.toString(codPessoa);
                     
                     sessao.setAttribute("nome", nome);
                     sessao.setAttribute("chefe", chefe);
                     sessao.setAttribute("codPessoa", CodPessoa);
                     sessao.setAttribute("url","departamento");
                     sessao.setAttribute("codDepartamento", codDepartamento);
                     sessao.setAttribute("logado", "true");
                     response.sendRedirect("departamento/index.jsp");
                    }
                }else{
                    if (tipo.equals("ADMIN")){ //ADMIN
                    ResultSet rs4 = admin.login(usuario,password,tipo);
                    while (rs4.next()){
                         String nome =rs4.getString("nome_pessoa");
                         int codPessoa =rs4.getInt("cod_pessoa");
                        out.print(tipo);
                         String CodPessoa = Integer.toString(codPessoa);
                         sessao.setAttribute("url","admin");
                         sessao.setAttribute("nome", nome);
                         sessao.setAttribute("logado", "true");
                         sessao.setAttribute("codPessoa", CodPessoa);
                         response.sendRedirect("admin/index.jsp");
                    }
                  }
                  else{
                      response.sendRedirect("index.jsp?msg=erro");
                  }
                }    
             }
          }
    }
    if(sessao.getAttribute("logado")==null) {
        response.sendRedirect("index.jsp?msg=erro");
    }
  }else
     response.sendRedirect("index.jsp");
%>

