<%-- 
    Document   : ListarIntegrante
    Created on : 23/05/2016, 11:10:32 AM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="com.upeu.mipes.dao.PersonaDAO" id="per" scope="page"></jsp:useBean>
<%@page import="com.upeu.mipes.dto.PersonaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.dto.IntegranteDTO"%>
<jsp:useBean id="list" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html5>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form>
            <div class="input-field col s12 m6">
                <input id="search" type="search" required>
                <label for="search"><i class="material-icons">search</i></label>
                <i class="material-icons">close</i>
                <!--<label for="search">Buscar</label>-->
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th colspan="2">Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String sql = "SELECT * FROM persona ORDER BY NOMBRES";
                        ResultSet rs = per.listarPersonas(sql);
                        while(rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("idPERSONA")%></td>
                        <td><%= rs.getString("NOMBRES")%></td>
                        <td><%= rs.getString("APELLIDOS")%></td>
                        <td><%= rs.getString("TELEFONO")%></td>
                        <td><%= rs.getString("DIRECCION")%></td>
                        <td>
                            <a href="regPer?op=2&id=<%= rs.getString("idPERSONA") %>" class="btn btn-success">Editar</a>
                        </td>
                        <td>
                            <a href="../../regPer?op=3&id=<%= rs.getString("idPERSONA") %>" class="btn btn-danger">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </form>
    </body>
</html>
