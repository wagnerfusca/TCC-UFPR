/*
 * ArquivoPubl.java
 *
 * Created on 7 de Dezembro de 2005, 17:16
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package Intranet;
import java.sql.*;
/**
 *
 * @author Wagner
 */
public class ArquivoPubl extends MaterialApoio{
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of ArquivoPubl */
    public ArquivoPubl() throws Exception{
        this.conexao = new Conexao();
    }
     public ResultSet BuscarArq(int CodDisciplinaVirtual){
        try {
            sql ="select arquivo.*, material_apoio.* from arquivo inner join material_apoio on material_apoio.cod_material=arquivo.cod_material where material_apoio.cod_disciplina_virtual='"+CodDisciplinaVirtual+"' order by material_apoio.titulo_material";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet AbrirArq(int codArquivo){
        try {
            sql ="select arquivo.* from arquivo where arquivo.cod_arquivo='"+codArquivo+"'";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
}
