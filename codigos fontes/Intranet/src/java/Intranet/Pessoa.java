/*
 * Pessoa.java
 *
 * Created on 31 de Outubro de 2005, 15:07
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

/**
 *
 * @author Wagner
 */
package Intranet;
import java.sql.*;

public class Pessoa {
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Pessoa */
    public Pessoa() throws Exception{
        this.conexao = new Conexao();
    }
    
    public boolean InserePessoa(String matricula, String nome, String dataNascimento,String Nascimento,String tipo){
        try { 
            sql ="insert into pessoa(nome_pessoa,nasc_pessoa,usuario,senha,tipopessoa) " +
                    "values ('"+nome+"','"+dataNascimento+"','"+matricula+"','"+Nascimento+"','"+tipo+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0){
                return true;
               }
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    
     public boolean UpdateSenha( String senhaAntiga, String senhaNova,int codPessoa){
        try { 
            sql ="update pessoa set senha='"+senhaNova+"' where senha='"+senhaAntiga+"'and cod_pessoa='"+codPessoa+"'" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0){
                return true;
               }
            else
                return false;
           }catch (Exception ex){
            return false;
        }
     }
    public boolean InsereOrgao(String codigo, String nome, String senha,String tipo){
        try { 
            sql ="insert into pessoa(nome_pessoa,usuario,senha,tipopessoa) " +
                    "values ('"+nome+"','"+codigo+"','"+senha+"','"+tipo+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0){
                return true;
               }
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    public ResultSet VerificaLogin(String codigo,String tipo){
        try{
            sql="select count(usuario) as contador from pessoa where pessoa.usuario='"+codigo+"' and pessoa.tipopessoa='"+tipo+"'";
            return conexao.getSt().executeQuery(sql); 
        }catch (Exception ex){
            return null;
        }
    }

    public ResultSet BuscaTipo(){
        try{
            sql="select * from tipoPessoa order by descricao";
            return conexao.getSt().executeQuery(sql); 
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet BuscarPessoa(String matricula, String nome, String dataNascimento,String tipo){
       try {
       sql = "select * from pessoa where nome_pessoa='"+nome+"' and nasc_pessoa='"+dataNascimento+"' and usuario='"+matricula+"' and tipopessoa='"+tipo+"'";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet BuscarOrgao(String matricula, String nome, String senha,String tipo){
       try {
       sql = "select * from pessoa where nome_pessoa='"+nome+"' and usuario='"+matricula+"' and senha ='"+senha+"' and tipopessoa='"+tipo+"' ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
   
   
}
