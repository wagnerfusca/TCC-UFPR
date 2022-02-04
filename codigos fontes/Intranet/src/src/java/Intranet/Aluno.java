/*
 * Aluno.java
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

public class Aluno extends Pessoa{
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Aluno */
    public Aluno() throws Exception{
        this.conexao = new Conexao();
    }
     public ResultSet buscarAluno(String codCurso){
        try {
            sql ="select aluno.cod_aluno,pessoa.nome_pessoa,pessoa.cod_pessoa from aluno inner join pessoa on pessoa.cod_pessoa=aluno.cod_pessoa where aluno.cod_curso='"+codCurso+"' order by pessoa.nome_pessoa";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public boolean alunoMatricular(String codTurma, int codAluno, String codDisciplina, int codPessoa ){
        try { 
            sql ="insert into matriculado(cod_turma,cod_aluno,cod_disciplina,cod_pessoa) " +
                    "values ('"+codTurma+"','"+codAluno+"','"+codDisciplina+"','"+codPessoa+"')" ;
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
      public ResultSet buscarCodMatriculado(String codTurma, int codAluno, String codDisciplina, int codPessoa){
        try {
            sql ="select matriculado.cod_matriculado from matriculado where cod_turma='"+codTurma+"' and cod_aluno='"+codAluno+"' and cod_disciplina='"+codDisciplina+"' and cod_pessoa='"+codPessoa+"'";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
      public ResultSet buscarCodDisciplinaVirtual(String codTurma){
        try {
            sql ="select disciplina_virtual.cod_disciplina_virtual from disciplina_virtual where cod_turma='"+codTurma+"'";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public boolean alunoMatricularVirtual(int codVirtual, int CodMatriculado, String monoProjeto){
        try { 
            sql ="insert into disc_virtual_matriculado(cod_disciplina_virtual,cod_matriculado,projeto_mono) " +
                    "values ('"+codVirtual+"','"+CodMatriculado+"','"+monoProjeto+"')" ;
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
     public ResultSet login(String usuario, String senha){
       try {
       sql = "select pessoa.nome_pessoa,pessoa.cod_pessoa,aluno.cod_aluno,aluno.cod_curso from pessoa INNER JOIN aluno on aluno.cod_pessoa=pessoa.cod_pessoa where pessoa.usuario='"+usuario+"' and pessoa.senha='"+senha+"' ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }  
}
