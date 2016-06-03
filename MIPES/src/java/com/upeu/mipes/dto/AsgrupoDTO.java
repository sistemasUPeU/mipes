package com.upeu.mipes.dto;

public class AsgrupoDTO {
    
    private int idAsgrupo;
    private int idGrupo;
    private int idAsistencia;

    public AsgrupoDTO() {
    }
    public AsgrupoDTO(int idGrupo, int idAsistencia) {
        this.idGrupo = idGrupo;
        this.idAsistencia = idAsistencia;
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

    public int getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
    }
    

    

    
}