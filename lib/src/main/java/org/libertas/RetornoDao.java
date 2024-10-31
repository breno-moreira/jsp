package org.libertas;

public class RetornoDao {

	public Retorno RetornoJson(boolean resposta, String mensagem) {
		Retorno retorno = new Retorno(resposta, mensagem);
		
		return retorno;		
	}
	
}