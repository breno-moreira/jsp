<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultado do Churrasco</title>
</head>
<body>
	<h2>Consumo Estimado para o Churrasco</h2>
    <%
        int homens = Integer.parseInt(request.getParameter("homens"));
        int mulheres = Integer.parseInt(request.getParameter("mulheres"));
        int criancas = Integer.parseInt(request.getParameter("criancas"));

        // Consumo de cada grupo
        int carneHomens = 300; // gramas
        double cervejaHomens = 2.0; // litros
        double refriHomens = 0.3; // litros
        
        int carneMulheres = 270; // gramas
        double cervejaMulheres = 1.5; // litros
        double refriMulheres = 0.6; // litros
        
        int carneCriancas = 250; // gramas
        double cervejaCriancas = 0.0; // litros
        double refriCriancas = 1.0; // litros

        // Cálculo total
        int totalCarne = (homens * carneHomens) + (mulheres * carneMulheres) + (criancas * carneCriancas);
        double totalCerveja = (homens * cervejaHomens) + (mulheres * cervejaMulheres) + (criancas * cervejaCriancas);
        double totalRefrigerante = (homens * refriHomens) + (mulheres * refriMulheres) + (criancas * refriCriancas);

        out.println("Quantidade total de carne: " + totalCarne + " gramas<br>");
        out.println("Quantidade total de cerveja: " + String.format("%.2f", totalCerveja) + " litros<br>");
        out.println("Quantidade total de refrigerante: " + String.format("%.2f", totalRefrigerante) + " litros<br>");
    %>
</body>
</html>