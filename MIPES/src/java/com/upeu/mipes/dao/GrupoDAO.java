/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.GrupoDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
public class GrupoDAO implements CrudInterface<GrupoDTO> {

    private ResultSet rs;
    private Statement st;
    private PreparedStatement ps;
    private String sql;
    private Connection cnn;

    Conexion cx = new Conexion();
    
    @Override
    public boolean agregar(GrupoDTO gp) {
        sql = "INSERT INTO grupo (idGRUPO,idESCUELA,NOMBRE,LUGAR_REUNION,FECHA_CREACION,ESTADO) values(" + gp.getIdGRUPO() + "," + gp.getIdESCUELA() + ",'" + gp.getNOMBRE() + "','" + gp.getLugar_reunion() + "','" + gp.getFecha_creacion() + "','" + gp.getEstado() + "')";
        boolean m = false;
        try {
            cnn = Conexion.getConexion();
            st = cnn.createStatement();
            int d = st.executeUpdate(sql);
            if (d > 0) {
                m = true;
            }
        } catch (SQLException e) {
            System.out.println("Error al agregar GP" + e);
        }
        return m;
    }

    @Override
    public boolean editar(GrupoDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        sql = "Delete from grupo where idGRUPO=" + key;
        boolean p = false;
        try {
            cnn = Conexion.getConexion();
            st = cnn.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Eliminar GP" + e);
        }
        return p;
    }

    @Override
    public ArrayList<GrupoDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public GrupoDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean desactivar(int idGP) {
        sql = "update grupo set estado='0' where idESCUELA=" + idGP;
        boolean p = false;
        try {
            cnn = Conexion.getConexion();
            st = cnn.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al desactivar GP " + e);
        }
        return p;
    }

    public boolean activar(int idGP) {
        sql = "Update escuela set estado='1' where idESCUELA=" + idGP;
        boolean p = false;
        try {
            cnn = Conexion.getConexion();
            st = cnn.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al activar GP " + e);
        }
        return p;
    }
    
    public ResultSet listar_GrupoP() {
        String consulta = "SELECT * FROM grupo order by NOMBRE";
        System.out.println(consulta);
        ResultSet rst = cx.RecibirDatos(consulta);
        return rst;
    }
}
