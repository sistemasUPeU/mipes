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
            ps.setInt(5, m.getVisitas());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al agregar AsMinisterio " + e);
            return false;
        }
    }

    @Override
    public boolean editar(AsministerioDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<AsministerioDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AsministerioDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
