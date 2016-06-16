<%-- 
    Document   : Reg_asis
    Created on : 20/05/2016, 05:32:34 PM
    Author     : USER
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/material.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="../../css/datatables/dataTables.material.min.css" rel="stylesheet" type="text/css"/>

        <link href="../../css/estilo.css" rel="stylesheet" type="text/css"/>


        <title>Registro de Asistencia GP</title>
    </head>
    <body>

        <br>
        <div>
            <center><span class="mdl-layout-title">Registro de Asistencia de Grupos Pequeños</span></center>
            <br>
            <div class="container">
                <div class="row">
                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <select data-placeholder="Seleccione Distrito" 
                                    class="chosen-select" style="width:350px;">
                                <option></option>
                                <option>hola</option>
                                <option>que</option>
                                <option>qtal</option>
                                <option>jejeje</option>
                            </select>
                        </div>
                        <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <select data-placeholder="Seleccione Escuela Sabática" 
                                    class="chosen-select" style="width:350px;">
                                <option></option>
                                <option>hola</option>
                                <option>que</option>
                                <option>qtal</option>
                                <option>jejeje</option>
                            </select>
                        </div>
                        <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <select data-placeholder="Seleccione Grupo Pequeño" 
                                    class="chosen-select" style="width:350px;">
                                <option></option>
                                <option>hola</option>
                                <option>que</option>
                                <option>qtal</option>
                                <option>jejeje</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>
            <br>
            <div class="container">
                <span class="mdl-layout-title">Lista de Integrantes</span>
                <br>
                <center>

                    <table id="lista" class="mdl-data-table mdl-shadow--2dp table-responsive" style="width: 100%">
                        <thead>
                            <tr>
                                <th class="hidden-sm hidden-xs">Nro</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th class="hidden-sm hidden-xs">Cumpleaños</th>
                                <th class="hidden-sm hidden-xs">Nivel Asistencia</th>
                                <th>Asistencia</th>
                            </tr>

                        </thead>
                        <tbody>
                            <% ArrayList<Map<String, ?>> listaIntegranteGP= 
                                    (ArrayList<Map<String, ?>>)request.getSession().getAttribute("listaIntegranteGP");
                                for (int i = 0; i < listaIntegranteGP.size(); i++) {
                                Map<String, Object> m= (Map<String, Object>)listaIntegranteGP.get(i);
                                Date cum=(Date)m.get("FE_NACIMIENTO");
                            %>
                            <tr>
                                <td class="hidden-sm hidden-xs"><%=i + 1%></td>
                                <td><%=m.get("NOMBRES") %></td>
                                <td><%=m.get("APELLIDOS") %></td>
                                <td class="hidden-sm hidden-xs"><%= cum.toString() %></td>
                                <td class="hidden-sm hidden-xs">B</td>
                                <td><center>
                            <label style="width: auto" class="mdl-switch mdl-js-switch mdl-js-ripple-effect" 
                                   for="switch-<%=i%>">
                                <input type="checkbox" id="switch-<%=i%>" class="mdl-switch__input">
                            </label></center>
                        </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </center>
            </div>
            <div class="container">
                <div class="well mdl-shadow--2dp">
                    <div class="mdl-card__title">
                        <center><h2 class="mdl-card__title-text">Resumen de Asistencia Grupal</h2></center>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <ul class="demo-list-icon mdl-list">
                            <li class="mdl-list__item">
                                <span class="mdl-list__item-primary-content">
                                    <i class="material-icons mdl-list__item-icon">person</i>
                                    Bryan Cranston
                                </span>
                            </li>
                            <li class="mdl-list__item">
                                <span class="mdl-list__item-primary-content">
                                    <i class="material-icons mdl-list__item-icon">person</i>
                                    Aaron Paul
                                </span>
                            </li>
                            <li class="mdl-list__item">
                                <span class="mdl-list__item-primary-content">
                                    <i class="material-icons mdl-list__item-icon">person</i>
                                    Bob Odenkirk
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="mdl-card__actions">
                        <a href="#" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">Enviar</a>
                    </div>
                </div>                        
            </div>
        </div>



        <!-- pace -->

        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../../js/datatables/dataTables.material.min.js" type="text/javascript"></script>
        <script src="../../js/chosen/chosen.jquery.min.js" type="text/javascript"></script>
        <script src="../../js/chosen/docsupport/prism.js" type="text/javascript"></script>
        <script src="../../js/material.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                var table = $('#lista').DataTable({
                    "pageLength": 100,
                    "bLengthChange": false
                });
                $('.chosen-select').chosen();

            });

        </script>



    </body>
</html>
