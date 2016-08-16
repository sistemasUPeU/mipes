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
public class RegistroControl extends HttpServlet {

    AsistenciaGPDAO ag = new AsistenciaGPDAO();
    AsistenciaMiDAO aM = new AsistenciaMiDAO();
    PersonaDAO pA = new PersonaDAO();
    Map<String, Object> mp = new HashMap<>();

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
        try {
            String opc = request.getParameter("opc");
            String tipo = request.getParameter("tipo");
            int idGrupo = 0;

            if (tipo.equals("asistencia")) {
                String idMiembroGP = "";
                String idAsistenciaGP = "";
                String lugar = "";
                String asistencia = "";
                String presentes = "";
                String faltas = "";
                String visitas = "";
                Map<String, Object> asgp = new HashMap<>();
                switch (opc) {
                    case "lista":
                        idGrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        mp.put("lista", ag.listar(idGrupo));
                        break;
                    case "grupo":
                        idGrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        lugar = request.getParameter("lugar");
                        presentes = request.getParameter("presentes");
                        faltas = request.getParameter("faltas");
                        visitas = request.getParameter("visitas");
                        asgp.put("idgrupo", idGrupo);
                        asgp.put("lugar", lugar);
                        asgp.put("presentes", presentes);
                        asgp.put("faltas", faltas);
                        asgp.put("visitas", visitas);
                        mp.put("idasistencia", ag.regAsistenciaGP(asgp));
                        break;
                    case "integrante":
                        asistencia = request.getParameter("asistencia");
                        idMiembroGP = request.getParameter("idmiembrogp");
                        idAsistenciaGP = request.getParameter("idasistenciagp");
                        asgp.put("asistencia", asistencia);
                        asgp.put("idmiembrogp", idMiembroGP);
                        asgp.put("idasistenciagp", idAsistenciaGP);
                        mp.put("result", ag.regAsistenciaIntegrante(asgp));
                        break;
                    case "puedereg":
                        idGrupo = Integer.parseInt(request.getParameter("idgrupo"));
                        mp.put("result", ag.puedeRegistrar(idGrupo));
                }
            }
            if (tipo.equals("mipes")) {
                String idlider = "";
                String idTabla = "";
                //MIPES DE CAMPO 1
                //MIPES DE DISTRITO 2
                //MIPES DE IGLESIA 3
                //MIPES DE ESCUELA 4
                //LIDER DE GRUPO 5
                //LIDER DE MINISTERIO 6
                int eslider = 0;
                if (opc != null) {
                    eslider = Integer.parseInt(opc);
                }
                idTabla = request.getParameter("idtabla");
                idlider = request.getParameter("idlider");
                mp.put("result", pA.regIdLider(Integer.parseInt(idlider), eslider, Integer.parseInt(idTabla)));
            }
            if (tipo.equals("asisMin")) {
                String op = request.getParameter("opc");
                int idministerio = 0;
                String idMiembroMI = "";
                String idAsistenciaMI = "";
                String lugar = "";
                String asistencia = "";
                String descripcion = "";
                String presentes = "";
                String faltas = "";
                int beneficiarios = 0;
                Map<String, Object> asmi = new HashMap<>();
                switch (op) {
                    case "lista":
                        idministerio = Integer.parseInt(request.getParameter("idministerio"));
                        mp.put("lista", aM.listar(idministerio));
                        break;
                    case "ministerio":
                        idministerio = Integer.parseInt(request.getParameter("idministerio"));
                        lugar = request.getParameter("lugar");
                        descripcion = request.getParameter("descripcion");
                        presentes = request.getParameter("presentes");
                        faltas = request.getParameter("faltas");
                        beneficiarios = Integer.parseInt(request.getParameter("beneficiarios"));
                        asmi.put("idministerio", idministerio);
                        asmi.put("lugar", lugar);
                        asmi.put("descripcion", descripcion);
                        asmi.put("presentes", presentes);
                        asmi.put("faltas", faltas);
                        asmi.put("beneficiarios", beneficiarios);
                        mp.put("idasistencia", aM.regAsistenciaMin(asmi));
                        break;
                    case "integrante":
                        asistencia = request.getParameter("asistencia");
                        idMiembroMI = request.getParameter("idmiembromi");
                        idAsistenciaMI = request.getParameter("idasistenciami");
                        asmi.put("asistencia", asistencia);
                        asmi.put("idmiembromi", idMiembroMI);
                        asmi.put("idasistenciami", idAsistenciaMI);
                        mp.put("result", aM.regAsistenciaIntegrante(asmi));
                        break;
                    case "puedereg":
                        idministerio = Integer.parseInt(request.getParameter("idministerio"));
                        mp.put("result", aM.puedeRegistrar(idministerio));
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
