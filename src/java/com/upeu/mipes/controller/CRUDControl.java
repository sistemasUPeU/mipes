/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.google.gson.Gson;
import com.upeu.mipes.dao.CampoDAO;
import com.upeu.mipes.dao.DiscipuladorDAO;
import com.upeu.mipes.dao.DistritoDAO;
import com.upeu.mipes.dao.EscuelaDAO;
import com.upeu.mipes.dao.GrupoDAO;
import com.upeu.mipes.dao.IglesiaDAO;
import com.upeu.mipes.dao.LeccionDAO;
import com.upeu.mipes.dao.MiembroGpDAO;
import com.upeu.mipes.dao.MiembroMiDAO;
import com.upeu.mipes.dao.MinisterioDAO;
import com.upeu.mipes.dao.PersonaDAO;
import com.upeu.mipes.dao.RolDAO;
import com.upeu.mipes.dao.StringTools;
import com.upeu.mipes.dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class CRUDControl extends HttpServlet {

    private static final long serialVersionUID = 1L;

    Map<String, Object> mp = new HashMap<>();
    //DAOS
    CampoDAO cA = new CampoDAO();
    DistritoDAO dA = new DistritoDAO();
    IglesiaDAO iA = new IglesiaDAO();
    EscuelaDAO eA = new EscuelaDAO();
    GrupoDAO gA = new GrupoDAO();
    MinisterioDAO mA = new MinisterioDAO();
    PersonaDAO pA = new PersonaDAO();
    UsuarioDAO uA = new UsuarioDAO();
    RolDAO rA = new RolDAO();
    MiembroGpDAO mgpA = new MiembroGpDAO();
    MiembroMiDAO mmiA = new MiembroMiDAO();
    DiscipuladorDAO diA = new DiscipuladorDAO();
    LeccionDAO lA = new LeccionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int opc = Integer.parseInt(request.getParameter("opc"));
        String ent = request.getParameter("ent");
        try {
            //campo
            if (ent.equals("campo")) {
                Map<String, Object> c = new HashMap<>();
                String nombre = "";
                int idcampo = 0;
                int idlider = 0;
                int key = 0;
                switch (opc) {
                    case 1://listar
                        ArrayList<Map<String, ?>> lista = cA.listar();
                        mp.put("lista", lista);
                        break;
                    case 2://crear
                        nombre = request.getParameter("nombre").toUpperCase();
                        c.put("idlider", 0);
                        c.put("nombre", nombre);
                        c.put("estado", 1);
                        mp.put("campo", cA.add(c));
                        break;
                    case 3://editar
                        idcampo = Integer.parseInt(request.getParameter("idcampo"));
                        nombre = request.getParameter("nombre").toUpperCase();
                        c.put("idcampo", idcampo);
                        c.put("nombre", nombre);
                        mp.put("respuesta", cA.edit(c));
                        break;
                    case 4://eliminar
                        idcampo = Integer.parseInt(request.getParameter("idcampo"));
                        mp.put("respuesta", cA.delete(idcampo));
                        break;
                    case 5:
                        idcampo = Integer.parseInt(request.getParameter("idcampo"));
                        mp.put("respuesta", cA.desactivar(idcampo));
                        break;
                    case 6:
                        idcampo = Integer.parseInt(request.getParameter("idcampo"));
                        mp.put("respuesta", cA.activar(idcampo));
                        break;
                    case 7:
                        key = Integer.parseInt(request.getParameter("lider"));
                        idcampo = Integer.parseInt(request.getParameter("idcampo"));
                        mp.put("anex", pA.regIdLider(key, 1, idcampo));
                        break;
                    case 8:
                        idcampo = Integer.parseInt(request.getParameter("idcampo"));
                        ArrayList<Map<String, ?>> listau = cA.listarun(idcampo);
                        mp.put("lista", listau);
                        break;
                }
            }
            //distrito
            if (ent.equals("distrito")) {
                Map<String, Object> d = new HashMap<>();
                String nombre = "";
                String estado = "";
                String idlider = "";
                int idDistrito = 0;
                int idCampo = 0;
                switch (opc) {
                    case 1://listar
                        idCampo = Integer.parseInt(request.getParameter("idcampo"));
                        ArrayList<Map<String, ?>> lista = dA.listar(idCampo);
                        mp.put("lista", lista);
                        break;
                    case 2: //Agregar
                        idCampo = Integer.parseInt(request.getParameter("idcampo"));
                        nombre = request.getParameter("nombre");
                        idlider = request.getParameter("idlider");
                        d.put("idlider", idlider);
                        d.put("idcampo", idCampo);
                        d.put("nombre", nombre);
                        d.put("estado", 1);
                        mp.put("result", dA.add(d));
                        break;
                    case 3://Editar
                        nombre = request.getParameter("nombre");
                        estado = request.getParameter("estado");
                        idDistrito = Integer.parseInt(request.getParameter("iddistrito"));
                        d.put("nombre", nombre);
                        d.put("estado", estado);
                        d.put("iddistrito", idDistrito);
                        mp.put("result", dA.edit(d));
                        break;
                    case 4: //Eliminar
                        idDistrito = Integer.parseInt(request.getParameter("iddistrito"));
                        mp.put("result", dA.delete(idDistrito));
                        break;
                    case 5:
                        idCampo = Integer.parseInt(request.getParameter("idcampo"));
                        ArrayList<Map<String, ?>> listad = dA.listar(idCampo);
                        mp.put("lista", listad);
                        break;
                    case 6://Asignar Lider
                        idDistrito = Integer.parseInt(request.getParameter("iddistrito"));
                        idlider = request.getParameter("idlider");
                        mp.put("result", pA.regIdLider(Integer.parseInt(idlider), 2, idDistrito));
                        break;
                }
            }
            //Iglesia
            if (ent.equals("iglesia")) {
                Map<String, Object> i = new HashMap<>();
                String nombre = "";
                int iddis = 0;
                int idiglesia = 0;
                int key = 0;
                switch (opc) {
                    case 1://listar
                        iddis = Integer.parseInt(request.getParameter("iddis"));
                        ArrayList<Map<String, ?>> lista = iA.lista(iddis);
                        mp.put("lista", lista);
                        break;
                    case 2://crear
                        iddis = Integer.parseInt(request.getParameter("iddis"));
                        nombre = request.getParameter("nombre").toUpperCase();
                        i.put("iddis", iddis);
                        i.put("nombre", nombre);
                        mp.put("iglesia", iA.add(i));
                        break;
                    case 3://editar
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        nombre = request.getParameter("nombre").toUpperCase();
                        i.put("id", idiglesia);
                        i.put("nombre", nombre);
                        mp.put("respuesta", iA.edit(i));
                        break;
                    case 4://eliminar
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        mp.put("respuesta", iA.delete(idiglesia));
                        break;
                    case 5:
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        mp.put("respuesta", iA.desactivar(idiglesia));
                        break;
                    case 6:
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        mp.put("respuesta", iA.activar(idiglesia));
                        break;
                    case 7:
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        ArrayList<Map<String, ?>> listau = iA.listaun(idiglesia);
                        mp.put("lista", listau);
                        break;
                    case 8:
                        key = Integer.parseInt(request.getParameter("lider"));
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        mp.put("anex", pA.regIdLider(key, 3, idiglesia));
                        break;
                    case 9:
                        iddis = Integer.parseInt(request.getParameter("iddis"));
                        ArrayList<Map<String, ?>> listaD = iA.listaDis(iddis);
                        mp.put("lista", listaD);
                        break;

                }
            }
            if (ent.equals("escuela")) {//Escuela Sabatica
                Map<String, Object> e = new HashMap<>();
                String nombre = "";
                String estado = "";
                int idEscuela = 0;
                int idIglesia = 0;
                switch (opc) {
                    case 1://Listar
                        idIglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        ArrayList<Map<String, ?>> lista = eA.listar(idIglesia);
                        mp.put("lista", lista);
                        break;
                    case 2://Agregar
                        nombre = request.getParameter("nombre");
                        estado = "1";
                        idIglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        e.put("nombre", nombre);
                        e.put("estado", estado);
                        e.put("idiglesia", idIglesia);
                        mp.put("result", eA.add(e));
                        break;
                    case 3://Editar
                        nombre = request.getParameter("nombre");
                        estado = request.getParameter("estado");
                        idEscuela = Integer.parseInt(request.getParameter("idescuela"));
                        e.put("nombre", nombre);
                        e.put("estado", estado);
                        e.put("idescuela", idEscuela);
                        mp.put("result", eA.edit(e));
                        break;
                    case 4://Eliminar
                        idEscuela = Integer.parseInt(request.getParameter("idescuela"));
                        e.put("idescuela", idEscuela);
                        mp.put("result", eA.delete(e));
                        break;
                }
            }
            if (ent.equals("grupo")) {//GRUPO P.
                Map<String, Object> g = new HashMap<>();
                String nombre = "";
                String fecha = "";
                String lugar = "";
                int idescuela = 0;
                int idgrupo = 0;
                int key = 0;
                int uscreador = 0;
                switch (opc) {
                    case 1://listar
                        idescuela = Integer.parseInt(request.getParameter("idescuela"));
                        ArrayList<Map<String, ?>> lista = gA.lista(idescuela);
                        mp.put("lista", lista);
                        break;
                    case 2://crear
                        idescuela = Integer.parseInt(request.getParameter("idescuela"));
                        nombre = request.getParameter("nombre").toUpperCase();
                        lugar = request.getParameter("lugar").toUpperCase();
                        uscreador = Integer.parseInt(request.getParameter("uscreador"));
                        g.put("idescuela", idescuela);
                        g.put("nombre", nombre);
                        g.put("usuario", uscreador);
                        g.put("lugar", lugar);
                        g.put("estado", 1);
                        mp.put("grupo", gA.add(g));
                        break;
                    case 3://editar
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        nombre = request.getParameter("nombre").toUpperCase();
                        g.put("id", idgrupo);
                        g.put("nombre", nombre);
                        mp.put("respuesta", gA.edit(g));
                        break;
                    case 4://eliminar
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        mp.put("respuesta", gA.delete(idgrupo));
                        break;
                    case 5:
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        mp.put("respuesta", gA.desactivar(idgrupo));
                        break;
                    case 6:
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        mp.put("respuesta", gA.activar(idgrupo));
                        break;
                    case 7:
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        ArrayList<Map<String, ?>> listau = gA.listaun(idgrupo);
                        mp.put("lista", listau);
                        break;
                    case 8:
                        key = Integer.parseInt(request.getParameter("lider"));
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        mp.put("anex", pA.regIdLider(key, 5, idgrupo));
                        break;
                }
            }
            //MINISTERIO
            if (ent.equals("ministerio")) {
                Map<String, Object> m = new HashMap<>();
                int idminis = 0;
                int idiglesia = 0;
                int key = 0;
                int uscreador = 0;
                String nombre = "";
                String fecha = "";
                switch (opc) {
                    case 1://Listar
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        ArrayList<Map<String, ?>> lista = mA.lista(idiglesia);
                        mp.put("lista", lista);
                        break;
                    case 2://EDITAR
                        idminis = Integer.parseInt(request.getParameter("idministerio"));
                        nombre = request.getParameter("nombre").toUpperCase();
                        m.put("nombre", nombre);
                        m.put("idministerio", idminis);
                        mp.put("respuesta", mA.edit(m));
                        break;
                    case 3://Crear
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        nombre = request.getParameter("nombre").toUpperCase();
                        //fecha = request.getParameter("fecha");
                        uscreador = Integer.parseInt(request.getParameter("uscreador"));
                        m.put("idiglesia", idiglesia);
                        m.put("nombre", nombre);
                        //m.put("fecha", fecha);
                        m.put("idlider", 0);
                        m.put("usuario", uscreador);
                        m.put("estado", 1);
                        mp.put("ministerio", mA.add(m));
                        break;
                    case 4://eliminar
                        idminis = Integer.parseInt(request.getParameter("idministerio"));
                        mp.put("respuesta", mA.delete(idminis));
                        break;
                    case 5:
                        idminis = Integer.parseInt(request.getParameter("idministerio"));
                        mp.put("respuesta", mA.desactivar(idminis));
                        break;
                    case 6:
                        idminis = Integer.parseInt(request.getParameter("idministerio"));
                        mp.put("respuesta", mA.activar(idminis));
                        break;
                    case 7:
                        idminis = Integer.parseInt(request.getParameter("idministerio"));
                        ArrayList<Map<String, ?>> listau = mA.listaun(idminis);
                        mp.put("lista", listau);
                        break;
                    case 8:
                        key = Integer.parseInt(request.getParameter("lider"));
                        idminis = Integer.parseInt(request.getParameter("idministerio"));
                        mp.put("anex", pA.regIdLider(key, 6, idminis));
                        break;
                }
            }
            //INTEGRANTE GP
            if (ent.equals("intgp")) {
                int idgrupo = 0;
                int idescuela = 0;
                int idiglesia = 0;
                int iddistrito = 0;
                int idpersona = 0;
                int idregistro = 0;
                switch (opc) {
                    case 1://LISTAR
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        ArrayList<Map<String, ?>> lista = mgpA.lista(idgrupo);
                        mp.put("lista", lista);
                        break;
                    case 2://AGREGAR
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        idpersona = Integer.parseInt(request.getParameter("idpersona"));
                        mp.put("respuesta", mgpA.AddIntg(idpersona, idgrupo));
                        break;
                    case 3://COMPROBAR QUE EL MIEMBRO NO ESTE EN OTRO GRUPO
                        idpersona = Integer.parseInt(request.getParameter("idpersona"));
                        ArrayList<Map<String, ?>> listar = mgpA.EstIntGP(idpersona);
                        mp.put("lista", listar);
                        break;
                    case 4://QUITAR PERSONA DE UN GRUPO
                        idregistro = Integer.parseInt(request.getParameter("idregistro"));
                        mp.put("respuesta", mgpA.desvincular(idregistro));
                        break;
                    case 7:
                        idescuela = Integer.parseInt(request.getParameter("idescuela"));
                        ArrayList<Map<String, ?>> listaes = mgpA.listaES(idescuela);
                        mp.put("lista", listaes);
                        break;
                    case 8:
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        ArrayList<Map<String, ?>> listaig = mgpA.listaIG(idiglesia);
                        mp.put("lista", listaig);
                        break;
                    case 9:
                        iddistrito = Integer.parseInt(request.getParameter("iddistrito"));
                        ArrayList<Map<String, ?>> listadis = mgpA.listaDis(iddistrito);
                        mp.put("lista", listadis);
                        break;

                }
            }
            if (ent.equals("intmin")) {
                int idministerio = 0;
                int idiglesia = 0;
                int iddistrito = 0;
                int idpersona = 0;
                int idregistro = 0;
                switch (opc) {
                    case 1://LISTAR
                        idministerio = Integer.parseInt(request.getParameter("idministerio"));
                        ArrayList<Map<String, ?>> lista = mmiA.lista(idministerio);
                        mp.put("lista", lista);
                        break;
                    case 2://AGREGAR
                        idministerio = Integer.parseInt(request.getParameter("idministerio"));
                        idpersona = Integer.parseInt(request.getParameter("idpersona"));
                        mp.put("respuesta", mmiA.AddIntg(idpersona, idministerio));
                        break;
                    case 3://COMPROBAR QUE EL MIEMBRO NO ESTE EN OTRO GRUPO
                        idpersona = Integer.parseInt(request.getParameter("idpersona"));
                        ArrayList<Map<String, ?>> listar = mmiA.EstIntGP(idpersona);
                        mp.put("lista", listar);
                        break;
                    case 4://QUITAR PERSONA DE UN GRUPO
                        idregistro = Integer.parseInt(request.getParameter("idregistro"));
                        mp.put("respuesta", mmiA.desvincular(idregistro));
                        break;
                    case 5:
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        ArrayList<Map<String, ?>> listaig = mmiA.listaIG(idiglesia);
                        mp.put("lista", listaig);
                        break;
                    case 6:
                        iddistrito = Integer.parseInt(request.getParameter("iddistrito"));
                        ArrayList<Map<String, ?>> listadis = mmiA.listaDis(iddistrito);
                        mp.put("lista", listadis);
                        break;
                }
            }
            //Persona
            if (ent.equals("pers")) {
                Map<String, Object> per = new HashMap<>();
                String usuario = "", nombre = "", apellidos = "", eslider = "", idtabla = "",
                        direccion = "", correo = "", telefono = "", dni = "", fecha = "";
                switch (opc) {
                    case 1://Login
                        usuario = request.getParameter("dni");
                        if (!usuario.equals("")) {
                            mp.put("dni", pA.valite(usuario));
                        }
                        break;
                    case 2://listar
                        int idp = Integer.parseInt(request.getParameter("idpersona"));
                        mp.put("lista", pA.listar(idp));
                        break;
                    case 3://crear
                        System.out.println("dsfsdf");
                        nombre = request.getParameter("nombres").toUpperCase();
                        apellidos = request.getParameter("apellidos").toUpperCase();
                        direccion = request.getParameter("direccion").toUpperCase();
                        correo = request.getParameter("correo");
                        telefono = request.getParameter("telefono");
                        dni = request.getParameter("dni");
                        fecha = request.getParameter("fecha");
                        eslider = request.getParameter("eslider");
                        idtabla = request.getParameter("idtabla");
                        if (StringTools.validateString(eslider)) {
                            per.put("eslider", eslider);
                        } else {
                            per.put("eslider", 0);
                        }
                        if (StringTools.validateString(idtabla)) {
                            per.put("idtabla", idtabla);
                        } else {
                            per.put("idtabla", 0);
                        }
                        per.put("nombres", nombre);
                        per.put("apellidos", apellidos);
                        per.put("direccion", direccion);
                        per.put("correo", correo);
                        per.put("telefono", telefono);
                        per.put("dni", dni);
                        per.put("fecha", fecha);
                        mp.put("result", pA.addPersona(per));
                        break;
                    case 4://info grupo
                        idp = Integer.parseInt(request.getParameter("idpersona"));
                        mp.put("lista", pA.getInfoGP(idp));
                        break;
                    case 5://Info MI
                        idp = Integer.parseInt(request.getParameter("idpersona"));
                        mp.put("lista", pA.getInfoMI(idp));
                        break;
                    case 6://Editar
                        idp = Integer.parseInt(request.getParameter("idpersona"));
                        nombre = request.getParameter("nombres");
                        apellidos = request.getParameter("apellidos");
                        direccion = request.getParameter("direccion");
                        correo = request.getParameter("correo");
                        telefono = request.getParameter("telefono");
                        dni = request.getParameter("dni");
                        fecha = request.getParameter("fecha");
                        per.put("nombres", nombre);
                        per.put("idpersona", idp);
                        per.put("apellidos", apellidos);
                        per.put("direccion", direccion);
                        per.put("correo", correo);
                        per.put("telefono", telefono);
                        per.put("dni", dni);
                        per.put("fecha", fecha);
                        mp.put("result", pA.update(per));
                        break;
                }
            }
            //USUARIO
            if (ent.equals("usuario")) {
                Map<String, Object> user = new HashMap<>();
                int idPersona = 0;
                int idUsuario = 0;
                String usuario = null;
                String clave = null;
                String estado = null;
                switch (opc) {
                    case 1://Listar
                        idPersona = Integer.parseInt(request.getParameter("idpersona"));
                        ArrayList<Map<String, ?>> lista = uA.listar(idPersona);
                        mp.put("lista", lista);
                        break;
                    case 2: //Agregar
                        idPersona = Integer.parseInt(request.getParameter("idpersona"));
                        user.put("idpersona", idPersona);
                        mp.put("result", uA.add(user));
                        break;
                    case 3://Editar
                        idUsuario = Integer.parseInt(request.getParameter("idusuario"));
                        usuario = request.getParameter("usuario");
                        clave = request.getParameter("clave");
                        estado = request.getParameter("estado");
                        user.put("usuario", usuario);
                        user.put("clave", clave);
                        user.put("estado", estado);
                        user.put("idusuario", idUsuario);
                        mp.put("result", uA.edit(user));
                        break;
                    case 4://Eliminar
                        idUsuario = Integer.parseInt(request.getParameter("idusuario"));
                        mp.put("result", uA.delete(idUsuario));
                        break;
                    case 5://Validar
                        usuario = request.getParameter("usuario");
                        clave = request.getParameter("clave");
                        mp.put("result", uA.validar(usuario, clave));
                        break;
                    case 6://Cambiar Clave
                        usuario = request.getParameter("usuario");
                        clave = request.getParameter("clave");
                        String newc = request.getParameter("newclave");
                        mp.put("result", uA.cambiarClave(usuario, clave, newc));
                        break;
                }
            }
            //ROL
            if (ent.equals("rol")) {
                Map<String, Object> rol = new HashMap<>();
                int idRol = 0;
                int idUsuario = 0;
                String nombre = null;
                String estado = null;
                switch (opc) {
                    case 1://Listar
                        mp.put("lista", rA.listar());
                        break;
                    case 2: //Agregar
                        nombre = request.getParameter("nombre");
                        rol.put("nombre", nombre);
                        mp.put("result", rA.add(rol));
                        break;
                    case 3: //Editar
                        idRol = Integer.parseInt(request.getParameter("idrol"));
                        nombre = request.getParameter("nombre");
                        estado = request.getParameter("estado");
                        rol.put("idrol", idRol);
                        rol.put("nombre", nombre);
                        rol.put("estado", estado);
                        mp.put("result", rA.edit(rol));
                        break;
                    case 4://Eliminar
                        idRol = Integer.parseInt(request.getParameter("idrol"));
                        rol.put("idrol", idRol);
                        mp.put("result", rA.delete(rol));
                        break;
                    case 5://Listar por Usuario
                        idUsuario = Integer.parseInt(request.getParameter("idusuario"));
                        mp.put("lista", rA.listar(idUsuario));
                        break;
                    case 6: //Asignar Rol
                        idRol = Integer.parseInt(request.getParameter("idrol"));
                        idUsuario = Integer.parseInt(request.getParameter("idusuario"));
                        mp.put("result", rA.asignar(idUsuario, idRol));
                        break;
                    case 7://Quitar Rol
                        idRol = Integer.parseInt(request.getParameter("idrol"));
                        idUsuario = Integer.parseInt(request.getParameter("idusuario"));
                        mp.put("result", rA.quitarRol(idUsuario, idRol));
                        break;
                }
            }
            if (ent.equals("selector")) {
                int idCampo = -1;
                int idDistrito = -1;
                int idIglesia = -1;
                int idEscuela = -1;
                switch (opc) {
                    case 1: //Campo
                        mp.put("lista", cA.listar());
                        break;
                    case 2://Distrito
                        idCampo = Integer.parseInt(request.getParameter("idcampo"));
                        mp.put("lista", dA.listar(idCampo));
                        break;
                    case 3: //Iglesia
                        idDistrito = Integer.parseInt(request.getParameter("iddistrito"));
                        mp.put("lista", iA.lista(idDistrito));
                        break;
                    case 4://Escuela
                        idIglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        mp.put("lista", eA.listar(idIglesia));
                        break;
                    case 5://Grupo
                        idEscuela = Integer.parseInt(request.getParameter("idescuela"));
                        mp.put("lista", gA.lista(idEscuela));
                        break;
                }
            }
            if (ent.equals("discipulador")) {
                Map<String, Object> dis = new HashMap<>();
                int idp = 0;
                int idgrupo = 0;
                int idm = 0;
                int idd = 0;
                int iddi = 0;
                String tipo = "";
                switch (opc) {
                    case 1://Listar Discipulos
                        if (request.getParameter("idpersona") != null) {
                            idd = diA.getIdDiscipulador(Integer.parseInt(request.getParameter("idpersona")));
                        } else {
                            idd = Integer.parseInt(request.getParameter("iddiscipulador"));
                        }
                        mp.put("lista", diA.listDiscipulo(idd));
                        break;
                    case 2://Listar miembro- discipulador
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        mp.put("lista", diA.listar(idgrupo));
                        break;
                    case 3://ASIGNAR COMO DISCIPULADOR
                        idm = Integer.parseInt(request.getParameter("idmiembrogp"));
                        dis.put("idmiembrogp", idm);
                        dis.put("idasociado", 0);
                        mp.put("result", diA.add(dis));
                        break;
                    case 4://ASIGNAR COMO DISCIPULADO
                        idp = Integer.parseInt(request.getParameter("idpersona"));
                        idd = Integer.parseInt(request.getParameter("iddiscipulador"));
                        tipo = request.getParameter("tipo");
                        mp.put("result", diA.addDiscipulo(idp, idd, tipo));
                        break;
                    case 5://Nombre de Discipulador
                        idd = Integer.parseInt(request.getParameter("iddiscipulador"));
                        mp.put("result", diA.getDiscipulador(idd));
                        break;
                    case 6://Desvincular discipulo
                        idd = Integer.parseInt(request.getParameter("iddiscipulador"));
                        iddi = Integer.parseInt(request.getParameter("iddiscipulado"));
                        mp.put("result", diA.delDiscipulo(iddi, idd));
                        break;
                    case 7://Asignar Asociado
                        idd = Integer.parseInt(request.getParameter("iddiscipulador"));
                        idm = Integer.parseInt(request.getParameter("idmiembrogp"));
                        mp.put("result", diA.addAsociado(idd, idm));
                        break;
                    case 8://Del Discipulador
                        idd = Integer.parseInt(request.getParameter("iddiscipulador"));
                        mp.put("result", diA.delete(idd));
                    case 9://Get id discipulador
                        idp = Integer.parseInt(request.getParameter("idpersona"));
                        mp.put("result", diA.getIdDiscipulador(idp));
                        break;
                }
            }
            if (ent.equals("leccion")) {
                int iddi = 0;
                int idt = 0;
                int idl = 0;
                int idd = 0;
                String nombre, estado;
                Map<String, Object> l = new HashMap<>();
                switch (opc) {
                    case 1://Listar Tipo de Leccion del Discipulo
                        iddi = Integer.parseInt(request.getParameter("iddiscipulado"));
                        mp.put("lista", lA.listarTipo(iddi));
                        break;
                    case 2:///Listar leccion por tipo de leccion
                        iddi = Integer.parseInt(request.getParameter("iddiscipulado"));
                        idt = Integer.parseInt(request.getParameter("idtipoleccion"));
                        mp.put("lista", lA.listar(idt, iddi));
                        break;
                    case 3://Agregar Tipo Leccion
                        nombre = request.getParameter("nombre");
                        l.put("nombre", nombre);
                        l.put("estado", 1);
                        mp.put("result", lA.addTipo(l));
                        break;
                    case 4://Agregar Leccion
                        idt = Integer.parseInt(request.getParameter("idtipoleccion"));
                        nombre = request.getParameter("nombre");
                        l.put("idtipoleccion", idt);
                        l.put("nombre", nombre);
                        l.put("estado", 1);
                        mp.put("result", lA.add(l));
                        break;
                    case 5://Listar todos los tipos de leccion;
                        mp.put("lista", lA.listarTipo());
                        break;
                    case 6://Editar Leccion
                        idl = Integer.parseInt(request.getParameter("idleccion"));
                        idt = Integer.parseInt(request.getParameter("idtipoleccion"));
                        nombre = request.getParameter("nombre");
                        estado = request.getParameter("estado");
                        l.put("idtipoleccion", idt);
                        l.put("idleccion", idl);
                        l.put("nombre", nombre);
                        l.put("estado", estado);
                        mp.put("result", lA.edit(l));
                        break;
                    case 7://Eliminar Leccion
                        idl = Integer.parseInt(request.getParameter("idleccion"));
                        mp.put("result", lA.delete(idl));
                        break;
                    case 8://Asigna Curso(TipoLeccion)
                        idt = Integer.parseInt(request.getParameter("idtipoleccion"));
                        iddi = Integer.parseInt(request.getParameter("iddiscipulado"));
                        mp.put("result", lA.asignarLeccion(idt, iddi));
                        break;
                    case 9://Registrar Leccion
                        idl = Integer.parseInt(request.getParameter("idleccion"));
                        iddi = Integer.parseInt(request.getParameter("iddiscipulado"));
                        idd = Integer.parseInt(request.getParameter("iddiscipulador"));
                        mp.put("result", lA.regLeccion(idl, iddi, idd));
                        break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            mp.put("error", e.getMessage());
        }

        Gson gson = new Gson();

        out.println(gson.toJson(mp));
        out.flush();

        out.close();
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (MainControl.validateSession(request)) {
            processRequest(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (MainControl.validateSession(request) || (request.getParameter("ent").equals("pers") && request.getParameter("opc").equals("3"))) {
            processRequest(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
