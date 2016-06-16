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
        /*
         String pagina;
         RequestDispatcher dispatcher;
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         String opc = request.getParameter("opc");
         switch (Integer.parseInt(opc)) {
         case 1:
         pagina = "/vistas/registro/RegistroNewES.jsp";
         dispatcher = getServletContext().getRequestDispatcher(pagina);
         dispatcher.forward(request, response);

         }*/

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
        switch (opc) {
            case 1://Crear nueva Escuela Sabatica
                String pagina;
                String dis = request.getParameter("n_distrito").toUpperCase();
                String nom = request.getParameter("n_es").toUpperCase();
                /*String fec = request.getParameter("fecha").toUpperCase();
                String co = request.getParameter("color").toUpperCase();
                String lem = request.getParameter("lema").toUpperCase();*/
                String est = "1";
                /*, fec, co, lem*/
                if (!dis.equals("") && !nom.equals("")) {
                    EscuelaDTO ed = new EscuelaDTO(Integer.parseInt(dis), nom, est);
                    if (eD.agregar(ed)) {
                        pagina = "/vistas/extras/CongNewES.jsp";
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                        dispatcher.forward(request, response);
                    } else {
                        pagina = "/vistas/extras/RegistroNewES.jsp";
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                        dispatcher.forward(request, response);
                    }
                } else {
                    pagina = "/vistas/extras/RegistroNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
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
