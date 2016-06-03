package com.upeu.mipes.dto;

/**
 *
 * @author Andrew
 */
public class AsistenciaDTO {
    
    private int idAsistencia;
    private String fecha;
    private int presentes;
    private int faltas;
    private int visitas;
    private String descripcion;
    private String lugar;

    public AsistenciaDTO() {
    }

    public AsistenciaDTO(String fecha, int presentes, int faltas, int visitas, String descripcion, String lugar) {
        this.fecha = fecha;
        this.presentes = presentes;
        this.faltas = faltas;
        this.visitas = visitas;
        this.descripcion = descripcion;
        this.lugar = lugar;
    }

    public int getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
    
    
}
