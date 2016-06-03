/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dto;

/**
 *
 * @author USER
 */
public class MinisterioDTO {
    private int idMinisterio;
    private int idDistritoM;
    private String Nombre;
    private String Descripcion;
    private String Estado;

    public MinisterioDTO() {
    }

    public MinisterioDTO(int idDistritoM, String Nombre, String Descripcion, String Estado) {
        this.idDistritoM = idDistritoM;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.Estado = Estado;
    }

    public int getIdMinisterio() {
        return idMinisterio;
    }

    public void setIdMinisterio(int idMinisterio) {
        this.idMinisterio = idMinisterio;
    }

    public int getIdDistritoM() {
        return idDistritoM;
    }

    public void setIdDistritoM(int idDistritoM) {
        this.idDistritoM = idDistritoM;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    
}
