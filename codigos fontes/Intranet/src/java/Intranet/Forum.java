/*
 * Forum.java
 *
 * Created on 31 de Outubro de 2005, 15:11
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */
package Intranet;
import java.sql.*;
/**
 *
 * @author Wagner
 */
public class Forum {
    private Conexao conexao = null;
    private String sql ="";
    /** Creates a new instance of Forum */
    public Forum() throws Exception{
        this.conexao = new Conexao();
    }
    public boolean InsereTopico(String titulo,String conteudo,String dataHoje,int codDisciplinaVirtual){
          try {
            sql ="insert into forum(titulo_topico,conteudo_topico,data_insercao,cod_disciplina_virtual) " + 
                "values ('"+titulo+"','"+conteudo+"','"+dataHoje+"','"+codDisciplinaVirtual+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
               return true;
           else
                return false;
           }catch (Exception ex){
            return false;
        }
    } 
     public boolean InserePost(String post,String dataHoje,int codTopico,int codPessoa){
          try {
            sql ="insert into post(post,data_insercao,cod_topico,cod_pessoa) " + 
                "values ('"+post+"','"+dataHoje+"','"+codTopico+"','"+codPessoa+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
               return true;
           else
                return false;
           }catch (Exception ex){
            return false;
        }
    } 
       public ResultSet BuscarTopicos(int CodDisciplinaVirtual){
        try {
            sql ="select forum.* from forum where forum.cod_disciplina_virtual='"+CodDisciplinaVirtual+"' order by forum.data_insercao desc";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
       public ResultSet AbrirTopicos(int codTopico){
        try {
            sql ="select forum.* from forum where forum.cod_topico='"+codTopico+"' order by forum.data_insercao desc";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
        public ResultSet AbrirPost(int codTopico){
        try {
            sql ="select forum.*,post.*,pessoa.* from forum inner join post on post.cod_topico=forum.cod_topico inner join pessoa on pessoa.cod_pessoa= post.cod_pessoa where forum.cod_topico='"+codTopico+"' order by forum.data_insercao desc";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
}
