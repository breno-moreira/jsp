<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultado do Jogo</title>
</head>
<body>
	    <h2>Resultado</h2>
    <%
        String time1 = request.getParameter("time1");
        int gols1 = Integer.parseInt(request.getParameter("gols1"));
        String time2 = request.getParameter("time2");
        int gols2 = Integer.parseInt(request.getParameter("gols2"));

        if (gols1 > gols2) {
            out.println("O time " + time1 + " venceu!");
        } else if (gols2 > gols1) {
            out.println("O time " + time2 + " venceu!");
        } else {
            out.println("O jogo terminou em empate!");
        }
    %>

</body>
</html>