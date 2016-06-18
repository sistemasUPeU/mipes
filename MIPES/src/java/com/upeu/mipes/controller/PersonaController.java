package com.upeu.mipes.controller;

import com.upeu.mipes.dao.IntegranteDAO;
import com.upeu.mipes.dao.PersonaDAO;
import com.upeu.mipes.dto.IntegranteDTO;
import com.upeu.mipes.dto.PersonaDTO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andrew
 */
public class PersonaController extends HttpServlet {

    PersonaDTO perDTO = new PersonaDTO();
    PersonaDAO perDAO = new PersonaDAO();

    IntegranteDTO intDTO = new IntegranteDTO();
    IntegranteDAO intDAO = new IntegranteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet PersonaController</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet PersonaController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        int op = Integer.parseInt(request.getParameter("op"));
        String pagina;

        switch (op) {
            case 1:
                String cargo = request.getParameter("n_cargo");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String email = request.getParameter("email");
                String telefono = request.getParameter("telefono");
                String nacimiento = request.getParameter("nacimiento");
                String bautizo = request.getParameter("bautizo");
                String sexo = request.getParameter("sexo");
                String dni = request.getParameter("dni");
                String ocupacion = request.getParameter("ocupacion");

                perDTO = new PersonaDTO(Integer.parseInt(cargo), nombre, apellido, direccion, email, telefono, nacimiento, bautizo, sexo, dni, ocupacion);

                if (perDAO.agregar(perDTO)) {
                    String idGrupo = (request.getParameter("n_grupo"));
                    int idMinisterio = Integer.parseInt(request.getParameter("n_ministerio"));
                    String estado = "1";
                    int idPersona = perDAO.buscarNombre(perDTO.getNombres());
                    intDTO = new IntegranteDTO(idPersona, Integer.parseInt(idGrupo), idMinisterio, estado);
                    if (intDAO.agregar(intDTO)) {
                        pagina = "/vistas/extras/CongNewES.jsp";
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                        dispatcher.forward(request, response);
                    }
                } else {
                    pagina = "/vistas/registro/RegistroIntegrante.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
            case 2:
                int idPersona = perDAO.buscarNombre(perDTO.getNombres());
                if (perDAO.eliminar(idPersona)) {
                    System.out.println("Exito al eliminar");
                    pagina = "/vistas/extras/CongNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
            case 3:
                

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
