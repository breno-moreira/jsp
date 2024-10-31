<%@page import="org.libertas.Pessoa"%>
<%@page import="org.libertas.PessoaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//declare um objeto Pessoa
		Pessoa p = new Pessoa();
	
		//receba o pagamento id e atribua no objeto pessoa o valor do idpessoa
		p.setIdpessoa(Integer.parseInt(request.getParameter("id")));
		
		//declare o PessoaDao
		PessoaDao pdao= new PessoaDao();
		
		//execute o metodo excluir
			pdao.excluir(p);
		
		//adicione um link pra voltar para pagina listar.jsp
	%>
	Registro excluido com sucesso<br/>
	<a href="listar.jsp">voltar</a>

</body>
</html>