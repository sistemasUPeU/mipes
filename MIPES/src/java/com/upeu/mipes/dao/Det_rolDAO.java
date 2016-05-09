/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.Det_rolDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author jevar
 */
public class Det_rolDAO implements CrudInterface<Det_rolDTO>{

    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    
    @Override
    public boolean agregar(Det_rolDTO d) {
        sql="INSERT INTO DET_ROL (idROL, idUSUARIO) VALUES(null,?)";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, d.getIdRol());
            ps.setInt(2, d.getIdUsuario());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al agregar Det_Rol "+e);
            return false;
        }
    }

    @Override
    public boolean editar(Det_rolDTO d) {
        sql="UPDATE TABLE DET_ROL SET idUSUARIO=? WHERE idROL=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, d.getIdUsuario());
            ps.setInt(2, d.getIdRol());
             int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al editar Det_Rol "+e);
            return false;
    }
    }
    
    @Override
    public boolean eliminar(Object key) {
        sql="DELETE FROM DET_ROL WHERE idROL=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al eliminar Det_Rol "+e);
            return false;
        }
    }

    @Override
    public ArrayList<Det_rolDTO> listar() {
        ArrayList<Det_rolDTO> list= new ArrayList<>();
        sql="SELECT * FROM DET_ROL";
        try {
            rs=cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {                
                Det_rolDTO d= new Det_rolDTO();
                d.setIdRol(rs.getInt("idROL"));
                d.setIdUsuario(rs.getInt("idUSUARIO"));
                list.add(d);
            }
            cn.close();            
        } catch (Exception e) {
            System.out.println("Error al listar Det_ROL "+e);
            return null;
        }
        return list;
    }

    @Override
    public Det_rolDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
