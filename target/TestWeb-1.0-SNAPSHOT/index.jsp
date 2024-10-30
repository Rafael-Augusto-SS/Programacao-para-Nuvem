<%-- 
    Document   : index
    Created on : 16 de out. de 2024, 07:56:50
    Author     : 2108761
--%>

<%@page import="com.mycompany.testweb.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>  
        <h1>
        <form action="menu.jsp" method="POST" border="1">
            
            LOGIN <input type="text" name="login"><br>
            SENHA <input type="text" name="senha"><br>
            <input type="submit" value="ENVIAR">
            
        </form>
        
        </h1>
    </body>
</html>
