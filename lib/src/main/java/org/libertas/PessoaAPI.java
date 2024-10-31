package org.libertas;

import java.io.IOException;
import java.util.stream.Collectors;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PessoaAPI
 */
public class PessoaAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public PessoaAPI() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PessoaDao pdao = new PessoaDao();
		Gson gson = new Gson();
		
		//pega o id passado por parametro
		int id = 0;
		try {
			id = Integer.parseInt( request.getPathInfo().substring(1));
		} catch (Exception e) {
		}
		String resposta;
		if (id==0) {
			//listar todos
			resposta = gson.toJson(pdao.listar());
		} else {
			//comsultar apenas
			resposta = gson.toJson(pdao.consultar(id));
		}
		response.setHeader("content-type", "application/json");
		response.getWriter().print(resposta);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pega do body da requisicao
		String body = request.getReader().lines().collect(
				Collectors.joining(System.lineSeparator()));
		
		//converte o body para um objeto java
		Gson gson = new Gson();
		Pessoa p = gson.fromJson(body, Pessoa.class);
		
		//insere a  pessoa
		PessoaDao pdao = new PessoaDao();
		pdao.inserir(p);
		
		//enviar resposta
		String resp = "Inserido com sucesso!";
		response.getWriter().print(resp);
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pega do body da requisicao
		String body = request.getReader().lines().collect(
				Collectors.joining(System.lineSeparator()));
		
		//converte o body para um objeto java
		Gson gson = new Gson();
		Pessoa p = gson.fromJson(body, Pessoa.class);
		
		//pega o id passado por parametro
		int id = 0;
		try {
			id = Integer.parseInt( request.getPathInfo().substring(1));
		} catch (Exception e) {
		}
		p.setIdpessoa(id);
		
		//salvar o nova pessoa
		PessoaDao pdao = new PessoaDao();
		pdao.alterar(p);
		
		//enviar resposta
		String resp = "Alterado com sucesso!";
		response.getWriter().print(resp);
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pega o id passado por parametro
		int id = 0;
		try {
			id = Integer.parseInt( request.getPathInfo().substring(1));
		} catch (Exception e) {
		}
		
		//excluir a nova pessoa
		PessoaDao pdao = new PessoaDao();
		Pessoa p = new Pessoa();
		p.setIdpessoa(id);
		pdao.excluir(p);
 		
		//enviar resposta
		String resp = "Excluido com sucesso!";
		response.getWriter().print(resp);
	}

}