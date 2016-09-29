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
 * @author Leandro
 */
public class AsistenciaMiDAO implements CrudInterface {

    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;

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

    public ArrayList<Map<String, ?>> listar(int idMinisterio) {
        sql = "{CALL list_asistenciami(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idMinisterio);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("persona", rs.getInt("IDPERSONA"));
                m.put("idmiembromi", rs.getInt("IDMIEMBROMI"));
                m.put("nombres", rs.getString("NOMBRES"));
                m.put("apellidos", rs.getString("APELLIDOS"));
                m.put("porcentaje", rs.getInt("PORCENTAJE"));
                m.put("dni", rs.getString("DNI"));
                m.put("celular", rs.getString("TELEFONO"));
                m.put("fecha",rs.getString("FE_NACIMIENTO"));
                lista.add(m);
            }
        } catch (Exception e) {
            System.out.println("Error al listar Miembros de Ministerio " + e);
            return null;
        }
        return lista;
    }

    public int regAsistenciaMin(Object o) {
        sql = "{CALL reg_asistencia_min(?,?,?,?,?,?)}";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, Integer.parseInt(m.get("idministerio").toString()));
            cs.setString(2, m.get("lugar").toString());
            cs.setString(3, m.get("descripcion").toString());
            cs.setInt(4, Integer.parseInt(m.get("presentes").toString()));
            cs.setInt(5, Integer.parseInt(m.get("faltas").toString()));
            cs.setInt(6, Integer.parseInt(m.get("beneficiarios").toString()));
            rs = cs.executeQuery();
            while (rs.next()) {
                return rs.getInt("idASISTENCIAMI");
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            return -1;
        }
        return -1;
    }

    public boolean regAsistenciaIntegrante(Object o) {
        sql = "{CALL reg_asistencia_int_min(?, ?, ?)}";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, Integer.parseInt(m.get("idmiembromi").toString()));
            cs.setInt(2, Integer.parseInt(m.get("idasistenciami").toString()));
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
    
    public boolean puedeRegistrar(int idMinisterio) {
        sql = "{CALL isenable_as_mi(?)}";
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idMinisterio);
            rs = cs.executeQuery();
            while (rs.next()) {
                if (rs.getInt("RESULT")>0) {
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
        sql = "SELECT * FROM asistenciami WHERE FECHA BETWEEN '" + fechai + "' AND '" + fechaf + "' AND idMINISTERIO=" + id;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("id", rs.getInt("idASISTENCIAMI"));
                d.put("idgrupo", rs.getInt("idMINISTERIO"));
                d.put("fecha", rs.getString("FECHA"));
                d.put("lugar", rs.getString("LUGAR"));
                d.put("descripcion", rs.getString("DESCRIPCION"));
                d.put("presentes", rs.getInt("PRESENTES"));
                d.put("faltas", rs.getInt("FALTAS"));
                d.put("beneficiarios", rs.getInt("BENEFICIARIOS"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Asistencias al Trabajo Misionero " + e);
            return null;
        }
        return lista;
    }
    
    public ArrayList<Map<String, ?>> listaASISTENCIASIG(String fechai, String fechaf, int id) {
        sql = "{CALL get_datosasisminig(?,?,?)}";
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
                d.put("ministerio", rs.getString("NOMBRE"));
                d.put("idministerio", rs.getInt("idMINISTERIO"));                
                d.put("presentes", rs.getInt("PRESENTES"));
                d.put("faltas", rs.getInt("FALTAS"));
                d.put("asistencias", rs.getInt("ASISTENCIAS"));
                d.put("total", rs.getInt("TOTAL"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Asistencias al ministerio por Iglesia " + e);
            return null;
        }
        return lista;
    }
    
    public ArrayList<Map<String, ?>> listaASISTENCIASDIS(String fechai, String fechaf, int id) {
        sql = "{CALL get_datosasisdis(?,?,?)}";
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