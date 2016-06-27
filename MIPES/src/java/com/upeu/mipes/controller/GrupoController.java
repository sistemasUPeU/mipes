/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.upeu.mipes.dao.GrupoDAO;
import com.upeu.mipes.dto.GrupoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
@WebServlet(name = "GrupoController", urlPatterns = {"/gp"})
public class GrupoController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    GrupoDAO gD = new GrupoDAO();
    GrupoDTO gT = new GrupoDTO();

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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String pagina;
        int id;
        RequestDispatcher dispatcher;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opc = request.getParameter("opc");
        switch (Integer.parseInt(opc)) {
            case 1:
                pagina = "/vistas/registro/RegistroNewGP.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 2:
                pagina = "/vistas/listado/ListarGP.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                id = Integer.parseInt(request.getParameter("id"));
                pagina = "/gp?opc=2";
                if (gD.eliminar(id)) {
                    dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
            break;
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
        processRequest(request, response);
        String pagina;
        int opc = Integer.parseInt(request.getParameter("opc"));
        switch (opc) {
            case 1:
                String esc = request.getParameter("n_escuela");
                String gp = request.getParameter("n_grupo");
                String fecha = request.getParameter("fecha");
                String color = request.getParameter("n_color");
                String canto = request.getParameter("n_canto");
                String lema = request.getParameter("n_lema");
                String ver = request.getParameter("n_ver");
                String cali = "1";
                String tipo = "1";
                String lugar = request.getParameter("n_lugar");
                String dia = request.getParameter("n_dia");
                String hora = request.getParameter("n_hora");
                String est = "1";
                GrupoDTO dt = new GrupoDTO(Integer.parseInt(esc), gp, fecha, color, canto, lema, ver, cali, tipo, lugar, dia, hora, est);
                if (gD.agregar(dt)) {
                    pagina = "/vistas/extras/CongNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                } else {
                    pagina = "/vistas/extras/Error_Reg.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }

            case 2:
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
