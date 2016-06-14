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
    private String nombre;
    private String fecha_creacion;
    private String color;
    private String canto;
    private String lema;
    private String versiculo;
    private String calificacion;
    private String tipoIntegrante;
    private String lugar_reunion;
    private String dia_reunion;
    private String hora_reunion;
    private String estado;
    
    public GrupoDTO() {
    }

    public GrupoDTO(int idESCUELA, String nombre, String fecha_creacion, String color, String canto, String lema, String versiculo, String calificacion, String tipoIntegrante, String lugar_reunion, String dia_reunion, String hora_reunion, String estado) {
        this.idESCUELA = idESCUELA;
        this.nombre = nombre;
        this.fecha_creacion = fecha_creacion;
        this.color = color;
        this.canto = canto;
        this.lema = lema;
        this.versiculo = versiculo;
        this.calificacion = calificacion;
        this.tipoIntegrante = tipoIntegrante;
        this.lugar_reunion = lugar_reunion;
        this.dia_reunion = dia_reunion;
        this.hora_reunion = hora_reunion;
        this.estado = estado;
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCanto() {
        return canto;
    }

    public void setCanto(String canto) {
        this.canto = canto;
    }

    public String getLema() {
        return lema;
    }

    public void setLema(String lema) {
        this.lema = lema;
    }

    public String getVersiculo() {
        return versiculo;
    }

    public void setVersiculo(String versiculo) {
        this.versiculo = versiculo;
    }

    public String getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    public String getTipoIntegrante() {
        return tipoIntegrante;
    }

    public void setTipoIntegrante(String tipoIntegrante) {
        this.tipoIntegrante = tipoIntegrante;
    }

    public String getLugar_reunion() {
        return lugar_reunion;
    }

    public void setLugar_reunion(String lugar_reunion) {
        this.lugar_reunion = lugar_reunion;
    }

    public String getDia_reunion() {
        return dia_reunion;
    }

    public void setDia_reunion(String dia_reunion) {
        this.dia_reunion = dia_reunion;
    }

    public String getHora_reunion() {
        return hora_reunion;
    }

    public void setHora_reunion(String hora_reunion) {
        this.hora_reunion = hora_reunion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}
