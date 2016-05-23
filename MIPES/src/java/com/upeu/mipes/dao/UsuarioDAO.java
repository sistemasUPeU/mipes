/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import static com.upeu.mipes.config.Conexion.getConexion;
import com.upeu.mipes.dto.UsuarioDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andres
 */
public class UsuarioDAO implements CrudInterface<UsuarioDTO> {
    
    private Connection cn;
    private PreparedStatement ps;
    private Statement st;
    private ResultSet rs;
    private String sql;

 public boolean validarUser(String user,String pass){
    boolean m=false;
    sql ="select * from usuario where USUARIO=? and CLAVE=?";
        try {
            cn=Conexion.getConexion();
            ps=cn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs=ps.executeQuery();
            while(rs.next()) {
                m=true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return m;
    }   
    
    
    
    @Override
    public boolean agregar(UsuarioDTO u) {
        sql="INSERT INTO USUARIO (idUSUARIO, USUARIO, CLAVE, ESTADO) VALUES("+u.getIdUsuario()+",'"+u.getUsuario()+"','"+u.getClave()+"','"+u.getEstado()+"')";
        boolean a=false;
        try {
            cn=Conexion.getConexion();
            st=cn.createStatement();
            int b=st.executeUpdate(sql);
            if (b>0) {
                a=true;
            }
            
        } catch (SQLException e) {
            System.out.println("Error al insertar Usuario "+e);
            
        }
        return a;
    }

    @Override
    public boolean editar(UsuarioDTO u) {
        sql="UPDATE TABLE USUARIO SET USUARIO=?, CLAVE=?, ESTADO=? WHERE idUSUARIO=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setString(1, u.getUsuario());
            ps.setString(2, u.getClave());
            ps.setString(3, u.getEstado());
            ps.setInt(4, u.getIdUsuario());
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (SQLException e) {
            System.out.println("Error al editar Usuario "+e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql="DELETE FROM USUARIO WHERE idUSUARIO=?";
        try {
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r=ps.executeUpdate();
            cn.close();
            return (r>0);
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al eliminar Usuario "+e);
            return false;
        }
    }

    @Override
    public ArrayList<UsuarioDTO> listar() {
        ArrayList<UsuarioDTO> list= new ArrayList<>();
        sql="SELECT * FROM USUARIO";
        try {
            rs=cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {                
                UsuarioDTO u= new UsuarioDTO();
                u.setIdUsuario(rs.getInt("idUSUARIO"));
                u.setUsuario(rs.getString("USUARIO"));
                u.setClave(rs.getString("CLAVE"));
                u.setEstado(rs.getString("ESTADO"));
                list.add(u);
            }
            cn.close();            
        } catch (SQLException e) {
            System.out.println("Error al listar Usuario "+e);
            return null;
        }
        return list;
    }

    @Override
    public UsuarioDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static ResultSet listaDistritos(String consulta){
        
        ResultSet rst=null;
        PreparedStatement psm=null;
        try {
        psm=getConexion().prepareStatement(consulta);
        rst=psm.executeQuery();
        } catch (Exception e) {
        }
        return rst;
    }
    

    
    
}
