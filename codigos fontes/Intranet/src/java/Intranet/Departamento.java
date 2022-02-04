/*
 * Departamento.java
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

public class Departamento extends Pessoa {
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Departamento */
    public Departamento() throws Exception{
        this.conexao = new Conexao();
    }
    
 
      public boolean CriarProfessor(String codDepartamento, String titulacaoProfessor, int codPessoa){
        try { 
            sql ="insert into professor(cod_departamento,titulacao_professor,cod_pessoa) " +
                    "values ('"+codDepartamento+"','"+titulacaoProfessor+"','"+codPessoa+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            // na pagina do professor chamar a funcao primeiro para inserir a pessoa
            // dai chama a funcao para buscar o codpessoa
            //dai insere aqui no professor
            if (rs!=0)
                return true;
             else
                return false;
           }catch (Exception ex){
            return false;
        }
    }    
       public boolean CriarDisciplina(String codDisciplina, String nomeDisciplina, String periodo,String codDepartamento){
        try { 
            sql ="insert into disciplina(cod_disciplina,nome_disciplina,periodo_disciplina,cod_departamento) " +
                    "values ('"+codDisciplina+"','"+nomeDisciplina+"','"+periodo+"','"+codDepartamento+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            
            if (rs!=0)
                return true;
             else
                return false;
           }catch (Exception ex){
            return false;
        }
    } 
       public ResultSet BuscarDepartamento(){
        try {
        sql ="select departamento.*,pessoa.* from departamento inner join pessoa on pessoa.cod_pessoa=departamento.cod_pessoa order by pessoa.nome_pessoa";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     
        public ResultSet BuscarDisciplina(String codDepartamento){
        try {
            sql ="select * from disciplina where cod_departamento ='"+codDepartamento+"' order by nome_disciplina";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
      public ResultSet login(String usuario, String senha,String tipo){
       try {
       sql = "select pessoa.nome_pessoa,pessoa.cod_pessoa,departamento.nome_departamento,departamento.cod_departamento,departamento.chefe_departamento from pessoa INNER JOIN departamento on departamento.cod_pessoa=pessoa.cod_pessoa where pessoa.usuario='"+usuario+"' and pessoa.senha='"+senha+"' and pessoa.tipopessoa='"+tipo+"' ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
       public ResultSet RelatorioProfessor(String codDepartamento){
       try {
       sql = "select p.*, pe.* from professor as p inner join pessoa as pe on pe.cod_pessoa=p.cod_pessoa where p.cod_departamento='"+codDepartamento+"' order by pe.nome_pessoa ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
        public ResultSet RelatorioDisciplina(String codDepartamento){
       try {
       sql = "select di.*,de.* from disciplina as di inner join departamento as de on de.cod_departamento = di.cod_departamento where di.cod_departamento='"+codDepartamento+"' order by di.nome_disciplina ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
}