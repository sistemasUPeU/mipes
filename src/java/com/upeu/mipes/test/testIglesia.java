/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.dao.IglesiaDAO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author USER
 */
public class testIglesia {

    static IglesiaDAO iA=new IglesiaDAO();
    
    public static void main(String[] args) {
        eliminar(1);
    }
    
    public static void crearIglesia(int distrito,String nombre) {
        String estado = "1";
        Map<String, Object> a = new HashMap<>();
        a.put("iddis", distrito);
        a.put("nombre", nombre);
        a.put("estado", estado);
        if (iA.add(a)) {
            System.out.println("Agregado Correctamente");
        } else {
            System.out.println("Error al agregar");
        }
    }
    
    public static void listarIglesia() {
        ArrayList<Map<String, ?>> lista = iA.lista(1);
        for (int i = 0; i < lista.size(); i++) {
            System.out.println(lista.get(i));
        }
    }
    
    public static void eliminar(int id){
        if (iA.delete(id)) {
            System.out.println("Eliminado");
        }else{
            System.out.println("Error al eliminar");
        }
    }
}
