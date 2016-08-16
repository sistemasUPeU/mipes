/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.config.JDBCTools;
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
 * @author Andres
 */
public class DiscipuladorDAO implements CrudInterface {

    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        sql = "SELECT P.NOMBRES, P.APELLIDOS, D.* FROM PERSONA P, DISCIPULADOR D, MIEMBROGP M"
                + " WHERE P.IDPERSONA=M.IDPERSONA AND D.IDMIEMBROGP=M.IDMIEMBROGP;";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            return JDBCTools.queryToMap(rs);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean add(Object o) {
        sql = "INSERT INTO DISCIPULADOR (idDISCIPULADOR, idMIEMBROGP, idASOCIADO, FE_INICIO, ESTADO) VALUES(NULL,?,?,NOW(),'1');";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idmiembrogp").toString()));
            ps.setInt(2, Integer.parseInt(m.get("idasociado").toString()));
            return ps.executeUpdate() > 0;
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean edit(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Object o) {
        sql = "{CALL DEL_DISCIPULADOR(?)}";
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, Integer.parseInt(o.toString()));
            rs=cs.executeQuery();
            while (rs.next()) {                
                return rs.getInt("RESULT")>0;
            }
            return false;
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<Map<String, ?>> listar(int idGrupo) {
        sql = "{CALL GET_DISCIPULADOR_GP(?)}";
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idGrupo);
            rs = cs.executeQuery();
            return JDBCTools.queryToMap(rs);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean addDiscipulo(int idPersona, int idDiscipulador, String tipo) {
        sql = "{CALL ADD_DISCIPULO(?,?,?)}";
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idPersona);
            cs.setInt(2, idDiscipulador);
            cs.setString(3, tipo);
            cs.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean addAsociado(int idDiscipulador, int idMiembro) {
        sql = "{CALL ADD_ASOCIADO(?,?)}";
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idDiscipulador);
            cs.setInt(2, idMiembro);
            cs.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean delDiscipulo(int iddi, int idDiscipulador) {
        sql = "DELETE FROM DETDISCIPULADOR WHERE IDDISCIPULADOR=? AND IDDISCIPULADO=?";
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idDiscipulador);
            cs.setInt(2, iddi);
            return cs.executeUpdate()>0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ArrayList<Map<String, ?>> listDiscipulo(int idDiscipulador) {
        sql = "{CALL GET_DISCIPULO(?)}";
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idDiscipulador);
            rs = cs.executeQuery();
            return JDBCTools.queryToMap(rs);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<Map<String, ?>> getDiscipulador(int iddi) {
        sql = "SELECT P.NOMBRES, P.APELLIDOS, D.*\n"
                + "FROM PERSONA P,DISCIPULADOR D, MIEMBROGP M\n"
                + "WHERE P.IDPERSONA=M.IDPERSONA\n"
                + "AND D.IDMIEMBROGP=M.IDMIEMBROGP AND D.IDDISCIPULADOR="+iddi;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            return JDBCTools.queryToMap(rs);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public int getIdDiscipulador(int idpersona){
        sql = "SELECT IDDISCIPULADOR FROM DISCIPULADOR WHERE IDMIEMBROGP="
                + "(SELECT IDMIEMBROGP FROM MIEMBROGP WHERE IDPERSONA=?)";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idpersona);
            rs = ps.executeQuery();
            while (rs.next()) {                
                return rs.getInt("IDDISCIPULADOR");
            }
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
