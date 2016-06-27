/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.upeu.mipes.dao.EscuelaDAO;
import com.upeu.mipes.dto.EscuelaDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class EscuelaController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    EscuelaDTO eT = new EscuelaDTO();
    EscuelaDAO eD = new EscuelaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /*try (PrintWriter out = response.getWriter()) {
         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegistroNewES.jsp");
         dispatcher.forward(request, response);
         }*/
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

        String pagina;
        int id;
        RequestDispatcher dispatcher;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String opc = request.getParameter("opc");
        switch (Integer.parseInt(opc)) {
            case 1:
                pagina = "/vistas/registro/RegistroNewES.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 2:
                pagina = "/vistas/listado/ListarES.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 3:
                id = Integer.parseInt(request.getParameter("id"));
                pagina = "/vistas/editar/EditarES.jsp";
                session.setAttribute("list_e", eD.listared(id));
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 4:
                id = Integer.parseInt(request.getParameter("id"));
                if (eD.desactivar(id)) {
                    pagina = "/esc?opc=2";
                    dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
                break;
            case 5:
                id = Integer.parseInt(request.getParameter("id"));
                if (eD.activar(id)) {
                    pagina = "/esc?opc=2";
                    dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
                break;
            case 6:
                id = Integer.parseInt(request.getParameter("id"));
                pagina = "/esc?opc=2";
                if (eD.eliminar(id)) {
                    dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
                break;
        }

        processRequest(request, response);
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
        response.setContentType("text/html; charset=UTF-8");
        int opc = Integer.parseInt(request.getParameter("opc"));
        String pagina;
        int dis;
        String nom;
        String est;
        int id;
        switch (opc) {
            case 1://Crear nueva Escuela Sabatica
                dis = Integer.parseInt(request.getParameter("n_distrito"));
                nom = request.getParameter("n_es").toUpperCase();
                est = "1";
                EscuelaDTO ed = new EscuelaDTO(dis, nom, est);
                if (eD.agregar(ed)) {
                    pagina = "/vistas/extras/CongNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                } else {
                    pagina = "/vistas/extras/RegistroNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }

                break;
            case 2:
                id = Integer.parseInt(request.getParameter("id"));
                dis = Integer.parseInt(request.getParameter("n_distrito"));
                nom = request.getParameter("n_es").toUpperCase();
                est = "1";
                EscuelaDTO es = new EscuelaDTO();
                es.setIdEscuela(id);
                es.setIdDistritoM(dis);
                es.setNombre(nom);
                es.setEstado(est);                
                if (eD.editar(es)) {
                    pagina = "/vistas/extras/CongNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                } else {
                    pagina = "/esc?opc=3";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }

                break;
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
