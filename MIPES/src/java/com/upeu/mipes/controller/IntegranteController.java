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
