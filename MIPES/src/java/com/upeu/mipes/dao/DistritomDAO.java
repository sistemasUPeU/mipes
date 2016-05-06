/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.DistritomDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author jevar
 */
public class DistritomDAO implements CrudInterface<DistritomDTO> {

    private Connection conn;
    private Statement st;
    private ResultSet rs;
    private String sql;

    @Override
    public boolean agregar(DistritomDTO e) {
        
        sql="INSERT INTO  distritom(idDISTRITOM,NOMBRE,ESTADO) VALUES ("+e.getIdDistritom()+",'"+e.getNombre()+"','"+e.getEstado()+"')";
        boolean p = false;
        try {
            conn = Conexion.getConexion();
            st = conn.createStatement();
            int a = st.executeUpdate(sql);                  
            if(a>0){
                p=true;
            }                
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error Registrar Distrito: "+e);
        }
        return p;        
    }

    @Override
    public boolean editar(DistritomDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<DistritomDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public DistritomDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
