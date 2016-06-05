package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dto.PersonaDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

public class PersonaDAO implements CrudInterface<PersonaDTO> {

    private String sql;
    private Connection cx;
    private PreparedStatement ps;
    private Statement st;

    @Override
    public boolean agregar(PersonaDTO per) {
        sql = "INSERT INTO persona(idPERSONA,idCARGO,NOMBRES,APELLIDOS,DIRECCION,EMAIL,TELEFONO,FE_NACIMIENTO,FE_BAUTIZMO,SEXO,DNI,OCUPACION) VALUES("+per.getIdPersona()+","+per.getIdCargo()+",'"+per.getNombres()+"','"+per.getApellidos()+"',"+per.getDireccion()+",'"+per.getEmail()+"','"+per.getTelefono()+"',"+per.getFe_nacimiento()+",'"+per.getFe_bautizmo()+"','"+per.getSexo()+"','"+per.getDni()+"','"+per.getOcupacion()+"')";
        boolean p = false;
        try {
//            System.out.println("Persona ID"+per.getIdPersona());
//            System.out.println("Persona cargonombre:"+per.getIdCargo());
//            System.out.println("Persona nombre:"+per.getNombres());
//            System.out.println("Persona apell"+per.getApellidos());
//            System.out.println("Persona direcc:"+per.getDireccion());
//            System.out.println("Persona email"+per.getEmail());
//            System.out.println("Persona telf:"+per.getTelefono());
//            System.out.println("Persona nac:"+per.getFe_nacimiento());
//            System.out.println("Persona bau:"+per.getFe_bautizmo());
//            System.out.println("Persona telf:"+per.getTelefono());
//            System.out.println("Persona sexo:"+per.getSexo());
//            System.out.println("Persona dni:"+per.getDni());
//            System.out.println("Persona ocu:"+per.getOcupacion());
            
            cx = Conexion.getConexion();
            st = cx.createStatement();
            int a = st.executeUpdate(sql);
            if (a > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error Registrar Integrante: " + e);
        }
        return p;
    }

    @Override
    public boolean editar(PersonaDTO e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<PersonaDTO> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PersonaDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
