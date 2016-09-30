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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Leandro
 */
public class IglesiaDAO implements CrudInterface {

    private String sql;
    private PreparedStatement ps;
    private ResultSet rs;
    private Statement st;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Object o) {
        boolean p = false;
        sql = "INSERT INTO iglesia (idDISTRITO,NOMBRE,ESTADO,IDLIDER) VALUES(?,?,1,0)";
        Map<String, Object> m = (Map<String, Object>) o;
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("iddis").toString()));
            ps.setString(2, m.get("nombre").toString());
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al agregar Iglesia " + e);
            p = false;
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    @Override
    public boolean edit(Object o) {
        boolean p = false;
        sql = "UPDATE iglesia SET NOMBRE=? WHERE IDIGLESIA=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            ps.setInt(2, Integer.parseInt(m.get("id").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al editar Iglesia " + e);
            p = false;
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    @Override
    public boolean delete(Object o) {
        boolean p = false;
        sql = "DELETE FROM iglesia WHERE IDIGLESIA=?";
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(o.toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar Iglesia " + e);
            p = false;
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public ArrayList<Map<String, ?>> lista(int id) {
        sql = "SELECT * FROM iglesia WHERE IDDISTRITO=" + id + " ORDER BY NOMBRE";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("id", rs.getInt("idIGLESIA"));
                d.put("iddis", rs.getInt("idDISTRITO"));
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("estado", rs.getString("ESTADO"));
                d.put("idlider", rs.getInt("idLIDER"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Iglesias" + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> listaun(int id) {
        sql = "SELECT * FROM iglesia WHERE IDIGLESIA=" + id;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("iddistrito", rs.getInt("idDISTRITO"));
                d.put("idiglesia", rs.getInt("idIGLESIA"));
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("idLider", rs.getInt("idLider"));
                d.put("estado", rs.getString("ESTADO"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Iglesias" + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public boolean desactivar(int id) {
        sql = "UPDATE iglesia SET ESTADO='0' WHERE idIGLESIA=" + id;
        boolean p = false;
        try {

            st = Conexion.getConexion().createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al desactivar Iglesia" + e);
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public boolean activar(int id) {
        sql = "UPDATE iglesia SET ESTADO='1' WHERE idIGLESIA=" + id;
        boolean p = false;
        try {

            st = Conexion.getConexion().createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al activar Iglesia" + e);
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public ArrayList<Map<String, ?>> listaDis(int idDis) {
        sql = "SELECT * FROM distrito WHERE IDDISTRITO=" + idDis;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("id", rs.getInt("idDISTRITO"));
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("estado", rs.getString("ESTADO"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar DistritosASDASDA" + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }
}
