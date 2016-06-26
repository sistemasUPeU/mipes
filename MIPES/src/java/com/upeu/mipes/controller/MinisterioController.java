/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.upeu.mipes.dao.MinisterioDAO;
import com.upeu.mipes.dto.MinisterioDTO;
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
public class MinisterioController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    MinisterioDAO mA = new MinisterioDAO();

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
         /*TODO output your page here. You may use following sample code.
         out.println("<!DOCTYPE html>");
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet MinisterioController</title>");            
         out.println("</head>");
         out.println("<body>");
         out.println("<h1>Servlet MinisterioController at " + request.getContextPath() + "</h1>");
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

        String pagina;
        int id;
        RequestDispatcher dispatcher;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String opc = request.getParameter("opc");
        switch (Integer.parseInt(opc)) {
            case 1:
                pagina = "/vistas/registro/RegistroNewMin.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 2:
                pagina = "/vistas/listado/ListarMin.jsp";
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 3:
                id = Integer.parseInt(request.getParameter("id"));
                pagina = "/vistas/editar/EditarMin.jsp";
                session.setAttribute("list_e", mA.listared(id));
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                break;
            case 4:
                id = Integer.parseInt(request.getParameter("id"));
                if(mA.desactivar(id)){
                    pagina = "/min?opc=2";
                    dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
                break;
            case 5:
                id = Integer.parseInt(request.getParameter("id"));
                if(mA.activar(id)){
                    pagina = "/min?opc=2";
                    dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
                break;
            case 6:
                id = Integer.parseInt(request.getParameter("id"));
                pagina = "/min?opc=2";
                if (mA.eliminar(id)) {
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
        processRequest(request, response);
        int opc = Integer.parseInt(request.getParameter("opc"));
        String pagina;
        int  id;
        int dis = Integer.parseInt(request.getParameter("n_distrito"));
        String min = request.getParameter("n_min");
        String des = request.getParameter("n_des");
        String es = "1";
        switch (opc) {
            case 1:
                MinisterioDTO mT = new MinisterioDTO(dis, min, des, es);
                if (mA.agregar(mT)) {
                    pagina = "/vistas/extras/CongNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                } else {
                    pagina = "/vistas/extras/CongNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
                break;
            case 2:
                id=Integer.parseInt(request.getParameter("id"));
                MinisterioDTO mn = new MinisterioDTO();
                mn.setIdMinisterio(id);
                mn.setIdDistritoM(dis);
                mn.setNombre(min);
                mn.setDescripcion(des);
                mn.setEstado(es);
                if (mA.editar(mn)) {
                    pagina = "/vistas/extras/CongNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                } else {
                    pagina = "/min?opc=3";
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
