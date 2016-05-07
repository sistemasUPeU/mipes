/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.PrivilegioDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author USER
 */

public class PrivilegioDAO implements CrudInterface<PrivilegioDTO>{

    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    
    
    @Override
    public boolean agregar(PrivilegioDTO u) {
        sql="INSERT INTO USUARIO (idPRIVILEGIO, NOMBRE, ESTADO) VALUES(null,?,?)";
        try {
            ps=cn.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getEstado());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al insertar Privilegio "+e);
            return false;
        }
    }

    @Override
    public boolean editar(PrivilegioDTO u) {
        sql="UPDATE TABLE USUARIO SET NOMBRE=?, ESTADO=? WHERE idPRIVILEGIO=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getEstado());
            ps.setInt(3, u.getIdPrivilegio());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al editar Privilegio "+e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql="DELETE FROM USUARIO WHERE idPRIVILEGIO=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al eliminar Privilegio "+e);
            return false;
        }
    }

    @Override
    public ArrayList<PrivilegioDTO> listar() {
        ArrayList<PrivilegioDTO> list= new ArrayList<>();
        sql="SELECT * FROM PRIVILEGIO";
        try {
            rs=cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {                
                PrivilegioDTO u= new PrivilegioDTO();
                u.setIdPrivilegio(rs.getInt("idPRIVILEGIO"));
                u.setNombre(rs.getString("NOMBRE"));
                u.setEstado(rs.getString("ESTADO"));
                list.add(u);
            }
            cn.close();            
        } catch (Exception e) {
            System.out.println("Error al listar Privilegio "+e);
            return null;
        }
        return list;
    }

    @Override
    public PrivilegioDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
