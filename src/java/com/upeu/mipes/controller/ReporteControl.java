/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.google.gson.Gson;
import com.upeu.mipes.dao.AsistenciaGPDAO;
import com.upeu.mipes.dao.AsistenciaMiDAO;
import com.upeu.mipes.dao.PersonaDAO;
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
public class ReporteControl extends HttpServlet {

    Map<String, Object> mp = new HashMap<>();
    PersonaDAO pA = new PersonaDAO();
    AsistenciaGPDAO agA = new AsistenciaGPDAO();
    AsistenciaMiDAO miA = new AsistenciaMiDAO();

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
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opc = request.getParameter("opc");
        try {
            if (opc.equals("buscarPersona")) {
                int filtro = Integer.parseInt(request.getParameter("filtro"));
                String nombres = request.getParameter("nombres");
                String apellidos = request.getParameter("apellidos");
                String dni = request.getParameter("dni");
                mp.put("lista", pA.buscar(nombres, apellidos, dni, filtro));
            }
            if (opc.equals("reportgp")) {
                int tipo = Integer.parseInt(request.getParameter("op"));
                int idgrupo = 0;
                int idescuela = 0;
                int idiglesia = 0;
                int iddistrito = 0;
                String fechai = "";
                String fechaf = "";
                switch (tipo) {
                    case 1://asistencias por gp
                        idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        fechai = request.getParameter("fechai");
                        fechaf = request.getParameter("fechaf");
                        ArrayList<Map<String, ?>> listasu = agA.listaASISTENCIAS(fechai, fechaf, idgrupo);
                        mp.put("lista", listasu);
                        break;
                    case 2://asistencias de grupo por escuela
                        idescuela = Integer.parseInt(request.getParameter("idescuela"));
                        fechai = request.getParameter("fechai");
                        fechaf = request.getParameter("fechaf");
                        ArrayList<Map<String, ?>> listaes = agA.listaASISTENCIASES(fechai, fechaf, idescuela);
                        mp.put("lista", listaes);
                        break;
                    case 3://asistencias de gp por iglesia
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        fechai = request.getParameter("fechai");
                        fechaf = request.getParameter("fechaf");
                        ArrayList<Map<String, ?>> listaig = agA.listaASISTENCIASIG(fechai, fechaf, idiglesia);
                        mp.put("lista", listaig);
                        break;
                    case 4://asistencias de gp por distrito
                        iddistrito = Integer.parseInt(request.getParameter("iddistrito"));
                        fechai = request.getParameter("fechai");
                        fechaf = request.getParameter("fechaf");
                        ArrayList<Map<String, ?>> listadis = agA.listaASISTENCIASDIS(fechai, fechaf, iddistrito);
                        mp.put("lista", listadis);
                        break;
                }
            }
            if (opc.equals("reportmin")) {
                int tipo = Integer.parseInt(request.getParameter("op"));
                int idministerio = 0;
                int idiglesia = 0;
                int iddistrito = 0;
                String fechai = "";
                String fechaf = "";
                switch (tipo) {
                    case 1://listar asistencias de ministerio
                        idministerio = Integer.parseInt(request.getParameter("idministerio"));
                        fechai = request.getParameter("fechai");
                        fechaf = request.getParameter("fechaf");
                        ArrayList<Map<String, ?>> listasu = miA.listaASISTENCIAS(fechai, fechaf, idministerio);
                        mp.put("lista", listasu);
                        break;
                    case 2://asistencias de ministerio por iglesia
                        idiglesia = Integer.parseInt(request.getParameter("idiglesia"));
                        fechai = request.getParameter("fechai");
                        fechaf = request.getParameter("fechaf");
                        ArrayList<Map<String, ?>> listaig = miA.listaASISTENCIASIG(fechai, fechaf, idiglesia);
                        mp.put("lista", listaig);
                        break;
                    case 3://asistencias de ministerio por distrito
                        iddistrito = Integer.parseInt(request.getParameter("iddistrito"));
                        fechai = request.getParameter("fechai");
                        fechaf = request.getParameter("fechaf");
                        ArrayList<Map<String, ?>> listadis = miA.listaASISTENCIASDIS(fechai, fechaf, iddistrito);
                        mp.put("lista", listadis);
                        break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
