/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.dto.ParejamDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
public class ParejamDAO implements CrudInterface<ParejamDTO>{

    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    
    
    @Override
    //PREGUNTAR POR ESTE METODO
    public boolean agregar(ParejamDTO u) {
    sql="INSERT INTO USUARIO (idUSUARIO, USUARIO, CLAVE, ESTADO) VALUES(null,?,?,?)";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, u.getIdIntegrante1());
            ps.setInt(2, u.getIdIntegrante2());
            ps.setString(3, u.getEstado());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (Exception e) {
            System.out.println("Error al insertar Pareja Misionera "+e);
            return false;
        }
    }

    @Override
    public boolean editar(ParejamDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<ParejamDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ParejamDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
