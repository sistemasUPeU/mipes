package com.upeu.mipes.dto;

public class AsparejamDTO {
    
    private int idAsparejam;
    private int idParejam;
    private String fecha;
    private String lugar;

    public AsparejamDTO() {
    }

    public AsparejamDTO(int idAsparejam, int idParejam, String fecha, String lugar) {
        this.idAsparejam = idAsparejam;
        this.idParejam = idParejam;
        this.fecha = fecha;
        this.lugar = lugar;
    }

    public int getIdAsparejam() {
        return idAsparejam;
    }

    public void setIdAsparejam(int idAsparejam) {
        this.idAsparejam = idAsparejam;
    }

    public int getIdParejam() {
        return idParejam;
    }

    public void setIdParejam(int idParejam) {
        this.idParejam = idParejam;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
    
    
}
