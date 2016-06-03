
package com.upeu.mipes.dto;

public class LinkDTO {
    private int idLink;
    private String Link;
    private String Icon;
    private String Orden;
    private String Estado;

    public LinkDTO() {
    }

    public LinkDTO(String Link, String Icon, String Orden, String Estado) {
        this.Link = Link;
        this.Icon = Icon;
        this.Orden = Orden;
        this.Estado = Estado;
    }

    public int getIdLink() {
        return idLink;
    }

    public void setIdLink(int idLink) {
        this.idLink = idLink;
    }

    public String getLink() {
        return Link;
    }

    public void setLink(String Link) {
        this.Link = Link;
    }

    public String getIcon() {
        return Icon;
    }

    public void setIcon(String Icon) {
        this.Icon = Icon;
    }

    public String getOrden() {
        return Orden;
    }

    public void setOrden(String Orden) {
        this.Orden = Orden;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
}
