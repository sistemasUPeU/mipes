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
    static UsuarioDAO us=new UsuarioDAO();
    static EscuelaDAO ed=new EscuelaDAO();
    
    public static void main(String[] args) {
        insertarescuela();
    }
    
    static void conex(){
        cx = Conexion.getConexion();
        if(cx!=null){
            System.out.println("Exito al conectar");
        }else{
            System.out.println("Error al conectar");
        }
    }
    public static void login(){
        UsuarioDTO d = new UsuarioDTO();
        if(us.validarUser("prueba", "123")){
            System.out.println("SI");
        }
    }
    public static void insertarescuela(){
        EscuelaDTO d = new EscuelaDTO(1,"BERITH","1");
        if(ed.agregar(d)){
            System.out.println("Escuela Sabatica Agregada");
        }else{
            System.out.println("Error al Agregar Escuela Sabatica");
        }
    }
}
