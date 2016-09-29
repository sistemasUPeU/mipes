/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Leandro
 */
public class EscuelaDAO implements CrudInterface {

    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    
    @Override
    public ArrayList<Map<String, ?>> listar() {
        sql = "SELECT * FROM escuela";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            rs=cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {                
                Map<String, Object> m= new HashMap<>();
                m.put("idescuela", rs.getInt("IDESCUELA"));
                m.put("idiglesia", rs.getInt("IDIGLESIA"));
                m.put("nombre", rs.getString("NOMBRE"));
                m.put("estado", rs.getString("ESTADO"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Escuela " + e);
            return null;
        }
        return lista;
    }

    @Override
    public boolean add(Object o) {
        sql = "INSERT INTO escuela (idESCUELA, idIGLESIA, NOMBRE, ESTADO) VALUES(null,?,?,?)";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idiglesia").toString()));
            ps.setString(2, m.get("nombre").toString());
            ps.setString(3, m.get("estado").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al agregar Escuela " + e);
            return false;
        }
    }

    @Override
    public boolean edit(Object o) {
        sql = "UPDATE escuela SET NOMBRE=?, ESTADO=? WHERE IDESCUELA=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            ps.setString(2, m.get("estado").toString());
            ps.setInt(3, Integer.parseInt(m.get("idescuela").toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Escuela " + e);
            return false;
        }
    }

    @Override
    public boolean delete(Object o) {
        sql = "DELETE FROM escuela WHERE IDESCUELA=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idescuela").toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Escuela " + e);
            return false;
        }
    }
    
    public ArrayList<Map<String, ?>> listar(int idIglesia) {
        sql = "{CALL get_escuela(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs=cn.prepareCall(sql);
            cs.setInt(1, idIglesia);
            rs=cs.executeQuery();
            while (rs.next()) {                
                Map<String, Object> m= new HashMap<>();
                m.put("id", rs.getInt("IDESCUELA"));
                m.put("idescuela", rs.getInt("IDESCUELA"));
                m.put("idiglesia", rs.getInt("IDIGLESIA"));
                m.put("nombre", rs.getString("NOMBRE"));
                m.put("lider", rs.getString("NOMBRES")+" "+rs.getString("APELLIDOS"));
                m.put("estado", rs.getString("ESTADO"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Escuela " + e);
            return null;
        }
        return lista;
    }
    
}
