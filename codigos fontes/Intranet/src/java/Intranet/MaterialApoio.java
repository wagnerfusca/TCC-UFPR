/*
 * MaterialApoio.java
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
       

public class MaterialApoio {
    private Conexao conexao = null;
    private String sql ="";

    /** Creates a new instance of MaterialApoio */
    public MaterialApoio()  throws Exception{
        this.conexao = new Conexao();
    }
    public boolean InsereMaterial(String titulo,String conteudo,String dataHoje,String tipo,int codDisciplinaVirtual){
          try {
            sql ="insert into material_apoio(titulo_material,conteudo_material,data_insercao,tipo_material,cod_disciplina_virtual) " + 
                "values ('"+titulo+"','"+conteudo+"','"+dataHoje+"','"+tipo+"','"+codDisciplinaVirtual+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
               return true;
           else
                return false;
           }catch (Exception ex){
            return false;
        }
    } 
    
    public ResultSet BucarCodMaterial(String titulo,String conteudo,String dataHoje,String tipo,int codDisciplinaVirtual){
        try {
            sql ="select * from material_apoio where titulo_material='"+titulo+"' and conteudo_material='"+conteudo+"' and data_insercao='"+dataHoje+"' and tipo_material='"+tipo+"' and cod_disciplina_virtual='"+codDisciplinaVirtual+"'";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
}
