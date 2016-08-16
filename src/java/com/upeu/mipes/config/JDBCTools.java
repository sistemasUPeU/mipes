/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.config;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Andres
 */
public class JDBCTools {

    private static ResultSetMetaData rsm;

    public static ArrayList<Map<String, ?>> queryToMap(ResultSet rs) {
        ArrayList<Map<String, ?>> lista= new ArrayList<>();
        try {
            rsm = rs.getMetaData();
            int ncols = rsm.getColumnCount();
            while (rs.next()) {
                Map<String,Object> m= new HashMap<>();
                for (int i = 1; i <= ncols; i++) {
                    m.put(rsm.getColumnName(i).toLowerCase(), rs.getObject(i));
                }                
                lista.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al Convertir a Map");
            return lista;
        }
        return lista;
    }
}
