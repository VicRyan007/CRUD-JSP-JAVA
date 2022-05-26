package com.crudjspjava.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudjspjava.beans.Usuario;

public class UsuarioDao {

	public static Connection getConnection() {
		Connection con = null;
	 try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud","root","P@ssw0rd");
	} catch(Exception e) {
		System.out.println(e);
	}
	return con;
	}
	
	public static int salvarUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO crud.usuario (nome,sobrenome,email,sexo,pais) VALUES (?,?,?,?,?)");
			ps.setString(1, u.getNome());
			ps.setString(2, u.getSobrenome());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getPais());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
		
	}
	
	public static List<Usuario> getRecords(int start,int total) {
		List<Usuario> list = new ArrayList<Usuario>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM LIMIT"+(start)+","+total);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSobrenome(rs.getString("sobrenome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
			}
			con.close();
		}catch ( Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	public static int deletarUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM crud.usuario WHERE id=?");
			ps.setInt(1, u.getId());
			status=ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static int updateUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE crud.usuario SET nome=?, sobrenome=?, email=?, sexo=?, pais=? WHERE id=?");
			ps.setString(1, u.getNome());
			ps.setString(2, u.getSobrenome());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSexo());
			ps.setString(5, u.getPais());
			ps.setInt(6, u.getId());
			status = ps.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static Usuario getRegistroById(int id) {
		Usuario usuario = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM crud.usuario WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSobrenome(rs.getString("sobrenome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return usuario;
	}
	
	public static List<Usuario> getAllusuarios(){
		List<Usuario> list = new ArrayList<Usuario>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM crud.usuario");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSobrenome(rs.getString("sobrenome"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setPais(rs.getString("pais"));
				list.add(usuario);
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return list;
		
	}
	
	
	
}
