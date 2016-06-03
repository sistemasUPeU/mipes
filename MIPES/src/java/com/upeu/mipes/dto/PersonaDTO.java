
package com.upeu.mipes.dto;

public class PersonaDTO {
    private int idPersona;
    private int idCargo;
    private String Nombres;
    private String Apellidos;
    private String Direccion;
    private String Telefono;
    private String Fe_nacimiento;
    private String Fe_bautizmo;
    private String Sexo;
    private String Dni;
    private String Ocupacion;

    public PersonaDTO() {
    }

    public PersonaDTO(int idCargo, String Nombres, String Apellidos, String Direccion, String Telefono, String Fe_nacimiento, String Fe_bautizmo, String Sexo, String Dni, String Ocupacion) {
        this.idCargo = idCargo;
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Fe_nacimiento = Fe_nacimiento;
        this.Fe_bautizmo = Fe_bautizmo;
        this.Sexo = Sexo;
        this.Dni = Dni;
        this.Ocupacion = Ocupacion;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
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

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getFe_nacimiento() {
        return Fe_nacimiento;
    }

    public void setFe_nacimiento(String Fe_nacimiento) {
        this.Fe_nacimiento = Fe_nacimiento;
    }

    public String getFe_bautizmo() {
        return Fe_bautizmo;
    }

    public void setFe_bautizmo(String Fe_bautizmo) {
        this.Fe_bautizmo = Fe_bautizmo;
    }

    public String getSexo() {
        return Sexo;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }

    public String getDni() {
        return Dni;
    }

    public void setDni(String Dni) {
        this.Dni = Dni;
    }

    public String getOcupacion() {
        return Ocupacion;
    }

    public void setOcupacion(String Ocupacion) {
        this.Ocupacion = Ocupacion;
    }
    
    
    
}
