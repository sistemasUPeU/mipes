package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.ParejamDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
        sql = "INSERT INTO parejam (idPAREJAM, idTIPORELACION, CLASIFICACION, ESTADO) VALUES("+u.getIdParejaM()+","+u.getIdTipoRelacion()+",'"+u.getClasificacion()+"','"+u.getEstado()+"')";
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
    public boolean editar(ParejamDTO u) {
        sql = "UPDATE TABLE parejam SET idTIPORELACION=?, CLASIFICACION=?, ESTADO=? WHERE idPAREJAM=?";
        try {
            ps = cx.prepareStatement(sql);
            ps.setInt(1, u.getIdParejaM());
            ps.setInt(2, u.getIdTipoRelacion());
            ps.setString(3, u.getClasificacion());
            ps.setString(4, u.getEstado());
            int r = ps.executeUpdate();
            cx.close();
            return (r > 0);
        } catch (SQLException e) {
            System.out.println("Error al editar Usuario " + e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql = "DELETE FROM parejam WHERE idPAREJAM=?";
        try {
            ps = cx.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r = ps.executeUpdate();
            cx.close();
            return (r > 0);
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al eliminar ParejaM " + e);
            return false;
        }
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
