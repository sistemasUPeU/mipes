/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.dao.CampoDAO;
import com.upeu.mipes.dao.PersonaDAO;
import com.upeu.mipes.dao.RolDAO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author USER
 */
public class testCampo {

    
    static CampoDAO cA=new CampoDAO();
    static PersonaDAO pA=new PersonaDAO();
    static RolDAO rA=new RolDAO();
    
    
    public static void main(String[] args) {
    }
    
    public static void listarIglesia() {
        ArrayList<Map<String, ?>> lista = cA.listar();
        for (int i = 0; i < lista.size(); i++) {
            //System.out.println(lista.get(i).toString());
            if (lista.get(i).toString().contains("AS")) {
            System.out.println(lista.get(i));    
            }
            
        }
    }
    public static void buscarLider(int DNI) {
        String dni=String.valueOf(DNI);
        ArrayList<Map<String, ?>> lista = pA.listar();
        for (int i = 0; i < lista.size(); i++) {
            //System.out.println(lista.get(i).toString());
            //System.out.println(dni);
            //System.out.println(lista.get(i));
            if (lista.get(i).toString().contains(dni)) {
            System.out.println(lista.get(i));    
            }
            
        }
        
    }
    
    public static void crearRol(String nombre){
        Map<String, Object> a = new HashMap<>();
        a.put("nombre", nombre);
        if (rA.add(a)) {
            
        }
    }
    
}
