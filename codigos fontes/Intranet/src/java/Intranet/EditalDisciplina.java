/*
 * EditalDisciplina.java
 *
 * Created on 6 de Dezembro de 2005, 18:13
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
public class EditalDisciplina {
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of EditalDisciplina */
    public EditalDisciplina() throws Exception{
        this.conexao = new Conexao();
    }
    
    
    public ResultSet BuscarEditalValidos(int codDisciplinaVirtual){
        try {
            sql ="select edital_disciplina.*,disciplina_virtual.* from edital_disciplina inner join disciplina_virtual on disciplina_virtual.cod_disciplina_virtual=edital_disciplina.cod_disciplina_virtual where  edital_disciplina.cod_disciplina_virtual='"+codDisciplinaVirtual+"' order by edital_disciplina.data_validade desc";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
  
    //arrumar as classes
    public ResultSet BuscarEditalVencidos(String dataatual,int codDisciplinaVirtual){
        try {
            sql ="select edital_disciplina.*,disciplina_virtual.* from edital_disciplina inner join disciplina_virtual on disciplina_virtual.cod_disciplina_virtual=edital_disciplina.cod_disciplina_virtual where edital_disciplina.data_validade <'"+dataatual+"' and edital_disciplina.cod_disciplina_virtual='"+codDisciplinaVirtual+" order by edital_disciplina.data_validade";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public ResultSet BuscarEditalData(String datainicio, String datafinal,int codDisciplinaVirtual){
        try {
            sql ="select edital_disciplina.*,disciplina_virtual.* from edital_disciplina inner join disciplina_virtual on disciplina_virtual.cod_disciplina_virtual=edital_disciplina.cod_disciplina_virtual where  edital_disciplina.data_validade between '"+datainicio+"' and '"+datafinal+"' and edital_disciplina.cod_disciplina_virtual='"+codDisciplinaVirtual+"order by  edital_disciplina.data_validade";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public ResultSet AbrirEdital(int codEdital){
        try {
            sql ="select edital_disciplina.*,disciplina_virtual.* from edital_disciplina inner join disciplina_virtual on disciplina_virtual.cod_disciplina_virtual=edital_disciplina.cod_disciplina_virtual where edital_disciplina.cod_edital_disciplina='"+codEdital+"' ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public boolean InsereEdital(String titulo, String conteudo, String dataValidade,String dataInsercao, int codDiscipliaVirtual){
        try {
            sql ="insert into edital_disciplina(titulo_edital,conteudo_edital,data_validade,data_insercao,cod_disciplina_virtual) " +
                    "values ('"+titulo+"','"+conteudo+"','"+dataValidade+"','"+dataInsercao+"','"+codDiscipliaVirtual+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
     public ResultSet AbrirArq(int codArquivo){
        try {
            sql ="select edital_disciplina.* from edital_disciplina where edital_disciplina.cod_edital_disciplina='"+codArquivo+"'";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
 }

