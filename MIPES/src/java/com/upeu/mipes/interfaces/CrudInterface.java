/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.interfaces;

import java.util.ArrayList;

/**
 *
 * @author Andres

 */
public interface CrudInterface{
    
    public boolean agregar(Object o);
    public boolean editar(Object o);
    public boolean eliminar(Object o);
    public ArrayList<?> listar();
    
}
