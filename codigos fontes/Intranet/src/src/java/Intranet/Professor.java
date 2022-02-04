/*
 * Professor.java
 *
 * Created on 31 de Outubro de 2005, 14:50
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

public class Professor extends Pessoa {
    private Conexao conexao = null;
    private String sql ="";    
    /** Creates a new instance of Professor */
    public Professor() throws Exception{
        this.conexao = new Conexao();
    }
    
     public ResultSet BuscarProfessor(String codDepartamento){
        try {
            sql ="select professor.cod_professor,pessoa.cod_pessoa,pessoa.nome_pessoa from professor inner join pessoa on pessoa.cod_pessoa=professor.cod_pessoa where professor.cod_departamento='"+codDepartamento+"' order by pessoa.nome_pessoa";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet BuscarTodosProfessor(){
        try {
            sql ="select professor.cod_professor,pessoa.cod_pessoa,pessoa.nome_pessoa from professor inner join pessoa on pessoa.cod_pessoa=professor.cod_pessoa order by pessoa.nome_pessoa";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
   public ResultSet login(String usuario, String senha){
       try {
       sql = "select pessoa.nome_pessoa,pessoa.cod_pessoa,professor.cod_professor,professor.titulacao_professor,professor.cod_departamento from pessoa INNER JOIN professor on professor.cod_pessoa=pessoa.cod_pessoa where pessoa.usuario='"+usuario+"' and pessoa.senha='"+senha+"' ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }  
}
