package com.upeu.mipes.test;

import java.sql.Connection;
import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dao.DistritomDAO;
import com.upeu.mipes.dao.UsuarioDAO;
import com.upeu.mipes.dto.DistritomDTO;
import com.upeu.mipes.dto.UsuarioDTO;

public class Pruebas {
    static Connection cx;
    static DistritomDAO x = new DistritomDAO();
    static UsuarioDAO us=new UsuarioDAO();
    
    public static void main(String[] args) {
        login();
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
}
