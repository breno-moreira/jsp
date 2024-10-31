<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comparar Resultados de Futebol</title>
</head>
<body>
	<h2>Digite os Resultados dos Times</h2>
    <form action="resultado.jsp" method="post">
        <label>Nome do Time 1:</label><br>
        <input type="text" name="time1" required><br>
        <label>Gols do Time 1:</label><br>
        <input type="number" name="gols1" required><br><br>
        
        <label>Nome do Time 2:</label><br>
        <input type="text" name="time2" required><br>
        <label>Gols do Time 2:</label><br>
        <input type="number" name="gols2" required><br><br>
        
        <input type="submit" value="Enviar">
    </form>

</body>
</html>