/*
 * Admin.java
 *
 * Created on 8 de Novembro de 2005, 23:00
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
public class Admin extends Pessoa{
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Admin */
    public Admin() throws Exception{
        this.conexao = new Conexao();
    }
    
      public boolean CriarDepartamento(String codDepartamento, String nomeDepartamento,int codPessoa, String chefe){
        try {
            sql ="insert into departamento(cod_departamento,nome_departamento,cod_pessoa,chefe_departamento) " +
                    "values ('"+codDepartamento+"','"+nomeDepartamento+"','"+codPessoa+"','"+chefe+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
     public boolean CriarCoordenacao(String codCoordenacao, String nomeCoordenacao,String codDepartamento, String nomeCoordenador,int codPessoa){
        try {
            sql ="insert into Coordenacao(cod_Coordenacao,nome_Coordenacao,cod_departamento,nome_coordenador,cod_pessoa) " +
                    "values ('"+codCoordenacao+"','"+nomeCoordenacao+"','"+codDepartamento+"','"+nomeCoordenador+"','"+codPessoa+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
         public ResultSet login(String usuario, String senha,String tipo){
       try {
       sql = "select pessoa.nome_pessoa,pessoa.cod_pessoa from pessoa where pessoa.usuario='ADMIN' and pessoa.senha='"+senha+"' and pessoa.tipopessoa='"+tipo+"' ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
         }
         public ResultSet RelatorioDepartamento(){
       try {
       sql = "select * from departamento order by nome_departamento";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
         }
       public ResultSet RelatorioCoordenacao(){
       try {
       sql = "select d.nome_departamento,c.* from coordenacao as c inner join departamento as d on c.cod_departamento=d.cod_departamento order by nome_coordenacao ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
       }
    }  
