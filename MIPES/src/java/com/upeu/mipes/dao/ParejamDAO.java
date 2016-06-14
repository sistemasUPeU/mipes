package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.ParejamDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
public class ParejamDAO implements CrudInterface<ParejamDTO> {

    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private Statement st;

    @Override
    //PREGUNTAR POR ESTE METODO
    public boolean agregar(ParejamDTO u) {
        sql = "INSERT INTO USUARIO (idPAREJAM, idINTEGRANTE1, idINTEGRANTE2, ESTADO) VALUES(" + u.getIdParejaM() + "," + u.getIdIntegrante1() + "," + u.getIdIntegrante2() + ",'" + u.getEstado() + "')";
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception ex) {
            System.out.println("Error Registrar Pareja Misionera: " + ex);
        }
        return p;
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
