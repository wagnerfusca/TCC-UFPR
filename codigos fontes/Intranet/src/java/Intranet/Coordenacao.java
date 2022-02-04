/*
 * Coordenacao.java
 *
 * Created on 31 de Outubro de 2005, 14:49
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

public class Coordenacao extends Pessoa{
    private Conexao conexao = null;
    private String sql ="";
    
    /** Creates a new instance of Coordenacao */
    public Coordenacao() throws Exception{
        this.conexao = new Conexao();
    }
    
    public boolean CriarCurso(String codCurso, String codCoordenacao,String versao,String nomeCurso){
        try {
            sql ="insert into Curso (cod_Coordenacao,cod_Curso,cod_versao_curso, nome_curso) " +
                    "values ('"+codCoordenacao+"','"+codCurso+"','"+versao+"','"+nomeCurso+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    
   
    public boolean CriarAluno(int codPessoa,String codCurso){
        try {
            sql ="insert into aluno (cod_pessoa,cod_curso)  values ('"+codPessoa+"','"+codCurso+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
             // na pagina do professor chamar a funcao primeiro para inserir a pessoa
            // dai chama a funcao para buscar o codpessoa
           if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
    
     public boolean CadastrarDisciplina(String codCurso, String CodDisciplina){
        try {
            sql ="insert into curso_disciplina(cod_curso,cod_disciplina) " +
                    "values ('"+codCurso+"','"+CodDisciplina+"')" ;
            int rs = conexao.getSt().executeUpdate(sql);
            if (rs!=0)
                return true;
            else
                return false;
           }catch (Exception ex){
            return false;
        }
    }
     
   public ResultSet BuscarCoordenacao(){
        try {
        sql ="select coordenacao.*,pessoa.* from Coordenacao inner join pessoa on pessoa.cod_pessoa=coordenacao.cod_pessoa order by pessoa.nome_pessoa";
            return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
    }    
      
    public ResultSet login(String usuario, String senha,String tipo){
       try {
       sql = "select pessoa.nome_pessoa,pessoa.cod_pessoa,coordenacao.nome_coordenacao,coordenacao.cod_coordenacao,coordenacao.cod_departamento,coordenacao.nome_coordenador from pessoa INNER JOIN coordenacao on coordenacao.cod_pessoa=pessoa.cod_pessoa where pessoa.usuario='"+usuario+"' and pessoa.senha='"+senha+"' and pessoa.tipopessoa='"+tipo+"' ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
     }
   public ResultSet RelatorioCurso(String codCoordenacao){
       try {
       sql = "select c.*,co.* from curso as c inner join coordenacao as co on co.cod_coordenacao = c.cod_coordenacao where c.cod_coordenacao='"+codCoordenacao+"' order by c.nome_curso";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
     }
    public ResultSet RelatorioGrade(String codCoordenacao){
       try {
       sql = "select c.*,co.*,g.* from grade as g inner join curso as c on (c.cod_curso=g.cod_curso) inner join coordenacao as co on co.cod_coordenacao = c.cod_coordenacao where c.cod_coordenacao='"+codCoordenacao+"' order by c.nome_curso";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
     }
     public ResultSet RelatorioDisciplinas(String codCoordenacao){
       try {
       sql = "select c.*,d.*,de.* from disciplina as d inner join curso_disciplina as cd on cd.cod_disciplina=d.cod_disciplina inner join curso as c on (c.cod_curso=cd.cod_curso) inner join coordenacao as co on co.cod_coordenacao = c.cod_coordenacao  inner join departamento as de on de.cod_departamento = d.cod_departamento where c.cod_coordenacao='"+codCoordenacao+"' order by c.nome_curso ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
     }
      public ResultSet RelatorioTurmas(String codCoordenacao){
       try {
       sql = "select c.*,d.*,t.*,p.*,pe.* from turma as t inner join grade_disciplina as gd on gd.cod_grade_disciplina=t.cod_grade_disc inner join grade as g on g.cod_grade=gd.cod_grade inner join curso_disciplina as cd on cd.cod_curso_disciplina=gd.cod_curso_disc	inner join curso as c on c.cod_curso=cd.cod_curso inner join disciplina as d on d.cod_disciplina=cd.cod_disciplina inner join professor as p on p.cod_professor = t.cod_professor inner join pessoa as pe on pe.cod_pessoa = p.cod_pessoa where c.cod_coordenacao='"+codCoordenacao+"' order by t.nome_turma  ";             
        return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
     }
       public ResultSet RelatorioAlunos(String codCoordenacao){
       try {
       sql = "select p.*,a.*,cu.* from aluno as a inner join pessoa as p on p.cod_pessoa=a.cod_pessoa inner join curso as cu on cu.cod_curso=a.cod_curso  where cu.cod_coordenacao='"+codCoordenacao+"' order by p.nome_pessoa  ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
     }
    public ResultSet RelatorioAlunoMatriculado(String codCoordenacao){
       try {
       sql = "select m.*,t.*,d.*,c.*,a.*,p.* from matriculado as m inner join turma as t on t.cod_turma=m.cod_turma inner join aluno as a on a.cod_aluno=m.cod_aluno inner join disciplina as d on d.cod_disciplina=m.cod_disciplina inner join curso as c on c.cod_curso=a.cod_curso inner join pessoa as p on p.cod_pessoa=a.cod_pessoa where c.cod_coordenacao='"+codCoordenacao+"' order by p.nome_pessoa ";
              return conexao.getSt().executeQuery(sql);      
        }catch (Exception ex){
            return null;
        }
     }    
}