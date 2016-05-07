/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.RolDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
public class RolDAO implements CrudInterface<RolDTO>{

    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    
    
    @Override
    public boolean agregar(RolDTO l) {
        sql="INSERT INTO ROL (idROL, NOMBRE, ESTADO) VALUES(null,?,?)";
        try {
            ps=cn.prepareStatement(sql);
            ps.setString(1, l.getNombre());
            ps.setString(2, l.getEstado());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al insertar Rol "+e);
            return false;
        }
    }

    @Override
    public boolean editar(RolDTO l) {
        sql="UPDATE TABLE USUARIO SET NOMBRE=?, ESTADO=? WHERE idROL=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setString(1, l.getNombre());
            ps.setString(2, l.getEstado());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al editar Rol "+e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql="DELETE FROM USUARIO WHERE idROL=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al eliminar Rol "+e);
            return false;
        }
    }

    @Override
    public ArrayList<RolDTO> listar() {
        ArrayList<RolDTO> list= new ArrayList<>();
        sql="SELECT * FROM ROL";
        try {
            rs=cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {                
                RolDTO u= new RolDTO();
                u.setIdRol(rs.getInt("idRol"));
                u.setNombre(rs.getString("NOMBRE"));
                u.setEstado(rs.getString("ESTADO"));
                list.add(u);
            }
            cn.close();            
        } catch (Exception e) {
            System.out.println("Error al listar Rol "+e);
            return null;
        }
        return list;
    }

    @Override
    public RolDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
