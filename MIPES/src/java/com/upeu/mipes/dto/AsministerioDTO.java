package com.upeu.mipes.dto;

public class AsministerioDTO {
    
    private int idAsministerio;
    private int idMinisterio;
    private String fecha;
    private int presentes;
    private int faltas;
    private int visitas;

    public AsministerioDTO() {
    }

    public AsministerioDTO(int idAsministerio, int idMinisterio, String fecha, int presentes, int faltas, int visitas) {
        this.idAsministerio = idAsministerio;
        this.idMinisterio = idMinisterio;
        this.fecha = fecha;
        this.presentes = presentes;
        this.faltas = faltas;
        this.visitas = visitas;
    }

    public int getIdAsministerio() {
        return idAsministerio;
    }

    public void setIdAsministerio(int idAsministerio) {
        this.idAsministerio = idAsministerio;
    }

    public int getIdMinisterio() {
        return idMinisterio;
    }

    public void setIdMinisterio(int idMinisterio) {
        this.idMinisterio = idMinisterio;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getPresentes() {
        return presentes;
    }

    public void setPresentes(int presentes) {
        this.presentes = presentes;
    }

    public int getFaltas() {
        return faltas;
    }

    public void setFaltas(int faltas) {
        this.faltas = faltas;
    }

    public int getVisitas() {
        return visitas;
    }

    public void setVisitas(int visitas) {
        this.visitas = visitas;
    }
    
    
}
