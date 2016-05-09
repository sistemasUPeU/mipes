package com.upeu.mipes.dto;

public class Det_privilegioDTO {
    
    private int idPrivilegio;
    private int idRol;

    public Det_privilegioDTO() {
    }

    public Det_privilegioDTO(int idRol) {
        this.idRol = idRol;
    }

    public int getIdPrivilegio() {
        return idPrivilegio;
    }

    public void setIdPrivilegio(int idPrivilegio) {
        this.idPrivilegio = idPrivilegio;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }
    
    
}
