/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.dao.GrupoDAO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author USER
 */
public class testGrupo {

    static GrupoDAO gA = new GrupoDAO();

    public static void main(String[] args) {
        crearGrupo(1,"ORION I");
    }

    public static void crearGrupo(int distrito, String nombre) {
        String estado = "1";
        String fecha="1998-12-12";
        String lugar="abc";
        Map<String, Object> a = new HashMap<>();
        a.put("idescuela", distrito);
        a.put("nombre", nombre);
        a.put("estado", estado);
        a.put("fecha", fecha);
        a.put("usuario", 1);//CAMBIAR AL USAR INICIO DE SESION
        a.put("lugar", lugar);
        if (gA.add(a)) {
            System.out.println("Agregado Correctamente");
        } else {
            System.out.println("Error al agregar");
        }
    }

}
