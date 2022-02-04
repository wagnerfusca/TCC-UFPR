/*
 * Coordenacao.java
 *
 * Created on 31 de Outubro de 2005, 14:49
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

public class Coordenacao extends Pessoa{
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Coordenacao */
    public Coordenacao() throws Exception{
        this.conexao = new Conexao();
    }
    
    public boolean CriarCurso(String codCurso, String codCoordenacao,String codDepartamento,String versao,String nomeCurso){
        try {
            sql ="insert into Curso (cod_Coordenacao,cod_Curso,cod_departamento,cod_versao_curso, nome_curso) " +
                    "values ('"+codCoordenacao+"','"+codCurso+"','"+codDepartamento+"','"+versao+"','"+nomeCurso+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    
   
    public boolean CriarAluno(int codPessoa,String codCurso){
        try {
            sql ="insert into aluno (cod_pessoa,cod_curso)  values ('"+codPessoa+"','"+codCurso+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
             // na pagina do professor chamar a funcao primeiro para inserir a pessoa
            // dai chama a funcao para buscar o codpessoa
           if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    
     public boolean CadastrarDisciplina(String codCurso, String CodDisciplina){
        try {
            sql ="insert into curso_disciplina(cod_curso,cod_disciplina) " +
                    "values ('"+codCurso+"','"+CodDisciplina+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
     
      
    
      public ResultSet BuscarCoordenacao(){
        try {
        sql ="select coordenacao.*,pessoa.* from Coordenacao inner join pessoa on pessoa.cod_pessoa=coordenacao.cod_pessoa order by pessoa.nome_pessoa";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
      
    public ResultSet login(String usuario, String senha){
       try {
       sql = "select pessoa.nome_pessoa,pessoa.cod_pessoa,coordenacao.nome_coordenacao,coordenacao.cod_coordenacao,coordenacao.cod_departamento,coordenacao.nome_coordenador from pessoa INNER JOIN coordenacao on coordenacao.cod_pessoa=pessoa.cod_pessoa where pessoa.usuario='"+usuario+"' and pessoa.senha='"+senha+"' ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     
}
