/*
 * GradeHoraria.java
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

public class GradeHoraria {
    private Conexao conexao = null;
    private String sql ="";
        
    /** Creates a new instance of GradeHoraria */
    public GradeHoraria() throws Exception{
        this.conexao = new Conexao();
    }
    
    public boolean CriarGrade(String nomeGrade,String codCurso){
          try {
            sql ="insert into grade(nome_grade,cod_curso) " + 
                "values ('"+nomeGrade+"','"+codCurso+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
               return true;
           else
                return false;
           }catch (Exception ex){
            return false;
        }
    }    
    
    public boolean CriarGradeDisciplina(int codGrade,int codCursoDisciplina){
          try {
            sql ="insert into grade_disciplina(cod_grade,cod_curso_disc) " + 
                "values ('"+codGrade+"','"+codCursoDisciplina+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
               return true;
           else
                return false;
           }catch (Exception ex){
            return false;
        }
    }     
    public ResultSet BuscarGrade(String codCurso){
        try {
            sql ="select * from grade where cod_curso='"+codCurso+"' order by nome_grade";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet BuscarGradeDisc(int codGrade){
        try {
            sql ="select * from grade_disciplina where cod_grade='"+codGrade+"' ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet BuscarDadosDisc(int codGrade,String codCurso){
        try  {
            sql ="select grade_disciplina.cod_grade_disciplina, curso_disciplina.cod_disciplina,disciplina.nome_disciplina, disciplina.periodo_disciplina from grade_disciplina INNER JOIN curso_disciplina on curso_disciplina.cod_curso_disciplina=grade_disciplina.cod_curso_disc INNER JOIN disciplina on curso_disciplina.cod_disciplina=disciplina.cod_disciplina where grade_disciplina.cod_grade='"+codGrade+"' and curso_disciplina.cod_curso='"+codCurso+"' order by disciplina.nome_disciplina";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
  public ResultSet BuscarDadosDiscProf(int codGradeDisciplina){
        try  {
            sql ="select grade_disciplina.cod_grade_disciplina, curso_disciplina.cod_disciplina,disciplina.nome_disciplina, disciplina.periodo_disciplina,disciplina.cod_Departamento from grade_disciplina INNER JOIN curso_disciplina on curso_disciplina.cod_curso_disciplina=grade_disciplina.cod_curso_disc INNER JOIN disciplina on curso_disciplina.cod_disciplina=disciplina.cod_disciplina where  grade_disciplina.cod_grade_disciplina='"+codGradeDisciplina+"' ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
}
