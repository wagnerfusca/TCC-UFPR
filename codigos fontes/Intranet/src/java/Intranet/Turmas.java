/*
 * Turmas.java
 *
 * Created on 31 de Outubro de 2005, 15:06
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

public class Turmas {
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Turmas */
    public Turmas() throws Exception{
        this.conexao = new Conexao();
    }
    
    public boolean criaTurma(String codTurma, String nome, String sala,String horario,int codGrade,int codProfessor){
        try { 
            sql ="insert into turma(cod_turma,nome_turma,sala,horario,cod_grade_disc,cod_professor) " +
                    "values ('"+codTurma+"','"+nome+"','"+sala+"','"+horario+"','"+codGrade+"','"+codProfessor+"')" ;
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
    public boolean criaTurmaVitual(String codTurma, String nome, int codProfessor){
        try { 
            sql ="insert into disciplina_virtual(cod_turma,nome_disciplina_virtual,cod_professor) " +
                    "values ('"+codTurma+"','"+nome+"','"+codProfessor+"')" ;
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
    public ResultSet BuscarTurmas(String codGrade){
        try  {
            sql ="select turma.cod_turma,turma.nome_turma, turma.sala,turma.horario, curso_disciplina.cod_disciplina, disciplina.nome_disciplina, disciplina.periodo_disciplina FROM turma INNER JOIN grade_disciplina ON turma.cod_grade_disc = grade_disciplina.cod_grade_disciplina INNER JOIN curso_disciplina on curso_disciplina.cod_curso_disciplina=grade_disciplina.cod_curso_disc INNER JOIN disciplina on curso_disciplina.cod_disciplina=disciplina.cod_disciplina where grade_disciplina.cod_grade='"+codGrade+"' order by turma.nome_turma";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
}
