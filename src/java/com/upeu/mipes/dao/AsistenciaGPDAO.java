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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Andres
 */
public class AsistenciaGPDAO implements CrudInterface {

    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        throw new UnsupportedOperationException("Not supported yet.");
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

    public ArrayList<Map<String, ?>> listar(int idGrupo) {
        sql = "{CALL LIST_ASISTENCIA(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idGrupo);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("idmiembrogp", rs.getInt("IDMIEMBROGP"));
                m.put("idpersona", rs.getInt("IDPERSONA"));
                m.put("nombres", rs.getString("NOMBRES"));
                m.put("apellidos", rs.getString("APELLIDOS"));
                m.put("porcentaje", rs.getDouble("PORCENTAJE"));
                m.put("dni", rs.getString("DNI"));
                m.put("celular", rs.getString("TELEFONO"));
                m.put("fecha",rs.getString("FE_NACIMIENTO"));
                lista.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public int regAsistenciaGP(Object o) {
        sql = "{CALL REG_ASISTENCIA_GP(?, ?, ?, ?, ?)}";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, Integer.parseInt(m.get("idgrupo").toString()));
            cs.setString(2, m.get("lugar").toString());
            cs.setInt(3, Integer.parseInt(m.get("presentes").toString()));
            cs.setInt(4, Integer.parseInt(m.get("faltas").toString()));
            cs.setInt(5, Integer.parseInt(m.get("visitas").toString()));
            rs = cs.executeQuery();
            while (rs.next()) {
                return rs.getInt("idASISTENCIAGP");
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return -1;
        }
        return -1;
    }

    public boolean regAsistenciaIntegrante(Object o) {
        sql = "{CALL REG_ASISTENCIA_INT_GP(?, ?, ?)}";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, Integer.parseInt(m.get("idmiembrogp").toString()));
            cs.setInt(2, Integer.parseInt(m.get("idasistenciagp").toString()));
            cs.setString(3, m.get("asistencia").toString());
            rs = cs.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean puedeRegistrar(int idGrupo) {
        sql = "{CALL IS_ENABLE_AS_GP(?)}";
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idGrupo);
            rs = cs.executeQuery();
            while (rs.next()) {
                if (rs.getInt("RESULT") > 0) {
                    return true;
                }
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public ArrayList<Map<String, ?>> listaASISTENCIAS(String fechai, String fechaf, int id) {
        sql = "SELECT * FROM ASISTENCIAGP WHERE FECHA BETWEEN '" + fechai + "' AND '" + fechaf + "' AND idGRUPO=" + id;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("id", rs.getInt("idASISTENCIAGP"));
                d.put("idgrupo", rs.getInt("idGRUPO"));
                d.put("fecha", rs.getString("FECHA"));
                d.put("lugar", rs.getString("LUGAR"));
                d.put("presentes", rs.getInt("PRESENTES"));
                d.put("faltas", rs.getInt("FALTAS"));
                d.put("visitas", rs.getInt("VISITAS"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Asistencias" + e);
            return null;
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> listaASISTENCIASES(String fechai, String fechaf, int id) {
        sql = "{CALL GET_DATOSASISES(?,?,?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, id);
            cs.setString(2, fechai);
            cs.setString(3, fechaf);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("grupo", rs.getString("NOMBRE"));
                d.put("idgrupo", rs.getInt("idGRUPO"));                
                d.put("presentes", rs.getInt("PRESENTES"));
                d.put("faltas", rs.getInt("FALTAS"));
                d.put("asistencias", rs.getInt("ASISTENCIAS"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Asistencias por E.S. " + e);
            return null;
        }
        return lista;
    }
    
    public ArrayList<Map<String, ?>> listaASISTENCIASIG(String fechai, String fechaf, int id) {
        sql = "{CALL GET_DATOSASISIG(?,?,?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, id);
            cs.setString(2, fechai);
            cs.setString(3, fechaf);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("escuela", rs.getString("NOMBRE"));
                d.put("idescuela", rs.getInt("idESCUELA"));                
                d.put("presentes", rs.getInt("PRESENTES"));
                d.put("faltas", rs.getInt("FALTAS"));
                d.put("asistencias", rs.getInt("ASISTENCIAS"));
                d.put("total", rs.getInt("TOTAL"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Asistencias por Iglesia " + e);
            return null;
        }
        return lista;
    }
    
    public ArrayList<Map<String, ?>> listaASISTENCIASDIS(String fechai, String fechaf, int id) {
        sql = "{CALL GET_DATOSASISMINDIS(?,?,?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, id);
            cs.setString(2, fechai);
            cs.setString(3, fechaf);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("iglesia", rs.getString("NOMBRE"));
                d.put("idiglesia", rs.getInt("idIGLESIA"));                
                d.put("presentes", rs.getInt("PRESENTES"));
                d.put("faltas", rs.getInt("FALTAS"));
                d.put("asistencias", rs.getInt("ASISTENCIAS"));
                d.put("total", rs.getInt("TOTAL"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Asistencias por Distrito " + e);
            return null;
        }
        return lista;
    }

}
