<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Filme</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Editar Filme</h1>

        <jsp:useBean id="f" class="org.cinema.Filmes" scope="page" />
        <jsp:useBean id="fdao" class="org.cinema.FilmesDao" scope="page" />
        <jsp:setProperty property="*" name="f"/>
        ${f = fdao.consultar(f.id_filme)}

        <form action="gravar.jsp" method="post">
            <input type="hidden" name="id_filme" value="<%= f.getId_filme() %>"/>
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="<%= f.getNome() %>" required/>

            <label for="diretor">Diretor:</label>
            <input type="text" id="diretor" name="diretor" value="<%= f.getDiretor() %>" required/>

            <label for="genero">Gênero:</label>
            <input type="text" id="genero" name="genero" value="<%= f.getGenero() %>" required/>

            <label for="lancamento">Lançamento:</label>
            <input type="text" id="lancamento" name="lancamento" value="<%= f.getAno() %>" required/>

            <label for="duracao">Duração:</label>
            <input type="text" id="duracao" name="duracao" value="<%= f.getDuracao() %>" required/>

            <input type="submit" value="Salvar"/>
        </form>
    </div>

</body>
</html>