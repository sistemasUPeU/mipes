package com.upeu.mipes.dto;

public class AsparejamDTO {
    
    private int idAsparejam;
    private int idParejam;
    private int idAsistencia;

    public AsparejamDTO() {
    }

    public AsparejamDTO(int idParejam, int idAsistencia) {
        this.idParejam = idParejam;
        this.idAsistencia = idAsistencia;
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

    public int getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
    }

    
}