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
 * @author USER
 */
public class MiembroMiDAO implements CrudInterface {

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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean edit(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean AddIntg(int Per, int MIN) {
        sql = "INSERT INTO miembromi (idPERSONA,idMINISTERIO,FE_UNION,ESTADO) VALUES (" + Per + "," + MIN + ",(SELECT SYSDATE()),1)";
        boolean p = false;
        try {

            st = Conexion.getConexion().createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Anexar Integrante al Ministerio " + e);
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public ArrayList<Map<String, ?>> EstIntGP(int Per) {
        sql = "SELECT * FROM miembromi WHERE IDPERSONA= " + Per + " AND ESTADO=1";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("idPersona", rs.getInt("idPERSONA"));
                p.put("idRegistro", rs.getInt("idMIEMBROMI"));
                p.put("idMinisterio", rs.getInt("idMinisterio"));
                p.put("fecha", rs.getString("FE_UNION"));
                p.put("estado", rs.getString("ESTADO"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Miembros Ministerio " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> lista(int idMin) {
        sql = "SELECT P.IDPERSONA,P.NOMBRES,P.APELLIDOS,P.DNI,P.TELEFONO,P.CORREO,M.IDMIEMBROMI,M.idMINISTERIO,M.ESTADO FROM persona P,miembromi M WHERE M.IDPERSONA=P.IDPERSONA AND M.IDMINISTERIO=" + idMin + " AND M.ESTADO=1;";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("idPersona", rs.getInt("idPERSONA"));
                p.put("nombres", rs.getString("NOMBRES"));
                p.put("apellidos", rs.getString("APELLIDOS"));
                p.put("dni", rs.getString("DNI"));
                p.put("telefono", rs.getString("TELEFONO"));
                p.put("correo", rs.getString("CORREO"));
                p.put("idRegistro", rs.getInt("idMIEMBROMI"));
                p.put("idMinisterio", rs.getInt("idMINISTERIO"));
                p.put("estado", rs.getString("ESTADO"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Integrantes del Ministerio " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public boolean desvincular(int id) {
        sql = "UPDATE miembromi SET ESTADO='0' WHERE idMIEMBROMI=" + id;
        boolean p = false;
        try {
            st = Conexion.getConexion().createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al desvincular persona del ministerio " + e);
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public ArrayList<Map<String, ?>> listaIG(int idIG) {
        sql = "SELECT DISTINCT(MN.NOMBRE) MINISTERIO,COUNT(M.IDMIEMBROMI) MIEMBROS "
                + " FROM miembromi M,ministerio MN,iglesia I "
                + " WHERE MN.IDIGLESIA=I.IDIGLESIA "
                + " AND I.IDIGLESIA=" + idIG
                + " AND M.ESTADO=1 "
                + " GROUP BY MN.IDMINISTERIO;";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("ministerio", rs.getString("MINISTERIO"));
                p.put("miembros", rs.getInt("MIEMBROS"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Integrantes del Ministerio por Iglesia " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> listaDis(int idDis) {
        sql = "SELECT DISTINCT(I.NOMBRE) IGLESIA,COUNT(M.IDMIEMBROMI) MIEMBROS "
                + " FROM miembromi M,ministerio MN,iglesia I,distrito D "
                + " WHERE MN.IDIGLESIA=I.IDIGLESIA "
                + " AND D.IDDISTRITO=I.IDDISTRITO "
                + " AND D.IDDISTRITO=" + idDis
                + " AND M.ESTADO=1 "
                + " GROUP BY I.IDIGLESIA;";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("iglesia", rs.getString("IGLESIA"));
                p.put("miembros", rs.getInt("MIEMBROS"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Integrantes del Ministerio por Distrito " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }
}
