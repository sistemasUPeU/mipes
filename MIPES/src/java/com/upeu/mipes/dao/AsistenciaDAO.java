/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.CargoDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Andrew
 */
public class AsistenciaDAO implements CrudInterface<CargoDTO>{
    
    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean agregar(CargoDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean editar(CargoDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<CargoDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public CargoDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    //Asistencia Integrante GP
    public ArrayList<Map<String,?>> listaIntegranteGPEnable(){
        sql="SELECT * FROM VINTEGRANTE WHERE ESTADO='1'";
        ArrayList<Map<String,?>> lista= new ArrayList<>();
        try {
            cx=Conexion.getConexion();
            ps=cx.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Map<String,Object> m= new HashMap<>();
                m.put("idintegrantegp", rs.getInt("idintegrantegp"));
                m.put("idGrupo", rs.getInt("idGrupo"));
                m.put("nombre", rs.getString("nombre"));
                m.put("nomcargo", rs.getString("nomcargo"));
                m.put("idPERSONA", rs.getInt("idPERSONA"));
                m.put("idCARGO", rs.getInt("idCARGO"));
                m.put("NOMBRES", rs.getString("NOMBRES"));
                m.put("APELLIDOS", rs.getString("APELLIDOS"));
                m.put("DIRECCION", rs.getString("DIRECCION"));
                m.put("EMAIL", rs.getString("EMAIL"));
                m.put("TELEFONO", rs.getString("TELEFONO"));
                m.put("FE_NACIMIENTO", rs.getDate("FE_NACIMIENTO"));
                m.put("FE_BAUTIZMO", rs.getDate("FE_BAUTIZMO"));
                m.put("SEXO", rs.getString("SEXO"));
                m.put("DNI", rs.getString("DNI"));
                m.put("OCUPACION", rs.getString("OCUPACION"));
                lista.add(m);
            }
            //cx.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;            
        }
        return lista;
    }
    
    public ArrayList<Map<String,?>> listaIntegranteGPAll(){
        sql="SELECT * FROM VINTEGRANTE";
        ArrayList<Map<String,?>> lista= new ArrayList<>();
        try {
            cx=Conexion.getConexion();
            ps=cx.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Map<String,Object> m= new HashMap<>();
                m.put("idintegrantegp", rs.getInt("idintegrantegp"));
                m.put("idGrupo", rs.getInt("idGrupo"));
                m.put("nombre", rs.getString("nombre"));
                m.put("nomcargo", rs.getString("nomcargo"));
                m.put("idPERSONA", rs.getInt("idPERSONA"));
                m.put("idCARGO", rs.getInt("idCARGO"));
                m.put("NOMBRES", rs.getString("NOMBRES"));
                m.put("APELLIDOS", rs.getString("APELLIDOS"));
                m.put("DIRECCION", rs.getString("DIRECCION"));
                m.put("EMAIL", rs.getString("EMAIL"));
                m.put("TELEFONO", rs.getString("TELEFONO"));
                m.put("FE_NACIMIENTO", rs.getDate("FE_NACIMIENTO"));
                m.put("FE_BAUTIZMO", rs.getDate("FE_BAUTIZMO"));
                m.put("SEXO", rs.getString("SEXO"));
                m.put("DNI", rs.getString("DNI"));
                m.put("OCUPACION", rs.getString("OCUPACION"));
                lista.add(m);
            }
            cx.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            return null;            
        }
        return lista;
    }
    
}
