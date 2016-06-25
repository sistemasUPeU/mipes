package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.Det_Int_GPDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Andrew
 */
public class Det_Int_GPDAO implements CrudInterface<Det_Int_GPDTO>{

    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private Statement st;
    
    @Override
    public boolean agregar(Det_Int_GPDTO e) {
        sql = "INSERT INTO det_int_gp (idDET_INT_GP,idPERSONA,idGRUPO,FECHA_UNION) VALUES("+e.getIdDet_IntGP()+","+e.getIdPersona()+","+e.getIdGrupo()+",'"+e.getFechaReunion()+"')";
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception ex) {
            System.out.println("Error Registrar Det_Int_GP: " + ex);
        }
        return p;
    }

    @Override
    public boolean editar(Det_Int_GPDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Det_Int_GPDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Det_Int_GPDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
