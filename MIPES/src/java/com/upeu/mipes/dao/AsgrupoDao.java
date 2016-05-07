package com.upeu.mipes.dao;

import com.upeu.mipes.dto.AsgrupoDTO;
import com.upeu.mipes.interfaces.CrudInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AsgrupoDao implements CrudInterface<AsgrupoDTO> {

    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;

    @Override
    public boolean agregar(AsgrupoDTO g) {
        sql = "INSERT INTO ASGRUPO (idASGRUPO, idGRUPO, FECHA, PRESENTES, FALTAS, VISITAS) VALUES(null,?,?,?,?,?)";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, g.getIdAsgrupo());
            ps.setInt(2, g.getIdGrupo());
            ps.setString(3, g.getFecha());
            ps.setInt(4, g.getPresentes());
            ps.setInt(5, g.getFaltas());
            ps.setInt(6, g.getVisitas());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al agregar Grupo " + e);
            return false;
        }
    }

    @Override
    public boolean editar(AsgrupoDTO g) {
        sql = "UPDATE TABLE ASGRUPO SET idASGRUPO=?, idGRUPO=?, FECHA=?, PRESENTES=?, FALTAS=?, VISITAS=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, g.getIdAsgrupo());
            ps.setInt(2, g.getIdGrupo());
            ps.setString(3, g.getFecha());
            ps.setInt(4, g.getPresentes());
            ps.setInt(5, g.getFaltas());
            ps.setInt(6, g.getVisitas());
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al editar Grupo " + e);
            return false;
        }
    }

    @Override
    public boolean eliminar(Object key) {
        sql = "DELETE FROM ASGRUPO WHERE idASGRUPO=?";
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(key.toString()));
            int r = ps.executeUpdate();
            cn.close();
            return (r > 0);
        } catch (Exception e) {
            System.out.println("Error al eliminar Grupo " + e);
            return false;
        }
    }

    @Override
    public ArrayList<AsgrupoDTO> listar() {
        ArrayList<AsgrupoDTO> list = new ArrayList<>();
        sql = "SELECT * FROM USUARIO";
        try {
            rs = cn.prepareStatement(sql).executeQuery();
            while (rs.next()) {
                AsgrupoDTO u = new AsgrupoDTO();
                u.setIdAsgrupo(rs.getInt("idASGRUPO"));
                u.setIdGrupo(rs.getInt("idGRUPO"));
                u.setFecha(rs.getString("FECHA"));
                u.setPresentes(rs.getInt("PRESENTES"));
                u.setFaltas(rs.getInt("FALTAS"));
                u.setVisitas(rs.getInt("VISITAS"));
                list.add(u);
            }
            cn.close();
        } catch (Exception e) {
            System.out.println("Error al listar Usuario " + e);
            return null;
        }
        return list;
    }

    @Override
    public AsgrupoDTO buscar(Object key) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
