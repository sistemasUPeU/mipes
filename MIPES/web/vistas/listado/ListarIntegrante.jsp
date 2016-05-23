<%-- 
    Document   : ListarIntegrante
    Created on : 23/05/2016, 11:10:32 AM
    Author     : Andrew
--%>

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
        <form>
            <div class="input-field col s12 m6">
                <input id="search" type="search" required>
                <label for="search"><i class="material-icons">search</i></label>
                <i class="material-icons">close</i>
<!--                <label for="search">Buscar</label>-->
            </div>
        </form>
        <table class="responsive-table striped">
            <thead>
                <tr>
                    <th data-field="id">Grupo</th>
                    <th data-field="name">Cargo</th>
                    <th data-field="price">Ministerio</th>
                    <th data-field="id">Nombre</th>
                    <th data-field="name">Apellidos</th>
                    <th data-field="id">Email</th>
                    <th data-field="name">Teléfono</th>
                    <th data-field="price">Direccion</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>Alvin</td>
                    <td>Eclair</td>
                    <td>$0.87</td>
                    <td>Alvin</td>
                    <td>Eclair</td>
                    <td>$0.87</td>
                    <td>Alvin</td>
                    <td>Eclair</td>
                </tr>
                <tr>
                    <td>Teodoro</td>
                    <td>Jellybean</td>
                    <td>$3.76</td>
                    <td>Teodoro</td>
                    <td>Jellybean</td>
                    <td>$3.76</td>
                    <td>Teodoro</td>
                    <td>Jellybean</td>
                </tr>
                <tr>
                    <td>Simón</td>
                    <td>Lollipop</td>
                    <td>$7.00</td>
                    <td>Simón</td>
                    <td>Lollipop</td>
                    <td>$7.00</td>
                    <td>Simón</td>
                    <td>Lollipop</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
