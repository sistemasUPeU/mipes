/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.config.Conexion;
import java.sql.Connection;

/**
 *
 * @author USER
 */
public class testUser {

    static Connection cx;
    
    public static void main(String[] args) {
        conex();
    }
    
    static void conex() {
        cx = Conexion.getConexion();
        if (cx != null) {
            System.out.println("Exito al conectar");
        } else {
            System.out.println("Error al conectar");
        }
    }
    
}
