<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="p" class="org.projeto.Pessoa" scope="page" />
	<jsp:useBean id="pdao" class="org.libertas.PessoaDao" scope="page" />
	<jsp:setProperty property="*" name="p" />
	${pdao.excluir(p)}
	
	Registro excluido com sucesso!
	<br/>
	<a href="index.jsp">OK</a>

</body>
</html>