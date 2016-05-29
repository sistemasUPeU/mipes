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
public class IntegranteDTO {

    private int idIntegrante;
    private int idGrupo;
    private int idCargo;
    private int idMinisterio;
    private String Nombre;
    private String Apellidos;
    private String Direccion;
    private String Email;
    private String Telefono;
    private String Fecha_nacimiento;
    private String Fecha_bautizmo;
    private String Estado;
    private String sexo;
    private String dni;
    
    public IntegranteDTO() {
    }

    public IntegranteDTO(String Nombre, String Apellidos, String Direccion, String Email, String Telefono, String Fecha_nacimiento, String Fecha_bautizmo, String Estado, String sexo, String dni) {
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.Direccion = Direccion;
        this.Email = Email;
        this.Telefono = Telefono;
        this.Fecha_nacimiento = Fecha_nacimiento;
        this.Fecha_bautizmo = Fecha_bautizmo;
        this.Estado = Estado;
        this.sexo = sexo;
        this.dni = dni;
    }

    
    public int getIdIntegrante() {
        return idIntegrante;
    }

    public void setIdIntegrante(int idIntegrante) {
        this.idIntegrante = idIntegrante;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    public int getIdMinisterio() {
        return idMinisterio;
    }

    public void setIdMinisterio(int idMinisterio) {
        this.idMinisterio = idMinisterio;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getFecha_nacimiento() {
        return Fecha_nacimiento;
    }

    public void setFecha_nacimiento(String Fecha_nacimiento) {
        this.Fecha_nacimiento = Fecha_nacimiento;
    }

    public String getFecha_bautizmo() {
        return Fecha_bautizmo;
    }

    public void setFecha_bautizmo(String Fecha_bautizmo) {
        this.Fecha_bautizmo = Fecha_bautizmo;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }
    
    
    
}
