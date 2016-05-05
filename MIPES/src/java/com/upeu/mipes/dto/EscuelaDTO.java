/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dto;

/**
 *
 * @author USER
 */
public class EscuelaDTO {
    private int idESCUELA;
    private int idDISTRITO;
    private String NOMBRE;
    private String ESTADO;

    public EscuelaDTO() {
    }

    public EscuelaDTO(String NOMBRE, String ESTADO) {
        this.NOMBRE = NOMBRE;
        this.ESTADO = ESTADO;
    }

    public int getIdESCUELA() {
        return idESCUELA;
    }

    public void setIdESCUELA(int idESCUELA) {
        this.idESCUELA = idESCUELA;
    }

    public int getIdDISTRITO() {
        return idDISTRITO;
    }

    public void setIdDISTRITO(int idDISTRITO) {
        this.idDISTRITO = idDISTRITO;
    }

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public String getESTADO() {
        return ESTADO;
    }

    public void setESTADO(String ESTADO) {
        this.ESTADO = ESTADO;
    }
    
}
