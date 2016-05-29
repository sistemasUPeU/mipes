/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.upeu.mipes.dao.IntegranteDAO;
import com.upeu.mipes.dto.IntegranteDTO;
import com.upeu.mipes.interfaces.CrudInterface;
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
 * @author Andrew
 */
public class IntegranteController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
            CrudInterface intDAO = new IntegranteDAO();
        IntegranteDTO intDTO = new IntegranteDTO();
        
        HttpSession session = request.getSession(true);
        RequestDispatcher dispatcher; 
        String pagina;
        String op = request.getParameter("op"); 
        int id;
        //update
        if (op.equals("1")) {
            pagina = "/vistas/listado/ListarIntegrante.jsp";
            intDTO.setNombre(request.getParameter("nombre"));
            intDTO.setApellidos(request.getParameter("apellido"));
            intDTO.setDireccion(request.getParameter("direccion"));
            intDTO.setEmail(request.getParameter("email"));
            intDTO.setTelefono(request.getParameter("telefono"));
            intDTO.setFecha_nacimiento(request.getParameter("nacimiento"));
            intDTO.setFecha_bautizmo(request.getParameter("bautizo"));
            if (intDAO.agregar(intDTO)) {
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
                out.println("<h3>Error al Registrar registrodasdas</h3>");
            } else {
                out.println("<h3>Error al Registrar registro</h3>");
            }
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        CrudInterface intDAO = new IntegranteDAO();
        IntegranteDTO intDTO = new IntegranteDTO();
        
        HttpSession session = request.getSession(true);
        RequestDispatcher dispatcher; 
        String pagina;
        String op = request.getParameter("op"); 
        int id;
        //update
        if (op.equals("1")) {
            pagina = "/vistas/listado/ListarIntegrante.jsp";
            intDTO.setNombre(request.getParameter("nombre"));
            intDTO.setApellidos(request.getParameter("apellido"));
            intDTO.setDireccion(request.getParameter("direccion"));
            intDTO.setEmail(request.getParameter("email"));
            intDTO.setTelefono(request.getParameter("telefono"));
            intDTO.setFecha_nacimiento(request.getParameter("nacimiento"));
            intDTO.setFecha_bautizmo(request.getParameter("bautizo"));
            if (intDAO.agregar(intDTO)) {
                dispatcher = getServletContext().getRequestDispatcher(pagina);
                dispatcher.forward(request, response);
            } else {
                out.println("<h3>Error al Registrar registro</h3>");
            }
        }
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
