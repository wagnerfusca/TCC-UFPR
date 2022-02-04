/*
 * CronogramaTarefa.java
 *
 * Created on 31 de Outubro de 2005, 15:10
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */
package Intranet;
import java.sql.*;
import java.lang.*;
/**
 *
 * @author Wagner
 */
public class CronogramaTarefa {
    private Conexao conexao = null;
    private String sql ="";
    /** Creates a new instance of CronogramaTarefa */
    public CronogramaTarefa()throws Exception{
        this.conexao = new Conexao();
    }
    
    public ResultSet BuscarTarefaMes(String dataInicio, String dataFinal,int codDisciplinaVirtual){
        try {
            sql ="select cronograma.*,pessoa.nome_pessoa from cronograma inner join pessoa on pessoa.cod_pessoa=cronograma.cod_pessoa where cronograma.data_limite between '"+dataInicio+"' and '"+dataFinal+"' and cod_disciplina_virtual='"+codDisciplinaVirtual+"' and cod_professor is not null order by cronograma.data_limite asc";
            //vai ter que arrumar pra buscar o codigo de outra tabela
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public ResultSet BuscarTarefaAluno(String dataInicio, String dataFinal,int codDisciplinaVirtual){
        try {
            sql ="select cronograma.*,pessoa.nome_pessoa from cronograma inner join pessoa on pessoa.cod_pessoa=cronograma.cod_pessoa where cronograma.data_limite between '"+dataInicio+"' and '"+dataFinal+"' and cod_disciplina_virtual='"+codDisciplinaVirtual+"' and cod_professor is null order by cronograma.data_limite asc";
            //vai ter que arrumar pra buscar o codigo de outra tabela
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
     public String Mes(int mes){
         String nomeMes=null;
        if (mes==1)
           nomeMes="Janeiro";
        if (mes==2)
            nomeMes="Fevereiro";
        if (mes==3)
            nomeMes="Março";
        if (mes==4)
            nomeMes="Abril";
        if (mes==5)
            nomeMes="Maio";
        if (mes==6)
            nomeMes="Junho";
        if (mes==7)
            nomeMes="Julho";
        if (mes==8)
            nomeMes="Agosto";
        if (mes==9)
            nomeMes="Setembro";
        if (mes==10)
            nomeMes="Outubro";
        if (mes==11)
            nomeMes="Novembro";
        if (mes==12)
            nomeMes="Dezembro";
     return (nomeMes);
     }    
     public ResultSet AbrirTarefa(int codTarefa){
        try {
            sql ="select cronograma.*,pessoa.nome_pessoa from cronograma inner join pessoa on pessoa.cod_pessoa=cronograma.cod_pessoa where cronograma.cod_cronograma='"+codTarefa+"' ";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
       public ResultSet AbrirArq(int codArquivo){
        try {
            sql ="select cronograma.* from cronograma where cronograma.cod_cronograma='"+codArquivo+"'";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }
}
