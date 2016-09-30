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
 * @author Andrew
 */
public class MiembroGpDAO implements CrudInterface {

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

    public boolean AddIntg(int Per, int GP) {
        sql = "INSERT INTO miembrogp (idPERSONA,idGRUPO,FE_UNION,ESTADO) VALUES (" + Per + "," + GP + ",(SELECT SYSDATE()),1)";
        boolean p = false;
        try {

            st = Conexion.getConexion().createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Anexar Integrante" + e);
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public ArrayList<Map<String, ?>> EstIntGP(int Per) {
        sql = "SELECT M.IDMIEMBROGP,M.IDPERSONA,M.IDGRUPO,M.FE_UNION,M.ESTADO,G.NOMBRE FROM miembrogp M,grupo G WHERE M.IDPERSONA=" + Per + " AND M.IDGRUPO=G.IDGRUPO AND M.ESTADO=1;";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("idRegistro", rs.getInt("idMIEMBROGP"));
                p.put("idPersona", rs.getInt("idPERSONA"));
                p.put("idGrupo", rs.getInt("idGRUPO"));
                p.put("fecha", rs.getString("FE_UNION"));
                p.put("estado", rs.getString("ESTADO"));
                p.put("nomGrupo", rs.getString("NOMBRE"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Miembros de Grupo " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> lista(int idGrupo) {
        sql = "SELECT P.IDPERSONA,P.NOMBRES,P.APELLIDOS,P.DNI,P.TELEFONO,P.CORREO,M.IDMIEMBROGP,M.idGRUPO,M.ESTADO FROM persona P,miembrogp M WHERE M.IDPERSONA=P.IDPERSONA AND M.IDGRUPO=" + idGrupo + " AND M.ESTADO=1;";
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
                p.put("idRegistro", rs.getInt("idMIEMBROGP"));
                p.put("idGrupo", rs.getInt("idGRUPO"));
                p.put("estado", rs.getString("ESTADO"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Integrantes del GP " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public boolean desvincular(int id) {
        sql = "UPDATE miembrogp SET ESTADO='0' WHERE idMIEMBROGP=" + id;
        boolean p = false;
        try {

            st = Conexion.getConexion().createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al desvincular persona de grupo " + e);
        } finally {
            Conexion.cerrar();
        }
        return p;
    }

    public ArrayList<Map<String, ?>> listaES(int idEs) {
        sql = "SELECT DISTINCT(G.NOMBRE) GRUPO,COUNT(M.IDMIEMBROGP) MIEMBROS "
                + " FROM miembrogp M,grupo G,escuela E  "
                + " WHERE M.IDGRUPO=G.IDGRUPO  "
                + " AND G.IDESCUELA=E.IDESCUELA "
                + " AND E.IDESCUELA=" + idEs + " "
                + " AND M.ESTADO=1 "
                + " GROUP BY G.IDGRUPO ";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("grupo", rs.getString("GRUPO"));
                p.put("miembros", rs.getInt("MIEMBROS"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Integrantes del GP por E.S. " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> listaIG(int idIG) {
        sql = "SELECT DISTINCT(E.NOMBRE) ESCUELA,COUNT(M.IDMIEMBROGP) MIEMBROS "
                + " FROM miembrogp M,grupo G,escuela E,iglesia I "
                + " WHERE E.IDIGLESIA=I.IDIGLESIA "
                + " AND M.IDGRUPO=G.IDGRUPO  "
                + " AND G.IDESCUELA=E.IDESCUELA "
                + " AND I.IDIGLESIA=" + idIG + " "
                + " AND M.ESTADO=1 "
                + " GROUP BY E.IDESCUELA";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {

            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("escuela", rs.getString("ESCUELA"));
                p.put("miembros", rs.getInt("MIEMBROS"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Integrantes del GP por Iglesia " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> listaDis(int idDis) {
        sql = "SELECT DISTINCT(I.NOMBRE) IGLESIA,COUNT(M.IDMIEMBROGP) MIEMBROS "
                + " FROM miembrogp M,grupo G,escuela E,iglesia I,distrito D "
                + " WHERE D.IDDISTRITO=I.IDDISTRITO "
                + " AND E.IDIGLESIA=I.IDIGLESIA "
                + " AND M.IDGRUPO=G.IDGRUPO  "
                + " AND G.IDESCUELA=E.IDESCUELA "
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
            System.out.println("Error al Listar Integrantes del GP por Distrito " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }
}
