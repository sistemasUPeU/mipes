/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dto;

/**
 *
 * @author Andres
 */
public class UsuarioDTO {
    private int idUSUARIO;
    private String USUARIO;
    private String CLAVE;
    private String ESTADO;

    public UsuarioDTO() {
    }

    public UsuarioDTO(String USUARIO, String CLAVE, String ESTADO) {
        this.USUARIO = USUARIO;
        this.CLAVE = CLAVE;
        this.ESTADO = ESTADO;
    }

    public int getIdUSUARIO() {
        return idUSUARIO;
    }

    public void setIdUSUARIO(int idUSUARIO) {
        this.idUSUARIO = idUSUARIO;
    }

    public String getUSUARIO() {
        return USUARIO;
    }

    public void setUSUARIO(String USUARIO) {
        this.USUARIO = USUARIO;
    }

    public String getCLAVE() {
        return CLAVE;
    }

    public void setCLAVE(String CLAVE) {
        this.CLAVE = CLAVE;
    }

    public String getESTADO() {
        return ESTADO;
    }

    public void setESTADO(String ESTADO) {
        this.ESTADO = ESTADO;
    }
    
    
}
