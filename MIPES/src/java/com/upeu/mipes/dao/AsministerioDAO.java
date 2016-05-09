/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.AsministerioDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author jevar
 */
public class AsministerioDAO implements CrudInterface<AsministerioDTO>{
    
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;

    @Override
    public boolean agregar(AsministerioDTO m) {
        sql = "INSERT INTO ASMINISTERIO (idASMINISTERIO, idMINISTERIO, FECHA, PRESENTES, FALTAS, VISITAS) VALUES(null,?,?,?,?,?)";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, m.getIdAsministerio());
            ps.setInt(2, m.getIdMinisterio());
            ps.setString(3, m.getFecha());
            ps.setInt(4, m.getPresentes());
            ps.setInt(5, m.getFaltas());
            ps.setInt(6, m.getVisitas());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al agregar AsMinisterio " + e);
            return false;
        }
    }

    @Override
    public boolean editar(AsministerioDTO m) {
        sql = "UPDATE TABLE ASMINISTERIO SET idMINISTERIO=?, FECHA=?, PRESENTES=?, FALTAS=?, VISITAS=? WHERE idASMINISTERIO=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, m.getIdMinisterio());
            ps.setString(2, m.getFecha());
            ps.setInt(3, m.getPresentes());
            ps.setInt(4, m.getFaltas());
            ps.setInt(5, m.getVisitas());
            ps.setInt(6, m.getIdAsministerio());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al editar AsMinisterio " + e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql = "DELETE FROM ASMINISTERIO WHERE idASMINISTERIO=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al eliminar AsMinisterio " + e);
            return false;
        }
    }

    @Override
    public ArrayList<AsministerioDTO> listar() {
        ArrayList<AsministerioDTO> list = new ArrayList<>();
        sql = "SELECT * FROM ASMINISTERIO";
        try {
            rs = cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {
                AsministerioDTO u = new AsministerioDTO();
                u.setIdAsministerio(rs.getInt("idASMINISTERIO"));
                u.setIdMinisterio(rs.getInt("idMINISTERIO"));
                u.setFecha(rs.getString("FECHA"));
                u.setPresentes(rs.getInt("PRESENTES"));
                u.setFaltas(rs.getInt("FALTAS"));
                u.setVisitas(rs.getInt("VISITAS"));
                list.add(u);
            }
            cn.close();
        } catch (Exception e) {
            System.out.println("Error al listar AsMinisterio " + e);
            return null;
        }
        return list;
    }

    @Override
    public AsministerioDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
