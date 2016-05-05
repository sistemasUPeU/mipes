package com.upeu.mipes.test;

import java.sql.Connection;
import com.upeu.mipes.config.Conexion;

public class Pruebas {
    static Connection cx;
    
    public static void main(String[] args) {
        conex();
    }
    
    static void conex(){
        cx = Conexion.getConexion();
        if(cx!=null){
            System.out.println("Exito al conectar");
        }else{
            System.out.println("Error al conectar");
        }
    }
}
