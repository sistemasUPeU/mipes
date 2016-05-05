package com.upeu.mipes.dto;

public class Det_rolDTO {
    
    private int idRol;
    private int idUsuario;

    public Det_rolDTO() {
    }

    public Det_rolDTO(int idRol, int idUsuario) {
        this.idRol = idRol;
        this.idUsuario = idUsuario;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
}
