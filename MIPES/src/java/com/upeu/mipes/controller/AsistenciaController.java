/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upeu.mipes.controller;

import com.google.gson.Gson;
import com.upeu.mipes.dao.AsistenciaDAO;
import com.upeu.mipes.dao.EscuelaDAO;
import com.upeu.mipes.dao.GrupoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andres
 */
public class AsistenciaController extends HttpServlet {

    public static final String ASINTEGRANTEGP = "asintgp";
    public static final String ASGP = "asistencia";
    public static final String lISTINTEGRANTEGP = "listintgp";
    public static final String LISTESCUELA = "listes";
    public static final String LISTGRUPO = "listgru";

    private AsistenciaDAO adao = new AsistenciaDAO();
    private EscuelaDAO edao = new EscuelaDAO();
    private GrupoDAO gdao = new GrupoDAO();

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> r = new HashMap<>();
        String opc = request.getParameter("opc");
        if (opc != null) {
            try {
                /* TODO output your page here. You may use following sample code. */

                if (opc.equals(ASINTEGRANTEGP)) {
                    int idIntegrante = Integer.parseInt(request.getParameter("idintegrante"));
                    int idAsistencia = Integer.parseInt(request.getParameter("idasist"));
                    String asistencia = request.getParameter("asist");
                    System.out.println("asistencia integrante");
                    r.put("resp", adao.regAsistenciaIntegrante(idIntegrante, idAsistencia, asistencia));
                }
                if (opc.equals(ASGP)) {
                    int presentes = Integer.parseInt(request.getParameter("presentes"));
                    int faltas = Integer.parseInt(request.getParameter("faltas"));
                    int visitas = Integer.parseInt(request.getParameter("visitas"));
                    int idgrupo = Integer.parseInt(request.getParameter("idgrupo"));
                    String lugar = request.getParameter("lugar");
                    System.out.println("asistencia grupo");
                    r.put("idasist", adao.regAsistenciaGP(idgrupo, presentes, visitas, faltas, lugar));
                }
                if (opc.equals(lISTINTEGRANTEGP)) {
                    int idg = Integer.parseInt(request.getParameter("idgrupo"));
                    List<Map<String, ?>> lista = adao.listaIntegranteGPEnable(idg);
                    for (int i = 0; i < lista.size(); i++) {
                        System.out.println(lista.get(i).get("APELLIDOS")+ " "+lista.get(i).get("CUMPLE"));
                    }
                    r.put("lista", lista);
                }
                if (opc.equals(LISTESCUELA)) {
                    int idd = Integer.parseInt(request.getParameter("iddistrito"));
                    ArrayList<Map<String, Object>> lista = edao.listarEscuela(idd);
                    r.put("lista", lista);
                }

                if (opc.equals(LISTGRUPO)) {
                    int ide = Integer.parseInt(request.getParameter("idescuela"));
                    ArrayList<Map<String, Object>> lista = gdao.listarGrupo(ide);
                    r.put("lista", lista);
                }

            } catch (Exception e) {
                r.put("error", e.getMessage());
            }
            Gson gson = new Gson();
            out.println(gson.toJson(r));
            out.flush();
            out.close();
        } else {
            out.print("<p style='color:red'>Error</p>");
        }
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
