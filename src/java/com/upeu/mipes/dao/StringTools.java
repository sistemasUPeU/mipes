/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

/**
 *
 * @author Andres
 */
public class StringTools {
    public static boolean validateString(String s){
        if (s!=null) {
            if (!s.equals("")) {
                return true;
            }
        }
        return false;
    }
}
