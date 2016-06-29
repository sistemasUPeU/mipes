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
import java.util.ArrayList;
import java.util.List;

public class Pruebas {

    static Connection cx;
    static DistritomDAO x = new DistritomDAO();
    static UsuarioDAO us = new UsuarioDAO();
    static GrupoDAO gd = new GrupoDAO();
    static PersonaDAO per = new PersonaDAO();

    public static void main(String[] args) {
        listar();
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

    public static void listar() {
        List<PersonaDTO> u = new ArrayList<>();
        u = per.toList();
        for (int i = 0; i < u.size(); i++) {
            System.out.println(u.get(i).getNombres());
        }
    }
    static PersonaDAO pA = new PersonaDAO();
    static IntegranteDAO intDAO = new IntegranteDAO();

}
