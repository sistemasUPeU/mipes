/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Andres
 */
public class Conexion {
    private static final String url="jdbc:mysql://localhost:3306/dbmipes";
    private static final String driver="com.mysql.jdbc.Driver";
    private static final String user="root";
    private static final String clave="root";
    private static Connection cx=null;
    
    public static final Connection getConexion(){
        try {
            Class.forName(driver);
             if(cx==null){
                cx = DriverManager.getConnection(url, user, clave);            
            }             
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error: "+e);
        }  
    
        return cx;
    }
    public void cerrar(){
        cx = null;
        
    }
}
