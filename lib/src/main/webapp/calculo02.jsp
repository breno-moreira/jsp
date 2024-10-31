<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Resultado do Cálculo</title>
</head>
<body>
	<h2>Informações do Produto</h2>
    <%
        String descricao = request.getParameter("descricao");
        double precoDolar = Double.parseDouble(request.getParameter("preco"));
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));

        double taxaCambio = 5.00;  // Taxa de câmbio para conversão
        double precoReal = precoDolar * taxaCambio;
        double totalReal = precoReal * quantidade;

        out.println("Descrição do Produto: " + descricao + "<br>");
        out.println("Preço Unitário em Reais: R$ " + String.format("%.2f", precoReal) + "<br>");
        out.println("Quantidade: " + quantidade + "<br>");
        out.println("Preço Total em Reais: R$ " + String.format("%.2f", totalReal) + "<br>");
    %>
</body>
</html>