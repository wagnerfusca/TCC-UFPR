/*
 * Arquivo.java
 *
 * Created on 4 de Fevereiro de 2006, 14:10
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package Intranet;
import java.sql.*;
/**
 *
 * @author fusca
 */
public class Arquivo {
    private Conexao conexao = null;
    private String sql ="";
    /** Creates a new instance of Arquivo */
    public Arquivo()throws Exception{
        this.conexao = new Conexao();
    }
     public ResultSet buscarTipo(){
        try {
            sql ="select * from tipoarquivo order by tipoarquivo";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
}
