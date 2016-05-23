package com.upeu.mipes.test;

import java.sql.Connection;
import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dao.DistritomDAO;
import com.upeu.mipes.dao.EscuelaDAO;
import com.upeu.mipes.dao.UsuarioDAO;
import com.upeu.mipes.dto.DistritomDTO;
import com.upeu.mipes.dto.EscuelaDTO;
import com.upeu.mipes.dto.UsuarioDTO;

public class Pruebas {

    static Connection cx;
    static DistritomDAO x = new DistritomDAO();
    static UsuarioDAO us = new UsuarioDAO();
    static EscuelaDAO ed = new EscuelaDAO();

    public static void main(String[] args) {
        agregarUsuario();
    }

    static void conex() {
        cx = Conexion.getConexion();
        if (cx != null) {
            System.out.println("Exito al conectar");
        } else {
            System.out.println("Error al conectar");
        }
    }

    public void login() {
        if (us.validarUser("prueba", "123")) {
            System.out.println("SI");
        }
    }
    
    public static void agregarUsuario(){
        UsuarioDTO ud=new UsuarioDTO("a","123","1");
        if (us.agregar(ud)) {
            System.out.println("Se agrego correctamente");
        }else{
            System.out.println("Error al agregar");
        }
    }

    public void insertarescuela() {
        EscuelaDTO d = new EscuelaDTO(1, "BERITH", "1");
        if (ed.agregar(d)) {
            System.out.println("Escuela Sabatica Agregada");
        } else {
            System.out.println("Error al Agregar Escuela Sabatica");
        }
    }

    public void desactivarescuela() {
        if (ed.desactivar(12)) {
            System.out.println("Escuela Sabatica Desactivada");
        } else {
            System.out.println("Error al desactivar");
        }
    }

    public static void eliminarescuela() {
        if (ed.eliminar(12)) {
            System.out.println("Eliminacion correcta");
        } else {
            System.out.println("Error al eliminar");
        }
    }
}
