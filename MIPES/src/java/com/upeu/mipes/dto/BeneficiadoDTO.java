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
public class BeneficiadoDTO {
    
    private int idBeneficiado;
    private int idAsistencia;
    private int idPersona;

    public BeneficiadoDTO() {
    }

    public BeneficiadoDTO(int idAsistencia, int idPersona) {
        this.idAsistencia = idAsistencia;
        this.idPersona = idPersona;
    }

    public int getIdBeneficiado() {
        return idBeneficiado;
    }

    public void setIdBeneficiado(int idBeneficiado) {
        this.idBeneficiado = idBeneficiado;
    }

    public int getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }
    
    
}
