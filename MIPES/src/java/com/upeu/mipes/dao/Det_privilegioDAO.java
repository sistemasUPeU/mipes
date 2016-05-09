/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.Det_privilegioDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author jevar
 */
public class Det_privilegioDAO implements CrudInterface<Det_privilegioDTO>{
    
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;

    @Override
    public boolean agregar(Det_privilegioDTO p) {
        sql="INSERT INTO DET_PRIVILEGIO (idPRIVILEGIO, idROL) VALUES(null,?)";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, p.getIdPrivilegio());
            ps.setInt(2, p.getIdRol());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al insertar Det_Privilegio "+e);
            return false;
        }
    }

    @Override
    public boolean editar(Det_privilegioDTO p) {
        sql="UPDATE TABLE DET_PRIVILEGIO SET idROL=? WHERE idPRIVILEGIO=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, p.getIdRol());
            ps.setInt(2, p.getIdPrivilegio());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al editar Det_Privilegio "+e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql="DELETE FROM DET_PRIVILEGIO WHERE idPRIVILEGIO=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al eliminar Det_Privilegio "+e);
            return false;
        }
    }

    @Override
    public ArrayList<Det_privilegioDTO> listar() {
        ArrayList<Det_privilegioDTO> list= new ArrayList<>();
        sql="SELECT * FROM DET_PRIVILEGIO";
        try {
            rs=cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {                
                Det_privilegioDTO u= new Det_privilegioDTO();
                u.setIdPrivilegio(rs.getInt("idPRIVILEGIO"));
                u.setIdRol(rs.getInt("ROL"));
                list.add(u);
            }
            cn.close();            
        } catch (Exception e) {
            System.out.println("Error al listar Det_Privilegio "+e);
            return null;
        }
        return list;
    }

    @Override
    public Det_privilegioDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
