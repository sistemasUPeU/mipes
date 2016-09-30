package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Andrew
 */
public class MinisterioDAO implements CrudInterface {

    private String sql;
    private PreparedStatement ps;
    private ResultSet rs;
    private Statement st;
    private CallableStatement cs;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Object o) {
        boolean p = false;
        sql = "INSERT INTO ministerio (idIGLESIA,NOMBRE,FE_CREACION,US_CREADOR,idLIDER,ESTADO) VALUES(?,?,(SELECT SYSDATE()),?,?,?)";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idiglesia").toString()));
            ps.setString(2, m.get("nombre").toString());
            ps.setInt(3, Integer.parseInt(m.get("usuario").toString()));
            ps.setInt(4, Integer.parseInt(m.get("idlider").toString()));
            ps.setInt(5, Integer.parseInt(m.get("estado").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al agregar Ministerio " + e);
            p = false;
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    @Override
    public boolean edit(Object o) {
        boolean p = false;
        sql = "UPDATE ministerio SET NOMBRE=? WHERE IDMINISTERIO=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            ps.setInt(2, Integer.parseInt(m.get("idministerio").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Editar Ministerio " + e);
            p = false;
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    @Override
    public boolean delete(Object o) {
        boolean p = false;
        sql = "DELETE FROM ministerio WHERE IDMINISTERIO=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(o.toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Eliminar Ministerio " + e);
            p = false;
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public ArrayList<Map<String, ?>> lista(int idIglesia) {
        sql = "{CALL get_ministerio(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cs = Conexion.getConexion().prepareCall(sql);
            cs.setInt(1, idIglesia);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("idiglesia", rs.getInt("idIGLESIA"));
                d.put("id", rs.getInt("idMINISTERIO"));
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("fecha", rs.getString("FE_CREACION"));
                d.put("idlider", rs.getString("idLIDER"));
                d.put("estado", rs.getString("ESTADO"));
                d.put("lider", rs.getString("NOMBRES") + " " + rs.getString("APELLIDOS"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Ministerios" + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public boolean desactivar(int id) {
        sql = "UPDATE ministerio SET ESTADO='0' WHERE idMINISTERIO=" + id;
        boolean p = false;
        try {
            st = Conexion.getConexion().createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Desactivar Ministerio" + e);
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public boolean activar(int id) {
        sql = "UPDATE ministerio SET ESTADO='1' WHERE idMINISTERIO=" + id;
        boolean p = false;
        try {
            st = Conexion.getConexion().createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Activar Ministerio" + e);
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public ArrayList<Map<String, ?>> listaun(int id) {
        sql = "SELECT * FROM ministerio WHERE IDMINISTERIO=" + id;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("idministerio", rs.getInt("idMINISTERIO"));
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
}
