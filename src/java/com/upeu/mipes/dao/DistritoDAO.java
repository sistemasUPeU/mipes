package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Leandro
 */
public class DistritoDAO implements CrudInterface {

    private String sql;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        sql = "SELECT * FROM distrito";
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
            System.out.println("Error al Listar Distritos" + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    @Override
    public boolean add(Object o) {
        sql = "{CALL add_distrito(?,?,?,?)}";
        Map<String, Object> m = (Map<String, Object>) o;
        try {

            cs = Conexion.getConexion().prepareCall(sql);
            cs.setInt(1, Integer.parseInt(m.get("idcampo").toString()));
            cs.setInt(2, Integer.parseInt(m.get("idlider").toString()));
            cs.setString(3, m.get("nombre").toString());
            cs.setString(4, m.get("estado").toString());
            int r = cs.executeUpdate();
            return r >= 0;
        } catch (Exception e) {
            System.out.println("Error al agregar Distrito " + e);
            return false;
        } finally {
            Conexion.cerrar();
        }
    }

    @Override
    public boolean edit(Object o) {
        sql = "UPDATE distrito SET NOMBRE=?,ESTADO=? WHERE IDDISTRITO=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            ps.setString(2, m.get("estado").toString());
            ps.setInt(3, Integer.parseInt(m.get("iddistrito").toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Distrito " + e);
            return false;
        } finally {
            Conexion.cerrar();
        }
    }

    @Override
    public boolean delete(Object o) {
        sql = "DELETE FROM distrito WHERE IDDISTRITO=?";
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(o.toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Distrito " + e);
            return false;
        } finally {
            Conexion.cerrar();
        }
    }

    public ArrayList<Map<String, ?>> listar(int idCampo) {
        sql = "{CALL get_distrito(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {

            cs = Conexion.getConexion().prepareCall(sql);
            cs.setInt(1, idCampo);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("id", rs.getInt("idDISTRITO"));
                m.put("lider", rs.getString("NOMBRES") + " " + rs.getString("APELLIDOS"));
                m.put("nombre", rs.getString("NOMBRE"));
                m.put("estado", rs.getString("ESTADO"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Distrito " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

}
