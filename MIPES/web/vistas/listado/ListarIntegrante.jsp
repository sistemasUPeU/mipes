<%-- 
    Document   : ListarIntegrante
    Created on : 23/05/2016, 11:10:32 AM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.dto.IntegranteDTO"%>
<jsp:useBean id="list" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html5>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form>
            <div class="input-field col s12 m6">
                <input id="search" type="search" required>
                <label for="search"><i class="material-icons">search</i></label>
                <i class="material-icons">close</i>
                <!--                <label for="search">Buscar</label>-->
            </div>
        </form>

        <table class="table table-bordered" style="width: 800px;">
            <tr>
                <th>Id</th>
                <th>Departamento</th>
                <th>Centro Costos</th>
                <th>Status</th>
                <th></th>
            </tr>
            <% for (int i = 0; i < list.size(); i++) {
                    IntegranteDTO integr = new IntegranteDTO();
                    integr = (IntegranteDTO) list.get(i);
            %>
            <tr>
                <td><%= integr.getNombre()%></td>
                <td><%= integr.getApellidos()%></td>
                <td><%= integr.getEmail()%></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
