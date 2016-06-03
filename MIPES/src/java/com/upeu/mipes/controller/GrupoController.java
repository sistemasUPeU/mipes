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
        /*try (PrintWriter out = response.getWriter()) {
         TODO output your page here. You may use following sample code. 
         out.println("<!DOCTYPE html>");
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet GrupoController</title>");            
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet GrupoController at " + request.getContextPath() + "</h1>");
         out.println("</body>");
         out.println("</html>");
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
        processRequest(request, response);
        String pagina;
        int opc = Integer.parseInt(request.getParameter("opc"));
        switch (opc) {
            case 1:
                String esc = request.getParameter("n_escuela");
                String gp = request.getParameter("n_grupo");
                String fecha = request.getParameter("fecha");
                String est = "1";
                if (!esc.equals("") && !gp.equals("")) {
                    GrupoDTO dt = new GrupoDTO(Integer.parseInt(esc), gp, fecha, est);
                    if (gD.agregar(dt)) {
                        pagina = "/vistas/extras/CongNewES.jsp";
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                        dispatcher.forward(request, response);
                    }else{
                        pagina = "/vistas/extras/CongNewES.jsp";
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                        dispatcher.forward(request, response);
                    }
                } else {
                    pagina = "/vistas/extras/CongNewES.jsp";
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
