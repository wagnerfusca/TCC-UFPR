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
    String data2=null;String conteudo=null;String destinatario=null;
    String destinatario1=null;String codPessoa=null;
    java.util.Date dataHoje = null;
    java.util.Date data33 = null;
    java.sql.Date dataHoje1 = null;
    java.sql.Date data331 = null;
    String dataValidade = null;
    String dataHoje2 = null;
    String tipoDestinatario = null;
    String tipoAnexo=null;
    int autor =0;
    int para=0;
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
                if ( fi.getFieldName().equals("autor")) {
                     codPessoa = fi.getString();
                       autor = Integer.parseInt(codPessoa);
               }
                if ( fi.getFieldName().equals("coord")) {
                     destinatario1 = fi.getString();
                        para = Integer.parseInt(destinatario1);
                }
                if ( fi.getFieldName().equals("dep")) {
                     destinatario1 = fi.getString();
                        para = Integer.parseInt(destinatario1);
                }
                
                if ( fi.getFieldName().equals("prof")) {
                     destinatario1 = fi.getString();
                        para = Integer.parseInt(destinatario1);
                }
                if ( fi.getFieldName().equals("tipo")) {
                     tipoDestinatario = fi.getString();

                }
                if ( fi.getFieldName().equals("conteudo")){ 
                     conteudo = fi.getString();
               } 
                 if ( fi.getFieldName().equals("tipoarq")) {
                     tipoAnexo = fi.getString();
                }
                
       if ((titulo!=null)&&(dataValidade!=null)&&(dataHoje2!=null)&&(autor!=0)&&(para!=0)&&(conteudo!=null)&&(tipoAnexo!=null)){
        fi = (FileItem)i.next();                 
                arquivo = fi.get();
                //carregando o arquivo
                
                    data331 = java.sql.Date.valueOf(dataValidade);
                    dataHoje1 = java.sql.Date.valueOf(dataHoje2);
                 
               Conexao con =  new Conexao();
              Connection teste = con.getConn();
              PreparedStatement formInsere = teste.prepareStatement("insert into formdocs(titulo,conteudo,data_validade,data_insercao,cod_pessoa,cod_destinatario,tipo_destinatario,arquivo,tipo_arquivo) VALUES (?,?, ?, ?, ?, ?, ?,?, ?)");
                formInsere.setString(1, titulo);
                formInsere.setString(2, conteudo);
                formInsere.setDate(3, data331);
                formInsere.setDate(4, dataHoje1);
                formInsere.setInt(5, autor);
                formInsere.setInt(6, para);
                formInsere.setString(7, tipoDestinatario);
                formInsere.setBytes(8, arquivo); 
                formInsere.setString(9, tipoAnexo);
		// executando a query
 		int ok = formInsere.executeUpdate();
                if (ok==1){
                     if (tipoDestinatario.equals("DEPARTAMENTO"))
                        response.sendRedirect("formInserirDep.jsp?msg=salvo");
                      if (tipoDestinatario.equals("RESPOSTA"))
                            response.sendRedirect("formResponder.jsp?msg=salvo");
                      if (tipoDestinatario.equals("COORDENACAO")) 
                         response.sendRedirect("formInserirCoord.jsp?msg=salvo");
                     if (tipoDestinatario.equals("PROFESSOR")) 
                         response.sendRedirect("formInserirProf.jsp?msg=salvo");
                }else{
                    if (tipoDestinatario.equals("DEPARTAMENTO"))
                     response.sendRedirect("formInserirDep.jsp?msg=erro");
                     if (tipoDestinatario.equals("RESPOSTA"))
                            response.sendRedirect("formResponder.jsp?msg=erro");
                      if (tipoDestinatario.equals("COORDENACAO")) 
                         response.sendRedirect("formInserirCoord.jsp?msg=erro");
                    if (tipoDestinatario.equals("PROFESSOR")) 
                         response.sendRedirect("formInserirProf.jsp?msg=erro");
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
