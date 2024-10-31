package org.cinema;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class FilmesDao {
	
	public void salvar(Filmes f) {
		if (f.getId_filme()>0) {
			alterar(f);
		}else {
			inserir(f);
		}
	}

	public void inserir(Filmes f) {
		Conexao con = new Conexao();
		
		try {
			String sql= "INSERT INTO filmes (nome, diretor, genero, ano, duracao)"
					+ " VALUES (?,?,?,?,?)";
			PreparedStatement prep =con.getConnection().prepareStatement(sql);	
			prep.setString(1, f.getNome());
			prep.setString(2, f.getDiretor());
			prep.setString(3, f.getGenero());
			prep.setString(4, f.getAno());
			prep.setString(5, f.getDuracao());
			prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		con.desconecta();
	}
	
	public LinkedList<Filmes> listar() {
		LinkedList<Filmes> lista = new LinkedList<Filmes>();
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM filmes ORDER BY nome";
			Statement sta = con.getConnection().createStatement();
			ResultSet res = sta.executeQuery(sql);
			while (res.next()) {
				Filmes f = new Filmes();
				f.setId_filme(res.getInt("id_filme"));
				f.setNome(res.getString("nome"));
				f.setDiretor(res.getString("diretor"));
				f.setGenero(res.getString("genero"));
				f.setAno(res.getString("ano"));
				f.setDuracao(res.getString("duracao"));
				lista.add(f);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return lista;
		
	}
	
	public void alterar(Filmes f) {
		Conexao con = new Conexao();
		try {
			String sql = "UPDATE filmes SET nome = ?, diretor = ?, genero = ?,"
					+ " ano = ?, duracao = ? "
					+ "WHERE id_filme = ?";
			PreparedStatement prep = con.getConnection().prepareStatement(sql);
			prep.setString(1, f.getNome());
			prep.setString(2, f.getDiretor());
			prep.setString(3, f.getGenero());
			prep.setString(4, f.getAno());
			prep.setString(5, f.getDuracao());
			prep.setInt(6, f.getId_filme());
			prep.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	
	public void excluir(Filmes f) {
		Conexao con = new Conexao();
		try {
			String sql = "DELETE FROM filmes"
					+ " WHERE id_filme = ?";
			PreparedStatement prep = con.getConnection().prepareStatement(sql);
			prep.setInt(1, f.getId_filme());
			prep.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
	}
	
	public Filmes consultar(int id) {
		Filmes f = new Filmes();
		Conexao con = new Conexao();
		try {
			String sql = "SELECT * FROM filmes WHERE id_filme = "+ id;
			Statement sta = con.getConnection().createStatement();
			ResultSet res = sta.executeQuery(sql);
			if (res.next()) {
				f.setId_filme(res.getInt("id_filme"));
				f.setNome(res.getString("nome"));
				f.setDiretor(res.getString("diretor"));
				f.setGenero(res.getString("diretor"));
				f.setAno(res.getString("ano"));
				f.setDuracao(res.getString("duracao"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.desconecta();
		return f;
	}
}
	