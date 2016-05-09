/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.CargoDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author jevar
 */
public class CargoDAO implements CrudInterface<CargoDTO>{
    
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;

    @Override
    public boolean agregar(CargoDTO c) {
        sql="INSERT INTO CARGO (idCARGO, NOMBRE, ESTADO) VALUES(null,?,?)";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, c.getIdCargo());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getEstado());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al agregar Cargo "+e);
            return false;
        }
    }

    @Override
    public boolean editar(CargoDTO c) {
        sql="UPDATE TABLE CARGO SET  NOMBRE=?, ESTADO=? WHERE idCARGO=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getEstado());
            ps.setInt(3, c.getIdCargo());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al editar Cargo "+e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql="DELETE FROM CARGO WHERE idCARGO=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al eliminar Cargo "+e);
            return false;
        }
    }

    @Override
    public ArrayList<CargoDTO> listar() {
        ArrayList<CargoDTO> list= new ArrayList<>();
        sql="SELECT * FROM CARGO";
        try {
            rs=cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {                
                CargoDTO u= new CargoDTO();
                u.setIdCargo(rs.getInt("idCARGO"));
                u.setNombre(rs.getString("NOMBRE"));
                u.setEstado(rs.getString("ESTADO"));
                list.add(u);
            }
            cn.close();            
        } catch (Exception e) {
            System.out.println("Error al listar Cargo "+e);
            return null;
        }
        return list;
    }

    @Override
    public CargoDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
