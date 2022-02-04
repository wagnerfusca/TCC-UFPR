/*
 * Curso.java
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

public class Curso {
    private Conexao conexao = null;
    private String sql ="";
    /** Creates a new instance of Curso */
   
    public Curso() throws Exception{
        this.conexao = new Conexao();
    }
    public ResultSet BuscarCurso(String codCoordenacao){
        try {
            sql ="select * from curso where cod_coordenacao='"+codCoordenacao+"' order by nome_curso";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet BuscarCursoDisciplina(String codCurso){
        try {
            sql ="select curso_disciplina.*,disciplina.nome_disciplina,disciplina.periodo_disciplina from Curso_disciplina INNER JOIN " +
                    "disciplina on disciplina.cod_disciplina = curso_disciplina.cod_disciplina" +
                    " where cod_curso='"+codCurso+"' order by disciplina.nome_disciplina ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
}