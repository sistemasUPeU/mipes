/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.EscuelaDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
public class EscuelaDAO implements CrudInterface<EscuelaDTO> {
    
    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private Statement st;
    
    
    @Override
    public boolean agregar(EscuelaDTO u) {
        sql = "INSERT INTO escuela (idESCUELA,idDISTRITOM,NOMBRE,ESTADO) VALUES ("+u.getIdEscuela()+","+u.getIdDistritoM()+",'"+u.getNombre()+"','"+u.getEstado()+"')";
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception ex) {
            System.out.println("Error Registrar Escuela Sabática: " + u);
        }
        return p;

    }

    @Override
    public boolean editar(EscuelaDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<EscuelaDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EscuelaDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
