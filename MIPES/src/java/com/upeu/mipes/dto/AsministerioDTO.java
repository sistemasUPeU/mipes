package com.upeu.mipes.dto;

public class AsministerioDTO {
    
    private int idAsministerio;
    private int idAsistencia;
    private int idMinisterio;
   

    public AsministerioDTO() {
    }

    public AsministerioDTO(int idAsistencia, int idMinisterio) {
        this.idAsistencia = idAsistencia;
        this.idMinisterio = idMinisterio;
    }

    public int getIdAsministerio() {
        return idAsministerio;
    }

    public void setIdAsministerio(int idAsministerio) {
        this.idAsministerio = idAsministerio;
    }

    public int getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
    }

    public int getIdMinisterio() {
        return idMinisterio;
    }

    public void setIdMinisterio(int idMinisterio) {
        this.idMinisterio = idMinisterio;
    }

    
}
