/*
 * BancoQuestoes.java
 *
 * Created on 31 de Outubro de 2005, 15:11
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */
package Intranet;
import java.sql.*;
import java.math.*;
/**
 *
 * @author Wagner
 */
public class BancoQuestoes {
    private Conexao conexao = null;
    private String sql ="";
    /** Creates a new instance of BancoQuestoes */
    public BancoQuestoes() throws Exception{
        this.conexao = new Conexao();
    }
    
    public boolean CriarBancoQuestao(int codVirtual){
        try { 
            sql ="insert into banco_questoes(cod_disciplina_virtual) " +
                    "values ('"+codVirtual+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0){
                return true;
               }
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    public boolean InserePergunta(String pergunta,String certa, String errada1, String errada2,String errada3,String errada4,String conteudo, int codBancoQuestoes){
        try { 
            sql ="insert into perguntas(pergunta,resposta_certa,resposta_errada1,resposta_errada2,resposta_errada3,resposta_errada4,conteudo_resposta,cod_banco_questoes,Status) " +
                    "values ('"+pergunta+"','"+certa+"','"+errada1+"','"+errada2+"','"+errada3+"','"+errada4+"','"+conteudo+"','"+codBancoQuestoes+"','T')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0){
                return true;
               }
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    
    public ResultSet BuscarCodBancoQuestoes(int codVirtual){
        try { 
            sql ="select cod_banco_questoes from banco_questoes where cod_disciplina_virtual='"+codVirtual+"'" ;
             return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet BuscarQuestoes(int codVirtual){
        try { 
            sql ="select perguntas.* from perguntas inner join banco_questoes As b on b.cod_banco_questoes=perguntas.cod_banco_questoes where b.cod_disciplina_virtual='"+codVirtual+"'" ;
             return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet BuscarQuestoesRespondida(int codPergunta){
        try { 
            sql ="select perguntas.*,respostas.resposta_selecionada from perguntas inner join banco_questoes As b on b.cod_banco_questoes=perguntas.cod_banco_questoes inner join respostas on respostas.cod_pergunta=perguntas.cod_pergunta where perguntas.cod_pergunta='"+codPergunta+"'" ;
             return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public ResultSet AbrirQuestoes(int codPergunta){
        try { 
            sql ="select * from perguntas where cod_pergunta='"+codPergunta+"'" ;
             return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
    public boolean UpdateQuestao(int codPergunta,int codAluno,String respostaSelecionada){
        try { 
            sql ="insert into respostas (cod_pergunta,cod_aluno,resposta_selecionada)" +
                    "values ('"+codPergunta+"','"+codAluno+"','"+respostaSelecionada+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0){
                return true;
               }
            else
                return false;
           }catch (Exception ex){
            return false;
        }
     }
     public boolean UpdateStatus(int codPergunta){
        try { 
            sql ="update perguntas set status='F' where cod_pergunta='"+codPergunta+"'" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0){
                return true;
               }
            else
                return false;
           }catch (Exception ex){
            return false;
        }
     }
    
    }
