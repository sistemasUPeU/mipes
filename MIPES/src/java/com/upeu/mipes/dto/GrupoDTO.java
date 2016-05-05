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
public class GrupoDTO {
    private int idGRUPO;
    private int idESCUELA;
    private String NOMBRE;
    private String Lugar_reunion;
    private String Fecha_creacion;
    private String Estado;
    
    public GrupoDTO() {
    }

    public GrupoDTO(String NOMBRE, String Lugar_reunion, String Fecha_creacion, String Estado) {
        this.NOMBRE = NOMBRE;
        this.Lugar_reunion = Lugar_reunion;
        this.Fecha_creacion = Fecha_creacion;
        this.Estado = Estado;
    }

    public int getIdGRUPO() {
        return idGRUPO;
    }

    public void setIdGRUPO(int idGRUPO) {
        this.idGRUPO = idGRUPO;
    }

    public int getIdESCUELA() {
        return idESCUELA;
    }

    public void setIdESCUELA(int idESCUELA) {
        this.idESCUELA = idESCUELA;
    }

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public String getLugar_reunion() {
        return Lugar_reunion;
    }

    public void setLugar_reunion(String Lugar_reunion) {
        this.Lugar_reunion = Lugar_reunion;
    }

    public String getFecha_creacion() {
        return Fecha_creacion;
    }

    public void setFecha_creacion(String Fecha_creacion) {
        this.Fecha_creacion = Fecha_creacion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
    
}
