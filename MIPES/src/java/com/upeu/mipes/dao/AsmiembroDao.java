/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.AsmiembroDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author jevar
 */
public class AsmiembroDao implements CrudInterface<AsmiembroDTO>{

    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    
    @Override
    public boolean agregar(AsmiembroDTO m) {
        sql = "INSERT INTO ASMIEMBRO (idASMIEMBRO, idINTEGRANTE, FECHA, ESTUDIOB, ESTADO) VALUES(null,?,?,?,?)";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, m.getIdAsmiembro());
            ps.setInt(2, m.getIdIntegrante());
            ps.setString(3, m.getFecha());
            ps.setInt(4, m.getEstudioB());
            ps.setString(5, m.getEstado());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al agregar AsMiembro " + e);
            return false;
        }
    }

    @Override
    public boolean editar(AsmiembroDTO m) {
        sql = "UPDATE TABLE ASMIEMBRO SET idASMIEMBRO=?, idINTEGRANTE=?, FECHA=?, ESTUDIOB=?, ESTADO=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, m.getIdAsmiembro());
            ps.setInt(2, m.getIdIntegrante());
            ps.setString(3, m.getFecha());
            ps.setInt(4, m.getEstudioB());
            ps.setString(5, m.getEstado());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al editar AsMiembro " + e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql = "DELETE FROM ASMIEMBRO WHERE idASMIEMBRO=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al eliminar AsMiembro " + e);
            return false;
        }
    }

    @Override
    public ArrayList<AsmiembroDTO> listar() {
        ArrayList<AsmiembroDTO> list = new ArrayList<>();
        sql = "SELECT * FROM USUARIO";
        try {
            rs = cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {
                AsmiembroDTO u = new AsmiembroDTO();
                u.setIdAsmiembro(rs.getInt("idASMIEMBRO"));
                u.setIdIntegrante(rs.getInt("idINTEGRANTE"));
                u.setFecha(rs.getString("FECHA"));
                u.setEstudioB(rs.getInt("ESTUDIOB"));
                u.setEstado(rs.getString("ESTADO"));
                list.add(u);
            }
            cn.close();
        } catch (Exception e) {
            System.out.println("Error al listar AsMiembro " + e);
            return null;
        }
        return list;
    }

    @Override
    public AsmiembroDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
