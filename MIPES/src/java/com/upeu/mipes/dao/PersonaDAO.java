package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.PersonaDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements CrudInterface<PersonaDTO> {

    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private Statement st;
    private ResultSet rs;
    
    @Override
    public boolean agregar(PersonaDTO per) {
        sql = "INSERT INTO persona(idPERSONA,NOMBRES,APELLIDOS,DIRECCION,EMAIL,TELEFONO,FE_NACIMIENTO,FE_BAUTIZMO,SEXO,DNI,OCUPACION) VALUES("+per.getIdPersona()+",'"+per.getNombres()+"','"+per.getApellidos()+"','"+per.getDireccion()+"','"+per.getEmail()+"','"+per.getTelefono()+"','"+per.getFe_nacimiento()+"','"+per.getFe_bautizmo()+"','"+per.getSexo()+"','"+per.getDni()+"','"+per.getOcupacion()+"')";
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error Registrar Persona: " + e);
        }
        return p;
    }

    @Override
    public boolean editar(PersonaDTO per) {
        boolean p = false;
        sql = "UPDATE persona SET NOMBRES='"+per.getNombres()+"',APELLIDOS='"+per.getApellidos()+"',DIRECCION='"+per.getDireccion()+"',EMAIL='"+per.getEmail()+"',TELEFONO='"+per.getTelefono()+"',FE_NACIMIENTO='"+per.getFe_nacimiento()+"',FE_BAUTIZMO='"+per.getFe_bautizmo()+"',SEXO='"+per.getSexo()+"',DNI='"+per.getDni()+"',OCUPACION='"+per.getOcupacion()+"' WHERE idPERSONA=" + per.getIdPersona();
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception ex) {
            System.out.println("Error Editar Persona: " + ex);
        }
        return p;
    }

    @Override
    public boolean eliminar(Object key) {
        sql="DELETE FROM persona WHERE idPERSONA ="+ key;
        boolean p = false;
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);                  
            if(a>0){
                p=true;
            }                
        } catch (Exception e) {
            System.out.println("Error Eliminar Persona: "+e);
        }
        return p; 
    }

    @Override
    public ArrayList<PersonaDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PersonaDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int  buscarNombre(String nombre){
        int idPersona=0;
        sql = "SELECT *FROM persona WHERE NOMBRES = '" + nombre + "'";
        try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                idPersona = rs.getInt("idPERSONA");
            }

        } catch (Exception e) {
            System.out.println("Error Listar Persona (Nombre): " + e);
        }
        return idPersona;
    }
    public ResultSet listarPersonas(String consulta) {
        Conexion cnn = new Conexion();
        System.out.println(consulta);
        ResultSet rst = cnn.RecibirDatos(consulta);
        return rst;
    }
    
    public List<PersonaDTO> toList() {
        List<PersonaDTO> lista = new ArrayList<>();
        sql = "SELECT * FROM persona";
       try {
            cx = Conexion.getConexion();
            st = cx.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                PersonaDTO u = new PersonaDTO();
                u.setIdPersona(rs.getInt("idPERSONA"));
                u.setNombres(rs.getString("NOMBRES"));
                u.setApellidos(rs.getString("APELLIDOS"));
                u.setTelefono(rs.getString("TELEFONO"));
                u.setDireccion(rs.getString("DIRECCION"));
                lista.add(u);
            }
        } catch (Exception e) {
            System.out.println("Error listar Persona: " + e);
        }
        return lista;
    }
}
