/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.interfaces;

import java.util.ArrayList;
import java.util.Map;

public interface CrudInterface {

    public ArrayList<Map<String, ?>> listar();

    public boolean add(Object o);

    public boolean edit(Object o);

    public boolean delete(Object o);

}
