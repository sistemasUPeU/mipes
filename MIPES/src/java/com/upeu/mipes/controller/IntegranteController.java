/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.upeu.mipes.dao.IntegranteDAO;
import com.upeu.mipes.dto.IntegranteDTO;
import com.upeu.mipes.dto.PersonaDTO;
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

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        CrudInterface intDAO = new IntegranteDAO();
        PersonaDTO perDto = new PersonaDTO();
        IntegranteDTO intg = new IntegranteDTO();

        HttpSession session = request.getSession(true);
        RequestDispatcher dispatcher;
        String pagina;
        String op = request.getParameter("op");
        int id;
        switch (Integer.parseInt(op)) {
            case 1:
                pagina = "/vistas/registro/RegistroIntegrante.jsp";
                perDto.setNombres(request.getParameter("nombre"));
                perDto.setApellidos(request.getParameter("apellido"));
                perDto.setDireccion(request.getParameter("direccion"));
                perDto.setEmail(request.getParameter("email"));
                perDto.setTelefono(request.getParameter("telefono"));
                perDto.setFe_nacimiento(request.getParameter("nacimiento"));
                perDto.setFe_bautizmo(request.getParameter("bautizo"));
                perDto.setSexo(request.getParameter("sexo"));
                perDto.setDni(request.getParameter("dni"));
                perDto.setOcupacion(request.getParameter("ocupacion"));
                if (intDAO.agregar(intg)) {
                    dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                } else {
                    out.println("<h3>Error AL guardar registro..!!</h3>");
                }
           
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
