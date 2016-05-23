/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.IntegranteDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
public class IntegranteDAO implements CrudInterface<IntegranteDTO>{
    
    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private Statement st;

    @Override
    public boolean agregar(IntegranteDTO in) {
        sql = "INSERT INTO integrante (idINTEGRANTE,idGRUPO,idCARGO,idMINISTERIO,NOMBRES,APELLIDOS,DIRECCION,EMAIL,TELEFONO,FECHA_NACIMIENTO,FECHA_BAUTIZO,ESTADO) VALUES ("+in.getIdIntegrante()+","+in.getIdGrupo()+",'"+in.getIdCargo()+"','"+in.getIdMinisterio()+"','"+in.getNombre()+"','"+in.getApellidos()+"','"+in.getDireccion()+"','"+in.getEmail()+"','"+in.getTelefono()+"','"+in.getFecha_nacimiento()+"','"+in.getFecha_bautizmo()+"','"+in.getEstado()+"')";
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception ex) {
            System.out.println("Error Registrar Integrante: " + ex);
        }
        return p;
    }

    @Override
    public boolean editar(IntegranteDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<IntegranteDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public IntegranteDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
