package com.upeu.mipes.dto;

public class DistritoDTO {
    
    private int idDistritom;
    private String nombre;
    private String estado;

    public DistritoDTO() {
    }

    public DistritoDTO(int idDistritom, String nombre, String estado) {
        this.idDistritom = idDistritom;
        this.nombre = nombre;
        this.estado = estado;
    }

    public int getIdDistritom() {
        return idDistritom;
    }

    public void setIdDistritom(int idDistritom) {
        this.idDistritom = idDistritom;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
