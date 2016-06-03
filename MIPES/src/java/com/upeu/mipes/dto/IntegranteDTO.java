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
public class IntegranteDTO {

    private int idIntegrante;
    private int idPersona;
    private int idGrupo;
    private int idMinisterio;
    private String Estado;
    
    
    public IntegranteDTO() {
    }

    public IntegranteDTO(int idPersona, int idGrupo, int idMinisterio, String Estado) {
        this.idPersona = idPersona;
        this.idGrupo = idGrupo;
        this.idMinisterio = idMinisterio;
        this.Estado = Estado;
    }

    public int getIdIntegrante() {
        return idIntegrante;
    }

    public void setIdIntegrante(int idIntegrante) {
        this.idIntegrante = idIntegrante;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public int getIdMinisterio() {
        return idMinisterio;
    }

    public void setIdMinisterio(int idMinisterio) {
        this.idMinisterio = idMinisterio;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
   
}
