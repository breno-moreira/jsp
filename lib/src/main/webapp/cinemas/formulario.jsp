<%@ page import="org.cinema.Filmes" %>
<%@ page import="org.cinema.FilmesDao" %>
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
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h1>Cadastro de Filmes</h1>

    <div class="form-container">
        <%
            int id_filme = Integer.parseInt(request.getParameter("id"));
            Filmes f = new Filmes();
            FilmesDao fdao = new FilmesDao();
            if (id_filme > 0) {
                f = fdao.consultar(id_filme);
            } else {
                // Limpa os dados para novo
                f.setNome("");
                f.setDiretor("");
                f.setGenero("");
                f.setAno("");
                f.setDuracao("");
            }
        %>

        <form action="gravar.jsp" method="post">
            <input type="hidden" name="id_filme" value="<%= f.getId_filme() %>"/>
            <label for="nome">Nome:</label>
            <input type="text" name="nome" id="nome" value="<%= f.getNome() %>"/>

            <label for="diretor">Diretor:</label>
            <input type="text" name="diretor" id="diretor" value="<%= f.getDiretor() %>"/>

            <label for="genero">Gênero:</label>
            <input type="text" name="genero" id="genero" value="<%= f.getGenero() %>"/>

            <label for="lancamento">Lançamento:</label>
            <input type="text" name="lancamento" id="lancamento" value="<%= f.getAno() %>"/>

            <label for="duracao">Duração:</label>
            <input type="text" name="duracao" id="duracao" value="<%= f.getDuracao() %>"/>

            <input type="submit" value="Salvar"/>
        </form>
    </div>

    <div class="footer">
        <a href="index.jsp">Voltar ao Início</a>
    </div>

</body>
</html>
