/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.MinisterioDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
public class MinisterioDAO implements CrudInterface<MinisterioDTO> {

    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private Statement st;

    @Override
    public boolean agregar(MinisterioDTO u) {
        sql = "INSERT INTO ministerio (idMINISTERIO,idDISTRITOM,NOMBRE,DESCRIPCION,ESTADO) VALUES (" + u.getIdMinisterio() + "," + u.getIdDistritoM() + ",'" + u.getNombre() + "','" + u.getDescripcion() + "','"+u.getEstado()+"')";
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error Registrar Escuela Sabática: " + e);
        }
        return p;
    }

    @Override
    public boolean editar(MinisterioDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<MinisterioDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public MinisterioDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ResultSet listar_Ministerios() {
        Conexion cx = new Conexion();
        String consulta = "SELECT * FROM ministerio order by NOMBRE";
        System.out.println(consulta);
        ResultSet rst = cx.RecibirDatos(consulta);
        return rst;
    }
}
