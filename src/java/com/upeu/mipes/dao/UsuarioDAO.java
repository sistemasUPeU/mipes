/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Leandro
 */
public class UsuarioDAO implements CrudInterface {

    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private String sql;

    public Map<String, Object> validarUser(String user, String pass) {
        Map<String, Object> r = new HashMap<>();
        sql = "{CALL login(?,?)}";
        try {

            cs = Conexion.getConexion().prepareCall(sql);
            cs.setString(1, user);
            cs.setString(2, pass);
            rs = cs.executeQuery();
            while (rs.next()) {
                r.put("idpersona", rs.getInt("IDPERSONA"));
                r.put("iduser", rs.getInt("IDUSUARIO"));
                r.put("nombres", rs.getString("NOMBRES"));
                r.put("apellidos", rs.getString("APELLIDOS"));
                r.put("usuario", rs.getString("USUARIO"));
                return r;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            Conexion.cerrar();
        }
        return r;
    }

    public boolean validar(String user, String pass) {
        sql = "SELECT COUNT(*) AS CANT FROM usuario WHERE USUARIO=? AND CLAVE=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt("CANT") > 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            Conexion.cerrar();
        }
        return false;
    }

    public boolean cambiarClave(String user, String pass, String neww) {
        sql = "UPDATE usuario SET CLAVE=? WHERE IDUSUARIO=? AND CLAVE=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(1, neww);
            ps.setInt(2, Integer.parseInt(user));
            ps.setString(3, pass);
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            Conexion.cerrar();
        }
    }

    public Map<String, Object> getIdLider(String idPersona) {
        Map<String, Object> r = new HashMap<>();
        sql = "{CALL get_idlider(?)}";
        try {
            cs = Conexion.getConexion().prepareCall(sql);
            cs.setInt(1, Integer.parseInt(idPersona));
            rs = cs.executeQuery();
            while (rs.next()) {
                r.put("idcampo", rs.getInt("IDCAMPO"));
                r.put("iddistrito", rs.getInt("IDDISTRITO"));
                r.put("idiglesia", rs.getInt("IDIGLESIA"));
                r.put("idescuela", rs.getInt("IDESCUELA"));
                r.put("idgrupo", rs.getInt("IDGRUPO"));
                r.put("idministerio", rs.getInt("IDMINISTERIO"));
                r.put("ncampo", rs.getString("NCAMPO"));
                r.put("ndistrito", rs.getString("NDISTRITO"));
                r.put("niglesia", rs.getString("NIGLESIA"));
                r.put("nescuela", rs.getString("NESCUELA"));
                r.put("ngrupo", rs.getString("NGRUPO"));
                r.put("nministerio", rs.getString("NMINISTERIO"));
                return r;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            Conexion.cerrar();
        }
        return r;
    }

    public String validaRol(String user) {
        sql = "{CALL pre_login(?)}";
        try {
            cs = Conexion.getConexion().prepareCall(sql);
            cs.setString(1, user);
            rs = cs.executeQuery();
            String r = "validar";
            List<String> roles = new ArrayList<>();
            List<String> claves = new ArrayList<>();
            while (rs.next()) {
                roles.add(rs.getString("NOMBRE"));
                claves.add(rs.getString("CLAVE"));
            }
            if (roles.isEmpty()) {
                return "error";
            }
            for (int i = 0; i < roles.size(); i++) {
                if (roles.size() == 1 && roles.get(i).toUpperCase().equals("MIEMBRO")) {
                    return claves.get(i);
                } else {
                    return r;
                }
            }
            return r;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return "error";
        } finally {
            Conexion.cerrar();
        }
    }

    public ArrayList<Map<String, Object>> getLinks(Object idPrivilegio) {
        ArrayList<Map<String, Object>> lista = new ArrayList<>();
        sql = "{CALL get_link(?)}";
        try {
            cs = Conexion.getConexion().prepareCall(sql);
            cs.setInt(1, Integer.parseInt(idPrivilegio.toString()));
            System.out.println(idPrivilegio);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> r = new HashMap<>();
                r.put("idprivilegio", rs.getInt("IDPRIVILEGIO"));
                r.put("nombrelink", rs.getString("NOMBRE"));
                r.put("link", rs.getString("LINK"));
                r.put("icon", rs.getString("ICON"));
                r.put("orden", rs.getString("ORDEN"));
                r.put("estado", rs.getString("ESTADO"));
                lista.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, Object>> getRol(Object idUser) {
        ArrayList<Map<String, Object>> lista = new ArrayList<>();
        sql = "{CALL pre_login(?)}";
        try {
            cs = Conexion.getConexion().prepareCall(sql);
            cs.setInt(1, Integer.parseInt(idUser.toString()));
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> r = new HashMap<>();
                r.put("nombrerol", rs.getString("NOMBRE"));
                lista.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, Object>> getPriv(Object idUser) {
        ArrayList<Map<String, Object>> lista = new ArrayList<>();
        sql = "{CALL get_priv(?)}";
        try {
            cs = Conexion.getConexion().prepareCall(sql);
            cs.setInt(1, Integer.parseInt(idUser.toString()));
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> r = new HashMap<>();
                r.put("idprivilegio", rs.getInt("IDPRIVILEGIO"));
                r.put("nombrep", rs.getString("NOMBRE"));
                r.put("icon", rs.getString("ICON"));
                r.put("estado", rs.getString("ESTADO"));
                lista.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

    public ArrayList<Map<String, Object>> listOrden(ArrayList<Map<String, Object>> lista, Object o) {
        ArrayList<Map<String, Object>> listaR = new ArrayList<>();
        for (int i = 0; i < lista.size(); i++) {
            if (lista.get(i).get("orden").toString().equals(o.toString())) {
                listaR.add(lista.get(i));
            }
        }
        return listaR;
    }

    @Override
    public ArrayList<Map<String, ?>> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Object o) {
        sql = "INSERT INTO usuario (idUSUARIO, idPERSONA, USUARIO, CLAVE, FE_CREACION, ESTADO)\n"
                + "VALUES(NULL, ?, (SELECT DNI FROM PERSONA WHERE IDPERSONA=?)"
                + ",(SELECT DNI FROM PERSONA WHERE IDPERSONA=?),\n"
                + "NOW(),'1')";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idpersona").toString()));
            ps.setInt(2, Integer.parseInt(m.get("idpersona").toString()));
            ps.setInt(3, Integer.parseInt(m.get("idpersona").toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al agregar Usuario " + e);
            return false;
        } finally {
            Conexion.cerrar();
        }
    }

    @Override
    public boolean edit(Object o) {
        sql = "UPDATE usuario SET USUARIO=?, CLAVE=?, ESTADO=? WHERE IDUSUARIO=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setString(1, m.get("usuario").toString());
            ps.setString(2, m.get("clave").toString());
            ps.setString(3, m.get("estado").toString());
            ps.setInt(4, Integer.parseInt(m.get("idusuario").toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al editar Usuario " + e);
            return false;
        } finally {
            Conexion.cerrar();
        }
    }

    @Override
    public boolean delete(Object o) {
        sql = "DELETE FROM usuario WHERE IDUSUARIO=?";
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(o.toString()));
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            System.out.println("Error al eliminar Usuario " + e);
            return false;
        } finally {
            Conexion.cerrar();
        }
    }

    public ArrayList<Map<String, ?>> listar(int idPersona) {
        sql = "SELECT P.NOMBRES, P.APELLIDOS, U.* FROM persona P,"
                + " usuario U WHERE P.IDPERSONA=U.IDPERSONA AND U.IDPERSONA=" + idPersona;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            ps = Conexion.getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> d = new HashMap<>();
                d.put("nombres", rs.getString("NOMBRES"));
                d.put("apellidos", rs.getString("APELLIDOS"));
                d.put("idusuario", rs.getInt("IDUSUARIO"));
                d.put("idpersona", rs.getInt("IDPERSONA"));
                d.put("usuario", rs.getString("USUARIO"));
                d.put("clave", rs.getString("CLAVE"));
                d.put("fe_creacion", rs.getString("FE_CREACION"));
                d.put("estado", rs.getString("ESTADO"));
                lista.add(d);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Usuarios " + e);
            return null;
        } finally {
            Conexion.cerrar();
        }
        return lista;
    }

}
