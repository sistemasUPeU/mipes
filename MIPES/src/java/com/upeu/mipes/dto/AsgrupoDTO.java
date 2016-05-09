package com.upeu.mipes.dto;

public class AsgrupoDTO {
    
    private int idAsgrupo;
    private int idGrupo;
    private String fecha;
    private int presentes;
    private int faltas;
    private int visitas;

    public AsgrupoDTO() {
    }

    public AsgrupoDTO(int idGrupo, String fecha, int presentes, int faltas, int visitas) {
        this.idGrupo = idGrupo;
        this.fecha = fecha;
        this.presentes = presentes;
        this.faltas = faltas;
        this.visitas = visitas;
    }

    public int getIdAsgrupo() {
        return idAsgrupo;
    }

    public void setIdAsgrupo(int idAsgrupo) {
        this.idAsgrupo = idAsgrupo;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
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
