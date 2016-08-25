package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Andrew
 */
public class PersonaDAO implements CrudInterface {

    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private ResultSet rs;
    private Statement st;

    @Override
    public ArrayList<Map<String, ?>> listar() {
        sql = "SELECT * FROM PERSONA ORDER BY NOMBRES";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("idPersona", rs.getInt("idPERSONA"));
                p.put("nombres", rs.getString("NOMBRES"));
                p.put("apellidos", rs.getString("APELLIDOS"));
                p.put("telefono", rs.getString("TELEFONO"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Personas " + e);
            return null;
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> listar(int idPersona) {
        sql = "SELECT * FROM PERSONA WHERE IDPERSONA=" + idPersona;
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("idPersona", rs.getInt("idPERSONA"));
                p.put("nombres", rs.getString("NOMBRES"));
                p.put("apellidos", rs.getString("APELLIDOS"));
                p.put("telefono", rs.getString("TELEFONO"));
                p.put("direccion", rs.getString("DIRECCION"));
                p.put("fecha", rs.getDate("FE_NACIMIENTO"));
                p.put("correo", rs.getString("CORREO"));
                p.put("dni", rs.getString("DNI"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Listar Personas " + e);
            return null;
        }
        return lista;
    }

    public ArrayList<Map<String, ?>> getInfoGP(int idPersona) {
        sql = "{CALL GET_INFO_GP(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs=cn.prepareCall(sql);
            cs.setInt(1, idPersona);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("idmiembro", rs.getInt("idMIEMBROGP"));
                p.put("idpersona", rs.getInt("idPERSONA"));
                p.put("idgrupo", rs.getInt("IDGRUPO"));
                p.put("fe_union", rs.getDate("FE_UNION"));
                p.put("estado", rs.getString("ESTADO"));
                p.put("grupo", rs.getString("GRUPO"));
                if (rs.getInt("CARGO")==rs.getInt("IDPERSONA")) {
                    p.put("cargo", "Lider");
                }else{
                    p.put("cargo", "Miembro");
                }                
                p.put("escuela", rs.getString("ESCUELA"));
                p.put("iglesia", rs.getString("IGLESIA"));
                p.put("porcentaje", rs.getDouble("PORCENTAJE"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Get info GP " + e);
            return null;
        }
        return lista;
    }
    public ArrayList<Map<String, ?>> getInfoMI(int idPersona) {
        sql = "{CALL GET_INFO_MI(?)}";
        ArrayList<Map<String, ?>> lista = new ArrayList<>();
        try {
            cn = Conexion.getConexion();
            cs=cn.prepareCall(sql);
            cs.setInt(1, idPersona);
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("idmiembro", rs.getInt("idMIEMBROMI"));
                p.put("idpersona", rs.getInt("idPERSONA"));
                p.put("idministerio", rs.getInt("IDMINISTERIO"));
                p.put("fe_union", rs.getDate("FE_UNION"));
                p.put("estado", rs.getString("ESTADO"));
                p.put("ministerio", rs.getString("MINISTERIO"));
                p.put("cargo", rs.getString("CARGO"));
                p.put("iglesia", rs.getString("IGLESIA"));
                p.put("porcentaje", rs.getDouble("PORCENTAJE"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error al Get info Mi Personas " + e);
            return null;
        }
        return lista;
    }

    @Override
    public boolean add(Object o) {
        return false;
    }

    @Override
    public boolean edit(Object o) {
        boolean p = false;
        sql = "UPDATE PERSONA SET NOMBRES=?,APELLIDOS=? WHERE IDPERSONA=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("nombres").toString());
            ps.setString(2, m.get("apellidos").toString());
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Editar Persona " + e);
            p = false;
        }
        return p;
    }
    
    public boolean update(Object o) {
        boolean p = false;
        
        Map<String, Object> m = (Map<String, Object>) o;
        sql = "UPDATE PERSONA SET NOMBRES=?, APELLIDOS=?, DIRECCION=?,"
                + " CORREO=?, TELEFONO=?, DNI=?, FE_NACIMIENTO='"+m.get("fecha").toString()+"' WHERE idPERSONA=?";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("nombres").toString());
            ps.setString(2, m.get("apellidos").toString());
            ps.setString(3, m.get("direccion").toString());
            ps.setString(4, m.get("correo").toString());
            ps.setString(5, m.get("telefono").toString());
            ps.setString(6, m.get("dni").toString());
            ps.setInt(7, Integer.parseInt(m.get("idpersona").toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al Editar Persona " + e);
            p = false;
        }
        return p;
    }

    @Override
    public boolean delete(Object o) {
        boolean p = false;
        sql = "DELETE FROM PERSONA WHERE IDPERSONA=?";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(o.toString()));
            int r = ps.executeUpdate();
            if (r > 0) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error al Eliminar Persona " + e);
            p = false;
        }
        return p;
    }

    public ArrayList<Map<String, ?>> buscar(String nombres, String apellidos, String dni, int filtro) {
        ArrayList<Map<String, ?>> lista = new ArrayList<>();

        sql = "SELECT P.IDPERSONA, P.NOMBRES, P.APELLIDOS, P.DNI FROM PERSONA P ";
        if (filtro == 1) {
            sql = "SELECT P.IDPERSONA, P.NOMBRES, P.APELLIDOS, P.DNI FROM PERSONA P ";
            sql += "LEFT OUTER JOIN MIEMBROGP M ON P.IDPERSONA=M.IDPERSONA ";
            if (!nombres.equals("") || !apellidos.equals("") || !dni.equals("")) {
                sql += "WHERE ";
            } else {
                return lista;
            }
            if (!nombres.equals("")) {
                sql += " UPPER(P.NOMBRES) LIKE UPPER('%" + nombres + "%') ";
            }
            if (!apellidos.equals("")) {
                if (sql.endsWith("WHERE ")) {
                    sql += " UPPER(P.APELLIDOS) LIKE UPPER('%" + apellidos + "%') ";
                } else {
                    sql += "AND UPPER(P.APELLIDOS) LIKE UPPER('%" + apellidos + "%') ";
                }
            }
            if (!dni.equals("")) {
                if (sql.endsWith("WHERE ")) {
                    sql += " P.DNI LIKE('%" + dni + "%')";
                } else {
                    sql += "AND P.DNI LIKE('%" + dni + "%')";
                }
            }
            sql += "AND M.IDPERSONA IS NULL";
        } else if (filtro == 2) {
            sql = "SELECT P.IDPERSONA, P.NOMBRES, P.APELLIDOS, P.DNI FROM PERSONA P ";
            sql += "LEFT OUTER JOIN MIEMBROMI M ON P.IDPERSONA=M.IDPERSONA ";
            if (!nombres.equals("") || !apellidos.equals("") || !dni.equals("")) {
                sql += "WHERE ";
            } else {
                return lista;
            }
            if (!nombres.equals("")) {
                sql += " UPPER(P.NOMBRES) LIKE UPPER('%" + nombres + "%') ";
            }
            if (!apellidos.equals("")) {
                if (sql.endsWith("WHERE ")) {
                    sql += " UPPER(P.APELLIDOS) LIKE UPPER('%" + apellidos + "%') ";
                } else {
                    sql += "AND UPPER(P.APELLIDOS) LIKE UPPER('%" + apellidos + "%') ";
                }
            }
            if (!dni.equals("")) {
                if (sql.endsWith("WHERE ")) {
                    sql += " P.DNI LIKE('%" + dni + "%')";
                } else {
                    sql += "AND P.DNI LIKE('%" + dni + "%')";
                }
            }
            sql += "AND M.IDPERSONA IS NULL";
        } else if (filtro == 0) {
            sql = "SELECT P.IDPERSONA, P.NOMBRES, P.APELLIDOS, P.DNI FROM PERSONA P ";
            if (!nombres.equals("") || !apellidos.equals("") || !dni.equals("")) {
                sql += "WHERE ";
            } else {
                return lista;
            }
            if (!nombres.equals("")) {
                sql += " UPPER(P.NOMBRES) LIKE UPPER('%" + nombres + "%') ";
            }
            if (!apellidos.equals("")) {
                if (sql.endsWith("WHERE ")) {
                    sql += " UPPER(P.APELLIDOS) LIKE UPPER('%" + apellidos + "%') ";
                } else {
                    sql += "AND UPPER(P.APELLIDOS) LIKE UPPER('%" + apellidos + "%') ";
                }
            }
            if (!dni.equals("")) {
                if (sql.endsWith("WHERE ")) {
                    sql += " P.DNI LIKE('%" + dni + "%')";
                } else {
                    sql += "AND P.DNI LIKE('%" + dni + "%')";
                }
            }

        }
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            System.out.println(sql);
            while (rs.next()) {
                Map<String, Object> m = new HashMap<>();
                m.put("nya", rs.getString("NOMBRES") + " " + rs.getString("APELLIDOS"));
                m.put("dni", rs.getString("DNI"));
                m.put("idp", rs.getInt("IDPERSONA"));
                lista.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return lista;
        }
        return lista;
    }

    public int addPersona(Object o) {
        sql = "{CALL REG_PERSONA(?, ?, ?, ?, ?, ?, ?,?,?)}";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setString(1, m.get("nombres").toString());
            cs.setString(2, m.get("apellidos").toString());
            cs.setString(3, m.get("direccion").toString());
            cs.setString(4, m.get("correo").toString());
            cs.setString(5, m.get("telefono").toString());
            cs.setString(6, m.get("dni").toString());
            if (m.get("fecha").equals("undefined")||m.get("fecha").equals("")) {
                cs.setString(7, null);
            } else {
                cs.setString(7, m.get("fecha").toString());
            }
            System.out.println(m.get("fecha").toString()+"---");
            cs.setInt(8, Integer.parseInt(m.get("eslider").toString()));
            cs.setInt(9, Integer.parseInt(m.get("idtabla").toString()));
            rs = cs.executeQuery();
            while (rs.next()) {
                return rs.getInt("IDPERSONA");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al Agregar Persona " + e);
            return -1;
        }
        return -1;
    }

    public boolean regIdLider(int idPersona, int esLider, int idTabla) {
        sql = "{CALL REG_IDLIDER(?,?,?)}";
        if (esLider < 1) {
            return false;
        }
        try {
            cn = Conexion.getConexion();
            cs = cn.prepareCall(sql);
            cs.setInt(1, idPersona);
            cs.setInt(2, esLider);
            cs.setInt(3, idTabla);
            cs.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al Registrar Lider " + e);
            return false;
        }
    }

    public boolean valite(String dni) {
        sql = "SELECT * FROM persona WHERE DNI='" + dni + "'";
        boolean p = false;
        try {
            cn = Conexion.getConexion();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                p = true;
            }
        } catch (Exception e) {
            System.out.println("Error Validar Persona: " + e);
        }
        return p;
    }
}
