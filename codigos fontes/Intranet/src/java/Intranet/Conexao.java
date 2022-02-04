/*
 * Conexao.java
 *
 * Created on 31 de Outubro de 2005, 15:13
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

public class Conexao {
    private Connection conn;
    private Statement st;
    private String sql;
    
    public Connection getConn(){
        return conn;
    }
    
    public void setConn(Connection con){
        this.conn = con;
    }
    public Statement getSt(){
        return st;
    }
    
    public void setSt(Statement s){
        this.st = s;
        
    }
    
     /** Creates a new instance of Conexao */
    public Conexao() throws Exception {
        Class.forName("org.postgresql.Driver");
        this.conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/intranet","postgres","pglab3");
        this.st = conn.createStatement();
       
    }
    
}
