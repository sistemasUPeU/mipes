package com.upeu.mipes.controller;

import com.upeu.mipes.dao.Det_Int_GPDAO;
import com.upeu.mipes.dao.IntegranteDAO;
import com.upeu.mipes.dao.PersonaDAO;
import com.upeu.mipes.dto.Det_Int_GPDTO;
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

    Det_Int_GPDTO detIntDTO = new Det_Int_GPDTO();
    Det_Int_GPDAO detIntDAO = new Det_Int_GPDAO();

    
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
            case 1://AGREGAR
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String email = request.getParameter("email");
                String telefono = request.getParameter("telefono");
                String nacimiento = request.getParameter("nacimiento");
                String bautizo = request.getParameter("bautizmo");
                String sexo = request.getParameter("sexo");
                String dni = request.getParameter("dni");
                String ocupacion = request.getParameter("ocupacion");

                perDTO = new PersonaDTO(nombre, apellido, direccion, email, telefono, nacimiento, bautizo, sexo, dni, ocupacion);

                if (perDAO.agregar(perDTO)) {
                    String idGrupo = (request.getParameter("n_grupo"));
                    int idMinisterio = Integer.parseInt(request.getParameter("n_ministerio"));
                    String estado = "1";
                    int idPersona = perDAO.buscarNombre(perDTO.getNombres());
                    intDTO = new IntegranteDTO(idPersona, Integer.parseInt(idGrupo), idMinisterio, estado);
                    detIntDTO = new Det_Int_GPDTO(idPersona, Integer.parseInt(idGrupo), nacimiento);
                    if (detIntDAO.agregar(detIntDTO)) {
                        pagina = "/vistas/extras/CongNewES.jsp";
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                        dispatcher.forward(request, response);
                    }
                } else {
                    pagina = "/vistas/registro/RegistroIntegrante.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
                break;

            case 3://ELIMINAR

                int idPersona = Integer.parseInt(request.getParameter("id"));
                System.out.println("IDPERSONA: " + idPersona);
                if (perDAO.eliminar(idPersona)) {
                    System.out.println("Exito al eliminar");
                    pagina = "/vistas/listado/ListarIntegrante.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                } else {
                    pagina = "/vistas/extras/CongNewES.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(pagina);
                    dispatcher.forward(request, response);
                }
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
