/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.test;

import com.upeu.mipes.dao.MinisterioDAO;
import com.upeu.mipes.dto.MinisterioDTO;

/**
 *
 * @author USER
 */
public class MinisterioTest {

    static MinisterioDAO mA=new MinisterioDAO();
    
    public static void main(String[] args) {
        registrar();
    }
    
    public static void registrar(){
        MinisterioDTO mT= new MinisterioDTO(1,"JASS","Dramas actuacion etc","1");
        if (mA.agregar(mT)) {
            System.out.println("Se agrego correctamente");
        }else{
            System.out.println("Error al agregar");
        }
    }
}
