/*
 * DisciplinaVirtual.java
 *
 * Created on 31 de Outubro de 2005, 15:10
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

    
    public class DisciplinaVirtual {
    private Conexao conexao = null;
    private String sql ="";    
    
    /** Creates a new instance of DisciplinaVirtual */
    public DisciplinaVirtual() throws Exception{
        this.conexao = new Conexao();
    }
    
     public ResultSet PesqDisciplinaMatriculado(int codAluno){
        try {
            sql ="select matriculado.cod_aluno,matriculado.cod_disciplina,turma.cod_turma,turma.nome_turma,turma.Sala,turma.horario,turma.cod_professor,disciplina.nome_disciplina,disciplina.periodo_disciplina, disc_virtual_matriculado.cod_disciplina_virtual from matriculado inner join turma on turma.cod_turma=matriculado.cod_turma inner join disciplina on disciplina.cod_disciplina = matriculado.cod_disciplina inner join disc_virtual_matriculado on disc_virtual_matriculado.cod_matriculado=matriculado.cod_matriculado where matriculado.cod_aluno ='"+codAluno+"' ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet PesqDisciplinaVirtualMatriculado(int codAluno){
        try {
            sql ="select disc_virtual_matriculado.*,matriculado.cod_aluno,disciplina_virtual.* from disc_virtual_matriculado inner join matriculado on matriculado.cod_matriculado = disc_virtual_matriculado.cod_matriculado inner join disciplina_virtual on disciplina_virtual.cod_disciplina_virtual=disc_virtual_matriculado.cod_disciplina_virtual where matriculado.cod_aluno ='"+codAluno+"' ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
     }
    public ResultSet PesqNomeProfessor(String codTurma){
        try {
            sql ="select professor.titulacao_professor, turma.cod_turma, pessoa.nome_pessoa from professor inner join turma on turma.cod_professor=professor.cod_professor inner join pessoa on pessoa.cod_pessoa=professor.cod_pessoa where turma.cod_turma='"+codTurma+"' ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet PesqDiscProfessor(int codProfessor){
        try {
            sql ="select distinct professor.titulacao_professor, pessoa.nome_pessoa, disciplina_virtual.*,disc_virtual_matriculado.projeto_mono from professor inner join disciplina_virtual on disciplina_virtual.cod_professor=professor.cod_professor inner join pessoa on pessoa.cod_pessoa=professor.cod_pessoa inner join disc_virtual_matriculado on disc_virtual_matriculado.cod_disciplina_virtual=disciplina_virtual.cod_disciplina_virtual where professor.cod_professor='"+codProfessor+"'";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public ResultSet NomeProfessor(int codDisciplinaVirtual){
        try {
            sql ="select professor.cod_professor, disciplina_virtual.cod_professor, pessoa.nome_pessoa from professor inner join disciplina_virtual on disciplina_virtual.cod_professor=professor.cod_professor inner join pessoa on pessoa.cod_pessoa=professor.cod_pessoa where disciplina_virtual.cod_disciplina_virtual='"+codDisciplinaVirtual+"' ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     
}
