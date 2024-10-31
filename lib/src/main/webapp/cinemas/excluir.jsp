<%@ page import="org.cinema.Filmes" %>
<%@ page import="org.cinema.FilmesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filme Excluído</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #red;
            margin: 0;
            padding: 20px;
        }
        .message-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
            text-align: center;
        }
        h1 {
            color: #dc3545; /* Cor de alerta */
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px 15px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<%
    // Declare um objeto Filme
    Filmes f = new Filmes();
    
    // Receba o id e atribua ao objeto filme
    f.setId_filme(Integer.parseInt(request.getParameter("id")));
    
    // Declare o FilmeDao
    FilmesDao fdao = new FilmesDao();
    
    // Execute o método excluir
    fdao.excluir(f);
%>

<div class="message-container">
    <h1>Registro excluído com sucesso!</h1>
    <a href="listar.jsp">Voltar</a>
</div>

</body>
</html>
