package com.upeu.mipes.test;

import java.sql.Connection;
import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dao.DistritomDAO;
import com.upeu.mipes.dao.GrupoDAO;
import com.upeu.mipes.dao.UsuarioDAO;
import com.upeu.mipes.dto.GrupoDTO;
import com.upeu.mipes.dto.UsuarioDTO;

public class Pruebas {

    static Connection cx;
    static DistritomDAO x = new DistritomDAO();
    static UsuarioDAO us = new UsuarioDAO();
    static GrupoDAO gd=new GrupoDAO();

    public static void main(String[] args) {
        insertargrupo();
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

    
    public static void insertargrupo(){
        GrupoDTO gdt=new GrupoDTO(18,"prueba1","2016-08-16","1");
        if (gd.agregar(gdt)) {
            System.out.println("Grupo Agredado Correctamente");
        }else{
            System.out.println("Error al agregar Grupo");
        }
    }
}
