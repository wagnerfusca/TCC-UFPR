<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.lang.String"%>
<%@page import="Intranet.Conexao"%>
<%@ include file = "validaSessao.jsp"  %>
<%
//verificando se o form possui campso com dados binarios
    if (FileUpload.isMultipartContent(request)){
    String titulo=null;
    String data2=null;
    String conteudo=null;
    
    byte [] arquivo = null;
    java.util.Date dataHoje = null;
    java.util.Date data33 = null;
    java.sql.Date data331 = null;
    java.sql.Date dataHoje1 = null;
    String dataValidade = null;
    String dataHoje2 = null;
    String tipoAnexo=null;
    
    //pega da sessao
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    
    Object Pessoa = sessao.getAttribute("codPessoa");
    String strcodPessoa = Pessoa.toString();
    int codPessoa = Integer.parseInt(strcodPessoa); 
    
    Object Professor = sessao.getAttribute("codProfessor");
    String strProfessor = Professor.toString();
    int codProfessor = Integer.parseInt(strProfessor); 
    
    //criando o obj para cuidar do upload
    DiskFileUpload up = new DiskFileUpload();
     //setando o tamanho maximo em bytes para upload
    up.setSizeMax(800000);
    try{
        //passando a requisicao e retornando uma lista com os campos encontando , tanto textos, quanto dados binarios
        List items = up.parseRequest(request);
        Iterator i = items.iterator();
        FileItem fi;
         //laço para pegar todos os campos do form
        while (i.hasNext()){
             fi = (FileItem)i.next();
            //teste para ver se o campo em questao é campo do formulario ou um arquivo
            if (!fi.isFormField()){
                
            }
            else{
                if ( fi.getFieldName().equals("titulo")) {
                    titulo = fi.getString();
               }
                if ( fi.getFieldName().equals("validade")) {
                    dataHoje = new java.util.Date();
                    data2 = fi.getString();
                    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
                 try {
 			data33 = formatador.parse(data2);
                      } catch (ParseException e) {
 			e.printStackTrace();
                    }
 		formatador.applyPattern("yyyy-MM-dd"); 
                dataValidade = formatador.format(data33);
                dataHoje2 = formatador.format(dataHoje);
              }
                     if ( fi.getFieldName().equals("conteudo")){ 
                     conteudo = fi.getString();
               } 
                if ( fi.getFieldName().equals("tipoarq")) {
                     tipoAnexo = fi.getString();
                }
        if ((titulo!=null)&&(dataValidade!=null)&&(tipoAnexo!=null)&&(dataHoje2!=null)&&(codPessoa!=0)&&(codDisciplinaVirtual!=0)&&(codProfessor!=0)&&(conteudo!=null)){
        fi = (FileItem)i.next();                 
                arquivo = fi.get();
                //carregando o arquivo
                
                    data331 = java.sql.Date.valueOf(dataValidade);
                    dataHoje1 = java.sql.Date.valueOf(dataHoje2);
                 
              Conexao con =  new Conexao();
              Connection teste = con.getConn();
              PreparedStatement discCronInsere = teste.prepareStatement("insert into cronograma(titulo_tarefa,conteudo_tarefa,data_limite,data_tarefa,cod_pessoa,cod_professor,cod_disciplina_virtual,arquivo,tipo_anexo) VALUES (?,?, ?, ?, ?, ?, ?,?, ?)");  
              discCronInsere.setString(1, titulo);
                discCronInsere.setString(2, conteudo);
                discCronInsere.setDate(3, data331);
                discCronInsere.setDate(4, dataHoje1);
                discCronInsere.setInt(5, codPessoa);
                discCronInsere.setInt(6, codProfessor);
                discCronInsere.setInt(7, codDisciplinaVirtual);
                discCronInsere.setBytes(8, arquivo); 
                discCronInsere.setString(9, tipoAnexo); 
		// executando a query
 		int ok = discCronInsere.executeUpdate();
                if (ok==1){
                      response.sendRedirect("discCronInserir.jsp?msg=salvo");
                }else{
                      response.sendRedirect("discCronInserir.jsp?msg=erro");
                }
             }
            }
          }//while
    }catch (FileUploadException e){
        out.println("Erro no Upload do arquivo");
    }catch(SQLException e){
      out.println(e.getMessage());     
    }catch (Exception e){
       out.println(e.getMessage());
    }
}else{
    out.print("O formulario nao possui dados binarios");
}

%>
