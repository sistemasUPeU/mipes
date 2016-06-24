<%-- 
    Document   : RegistroNewES
    Created on : 22/05/2016, 12:22:03 PM
    Author     : USER
--%>

<%@page import="com.upeu.mipes.dto.EscuelaDTO"%>
<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no ,initial-scale=1.0 , maximun-scale=1.0, minimun-scale=1.0">
        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <jsp:include page="../../jspf/impmaterialize.jspf"></jsp:include>

            <script>
                $(document).ready(function () {
                    $('select').material_select();

                });
            </script>
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page"></jsp:useBean>
        <jsp:useBean id="list_e" scope="session" class="java.util.ArrayList"/>
    </head>
    <body>
        <div style="width: 65%; margin: auto">
            <form method="post" action="esc" id="data">
                
                <input type="hidden" name="opc" value="2">
                <center><h2 style="color:#00bfa5">Editar Escuela Sabática</h2></center>
                <br/><br/>
                <div class="input-field col s12" >
                    <select name="n_distrito" id="distrito">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <%
                            ResultSet rs = di.listar_Distritos("SELECT * FROM distritom order by NOMBRE");
                            while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("idDISTRITOM")%>"><%= rs.getString("NOMBRE")%></option>
                        <%
                            }
                        %>
                    </select>
                    <label>Elegir Distrito</label>
                </div>
                <% for (int i = 0; i < list_e.size(); i++) {
                        EscuelaDTO escuela = new EscuelaDTO();
                        escuela = (EscuelaDTO) list_e.get(i);
                %>
                <div class="input-field col s6">
                    <input id="i_es" name="n_es" type="text" class="validate" value="<%= escuela.getNombre() %>">
                    <label for="i_es" style="margin-top: 1%">Nombre de la Escuela Sabática</label>
                </div>
                    <input type="hidden" name="id" value="<%= escuela.getIdEscuela() %>">
                    <% } %>
                <br/><br/>
                <button class="btn waves-effect waves-light" type="submit" name="action" style="width: 100%;background-color: #b71c1c;">Guardar Cambios
                    <i class="material-icons right">send</i>
                </button>
            </form>

        </div>

    </body>
</html>
