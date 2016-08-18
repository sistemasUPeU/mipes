/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.upeu.mipes.dao.RolDAO;
import com.upeu.mipes.dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class MainControl extends HttpServlet {

    UsuarioDAO aO = new UsuarioDAO();
    RolDAO rA = new RolDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (validateSession(request)) {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("login");
            }

        }
    }

    public static boolean validateSession(HttpServletRequest request){
        try {
            return request.getSession(false).getAttribute("iduser") != null;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean validateRol(String idrol, HttpSession session) {
        try {
            ArrayList<Map<String, ?>> roles = (ArrayList<Map<String, ?>>) session.getAttribute("listrol");
            if (roles != null) {
                if (!roles.isEmpty()) {
                    for (int i = 0; i < roles.size(); i++) {
                        if (roles.get(i).get("idrol").toString().equals(idrol)) {
                            return true;
                        }
                    }
                } else {
                    return false;
                }

            } else {
                return false;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
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
        try {
            int opc = 0;
            int orden = 0;
            String opcString = request.getParameter("opc");
            String ordenString = request.getParameter("orden");
            RequestDispatcher dispatcher;
            String pagina = "/vistas/error/error404.html";
            if (opcString != null && ordenString != null && validateSession(request)) {
                opc = Integer.parseInt(opcString);
                orden = Integer.parseInt(ordenString);
                switch (orden) {
                    case 1://Perfil
                        switch (opc) {
                            case 1://Ver Perfil Personal
                                pagina = "/vistas/persona/perfil.jsp";
                                request.setAttribute("tipo", 1);
                                break;
                            case 2://Ver Perfil de Otra Persona
                                pagina = "/vistas/persona/perfil.jsp";
                                request.setAttribute("tipo", 2);
                                request.setAttribute("idpersona", request.getParameter("idpersona"));
                                break;
                        }
                        break;
                    case 2://Campo
                        switch (opc) {
                            case 1:
                                pagina = "/vistas/campo/campo.jsp";
                                break;
                            case 2:
                                pagina = "/vistas/campo/ListCampo.jsp";
                                break;
                        }
                        break;
                    case 3://Distrito
                        switch (opc) {
                            case 1://Distritos Misioneros
                                pagina = "/vistas/distrito/distrito.jsp";
                                break;
                        }
                        break;
                    case 4://Iglesia
                        switch (opc) {
                            case 1:
                                pagina = "/vistas/iglesia/CreateIglesia.jsp";
                                break;
                            case 2:
                                pagina = "/vistas/iglesia/ListIglesia.jsp";
                                break;
                        }
                        break;
                    case 5://Escuela Sabatica
                        switch (opc) {
                            case 1:
                                pagina = "/vistas/escuela/escuela.jsp";
                                break;
                        }
                        break;
                    case 6://Grupo P.
                        switch (opc) {
                            case 1:
                                pagina = "/vistas/grupo/CreateGrupo.jsp";
                                break;
                            case 2:
                                pagina = "/vistas/grupo/ListGrupo.jsp";
                                break;
                            case 3:
                                pagina = "/vistas/grupo/AnexInteg.jsp";
                                request.setAttribute("idgrupo", request.getParameter("idgrupo"));
                                break;
                            case 4:
                                pagina = "/vistas/asistencia/asistenciaGP.jsp";
                                break;
                        }
                        break;
                    case 7://Ministerio
                        switch (opc) {
                            case 1:
                                pagina = "/vistas/ministerio/CreateMinisterio.jsp";
                                break;
                            case 2:
                                pagina = "/vistas/ministerio/ListMinisterio.jsp";
                                request.setAttribute("idiglesia", request.getParameter("m"));
                                break;
                            case 3:
                                pagina = "/vistas/ministerio/AnexIntg.jsp";
                                request.setAttribute("idministerio", request.getParameter("i"));
                                break;
                            case 4://TRABAJO MISIONERO DE MINISTERIO
                                pagina = "/vistas/ministerio/tmMinisterio.jsp";
                                break;
                        }
                        break;
                    case 8://Trabajo Misionero
                        switch (opc) {
                            case 1: //T.M. DISCIPULADOR
                                pagina = "/vistas/trabajo/tbmDiscipulador.jsp";
                                break;
                            case 2: //GESTION DE DISCIPULADOS
                                request.setAttribute("iddiscipulador", request.getParameter("iddiscipulador"));
                                pagina = "/vistas/grupo/Discipulado.jsp";
                                break;
                            case 3://GRSTION DE DISCIPULADOR
                                pagina = "/vistas/grupo/Discipulador.jsp";
                                break;
                            case 4://Gestion de Lecciones de Estudio
                                pagina = "/vistas/trabajo/lecciones.jsp";
                                break;
                        }
                        break;
                    case 9://Reportes
                        switch (opc) {
                            case 1:
                                pagina = "/vistas/reportesgp/repasisGP.jsp";
                                break;
                            case 2:
                                pagina = "/vistas/reportesmin/repasisMin.jsp";
                                break;
                            case 3://REPORTE DE DISCIPULADOR
                                break;
                            case 4://REPORTE DE DISCIPULADO
                                break;
                            case 5:
                                pagina = "/vistas/reportesgp/repasisDetalle.jsp";
                                break;
                            /*case 6:
                             pagina = "/vistas/reportesmin/repasisDetalle.jsp";
                             break;*/
                            case 7:
                                pagina = "/vistas/reporteint/intgp.jsp";
                                break;
                            case 8:
                                pagina = "/vistas/reporteint/intmin.jsp";
                                break;
                        }
                        break;
                    case 10://Usuario
                        switch (opc) {
                            case 1://Usuarios y privilegios
                                pagina = "/vistas/usuario/gestionUsuarios.jsp";
                                break;
                        }
                        break;
                }
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
            } else {
                processRequest(request, response);
            }

        } catch (NumberFormatException | ServletException | IOException e) {
            e.printStackTrace();
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
        //processRequest(request, response);
        String a, b, pagina, opc;
        a = request.getParameter("user");
        b = request.getParameter("pass");
        opc = request.getParameter("opc");
        try {
            if (opc.equals("validate")) {
                if (!a.equals("") && !b.equals("")) {
                    Map<String, Object> r = aO.validarUser(a, b);
                    if (r != null && !r.isEmpty()) {
                        ArrayList<Map<String, ?>> rol;
                        Map<String, Object> idLider;
                        rol = rA.listar(Integer.parseInt(r.get("iduser").toString()));
                        idLider = aO.getIdLider(r.get("idpersona").toString());
                        if (rol != null) {
                            HttpSession session = request.getSession(true);
                            session.setAttribute("listrol", rol);
                            session.setAttribute("idpersona", r.get("idpersona"));
                            session.setAttribute("iduser", r.get("iduser"));
                            session.setAttribute("nombres", r.get("nombres"));
                            session.setAttribute("apellidos", r.get("apellidos"));
                            session.setAttribute("usuario", r.get("usuario"));
                            session.setAttribute("idcampo", idLider.get("idcampo"));
                            session.setAttribute("iddistrito", idLider.get("iddistrito"));
                            session.setAttribute("idiglesia", idLider.get("idiglesia"));
                            session.setAttribute("idescuela", idLider.get("idescuela"));
                            session.setAttribute("idgrupo", idLider.get("idgrupo"));
                            session.setAttribute("idministerio", idLider.get("idministerio"));
                            session.setAttribute("ncampo", idLider.get("ncampo"));
                            session.setAttribute("ndistrito", idLider.get("ndistrito"));
                            session.setAttribute("niglesia", idLider.get("niglesia"));
                            session.setAttribute("nescuela", idLider.get("nescuela"));
                            session.setAttribute("ngrupo", idLider.get("ngrupo"));
                            session.setAttribute("nministerio", idLider.get("nministerio"));
                            pagina = "home";
                            response.sendRedirect(pagina);
                        } else {
                            pagina = "/login.jsp";
                            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                            dispatcher.forward(request, response);
                        }
                    } else {
                        pagina = "/login.jsp";
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                        dispatcher.forward(request, response);
                    }
                } else {
                    pagina = "/login.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();

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
