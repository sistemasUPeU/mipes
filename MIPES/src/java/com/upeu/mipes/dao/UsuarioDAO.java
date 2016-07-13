package com.upeu.mipes.dao;

import com.upeu.mipes.config.Conexion;
import static com.upeu.mipes.config.Conexion.getConexion;
import com.upeu.mipes.dto.UsuarioDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andres
 */
public class UsuarioDAO implements CrudInterface<UsuarioDTO> {

    private Connection cn;
    private PreparedStatement ps;
    private CallableStatement cs;
    private Statement st;
    private ResultSet rs;
    private String sql;

    public Map<String, Object> validarUser(String user, String pass) {
        Map<String, Object> r= new HashMap<>();
        sql = "{CALL LOGIN(?,?)}";
        try {
            cn = Conexion.getConexion();
            cs= cn.prepareCall(sql);
            cs.setString(1, user);
            cs.setString(2, pass);
            rs = cs.executeQuery();
            while (rs.next()) {
                r.put("idpersona", rs.getInt("IDPERSONA"));
                r.put("iduser", rs.getInt("IDUSUARIO"));
                r.put("idfoto", rs.getInt("IDFOTO"));
                r.put("nombres", rs.getString("NOMBRES"));
                r.put("apellidos", rs.getString("APELLIDOS"));
                r.put("usuario", rs.getString("USUARIO"));
                r.put("nomfoto", rs.getString("NOMBRE_FOTO"));
                r.put("linkfoto", rs.getString("LINK"));
                return r;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return r;
    }
    
    public ArrayList<Map<String, Object>> getLinks(Object idPrivilegio) {
        ArrayList<Map<String, Object>> lista= new ArrayList<>();
        sql = "{CALL GET_LINK(?)}";
        try {
            cn = Conexion.getConexion();
            cs= cn.prepareCall(sql);
            cs.setInt(1, Integer.parseInt(idPrivilegio.toString()));
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> r= new HashMap<>();
                r.put("idlink", rs.getInt("IDLINK"));
                r.put("idprivilegio", rs.getInt("IDPRIVILEGIO"));
                r.put("nombrelink", rs.getString("NOMBRE_LINK"));
                r.put("link", rs.getString("LINK"));
                r.put("icon", rs.getString("ICON"));
                r.put("orden", rs.getString("ORDEN"));
                r.put("estado", rs.getString("ESTADO"));
                lista.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return lista;
    }
    
    public ArrayList<Map<String, Object>> getPriv(Object idUser) {
        ArrayList<Map<String, Object>> lista= new ArrayList<>();
        sql = "{CALL GET_PRIV(?)}";
        try {
            cn = Conexion.getConexion();
            cs= cn.prepareCall(sql);
            cs.setInt(1, Integer.parseInt(idUser.toString()));
            rs = cs.executeQuery();
            while (rs.next()) {
                Map<String, Object> r= new HashMap<>();
                r.put("idprivilegio", rs.getInt("IDPRIVILEGIO"));
                r.put("nombrep", rs.getString("NOMBRE"));
                r.put("icon", rs.getString("ICON"));
                r.put("estado", rs.getString("ESTADO"));
                lista.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return lista;
    }

    @Override
    public boolean agregar(UsuarioDTO u) {
        sql = "INSERT INTO USUARIO (idUSUARIO,idPERSONA, USUARIO, CLAVE, ESTADO) VALUES(" + u.getIdUsuario() + "," + u.getIdPersona() + ",'" + u.getUsuario() + "','" + u.getClave() + "','" + u.getEstado() + "')";
        boolean a = false;
        try {
            cn = Conexion.getConexion();
            st = cn.createStatement();
            int b = st.executeUpdate(sql);
            if (b > 0) {
                a = true;
            }

        } catch (SQLException e) {
            System.out.println("Error al insertar Usuario " + e);

        }
        return a;
    }

    @Override
    public boolean editar(UsuarioDTO u) {
        sql = "UPDATE TABLE USUARIO SET USUARIO=?, CLAVE=?, ESTADO=? WHERE idUSUARIO=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, u.getUsuario());
            ps.setString(2, u.getClave());
            ps.setString(3, u.getEstado());
            ps.setInt(4, u.getIdUsuario());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (SQLException e) {
            System.out.println("Error al editar Usuario " + e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql = "DELETE FROM USUARIO WHERE idUSUARIO=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Error al eliminar Usuario " + e);
            return false;
        }
    }

    @Override
    public ArrayList<UsuarioDTO> listar() {
        ArrayList<UsuarioDTO> list = new ArrayList<>();
        sql = "SELECT * FROM USUARIO";
        try {
            rs = cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {
                UsuarioDTO u = new UsuarioDTO();
                u.setIdUsuario(rs.getInt("idUSUARIO"));
                u.setUsuario(rs.getString("USUARIO"));
                u.setClave(rs.getString("CLAVE"));
                u.setEstado(rs.getString("ESTADO"));
                list.add(u);
            }
            cn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar Usuario " + e);
            return null;
        }
        return list;
    }

    @Override
    public UsuarioDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean validar(String user,String pass){
        boolean m = false;
        sql = "select * from usuario where USUARIO=? and CLAVE=?";
        try {
            cn = Conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                m = true;
            }
        } catch (Exception e) {
            System.out.println("Usuario no registrado "+e);
        }
        return m;
    }
    
    public static ResultSet listaDistritos(String consulta)  {

        ResultSet rst = null;
        PreparedStatement psm = null;
        try {
            psm = getConexion().prepareStatement(consulta);
            rst = psm.executeQuery();
        } catch (Exception e) {
        }
        return rst;
    }

}
