/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.dao.DistritoDAO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author USER
 */
public class testDistrito {

    static DistritoDAO dO = new DistritoDAO();

    public static void main(String[] args) {
        crearDistrito("Kerigma");
    }

    public static void crearDistrito(String nombre) {
        String estado = "1";
        Map<String, Object> a = new HashMap<>();
        a.put("nombre", nombre);
        a.put("estado", estado);
        if (dO.add(a)) {
            System.out.println("Agregado Correctamente");
        } else {
            System.out.println("Error al agregar");
        }
    }

    public static void listarDistritos() {
        ArrayList<Map<String, ?>> lista = dO.listar();
        for (int i = 0; i < lista.size(); i++) {
            System.out.println(lista.get(i));
        }
    }

}
