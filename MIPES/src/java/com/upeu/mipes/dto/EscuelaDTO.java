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
public class EscuelaDTO {
    private int idEscuela;
    private int idDistritoM;
    private String Nombre;
    private String Estado;
    /*private String Fecha;
    private String Color;
    private String Lema;*/

    public EscuelaDTO() {
    }

    public EscuelaDTO(int idDistritoM, String Nombre, String Estado/*,String Fecha, String Color, String Lema*/) {
        this.idDistritoM = idDistritoM;
        this.Nombre = Nombre;
        this.Estado = Estado;
        /*this.Fecha = Fecha;
        this.Color = Color;
        this.Lema = Lema;*/
    }

    public int getIdEscuela() {
        return idEscuela;
    }

    public void setIdEscuela(int idEscuela) {
        this.idEscuela = idEscuela;
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

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    /*public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getLema() {
        return Lema;
    }

    public void setLema(String Lema) {
        this.Lema = Lema;
    }*/

}
