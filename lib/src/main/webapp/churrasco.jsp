<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Cálculo de Churrasco</title>
</head>
<body>
	<h2>Informe a Quantidade de Pessoas</h2>
    <form action="churrascores.jsp" method="post">
        <label>Homens:</label><br>
        <input type="number" name="homens" required><br>
        <label>Mulheres:</label><br>
        <input type="number" name="mulheres" required><br>
        <label>Crianças:</label><br>
        <input type="number" name="criancas" required><br><br>
        
        <input type="submit" value="Calcular">
    </form>
</body>
</html>