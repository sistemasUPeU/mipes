package com.upeu.mipes.test;

import com.upeu.mipes.dao.PersonaDAO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class testPersona {

    static PersonaDAO pA = new PersonaDAO();

    public static void main(String[] args) {
        crearPersona();
    }

    public static void crearPersona() {
        Map<String, Object> per = new HashMap<>();
        per.put("nombres", "jefaaaf");
        per.put("apellidos", "vara");
        per.put("direccion", "upeu");
        per.put("correo", "correo");
        per.put("telefono", 966335440);
        per.put("dni", 7459729);
        if (pA.add(per)) {
            System.out.println("Agregado Correctamente");
        } else {
            System.out.println("Error al agregar");
        }
    }
    
    public static void listarPersonas() {
        ArrayList<Map<String, ?>> lista = pA.listar();
        for (int i = 0; i < lista.size(); i++) {
            System.out.println(lista.get(i));
        }
    }
}
