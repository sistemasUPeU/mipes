package com.upeu.mipes.dto;

/**
 *
 * @author Andrew
 */
public class Det_Int_GPDTO {
    
    private int idDet_IntGP;
    private int idPersona;
    private int idGrupo;
    private String fechaUeunion;

    public Det_Int_GPDTO() {
    }

    public Det_Int_GPDTO(int idPersona, int idGrupo, String fechaReunion) {
        this.idPersona = idPersona;
        this.idGrupo = idGrupo;
        this.fechaUeunion = fechaReunion;
    }

    public int getIdDet_IntGP() {
        return idDet_IntGP;
    }

    public void setIdDet_IntGP(int idDet_IntGP) {
        this.idDet_IntGP = idDet_IntGP;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public String getFechaReunion() {
        return fechaUeunion;
    }

    public void setFechaReunion(String fechaReunion) {
        this.fechaUeunion = fechaReunion;
    }
    
    
}
