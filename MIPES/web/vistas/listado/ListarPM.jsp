<%-- 
    Document   : ListarPM
    Created on : 18/06/2016, 12:04:51 AM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="com.upeu.mipes.dao.ParejamDAO" id="parj" scope="page" ></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <table class="striped centered responsive-table">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Teléfono</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String sql = "SELECT * FROM parejam ORDER BY idPAREJAM";
                    ResultSet rs = parj.listar_pareja(sql);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("NOMBRES")%></td>
                    <td><%= rs.getString("APELLIDOS")%></td>
                    <td><%= rs.getString("TELEFONO")%></td>
                    <td>
                        <a href="dis?opc=2" class="btn btn-success">Editar</a>
                    </td>
                    <td>
                        <a href="dis?opc=4" class="btn btn-danger">Eliminar</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
