/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author USER
 */
public class CampoDAO implements CrudInterface {

    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private Statement st;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        sql = "SELECT * FROM campo";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> c = new HashMap<>();
                c.put("id", rs.getInt("idCAMPO"));
                c.put("idlider", rs.getInt("idLIDER"));
                c.put("nombre", rs.getString("NOMBRE"));
                c.put("estado", rs.getString("ESTADO"));
                lista.add(c);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Distritos" + e);
            return null;
        }
        return lista;
    }

    @Override
    public boolean add(Object o) {
        boolean p = false;
        sql = "INSERT INTO campo (NOMBRE,idLIDER,ESTADO) VALUES(?,?,?)";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            ps.setInt(2, Integer.parseInt(m.get("idlider").toString()));
            ps.setString(3, m.get("estado").toString());
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al agregar Campo " + e);
            p = false;
        }
        return p;
    }

    @Override
    public boolean edit(Object o) {
        boolean p = false;
        sql = "UPDATE campo SET NOMBRE=? WHERE idCAMPO=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            ps.setInt(2, Integer.parseInt(m.get("idcampo").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al editar CAMPO " + e);
            p = false;
        }
        return p;
    }

    @Override
    public boolean delete(Object o) {
        boolean p = false;
        sql = "DELETE FROM campo WHERE IDCAMPO=?";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(o.toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar Campo " + e);
            p = false;
        }
        return p;
    }

    public boolean desactivar(int id) {
        sql = "UPDATE campo SET ESTADO='0' WHERE idCAMPO=" + id;
        boolean p = false;
        try {
            cn = Conexion.getConexion();
            st = cn.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al desactivar Campo" + e);
        }
        return p;
    }

    public boolean activar(int id) {
        sql = "UPDATE campo SET ESTADO='1' WHERE idCAMPO=" + id;
        boolean p = false;
        try {
            cn = Conexion.getConexion();
            st = cn.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al activar Campo" + e);
        }
        return p;
    }
    
    public ArrayList<Map<String, ?>> listarun(int id) {
        sql = "SELECT * FROM campo WHERE idCAMPO=" + id;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("estado", rs.getString("ESTADO"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar CAMPO" + e);
            return null;
        }
        return lista;
    }
    
    
}
