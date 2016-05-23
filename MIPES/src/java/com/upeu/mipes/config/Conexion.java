/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Andres
 */
public class Conexion {
    private static final String url="jdbc:mysql://localhost:3306/dbmipes";
    private static final String driver="com.mysql.jdbc.Driver";
    private static final String user="root";
    private static final String clave="root";
    private static Connection conn=null;
    public static Statement st=null;
    public static ResultSet rst=null;
    public static final Connection getConexion(){
        try {
            Class.forName(driver);
             if(conn==null){
                conn = DriverManager.getConnection(url, user, clave);
                st=conn.createStatement();
            }             
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error: "+e);
        }  
    
        return conn;
    }
    public void cerrar(){
        conn = null;
        
    }
    
    public ResultSet RecibirDatos(String consulta){
        
        try {
        getConexion();
        rst = st.executeQuery(consulta);
        } catch (Exception e) {
            System.out.println("Error de la consulta "+e.getMessage());
        }
        return rst;
    }
    
    
}
