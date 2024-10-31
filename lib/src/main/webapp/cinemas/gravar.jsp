<%@ page import="org.cinema.Filmes" %>
<%@ page import="org.cinema.FilmesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filme Salvo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
            color: #28a745; /* Cor de sucesso */
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
    FilmesDao fdao = new FilmesDao();
    Filmes f = new Filmes();
    f.setId_filme(Integer.parseInt(request.getParameter("id_filme")));
    f.setNome(request.getParameter("nome"));
    f.setDiretor(request.getParameter("diretor"));
    f.setGenero(request.getParameter("genero"));
    f.setAno(request.getParameter("lancamento"));
    f.setDuracao(request.getParameter("duracao"));

    // Salvar o filme
    if (f.getId_filme() > 0) {
        fdao.alterar(f);
    } else {
        fdao.inserir(f);
    }
%>

<div class="message-container">
    <h1>Filme salvo com sucesso!</h1>
    <a href="index.jsp">OK</a>
</div>

</body>
</html>