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
<jsp:useBean id="mat" scope="page" class="Intranet.MaterialApoio" /><jsp:setProperty name="mat" property="*" />
<%
if (FileUpload.isMultipartContent(request)){
    Object codDisciplina1 = sessao.getAttribute("codDisciplina");
    String codDisciplina2 = codDisciplina1.toString();
    int codDisciplinaVirtual = Integer.parseInt(codDisciplina2); 
    int codMaterial = 0;
      
    String titulo=null;
    String conteudo=null;
    String tipoAnexo=null;
    String tipo = "ARQUIVO";
    byte [] arquivo = null;
    java.util.Date dataHoje1 = new java.util.Date();
    java.sql.Date data33 = null;
    String dataHoje=null;
    
    SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");  
    formatador.applyPattern("yyyy-MM-dd"); 
    dataHoje = formatador.format(dataHoje1);
    
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
                if ( fi.getFieldName().equals("tipoarq")) {
                     tipoAnexo = fi.getString();
                }
                if ( fi.getFieldName().equals("conteudo")){ 
                     conteudo = fi.getString();
               } 
                
       if ((titulo!=null)&&(dataHoje!=null)&&(conteudo!=null)&&(tipoAnexo!=null)&&(codDisciplinaVirtual!=0)){
       fi = (FileItem)i.next();                 
             arquivo = fi.get();
                //carregando o arquivo
              data33 = java.sql.Date.valueOf(dataHoje);

              Conexao con =  new Conexao();
              Connection teste = con.getConn();
              PreparedStatement InsereMaterial = teste.prepareStatement("insert into material_apoio(titulo_material,conteudo_material,data_insercao,tipo_material,cod_disciplina_virtual) VALUES (?, ?, ?, ?,?)");
                InsereMaterial.setString(1, titulo);
                InsereMaterial.setString(2, conteudo);
                InsereMaterial.setDate(3, data33);
                InsereMaterial.setString(4, tipo);
                InsereMaterial.setInt(5, codDisciplinaVirtual);
                // executando a query
 		int ok = InsereMaterial.executeUpdate();
                if (ok==1){
                       ResultSet rs = mat.BucarCodMaterial(titulo,conteudo,dataHoje,tipo,codDisciplinaVirtual);
                       while (rs.next()){
                            codMaterial = rs.getInt("cod_material");
                        }
                        PreparedStatement discArquivo = teste.prepareStatement("insert into arquivo(cod_material,arquivo,tipo_arquivo) VALUES (?,?,?)");
                        discArquivo.setInt(1, codMaterial);
                        discArquivo.setBytes(2, arquivo);   
                        discArquivo.setString(3, tipoAnexo);
                        
                        int ok1 = discArquivo.executeUpdate();
                        if (ok1==1){
                            response.sendRedirect("discArquivoInserir.jsp?msg=salvo");
                        }
                }else{
                      response.sendRedirect("discArquivoInserir.jsp?msg=salvo");
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
