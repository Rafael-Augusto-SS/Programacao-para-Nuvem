<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="data.Banco"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<center>
<%
    String login = request.getParameter("login");
    String senha = request.getParameter("senha");
    Banco b = null;

    try {
        b = new Banco();
        if (b.getLogin(login, senha) && login != null && !login.isEmpty()) {
            String nomeCompleto = b.getUsuario(login);
            out.print("<h1>" + nomeCompleto + "</h1><br><br>");
            
            out.print("<h1>CADASTRA LIVRO</h1>");
            out.print("<h1>CONSULTA LIVRO</h1>");
            out.print("<h1>ATUALIZAR LIVRO</h1>");
            out.print("<h1>DELETAR LIVRO</h1>");
        } else {
            out.print("<h1>USUÁRIO OU SENHA INCORRETOS</h1>");
            out.print("<h1><a href='index.jsp'>Clique aqui para voltar</a></h1>");
        }
    } catch (SQLException e) {
        out.print("<h1>Erro ao acessar o banco de dados: " + e.getMessage() + "</h1>");
    } finally {
        if (b != null) {
            b.close(); // Certifique-se de fechar a conexão
        }
    }
%>
</center>
</body>
</html>
