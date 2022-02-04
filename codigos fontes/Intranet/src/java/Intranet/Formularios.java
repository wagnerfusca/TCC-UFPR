/*
 * Formularios.java
 *
 * Created on 31 de Outubro de 2005, 15:11
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


public class Formularios extends CronogramaTarefa{
    private Conexao conexao = null;
    private String sql ="";    
    /** Creates a new instance of Formularios */
    public Formularios() throws Exception{
        this.conexao = new Conexao();
    }
    public ResultSet VisualizaDoc(int destinatario, String dataHoje){
       try {
       sql = "select formdocs.*,pessoa.* from formdocs inner join pessoa on pessoa.cod_pessoa=formdocs.cod_pessoa where data_validade >='"+dataHoje+"' and formdocs.cod_destinatario='"+destinatario+"' ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet AbrirDoc(int codForm){
       try {
       sql = "select formdocs.*,pessoa.* from formdocs inner join pessoa on pessoa.cod_pessoa=formdocs.cod_pessoa where formdocs.cod_form='"+codForm+"'  ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet BuscarFormData(String datainicio, String datafinal,int destinatario){
        try {
            sql ="select formdocs.* ,pessoa.nome_pessoa from formdocs inner join pessoa on pessoa.cod_pessoa=formdocs.cod_pessoa where formdocs.data_validade between '"+datainicio+"' and '"+datafinal+"' and formdocs.cod_destinatario='"+destinatario+"' order by formdocs.data_validade";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public ResultSet BuscarFormAutor(String autor,int destinatario){
        try {
            sql ="select formdocs.* ,pessoa.nome_pessoa from formdocs inner join pessoa on pessoa.cod_pessoa=formdocs.cod_pessoa where pessoa.nome_pessoa like '%"+autor+"%' and formdocs.cod_destinatario='"+destinatario+"' order by pessoa.nome_pessoa";
            //vai ter que arrumar pra buscar o codigo de outra tabela
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }

    
}
