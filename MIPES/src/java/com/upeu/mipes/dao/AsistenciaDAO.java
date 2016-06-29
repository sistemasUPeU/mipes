/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.CargoDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
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
public class AsistenciaDAO {

    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;

    //Asistencia Integrante GP
    public ArrayList<Map<String, ?>> listaIntegranteGPEnable(Object idGrupo) {
        sql = "{CALL LIST_ASISTENCIA(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cx = Conexion.getConexion();
            cs = cx.prepareCall(sql);
            cs.setInt(1, Integer.parseInt(idGrupo.toString()));
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("idintgp", rs.getInt("IDDET_INT_GP"));
                m.put("idGrupo", rs.getInt("idGrupo"));
                m.put("idPERSONA", rs.getInt("idPERSONA"));
                m.put("NOMBRES", rs.getString("NOMBRES"));
                m.put("APELLIDOS", rs.getString("APELLIDOS"));
                m.put("CUMPLE", rs.getDate("CUMPLEANIOS"));
                m.put("PORCENTAJE", rs.getDouble("PORCENTAJE"));
                lista.add(m);
            }
            //cx.close();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return lista;
    }

    public int regAsistenciaGP(int idGp, int presentes, int visitas, int faltas, String lugar) {
        int idas = 0;
        sql = "{CALL REG_ASISTENCIA_GP(?, ?, ?, ? ,?)}";
        try {
            cx = Conexion.getConexion();
            cs = cx.prepareCall(sql);
            cs.setInt(1, idGp);
            cs.setInt(2, presentes);
            cs.setInt(3, visitas);
            cs.setInt(4, faltas);
            cs.setString(5, lugar);
            rs = cs.executeQuery();
            while (rs.next()) {
                idas = rs.getInt("IDASGP");
            }
            System.out.println("idasist "+idas);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return idas;
    }

    public int regAsistenciaIntegrante(int idIntegrante, int idAsistencia, String asistencia) {
        int idas = 0;
        sql = "{CALL REG_ASISTENCIA_INT(?, ?, ?)}";
        try {
            cx = Conexion.getConexion();
            cs = cx.prepareCall(sql);
            cs.setInt(1, idIntegrante);
            cs.setInt(2, idAsistencia);
            cs.setString(3, asistencia);
            idas= cs.executeUpdate();
            System.out.println(idas);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        return idas;
    }

    public ArrayList<Map<String, ?>> listaIntegranteGPAll() {
        sql = "SELECT * FROM VINTEGRANTE";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cx = Conexion.getConexion();
            ps = cx.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("idintegrantegp", rs.getInt("idintegrantegp"));
                m.put("idGrupo", rs.getInt("idGrupo"));
                m.put("nombre", rs.getString("nombre"));
                m.put("nomcargo", rs.getString("nomcargo"));
                m.put("idPERSONA", rs.getInt("idPERSONA"));
                m.put("idCARGO", rs.getInt("idCARGO"));
                m.put("NOMBRES", rs.getString("NOMBRES"));
                m.put("APELLIDOS", rs.getString("APELLIDOS"));
                m.put("DIRECCION", rs.getString("DIRECCION"));
                m.put("EMAIL", rs.getString("EMAIL"));
                m.put("TELEFONO", rs.getString("TELEFONO"));
                m.put("FE_NACIMIENTO", rs.getDate("FE_NACIMIENTO"));
                m.put("FE_BAUTIZMO", rs.getDate("FE_BAUTIZMO"));
                m.put("SEXO", rs.getString("SEXO"));
                m.put("DNI", rs.getString("DNI"));
                m.put("OCUPACION", rs.getString("OCUPACION"));
                lista.add(m);
            }
            cx.close();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return lista;
    }

}
