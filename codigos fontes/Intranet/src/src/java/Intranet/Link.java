/*
 * Link.java
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

    /** Creates a new instance of MaterialApoio */
    
public class Link extends MaterialApoio{
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Link */
    public Link() throws Exception{
        this.conexao = new Conexao();
    }
    
    public boolean InsereLink(int codMaterial, String link){
          try {
            sql ="insert into link(cod_material,endereco_links) " + 
                "values ('"+codMaterial+"','"+link+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
               return true;
           else
                return false;
           }catch (Exception ex){
            return false;
        }
    } 
    public ResultSet BuscarLinks(int CodDisciplinaVirtual){
        try {
            sql ="select link.*, material_apoio.* from link inner join material_apoio on material_apoio.cod_material=link.cod_material where material_apoio.cod_disciplina_virtual='"+CodDisciplinaVirtual+"' order by material_apoio.titulo_material";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
}
