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
import java.sql.ResultSet;
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
        sql = "INSERT INTO escuela (idESCUELA,idDISTRITOM,NOMBRE,ESTADO,FECHA_CREACION,COLOR,LEMA) VALUES (" + u.getIdEscuela() + "," + u.getIdDistritoM() + ",'" + u.getNombre() + "','" + u.getEstado() + "','"+u.getFecha()+"','"+u.getColor()+"','"+u.getLema()+"')";
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
    public boolean editar(EscuelaDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        sql = "delete from escuela where idESCUELA=" + key;
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Eliminar Escuela Sabatica" + e);
        }
        return p;
    }

    @Override
    public ArrayList<EscuelaDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EscuelaDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean desactivar(int idESC) {
        sql = "update escuela set estado='0' where idESCUELA=" + idESC;
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al desactivar Escuela Sabatica" + e);
        }
        return p;
    }

    public boolean activar(int idESC) {
        sql = "update escuela set estado='1' where idESCUELA=" + idESC;
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al activar Escuela Sabatica" + e);
        }
        return p;
    }
    public ResultSet listar_escuelas(String consulta) {
        Conexion cnn = new Conexion();
        System.out.println(consulta);
        ResultSet rst = cnn.RecibirDatos(consulta);
        return rst;
    }

}
