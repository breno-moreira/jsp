<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Filmes</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #28a745;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            text-decoration: none;
            color: #007bff;
            padding: 5px 10px;
            border: 1px solid #007bff;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }
        a:hover {
            background-color: #007bff;
            color: white;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Lista de Filmes</h1>

        <jsp:useBean id="fdao" scope="page" class="org.cinema.FilmesDao"/>

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
                <c:forEach var='f' items='${fdao.listar()}'>
                    <tr>
                        <td>${f.id_filme}</td>
                        <td>${f.nome}</td>
                        <td>${f.diretor}</td>
                        <td>${f.genero}</td>
                        <td>${f.ano}</td>
                        <td>${f.duracao}</td>
                        <td>
                            <a href="formulario.jsp?idpessoa=${f.id_filme}">Alterar</a>
                            <a href="excluir.jsp?idpessoa=${f.id_filme}">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
