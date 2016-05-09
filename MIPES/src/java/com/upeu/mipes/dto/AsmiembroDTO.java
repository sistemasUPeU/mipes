package com.upeu.mipes.dto;

public class AsmiembroDTO {
    
    private int idAsmiembro;
    private int idIntegrante;
    private String fecha;
    private int estudioB;
    private String estado;

    public AsmiembroDTO() {
    }

    public AsmiembroDTO(int idIntegrante, String fecha, int estudioB, String estado) {
        this.idIntegrante = idIntegrante;
        this.fecha = fecha;
        this.estudioB = estudioB;
        this.estado = estado;
    }

    public int getIdAsmiembro() {
        return idAsmiembro;
    }

    public void setIdAsmiembro(int idAsmiembro) {
        this.idAsmiembro = idAsmiembro;
    }

    public int getIdIntegrante() {
        return idIntegrante;
    }

    public void setIdIntegrante(int idIntegrante) {
        this.idIntegrante = idIntegrante;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getEstudioB() {
        return estudioB;
    }

    public void setEstudioB(int estudioB) {
        this.estudioB = estudioB;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
