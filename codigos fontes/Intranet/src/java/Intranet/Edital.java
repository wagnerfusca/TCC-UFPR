/*
 * Edital.java
 *
 * Created on 31 de Outubro de 2005, 15:07
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

public class Edital {
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Edital */
    public Edital() throws Exception{
        this.conexao = new Conexao();
    }
    
    
    public ResultSet BuscarEditalValidos(String dataatual){
        try {
            sql ="select edital.*,pessoa.nome_pessoa from edital inner join pessoa on pessoa.cod_pessoa=edital.cod_pessoa where edital.data_validade >='"+dataatual+"' order by edital.data_validade desc";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
  
    //arrumar as classes
    public ResultSet BuscarEditalVencidos(String dataatual){
        try {
            sql ="select edital.* ,pessoa.nome_pessoa from edital inner join pessoa on pessoa.cod_pessoa=edital.cod_pessoa where edital.data_validade < '"+dataatual+"'order by edital.data_validade desc";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public ResultSet BuscarEditalData(String datainicio, String datafinal){
        try {
            sql ="select edital.* ,pessoa.nome_pessoa from edital inner join pessoa on pessoa.cod_pessoa=edital.cod_pessoa where edital.data_validade between '"+datainicio+"' and '"+datafinal+"'order by edital.data_validade desc";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public ResultSet BuscarEditalAutor(String autor){
        try {
            sql ="select edital.* ,pessoa.nome_pessoa from edital inner join pessoa on pessoa.cod_pessoa=edital.cod_pessoa where pessoa.nome_pessoa like '%"+autor+"%' order by pessoa.nome_pessoa";
            //vai ter que arrumar pra buscar o codigo de outra tabela
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }

    public ResultSet AbrirEdital(int codEdital){
        try {
            sql ="select edital.* ,pessoa.nome_pessoa from edital inner join pessoa on pessoa.cod_pessoa=edital.cod_pessoa where edital.cod_edital='"+codEdital+"' ";
            //vai ter que arrumar pra buscar o codigo de outra tabela
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public boolean InsereEdital(String titulo, String conteudo, String dataValidade,String dataInsercao, int autor){
        try {
            sql ="insert into edital(titulo_edital,conteudo_edital,data_validade,data_insercao,cod_pessoa) " +
                    "values ('"+titulo+"','"+conteudo+"','"+dataValidade+"','"+dataInsercao+"','"+autor+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    
    
}
