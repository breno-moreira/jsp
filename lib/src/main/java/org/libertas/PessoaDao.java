package org.libertas;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class PessoaDao {

    public void salvar(Pessoa p) {
        if (p.getIdpessoa() > 0) {
            alterar(p);
        } else {
            inserir(p);
        }
    }

    public boolean inserir(Pessoa p) {
        Conexao con = new Conexao();
        boolean sucesso = false;
        
        try {
            String sql = "INSERT INTO pessoa (nome, telefone, email, cidade) VALUES (?, ?, ?, ?)";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setString(1, p.getNome());
            prep.setString(2, p.getTelefone());
            prep.setString(3, p.getEmail());
            prep.setString(4, p.getCidade());
            
            sucesso = prep.executeUpdate() > 0; // verdadeiro se pelo menos uma linha foi afetada
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return sucesso;
    }

    public boolean alterar(Pessoa p) {
        Conexao con = new Conexao();
        boolean sucesso = false;
        
        try {
            String sql = "UPDATE pessoa SET nome = ?, telefone = ?, email = ?, cidade = ? WHERE idpessoa = ?";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setString(1, p.getNome());
            prep.setString(2, p.getTelefone());
            prep.setString(3, p.getEmail());
            prep.setString(4, p.getCidade());
            prep.setInt(5, p.getIdpessoa());
            
            sucesso = prep.executeUpdate() > 0; // verdadeiro se pelo menos uma linha foi afetada
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return sucesso;
    }

    public boolean excluir(Pessoa p) {
        Conexao con = new Conexao();
        boolean sucesso = false;
        
        try {
            String sql = "DELETE FROM pessoa WHERE idpessoa = ?";
            PreparedStatement prep = con.getConnection().prepareStatement(sql);
            prep.setInt(1, p.getIdpessoa());
            
            sucesso = prep.executeUpdate() > 0; // verdadeiro se pelo menos uma linha foi afetada
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return sucesso;
    }

    public LinkedList<Pessoa> listar() {
        LinkedList<Pessoa> lista = new LinkedList<>();
        Conexao con = new Conexao();
        
        try {
            String sql = "SELECT * FROM pessoa ORDER BY nome";
            Statement sta = con.getConnection().createStatement();
            ResultSet res = sta.executeQuery(sql);
            
            while (res.next()) {
                Pessoa p = new Pessoa();
                p.setIdpessoa(res.getInt("idpessoa"));
                p.setNome(res.getString("nome"));
                p.setTelefone(res.getString("telefone"));
                p.setEmail(res.getString("email"));
                p.setCidade(res.getString("cidade"));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return lista;
    }

    public Pessoa consultar(int id) {
        Pessoa p = new Pessoa();
        Conexao con = new Conexao();
        
        try {
            String sql = "SELECT * FROM pessoa WHERE idpessoa = " + id;
            Statement sta = con.getConnection().createStatement();
            ResultSet res = sta.executeQuery(sql);
            
            while (res.next()) {
                p.setIdpessoa(res.getInt("idpessoa"));
                p.setNome(res.getString("nome"));
                p.setTelefone(res.getString("telefone"));
                p.setEmail(res.getString("email"));
                p.setCidade(res.getString("cidade"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            con.desconecta();
        }
        
        return p;
    }
}
