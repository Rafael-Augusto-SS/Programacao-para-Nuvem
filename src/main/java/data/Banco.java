package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Banco {
    private Statement stmt;
    private ResultSet rs;
    public Connection conn;

    public Banco() {
        String URL = "jdbc:mysql://biblioteca.cpgwgoeq0ov9.us-east-1.rds.amazonaws.com:3306/biblioteca";
        String USR = "admin";
        String PAS = "68mA9h3njmSeyXHZA4AQ";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USR, PAS);
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private void verificarStatement() throws SQLException {
        if (stmt == null || conn.isClosed()) {
            throw new SQLException("Statement não foi inicializado ou conexão fechada.");
        }
    }

    public ResultSet livros() throws SQLException {
        verificarStatement();
        String query = "SELECT * FROM livro";
        rs = stmt.executeQuery(query);
        return rs;
    }

    public String getUsuario(String login) throws SQLException { 
        verificarStatement();
        String nome = "";
        rs = stmt.executeQuery("SELECT * FROM usuario WHERE login = '" + login + "'");
        while(rs.next()) {
            nome = rs.getString("nome");
        }
        return nome;
    }
    
    public boolean getLogin(String login, String senha) throws SQLException { 
        verificarStatement();
        String dbSenha = "";
        rs = stmt.executeQuery("SELECT senha FROM usuario WHERE login = '" + login + "'");
        if (rs.next()) {
            dbSenha = rs.getString("senha");
        }
        return dbSenha.equals(senha);
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            System.out.println("Erro ao fechar recursos: " + e.getMessage());
        }
    }
}
