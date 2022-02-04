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
    String codCoordenacao=null;
    String conteudo=null;
    String autor=null;
    String assunto=null;
    String tipoAnexo=null;
        
    java.util.Date dataHoje = null;
    java.sql.Date dataHoje1 = null;
    String dataHoje2 = null;
        
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
                     titulo = titulo.toUpperCase();
                    dataHoje = new java.util.Date();
                    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
                    formatador.applyPattern("yyyy-MM-dd"); 
                    dataHoje2 = formatador.format(dataHoje);
               }
                  if ( fi.getFieldName().equals("autor")) {
                     autor = fi.getString();
                      autor = autor.toUpperCase();
            }
                if ( fi.getFieldName().equals("coordenacao")) {
                     codCoordenacao = fi.getString();
                        
                }
                
                if ( fi.getFieldName().equals("assunto")) {
                     assunto = fi.getString();
                         assunto = assunto.toUpperCase();
                }
                
                if ( fi.getFieldName().equals("conteudo")){ 
                     conteudo = fi.getString();
               } 
                 if ( fi.getFieldName().equals("tipoarq")) {
                     tipoAnexo = fi.getString();
                }
       if ((titulo!=null)&&(dataHoje2!=null)&&(autor!=null)&&(codCoordenacao!=null)&&(assunto!=null)&&(conteudo!=null)&&(tipoAnexo!=null)){
        fi = (FileItem)i.next();                 
                arquivo = fi.get();
                //carregando o arquivo
                   dataHoje1 = java.sql.Date.valueOf(dataHoje2);
              Conexao con =  new Conexao();
              Connection teste = con.getConn();
              PreparedStatement InsereMono = teste.prepareStatement("insert into biblioteca_digital(titulo_monografia,conteudo_monografia,data_insercao,cod_coordenacao,autor_monografia,assunto_monografia,arquivo,tipo_arquivo) VALUES (?, ?, ?, ?,?, ?, ?,?)");
                InsereMono.setString(1, titulo);
                InsereMono.setString(2, conteudo);
                InsereMono.setDate(3, dataHoje1);
                InsereMono.setString(4, codCoordenacao);
                InsereMono.setString(5, autor);
                InsereMono.setString(6,assunto );
                InsereMono.setBytes(7, arquivo); 
                InsereMono.setString(8, tipoAnexo);
		// executando a query
 		int ok = InsereMono.executeUpdate();
                if (ok==1){
                      response.sendRedirect("bibliInsere.jsp?msg=salvo");
                }else{
                     response.sendRedirect("bibliInsere.jsp?msg=erro");
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
