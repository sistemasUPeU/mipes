/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author USER
 */
public class testUser {

    static Connection cx;
    static PreparedStatement ps;
    static ResultSet rs;

    public static void main(String[] args) {
        conex();
    }

    static void conex() {
        cx = Conexion.getConexion();
        try {

            if (cx != null) {
                System.out.println("Exito al conectar");
                ps = cx.prepareStatement("SELECT * FROM campo");
                rs=ps.executeQuery();
                while(rs.next()){
                    System.out.println(rs.getString("NOMBRE"));
                }
            } else {
                System.out.println("Error al conectar");
            }
        } catch (Exception e) {
            System.out.println("Error : " + e);
        }

    }

}
