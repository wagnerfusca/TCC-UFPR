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
<%//verificando se o form possui campso com dados binarios
    if (FileUpload.isMultipartContent(request)){
    String titulo=null;
    String data2=null;
    String conteudo=null;
    
    java.util.Date dataHoje = null;
    java.util.Date data33 = null;
    java.sql.Date dataHoje1 = null;
    java.sql.Date data331 = null;
    String dataValidade = null;
    String dataHoje2 = null;
    String tipoAnexo=null;
    
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2);
    
    byte [] arquivo = null;
    
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
            if ( fi.getFieldName().equals("tipoarq")) {
                     tipoAnexo = fi.getString();

                }
                if ( fi.getFieldName().equals("conteudo")){ 
                     conteudo = fi.getString();
               } 
                
       if ((titulo!=null)&&(dataValidade!=null)&&(dataHoje2!=null)&&(tipoAnexo!=null)&&(conteudo!=null)&&(codDisciplinaVirtual!=0)){
        fi = (FileItem)i.next();                 
                arquivo = fi.get();
                //carregando o arquivo
                
                    data331 = java.sql.Date.valueOf(dataValidade);
                    dataHoje1 = java.sql.Date.valueOf(dataHoje2);
                 
              Conexao con =  new Conexao();
              Connection teste = con.getConn();
              PreparedStatement discEditalInserir = teste.prepareStatement("insert into edital_disciplina(titulo_edital,conteudo_edital,data_validade,data_insercao,cod_disciplina_virtual,tipo_arquivo,arquivo) VALUES (?, ?, ?, ?, ?,?, ?)");
                discEditalInserir.setString(1, titulo);
                discEditalInserir.setString(2, conteudo);
                discEditalInserir.setDate(3, data331);
                discEditalInserir.setDate(4, dataHoje1);
                discEditalInserir.setInt(5, codDisciplinaVirtual);
                discEditalInserir.setString(6, tipoAnexo);
                discEditalInserir.setBytes(7, arquivo); 
		// executando a query
 		int ok = discEditalInserir.executeUpdate();
                if (ok==1)
                    response.sendRedirect("discEditalInserir.jsp?msg=salvo");
                else
                    response.sendRedirect("discEditalInserir.jsp?msg=erro");
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
