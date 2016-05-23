/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import static com.upeu.mipes.config.Conexion.getConexion;
import com.upeu.mipes.dto.DistritomDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author jevar
 */
public class DistritomDAO implements CrudInterface<DistritomDTO> {

    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    
    Conexion cx=new Conexion();

    @Override
    public boolean agregar(DistritomDTO d) {
        
        sql = "INSERT INTO ASGRUPO (idDISTRITOM, NOMBRE, ESTADO) VALUES(null,?,?)";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, d.getIdDistritom());
            ps.setString(2, d.getNombre());
            ps.setString(3, d.getEstado());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al agregar Distritom " + e);
            return false;
        }
    }

    @Override
    public boolean editar(DistritomDTO d) {
        sql = "UPDATE TABLE ASGRUPO SET NOMBRE=?, ESTADO=? WHERE idDISTRITOM=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, d.getNombre());
            ps.setString(2, d.getEstado());
            ps.setInt(3, d.getIdDistritom());
                       
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al editar Distritom " + e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql = "DELETE FROM DISTRITOM WHERE idDISTRITOM=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al eliminar Distritom " + e);
            return false;
        }
    }

    @Override
    public ArrayList<DistritomDTO> listar() {
        ArrayList<DistritomDTO> list = new ArrayList<>();
        sql = "SELECT * FROM ASGRUPO";
        try {
            rs = cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {
                DistritomDTO d = new DistritomDTO();
                d.setIdDistritom(rs.getInt("idDISTRITOM"));
                d.setNombre(rs.getString("NOMBRE"));
                d.setEstado(rs.getString("ESTADO"));
                list.add(d);
            }
            cn.close();
        } catch (Exception e) {
            System.out.println("Error al listar Distritom " + e);
            return null;
        }
        return list;
    }

    @Override
    public DistritomDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public ResultSet listar_Distritos(){
		String consulta = "SELECT * FROM distritom order by NOMBRE";
		System.out.println(consulta);
		ResultSet rst =cx.RecibirDatos(consulta) ;	
		return rst;
	}
 

}
