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
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="../../css/datatables/dataTables.material.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/material.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/select/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Registro de Asistencia GP</title>
    </head>
    <body>
        <style>
            .mdl-card__title{
                height: 80px;
                background-color: #003973;
                color: white;
            }
            .mdl-card{
                width: 100%;
            }
        </style>

        <br>
        <div>
            <center><span class="mdl-layout-title">Registro de Asistencia de Grupos Pequeños</span></center>
            <br>
            <div class="container">
                <div class="row">
                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12 CDistrito">
                            <select title="Seleccione Distrito" class="selDis selectpicker" data-live-search="true"></select>
                        </div>
                        <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12 CEscuela">
                            <select title="Seleccione Escuela Sabática" class="selEs selectpicker" data-live-search="true"></select>
                        </div>
                        <div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12 CGrupo">
                            <select title="Seleccione Grupo Pequeño" 
                                    class="selGru selectpicker" data-live-search="true">
                            </select>
                        </div>
                    </div>
                </div>

            </div>
            <br>
            <div class="container">
                <center>
                    <div class="contLista">
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
                            <tbody class="listaBody">
                            </tbody>
                        </table>
                    </div>
                </center>
            </div>
            <div class="container">
                <div class="mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-color--primary-50">
                        <h2 class="mdl-card__title-text">Resumen de Asistencia</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <ul class="mdl-list">
                            <li class="mdl-list__item">
                                <span class="mdl-list__item-primary-content">
                                    <i class="material-icons mdl-list__item-icon">person</i>
                                    Numero de Asistentes : 10
                                </span>
                            </li>
                            <li class="mdl-list__item">
                                <span class="mdl-list__item-primary-content">
                                    <i class="material-icons mdl-list__item-icon">person</i>
                                    Numero de Faltas : 2
                                </span>
                            </li>
                            <li class="mdl-list__item">
                                <span class="mdl-list__item-primary-content">
                                    <i class="material-icons mdl-list__item-icon">person</i>
                                    Numero de Visitas : 0
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
                            Enviar
                        </a>
                    </div>
                </div>
                <br><br>
            </div>
        </div>



        <!-- pace -->

        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/select/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="../../js/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../../js/datatables/dataTables.material.min.js" type="text/javascript"></script>
        <script src="../../js/material.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#lista').DataTable({
                 "pageLength": 100,
                 "bLengthChange": false
                 });
                listar();

                listarDistrito();
                //Selectores anidados

                $('.selEs').change();
                $('.selGru').change();
                //Listado de Selectores
                function listarDistrito() {
                    var url = "../../distrito?opc=listar";
                    $.post(url, function (objJson) {
                        var lista = objJson.lista;
                        var t = "<option value=''>[Seleccione Distrito]</option>";
                        for (var i = 0; i < lista.length; i++) {
                            t += "<option value='" + lista[i].idDISTRITOM + "'>" + lista[i].NOMBRE + "</option>";
                        }
                        $('.CDistrito').empty();
                        $('.CDistrito').append('<select title="Seleccione Distrito" class="selDis selectpicker" data-live-search="true"></select>');
                        $('.selDis').append(t);
                        $('.selDis').addClass("selectpicker");
                        $('.selDis').attr("data-live-search", true);
                        $('.selectpicker').selectpicker();
                        $('.selDis').change(function () {
                            listarEscuela($(this).val());
                        });
                    });

                }
                function listarEscuela(idDistrito) {
                    var url = "../../Asistencia?opc=listes&iddistrito=" + idDistrito;
                    $.post(url, function (objJson) {
                        var lista = objJson.lista;
                        var t = "<option value=''>[Seleccione Escuela]</option>";
                        for (var i = 0; i < lista.length; i++) {
                            t += "<option value='" + lista[i].idEscuela + "'>" + lista[i].NOMBRE + "</option>";
                        }
                        $('.CEscuela').empty();
                        $('.CEscuela').append('<select title="Seleccione Escuela Sabática" class="selEs selectpicker" data-live-search="true"></select>');
                        $('.selEs').empty();
                        $('.selEs').append(t);
                        $('.selEs').addClass("selectpicker");
                        $('.selEs').attr("data-live-search", true);
                        $('.selectpicker').selectpicker();
                    });
                }
                function listarGrupo(idEscuela) {

                }

                function listar() {

                    var url = "../../Asistencia?opc=listintgp";

                    $.post(url, function (objJson) {
                        var list = objJson.lista;
                        if (list.length > 0) {
                            var t = "";
                            for (var i = 0; i < list.length; i++) {
                                t += "<tr>";
                                t += "<td class='hidden-sm hidden-xs'>" + (i + 1) + "</td>";
                                t += "<td><center>" + list[i].NOMBRES + "</center></td>";
                                t += "<td><center>" + list[i].APELLIDOS + "</center></td>";
                                t += "<td class='hidden-sm hidden-xs'><center>" + list[i].FE_NACIMIENTO + "</center></td>";
                                t += "<td class='hidden-sm hidden-xs'><center>B</center></td>";
                                t += '<td><center><label style="width: auto" ';
                                t += 'class="mdl-switch mdl-js-switch mdl-js-ripple-effect"';
                                t += 'for="switch-' + i + '">';
                                t += '<input type="checkbox" id="switch-' + i + '" class="chk">';
                                t += '</label></center></td>';
                                t += "</tr>";
                            }
                            $('.contLista').empty();
                            $('.contLista').append(cargarTabla());
                            $('.listaBody').append(t);
                            $('#lista').DataTable({
                                "pageLength": 100,
                                "bLengthChange": false
                            });
                            $('.chk').addClass("mdl-switch__input");
                            $('.chk').click(function () {
                                alert($(this).attr("id"));

                            });

                        } else {
                            alert('0');
                        }
                    }).fail(function () {
                        alert('error');
                    });
                }

                function cargarTabla() {
                    var r = '<table id="lista" class="mdl-data-table mdl-shadow--2dp table-responsive" style="width: 100%">';
                    r += '<thead><tr><th class="hidden-sm hidden-xs">Nro</th><th>Nombres</th><th>Apellidos</th>';
                    r += '<th class="hidden-sm hidden-xs">Cumpleaños</th><th class="hidden-sm hidden-xs">Nivel Asistencia</th>';
                    r += '<th>Asistencia</th></tr></thead><tbody class="listaBody"></tbody></table>';
                    return r;
                }

            });

        </script>



    </body>
</html>
