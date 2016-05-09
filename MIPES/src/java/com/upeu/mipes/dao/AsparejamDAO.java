/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.AsparejamDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author jevar
 */
public class AsparejamDAO implements CrudInterface<AsparejamDTO> {

    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;

    @Override
    public boolean agregar(AsparejamDTO p) {
        sql = "INSERT INTO ASPAREJAM (idUSUARIO, idPAREJAM, FECHA, LUGAR) VALUES(null,?,?,?)";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, p.getIdAsparejam());
            ps.setInt(2, p.getIdParejam());
            ps.setString(3, p.getFecha());
            ps.setString(4, p.getLugar());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al insertar AsParejam " + e);
            return false;
        }
    }

    @Override
    public boolean editar(AsparejamDTO p) {
        sql = "UPDATE TABLE ASPAREJAM SET idPAREJAM=?, FECHA=?, LUGAR=? WHERE idASPAREJAM=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, p.getIdParejam());
            ps.setString(2, p.getFecha());
            ps.setString(3, p.getLugar());
            ps.setInt(4, p.getIdAsparejam());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al editar AsParejam " + e);
            return false;
        }

    }

    @Override
    public boolean eliminar(Object key) {
        sql="DELETE FROM ASPAREJAM WHERE idASPAREJAM=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al eliminar AsParejam "+e);
            return false;
        }
    }

    @Override
    public ArrayList<AsparejamDTO> listar() {
        ArrayList<AsparejamDTO> list= new ArrayList<>();
        sql="SELECT * FROM ASPAREJAM";
        try {
            rs=cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {                
                AsparejamDTO u= new AsparejamDTO();
                u.setIdAsparejam(rs.getInt("idASPAREJAM"));
                u.setIdParejam(rs.getInt("idPAREJAM"));
                u.setFecha(rs.getString("FECHA"));
                u.setLugar(rs.getString("LUGAR"));
                list.add(u);
            }
            cn.close();            
        } catch (Exception e) {
            System.out.println("Error al listar AsParejam "+e);
            return null;
        }
        return list;
    }

    @Override
    public AsparejamDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
