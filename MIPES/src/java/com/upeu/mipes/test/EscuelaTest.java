/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.dao.EscuelaDAO;
import com.upeu.mipes.dto.EscuelaDTO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        editar();
    }

    public static void insertarescuela() {
        EscuelaDTO d = new EscuelaDTO(1, "BERITH", "1");
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

    public static void listar() {
        ArrayList<EscuelaDTO> list = ed.listar();
        if (list != null) {
            System.out.println("Lista de escuelas");
            for (int i = 0; i < list.size(); i++) {
                System.out.println("Nombre : " + list.get(i).getNombre() + "  ID:" + list.get(i).getIdEscuela());
            }
        } else {
            System.out.println("falla");
        }
    }
    
    public static void listr(){
        try {
            String sql = "SELECT * FROM escuela where iddistritom =1  order by nombre";
            ResultSet rs = ed.listar_escuelas(sql);
            while  (rs.next()) {
                String a=rs.getString("estado");
                String estado="";
                if (a.equals("1")) {
                    estado="DESACTIVALO";
                }else{
                    estado="ACTIVALO";
                }
                System.out.println(estado);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EscuelaTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    
    public static void editar(){
        EscuelaDTO es=new EscuelaDTO();
        es.setIdEscuela(10);
        es.setIdDistritoM(1);
        es.setNombre("GETSEMANI");
        es.setEstado("1");
        if (ed.editar(es)) {
            System.out.println("Editado");
        }else{
            System.out.println("Error al editar");
        }
    }

}
