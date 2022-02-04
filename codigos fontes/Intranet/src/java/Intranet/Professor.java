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
      public ResultSet login(String usuario, String senha,String tipo){
       try {
       sql = "select pessoa.nome_pessoa,pessoa.cod_pessoa,professor.cod_professor,professor.titulacao_professor,professor.cod_departamento from pessoa INNER JOIN professor on professor.cod_pessoa=pessoa.cod_pessoa where pessoa.usuario='"+usuario+"' and pessoa.senha='"+senha+"' and pessoa.tipopessoa='"+tipo+"'";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }  
      public ResultSet RelatorioTurma(int codProfessor){
       try {
       sql = "select c.*,d.*,t.*,p.*,pe.* from turma as t inner join grade_disciplina as gd on gd.cod_grade_disciplina=t.cod_grade_disc inner join grade as g on g.cod_grade=gd.cod_grade inner join curso_disciplina as cd on cd.cod_curso_disciplina=gd.cod_curso_disc	inner join curso as c on c.cod_curso=cd.cod_curso inner join disciplina as d on d.cod_disciplina=cd.cod_disciplina inner join professor as p on p.cod_professor = t.cod_professor inner join pessoa as pe on pe.cod_pessoa = p.cod_pessoa where t.cod_professor='"+codProfessor+"' order by t.nome_turma ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }  
      public ResultSet RelatorioAlunos(int codProfessor){
       try {
       sql = "select m.*,t.*,d.*,c.*,a.*,p.* from matriculado as m inner join turma as t on t.cod_turma=m.cod_turma inner join aluno as a on a.cod_aluno=m.cod_aluno inner join disciplina as d on d.cod_disciplina=m.cod_disciplina inner join curso as c on c.cod_curso=a.cod_curso inner join pessoa as p on p.cod_pessoa=a.cod_pessoa where t.cod_professor='"+codProfessor+"' order by p.nome_pessoa ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }  
}

