package com.upeu.mipes.test;

import java.sql.Connection;
import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.dao.DistritomDAO;
import com.upeu.mipes.dto.DistritomDTO;

public class Pruebas {
    static Connection cx;
    static DistritomDAO x = new DistritomDAO();
    
    public static void main(String[] args) {
        insertar();
    }
    
    static void conex(){
        cx = Conexion.getConexion();
        if(cx!=null){
            System.out.println("Exito al conectar");
        }else{
            System.out.println("Error al conectar");
        }
    }
    public static void insertar(){
        DistritomDTO d = new DistritomDTO(1, "burgos", "1");
        if(x.agregar(d)){
            System.out.println("SI");
        }
    }
}
