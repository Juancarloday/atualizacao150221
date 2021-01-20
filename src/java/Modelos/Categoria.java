/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

/**
 *
 * @author entra21
 */
public class Categoria {
    private int id;
    private int idUsuario;
    private String descricao;
    private String tipo;
   
    public boolean salvar(){
    String sql = "insert into categoria(idUsuario, descricao, tipo)";
                  sql += "values(?,?,?)";
        Connection con = Conexao.conectar();
       
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt(1, 1);    // idUsuario está mockeado
           stm.setString(2, this.descricao);
           stm.setString(3, this.tipo);
           
           
           stm.execute();           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
        }        
        return true;
    }
    
    public boolean alterar(){
        Connection con = Conexao.conectar();
        String sql = "update categoria set ";
              sql +="descricao = ?,";
              sql +="tipo = ?";
              sql +=" where id = ?";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, this.descricao);
           stm.setString(2, this.tipo);
           stm.setInt(3, this.id);
           
           stm.execute();           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
        }        
        return true;
    }
    
    public Categoria consultar(int id){
        Connection con = Conexao.conectar();
        String sql = "select id, descricao, tipo"
                 + " from categoria where id = ?";
        Categoria categoria = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
             categoria = new Categoria();
             categoria.setId(id);
             categoria.setDescricao(rs.getString("descricao"));
             categoria.setTipo(rs.getString("tipo"));           
            }
           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
        }      
    return categoria;  
    }  
    
    public List<Categoria> consultar(){
        List<Categoria> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select id, descricao, tipo from categoria";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while(rs.next()){
            Categoria categoria = new Categoria();
            categoria.setId(rs.getInt("id"));
            categoria.setDescricao(rs.getString("descricao"));
            categoria.setTipo(rs.getString("tipo"));
            
            lista.add(categoria);
           }
           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
        }      
        return lista; 
    }
    
    public boolean excluir(){
        Connection con = Conexao.conectar();
        String sql = "delete from categoria ";
              sql +=" where id = ?";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt(1, this.id);
           stm.execute();           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
        }        
        return true;
    }
    public List<Categoria> consultar(String tipo){
        List<Categoria> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select id, descricao, tipo from categoria where tipo = ?";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, tipo);
           ResultSet rs = stm.executeQuery();
           while(rs.next()){
            Categoria categoria = new Categoria();
            categoria.setId(id);
            categoria.setDescricao(rs.getString("descricao"));
            categoria.setTipo(rs.getString("tipo"));
            
            lista.add(categoria);
           }
           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
        }      
        return lista; 
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    
}
