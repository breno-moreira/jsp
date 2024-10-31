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

    <jsp:useBean id="f" class="org.cinema.Filmes" scope="page" />
    <jsp:useBean id="fdao" class="org.cinema.FilmesDao" scope="page" />
    <jsp:setProperty property="*" name="f" />
    <c:if test="${fdao.excluir(f)}">
        <div class="message-container">
            <h1>Filme excluído com sucesso!</h1>
            <a href="index.jsp">OK</a>
        </div>
    </c:if>

</body>
</html>
