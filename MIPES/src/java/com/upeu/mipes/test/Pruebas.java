package com.upeu.mipes.test;

import java.sql.Connection;
import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dao.DistritomDAO;
import com.upeu.mipes.dao.GrupoDAO;
import com.upeu.mipes.dao.IntegranteDAO;
import com.upeu.mipes.dao.PersonaDAO;
import com.upeu.mipes.dao.UsuarioDAO;
import com.upeu.mipes.dto.GrupoDTO;
import com.upeu.mipes.dto.IntegranteDTO;
import com.upeu.mipes.dto.PersonaDTO;
import com.upeu.mipes.dto.UsuarioDTO;

public class Pruebas {

    static Connection cx;
    static DistritomDAO x = new DistritomDAO();
    static UsuarioDAO us = new UsuarioDAO();
    static GrupoDAO gd = new GrupoDAO();

    public static void main(String[] args) {
        insertarpersona();
    }

    static void conex() {
        cx = Conexion.getConexion();
        if (cx != null) {
            System.out.println("Exito al conectar");
        } else {
            System.out.println("Error al conectar");
        }
    }

    public static void agregarUsuario() {
        UsuarioDTO ud = new UsuarioDTO(1, "a", "123", "1");
        if (us.agregar(ud)) {
            System.out.println("Se agrego correctamente");
        } else {
            System.out.println("Error al agregar");
        }
    }

    static PersonaDAO pA = new PersonaDAO();
    static IntegranteDAO intDAO = new IntegranteDAO();

    public static void insertarpersona() {
        PersonaDTO pT = new PersonaDTO(1, "Persona728", "apellidom", "direc", "email", "telef", "nacimi", "bau", "M", "sallllll", "sa");
        if (pA.agregar(pT)) {
            System.out.println("Agregado persona");
            System.out.println("IDPERSONA" + String.valueOf((pT.getIdPersona())));
            System.out.println("Nombre Persona:" + pT.getNombres());
            int idPersona = pA.buscarNombre(pT.getNombres());

//            IntegranteDTO intDTO = new IntegranteDTO(idPersona, 8, 11, "1");
//            if (intDAO.agregar(intDTO)) {
//                System.out.println("Agregado");
//            }
//        }
            try {
                pA.editar(pT);
                System.out.println("assa");
            } catch (Exception e) {
                System.out.println("Error editar " + e);
            }

        }
    }
}
