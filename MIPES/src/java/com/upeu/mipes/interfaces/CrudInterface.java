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
 * @param <Entidad>

 */
public interface CrudInterface <Entidad>{
    
    public boolean agregar(Entidad e);
    public boolean editar(Entidad e);
    public boolean eliminar(Object key);
    public ArrayList<Entidad> listar();
    public Entidad buscar(Object key);
    
}
