<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Converter Preço de Produto</title>
</head>
<body>
	<h2>Digite as Informações do Produto</h2>
    <form action="calculo02.jsp" method="post">
        <label>Descrição do Produto:</label><br>
        <input type="text" name="descricao" required><br>
        <label>Preço em Dólar:</label><br>
        <input type="number" step="0.01" name="preco" required><br>
        <label>Quantidade:</label><br>
        <input type="number" name="quantidade" required><br><br>
        
        <input type="submit" value="Calcular">
    </form>
</body>
</html>