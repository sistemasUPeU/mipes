package com.upeu.mipes.dto;

public class AsmiembroDTO {
    
    private int idAsmiembro;
    private int idAsistencia;
    private int idIntegrante;
    private int estudioB;

    public AsmiembroDTO() {
    }

    public AsmiembroDTO(int idAsistencia, int idIntegrante, int estudioB) {
        this.idAsistencia = idAsistencia;
        this.idIntegrante = idIntegrante;
        this.estudioB = estudioB;
    }

    public int getIdAsmiembro() {
        return idAsmiembro;
    }

    public void setIdAsmiembro(int idAsmiembro) {
        this.idAsmiembro = idAsmiembro;
    }

    public int getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
    }

    public int getIdIntegrante() {
        return idIntegrante;
    }

    public void setIdIntegrante(int idIntegrante) {
        this.idIntegrante = idIntegrante;
    }

    public int getEstudioB() {
        return estudioB;
    }

    public void setEstudioB(int estudioB) {
        this.estudioB = estudioB;
    }

    
}