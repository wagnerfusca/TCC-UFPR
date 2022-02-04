/*
 * BibliotecaDigital.java
 *
 * Created on 31 de Outubro de 2005, 15:08
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

public class BibliotecaDigital {
private Conexao conexao = null;
    private String sql ="";
        
    /** Creates a new instance of BibliotecaDigital */
    public BibliotecaDigital() throws Exception{
        this.conexao = new Conexao();
    }
    
    public boolean InsereMono(String titulo, String conteudo,String autor,String assunto,String codCoordenacao, byte [] anexo,String dataInsercao){
        try {
            sql ="insert into biblioteca_digital(titulo_monografia,conteudo_monografia,autor_monografia,assunto_monografia,cod_coordenacao,anexo, data_insercao) " +
                    "values ('"+titulo+"','"+conteudo+"','"+autor+"','"+assunto+"','"+codCoordenacao+"','"+anexo+"','"+dataInsercao+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    
    public ResultSet BuscarBiblioData(String datainicio, String datafinal){
        try {
            sql ="select biblioteca_digital.* ,coordenacao.nome_coordenacao from biblioteca_digital inner join coordenacao on coordenacao.cod_coordenacao=biblioteca_digital.cod_coordenacao where biblioteca_digital.data_insercao between '"+datainicio+"' and '"+datafinal+"'";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet BuscarUltimas(String dataHoje, String dataPassada){
        try {
            sql ="select biblioteca_digital.* ,coordenacao.nome_coordenacao from biblioteca_digital inner join coordenacao on coordenacao.cod_coordenacao=biblioteca_digital.cod_coordenacao where biblioteca_digital.data_insercao between '"+dataPassada+"' and '"+dataHoje+"' order by biblioteca_digital.data_insercao";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    
    public ResultSet BuscarBiblioAutor(String autor){
        try {
            sql ="select biblioteca_digital.* ,coordenacao.nome_coordenacao from biblioteca_digital inner join coordenacao on coordenacao.cod_coordenacao=biblioteca_digital.cod_coordenacao where biblioteca_digital.autor_monografia like '%"+autor+"%'  order by biblioteca_digital.autor_monografia ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet BuscarBiblioAssunto(String assunto){
        try {
            sql ="select biblioteca_digital.* ,coordenacao.nome_coordenacao from biblioteca_digital inner join coordenacao on coordenacao.cod_coordenacao=biblioteca_digital.cod_coordenacao where biblioteca_digital.assunto_monografia like '%"+assunto+"%' order by biblioteca_digital.assunto_monografia";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet AbrirMono(int cod){
        try {
            sql ="select biblioteca_digital.* ,coordenacao.nome_coordenacao from biblioteca_digital inner join coordenacao on coordenacao.cod_coordenacao=biblioteca_digital.cod_coordenacao where biblioteca_digital.cod_monografia='"+cod+"'";
            //vai ter que arrumar pra buscar o codigo de outra tabela
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
}
