/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.dao.EscuelaDAO;
import com.upeu.mipes.dto.EscuelaDTO;

/**
 *
 * @author USER
 */
public class EscuelaTest {

    
    
    static EscuelaDAO ed = new EscuelaDAO();
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    public static void insertarescuela() {
        EscuelaDTO d = new EscuelaDTO(1, "ESCUELA", "1","25/05/2016","VERDE","LEMA");
        if (ed.agregar(d)) {
            System.out.println("Escuela Sabatica Agregada");
        } else {
            System.out.println("Error al Agregar Escuela Sabatica");
        }
    }

    public void desactivarescuela() {
        if (ed.desactivar(12)) {
            System.out.println("Escuela Sabatica Desactivada");
        } else {
            System.out.println("Error al desactivar");
        }
    }

    public static void eliminarescuela() {
        if (ed.eliminar(12)) {
            System.out.println("Eliminacion correcta");
        } else {
            System.out.println("Error al eliminar");
        }
    }
    
}
