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
public class ParejamDTO {
    private int idParejaM;
    private int idIntegrante1;
    private int idIntegrante2;
    private String Estado;

    public ParejamDTO() {
    }

    public ParejamDTO(int idIntegrante1, int idIntegrante2, String Estado) {
        this.idIntegrante1 = idIntegrante1;
        this.idIntegrante2 = idIntegrante2;
        this.Estado = Estado;
    }

    public int getIdParejaM() {
        return idParejaM;
    }

    public void setIdParejaM(int idParejaM) {
        this.idParejaM = idParejaM;
    }

    public int getIdIntegrante1() {
        return idIntegrante1;
    }

    public void setIdIntegrante1(int idIntegrante1) {
        this.idIntegrante1 = idIntegrante1;
    }

    public int getIdIntegrante2() {
        return idIntegrante2;
    }

    public void setIdIntegrante2(int idIntegrante2) {
        this.idIntegrante2 = idIntegrante2;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    
}
