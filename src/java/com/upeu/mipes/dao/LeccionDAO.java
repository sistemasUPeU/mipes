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
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Andres
 */
public class LeccionDAO implements CrudInterface {

    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        sql="SELECT * FROM LECCION";
        try {
            cn=Conexion.getConexion();
            ps=cn.prepareStatement(sql);
            rs=ps.executeQuery();
            return JDBCTools.queryToMap(rs);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean add(Object o) {
        sql="INSERT INTO LECCION (idLECCION, idTIPOLECCION, NOMBRE, ESTADO) VALUES(NULL,?,?,?)";
        Map<String, Object> m=(Map<String, Object>) o;
        try {
            cn=Conexion.getConexion();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idtipoleccion").toString()));
            ps.setString(2, m.get("nombre").toString());
            ps.setString(3, m.get("estado").toString());
            return ps.executeUpdate()>0;
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean edit(Object o) {
        sql="UPDATE LECCION SET idTIPOLECCION=?, NOMBRE=?, ESTADO=? WHERE idLECCION=?";
        Map<String, Object> m=(Map<String, Object>) o;
        try {
            cn=Conexion.getConexion();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idtipoleccion").toString()));
            ps.setString(2, m.get("nombre").toString());
            ps.setString(3, m.get("estado").toString());
            ps.setInt(4, Integer.parseInt(m.get("idleccion").toString()));
            return ps.executeUpdate()>0;
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Object o) {
        sql="DELETE FROM LECCION WHERE idLECCION=?";
        try {
            cn=Conexion.getConexion();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(o.toString()));
            return ps.executeUpdate()>0;
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public ArrayList<Map<String, ?>> listar(int idt,int idd) {
        sql="{CALL GET_LECCION_DISCIPULO(?,?)}";
        try {
            cn=Conexion.getConexion();
            cs=cn.prepareCall(sql);
            cs.setInt(1, idt);
            cs.setInt(2, idd);
            rs=cs.executeQuery();
            return JDBCTools.queryToMap(rs);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList<Map<String, ?>> listarTipo() {
        sql="SELECT * FROM TIPOLECCION";
        try {
            cn=Conexion.getConexion();
            ps=cn.prepareStatement(sql);
            rs=ps.executeQuery();
            return JDBCTools.queryToMap(rs);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList<Map<String, ?>> listarTipo(int iddiscipulado) {
        sql="{CALL GET_TIPO_LECCION_DISCIPULO(?)}";
        try {
            cn=Conexion.getConexion();
            cs=cn.prepareCall(sql);
            cs.setInt(1, iddiscipulado);
            rs=cs.executeQuery();
            return JDBCTools.queryToMap(rs);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public int addTipo(Object o) {
        sql="{CALL ADD_TIPOLECCION(?,?)}";
        Map<String, Object> m=(Map<String, Object>) o;
        try {
            cn=Conexion.getConexion();
            cs=cn.prepareCall(sql);
            cs.setString(1, m.get("nombre").toString());
            cs.setString(2, m.get("estado").toString());
            return Integer.parseInt(JDBCTools.queryToMap(cs.executeQuery()).get(0).get("idtipoleccion").toString());
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return -1;
        }
    }
    
    public boolean asignarLeccion(int idLeccion, int idDiscipulo) {
        sql="INSERT INTO DETLECCION (idTIPOLECCION, idDISCIPULADO, ESTADO) VALUES(?,?,'1')";
        try {
            cn=Conexion.getConexion();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, idLeccion);
            ps.setInt(2, idDiscipulo);
            return ps.executeUpdate()>0;
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean regLeccion(int idLeccion, int idDiscipulo, int idd) {
        sql="INSERT INTO TRABMISIONERO (idTRABMISIONERO, idLECCION, idDISCIPULADO, idDISCIPULADOR, FECHA) VALUES("
                + "NULL, ?,?,?,NOW());";
        try {
            cn=Conexion.getConexion();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, idLeccion);
            ps.setInt(2, idDiscipulo);
            ps.setInt(3, idd);
            return ps.executeUpdate()>0;
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

}
