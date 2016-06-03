/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dto;

/**
 *
 * @author Andrew
 */
public class Det_LinkDTO {
    
    private int idLink;
    private int idPrivilegio;
    
    public Det_LinkDTO() {
    }

    public Det_LinkDTO(int idPrivilegio) {
        this.idPrivilegio = idPrivilegio;
    }

    public int getIdLink() {
        return idLink;
    }

    public void setIdLink(int idLink) {
        this.idLink = idLink;
    }

    public int getIdPrivilegio() {
        return idPrivilegio;
    }

    public void setIdPrivilegio(int idPrivilegio) {
        this.idPrivilegio = idPrivilegio;
    }

    
    
    
}
