<%@page import="org.cinema.Filmes" %>
<%@page import="org.cinema.FilmesDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Filmes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .link-container {
            text-align: center;
            margin-bottom: 20px;
        }
        a {
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h1>Cadastro de Filmes</h1>
    <div class="link-container">
        <a href="formulario.jsp?id=0">Novo</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Id_filme</th>
                <th>Nome</th>
                <th>Diretor</th>
                <th>Gênero</th>
                <th>Lançamento</th>
                <th>Duração</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%
                FilmesDao fdao = new FilmesDao();
                for (Filmes f : fdao.listar()) {
                    out.print("<tr>");
                    out.print("<td>" + f.getId_filme() + "</td>");
                    out.print("<td>" + f.getNome() + "</td>");
                    out.print("<td>" + f.getDiretor() + "</td>");
                    out.print("<td>" + f.getGenero() + "</td>");
                    out.print("<td>" + f.getAno() + "</td>");
                    out.print("<td>" + f.getDuracao() + "</td>");
                    out.print("<td>");
                    out.print("<a href='formulario.jsp?id=" + f.getId_filme() + "'>Alterar</a> | ");
                    out.print("<a href='excluir.jsp?id=" + f.getId_filme() + "'>Excluir</a>");
                    out.print("</td>");
                    out.print("</tr>");
                }
            %>
        </tbody>
    </table>
    
    <div class="footer">
        <a href="index.jsp">Início</a>
    </div>

</body>
</html>
