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
    private int idTipoRelacion;
    private String clasificacion;
    private String Estado;

    public ParejamDTO() {
    }

    public ParejamDTO(int idTipoRelacion, String clasificacion, String Estado) {
        this.idTipoRelacion = idTipoRelacion;
        this.clasificacion = clasificacion;
        this.Estado = Estado;
    }

    public int getIdParejaM() {
        return idParejaM;
    }

    public void setIdParejaM(int idParejaM) {
        this.idParejaM = idParejaM;
    }

    public int getIdTipoRelacion() {
        return idTipoRelacion;
    }

    public void setIdTipoRelacion(int idTipoRelacion) {
        this.idTipoRelacion = idTipoRelacion;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public void setClasificacion(String clasificacion) {
        this.clasificacion = clasificacion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

   
}
