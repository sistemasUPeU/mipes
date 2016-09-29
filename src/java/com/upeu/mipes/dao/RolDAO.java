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
 * @author Andres
 */
public class RolDAO implements CrudInterface {

    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        sql = "SELECT * FROM rol";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("idrol", rs.getInt("IDROL"));
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("estado", rs.getString("ESTADO"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Rol " + e);
            return null;
        }
        return lista;
    }

    @Override
    public boolean add(Object o) {
        sql = "INSERT INTO rol (idROL, NOMBRE, ESTADO) VALUES(NULL,?,'1')";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al agregar Rol " + e);
            return false;
        }
    }

    @Override
    public boolean edit(Object o) {
        sql = "UPDATE rol SET NOMBRE=?, ESTADO=? WHERE IDROL=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            ps.setString(2, m.get("estado").toString());
            ps.setInt(3, Integer.parseInt(m.get("idrol").toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Rol " + e);
            return false;
        }
    }

    @Override
    public boolean delete(Object o) {
        sql = "DELETE FROM rol WHERE IDROL=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idrol").toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Rol " + e);
            return false;
        }
    }
    public boolean asignar(int idUsuario, int idRol) {
        sql = "INSERT INTO detrol (idROL, idUSUARIO) VALUES(?,?)";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idRol);
            ps.setInt(2, idUsuario);
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al asignar Rol " + e);
            return false;
        }
    }
    public boolean quitarRol(int idUsuario, int idRol) {
        sql = "DELETE FROM detrol WHERE idROL=? AND idUSUARIO=?";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idRol);
            ps.setInt(2, idUsuario);
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al quitar Rol " + e);
            return false;
        }
    }

    public ArrayList<Map<String, ?>> listar(int idUsuario) {
        System.out.println(idUsuario);
        sql = "{CALL get_rol(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idUsuario);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("idrol", rs.getInt("IDROL"));
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("estado", rs.getString("ESTADO"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Rol " + e);
            return null;
        }
        return lista;
    }

}
