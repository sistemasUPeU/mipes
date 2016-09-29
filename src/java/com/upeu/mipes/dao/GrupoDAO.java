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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Leandro
 */
public class GrupoDAO implements CrudInterface {

    private String sql;
    private Connection cn;
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
        sql = "INSERT INTO grupo (idESCUELA , NOMBRE , FE_CREACION , US_CREADOR , LUG_REUNION , idLIDER,ESTADO ) VALUES(?,?,(SELECT SYSDATE()),?,?,?,?)";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idescuela").toString()));
            ps.setString(2, m.get("nombre").toString());
            /*if (m.get("fecha").toString().equals("undefined")) {
             ps.setString(3, null);
             } else {
             ps.setString(3, m.get("fecha").toString());
             }*/
            ps.setInt(3, Integer.parseInt(m.get("usuario").toString()));
            ps.setString(4, m.get("lugar").toString());
            ps.setInt(5, 0);
            ps.setString(6, m.get("estado").toString());
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al agregar Grupo " + e);
            p = false;
        }
        return p;
    }

    @Override
    public boolean edit(Object o) {
        boolean p = false;
        sql = "UPDATE grupo SET NOMBRE=? WHERE idGRUPO=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("nombre").toString());
            ps.setInt(2, Integer.parseInt(m.get("id").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al editar Iglesia " + e);
            p = false;
        }
        return p;
    }

    @Override
    public boolean delete(Object o) {
        boolean p = false;
        sql = "DELETE FROM grupo WHERE idGRUPO=?";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(o.toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar GRUPO " + e);
            p = false;
        }
        return p;
    }

    public boolean desactivar(int id) {
        sql = "UPDATE grupo SET ESTADO='0' WHERE idGRUPO=" + id;
        boolean p = false;
        try {
            cn = Conexion.getConexion();
            st = cn.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al desactivar GRUPO" + e);
        }
        return p;
    }

    public boolean activar(int id) {
        sql = "UPDATE grupo SET ESTADO='1' WHERE idGRUPO=" + id;
        boolean p = false;
        try {
            cn = Conexion.getConexion();
            st = cn.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al activar GRUPO" + e);
        }
        return p;
    }

    public ArrayList<Map<String, ?>> lista(int id) {
        sql = "{CALL get_grupo(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("id", rs.getInt("idGRUPO"));
                d.put("idescuela", rs.getInt("idESCUELA"));
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("fecha", rs.getString("FE_CREACION"));
                d.put("lugar", rs.getString("LUG_REUNION"));
                d.put("idlider", rs.getInt("idLider"));
                d.put("estado", rs.getString("ESTADO"));
                d.put("lider", rs.getString("NOMBRES")+" "+rs.getString("APELLIDOS"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar GRUPO" + e);
            return null;
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> listaun(int id) {
        sql = "SELECT * FROM grupo WHERE idGRUPO=" + id;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("id", rs.getInt("idGRUPO"));
                d.put("idescuela", rs.getInt("idESCUELA"));
                d.put("nombre", rs.getString("NOMBRE"));
                d.put("fecha", rs.getString("FE_CREACION"));
                d.put("usuario", rs.getString("US_CREADOR"));
                d.put("lugar", rs.getString("LUG_REUNION"));
                d.put("idlider", rs.getInt("idLider"));
                d.put("estado", rs.getString("ESTADO"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Grupo " + e);
            return null;
        }
        return lista;
    }

}
