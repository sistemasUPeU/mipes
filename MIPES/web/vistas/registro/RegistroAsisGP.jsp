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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/datatables/dataTables.material.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/material.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/select/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Registro de Asistencia GP</title>
        <style>
            .col{
                margin-bottom: 12px;
            }

        </style>
    </head>
    <body>
        <br>
        <div>
            <center><span class="mdl-layout-title">Registro de Asistencia de Grupos Pequeños</span></center>
            <br>
            <div class="container">
                <div class="panel panel-default conDist">
                    <div class="panel-heading">
                        <h5 class="panel-title">Seleccionar Grupo Pequeño</h5>
                    </div>
                    <div class="panel-body">
                        <div class="col col-lg-4 col-md-4 col-sm-12 col-xs-12 CDistrito">
                            <select title="Seleccione Distrito" 
                                    class="selDis selectpicker form-control" data-live-search="true"></select>
                        </div>
                        <div class="col col-lg-4 col-md-4 col-sm-12 col-xs-12 CEscuela">
                            <select title="Seleccione Escuela Sabática" 
                                    class="selEs selectpicker form-control" data-live-search="true"></select>
                        </div>
                        <div class="col col-lg-4 col-md-4 col-sm-12 col-xs-12 CGrupo">
                            <select title="Seleccione Grupo Pequeño" 
                                    class="selGru selectpicker form-control" data-live-search="true">
                            </select>
                        </div>
                    </div>
                </div>

            </div>
            <br>
            <div class="container">
                <center><span class="mdl-layout-title titGrupo"></span></center>
                <center>
                    <div class="contLista">
                        <table id="lista" class="mdl-data-table mdl-shadow--2dp table-responsive" style="width: 100%">
                            <thead>
                                <tr>
                                    <th class="hidden-xs">Nro</th>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th class="hidden-sm hidden-xs">Cumpleaños</th>
                                    <th class="hidden-xs">Nivel Asistencia</th>
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
                <div class="well contresumen">
                    <div class="row">
                        <div class="col col-lg-12">
                            <span class="mdl-layout-title">Resumen de Asistencia</span>
                            <br>
                            <div class="form-horizontal">
                                <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="col col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="presentes">Presentes</label>
                                            <input type="number" class="form-control" 
                                                   id="presentes" value="0" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="visitas">Visitas</label>
                                            <input type="number" class="form-control" id="visitas" 
                                                   placeholder="Especificar cantidad de visitas"
                                                   min="0">
                                        </div>
                                    </div>
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="col col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="faltas">Faltas</label>
                                            <input type="number" class="form-control" 
                                                   id="faltas" value="0" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="lugar">Lugar de Reunion</label>
                                            <input type="text" class="form-control" 
                                                   id="lugar" placeholder="Especificar lugar de Reunion">
                                        </div>
                                    </div>
                                </div>

                                <div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12 pull-right" style="padding-top: 25px;">
                                    <a class="btn btn-primary btn-block regAsist">Guardar Cambios</a>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- pace -->
        <script src="../../js/material.js" type="text/javascript"></script>
        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/select/bootstrap-select.min.js" type="text/javascript"></script>
        <script src="../../js/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../../js/datatables/dataTables.material.min.js" type="text/javascript"></script>
        <script src="../../js/custom/selectDEGP.js" type="text/javascript"></script>
        <script>
            function selgruActions(selgru) {
                idgrupo = selgru.val();
                listar(idgrupo);
                $('.titGrupo').text('Lista de Integrantes del Grupo Pequeño ' + selgru.children().attr('title'));

            }
        </script>
        <script>
            var idgrupo = 0;
            var presentes = 0;
            var faltas = 0;
            var integr = [];
            var asist = [];

            function listar(idgrupo) {

                var url = "../../Asistencia?opc=listintgp&idgrupo=" + idgrupo;

                $.post(url, function (objJson) {
                    var list = objJson.lista;
                    if (list.length > 0) {
                        $('.contresumen').show();
                        var t = "";
                        integr = [];
                        asist = [];
                        for (var i = 0; i < list.length; i++) {
                            t += "<tr>";
                            t += "<td class='hidden-xs'>" + (i + 1) + "</td>";
                            t += "<td><center>" + list[i].NOMBRES + "</center></td>";
                            t += "<td><center>" + list[i].APELLIDOS + "</center></td>";
                            t += "<td class='hidden-sm hidden-xs'><center>" + getCumpleanios(new Date(list[i].CUMPLE)) + "</center></td>";
                            t += "<td class='hidden-xs'>";
                            t += '<div class="progress" style="margin-bottom:0px">';
                            var col="";
                            if(list[i].PORCENTAJE < 25){
                                col="progress-bar-danger";
                            }else if(list[i].PORCENTAJE >= 25 && list[i].PORCENTAJE < 75){
                                col="progress-bar-warning";
                            }
                            else if(list[i].PORCENTAJE >= 75){
                                col="";
                            }
                            t += '<div class="progress-bar '+col+'" role="progressbar"';
                            t += 'aria-valuenow="' + list[i].PORCENTAJE + '" aria-valuemin="0" aria-valuemax="100"';
                            t += 'style="min-width: 2em;width: ' + list[i].PORCENTAJE + '%;">' + list[i].PORCENTAJE + '%</div></div>';
                            t += "</td>";
                            t += '<td><center>';
                            t += '<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switch-' + i + '">';
                            t += '<input type="checkbox" id="switch-' + i + '" class="mdl-switch__input chk" >';
                            t += '<span class="mdl-switch__label"></span></label>';
                            t += '</center></td>';
                            t += "</tr>";
                            integr[i] = list[i].idintgp;
                            asist[i] = false;
                        }
                        $('.contLista').empty();
                        $('.contLista').append(cargarTabla());
                        $('.listaBody').append(t);
                        faltas = list.length;
                        updateValues();
                        $('.chk').click(function () {
                            var tmp = $(this).attr('id');
                            var nro = tmp.substring(7, 8);
                            if ($('#switch-' + nro).is(':checked')) {
                                presentes = presentes + 1;
                                faltas = faltas - 1;
                                asist[nro] = true;
                                updateValues();
                            } else {
                                presentes = presentes - 1;
                                faltas = faltas + 1;
                                asist[nro] = false;
                                updateValues();
                            }
                        });
                        $('#lista').DataTable({
                            "pageLength": 25,
                            "bLengthChange": false
                        });

                    } else {
                        $('.contresumen').hide();
                    }
                    $('.regAsist').click(function () {
                        var visitas = $('#visitas').val();
                        if (visitas.length === 0) {
                            visitas = 0;
                        }
                        var lugar = $('#lugar').val();
                        var idasist = 0;
                        //Reg Asistencia Grupal
                        var url = "../../Asistencia?opc=asistencia";
                        var data = "presentes=" + presentes;
                        data += "&faltas=" + faltas;
                        data += "&visitas=" + visitas;
                        data += "&lugar=" + lugar;
                        data += "&idgrupo=" + idgrupo;

                        $.post(url, data, function (objJson) {
                            idasist = objJson.idasist;

                            url = "../../Asistencia?opc=asintgp";
                            var ok = 0;
                            for (var i = 0; i < integr.length; i++) {
                                data = "idintegrante=" + integr[i];
                                var as = 0;
                                if (asist[i] === true) {
                                    as = 1;
                                }
                                data += "&asist=" + as;
                                data += "&idasist=" + idasist;
                                $.post(url, data, function (objJson) {
                                    ok = ok + 1;
                                });
                            }
                            window.top.location.href = '../../home';



                        });
                    });
                }).fail(function () {
                    alert('error');
                });

            }
            function updateValues() {
                $('#presentes').val(presentes);
                $('#faltas').val(faltas);
            }

            function cargarTabla() {
                var r = '<table id="lista" class="mdl-data-table mdl-shadow--2dp table-responsive" style="width: 100%">';
                r += '<thead><tr><th class="hidden-xs">Nro</th><th>Nombres</th><th>Apellidos</th>';
                r += '<th class="hidden-sm hidden-xs">Cumpleaños</th><th class="hidden-xs">Nivel Asistencia</th>';
                r += '<th>Asistencia</th></tr></thead><tbody class="listaBody"></tbody></table>';
                return r;
            }

            function getCumpleanios(date) {
                var month = date.getMonth() + 1;
                var nmonth = "";
                switch (month) {
                    case 1:
                        nmonth = "Enero";
                        break;
                    case 2:
                        nmonth = "Febrero";
                        break;
                    case 3:
                        nmonth = "Marzo";
                        break;
                    case 4:
                        nmonth = "Abril";
                        break;
                    case 5:
                        nmonth = "Mayo";
                        break;
                    case 6:
                        nmonth = "Junio";
                        break;
                    case 7:
                        nmonth = "Julio";
                        break;
                    case 8:
                        nmonth = "Agosto";
                        break;
                    case 9:
                        nmonth = "Septiembre";
                        break;
                    case 10:
                        nmonth = "Octubre";
                        break;
                    case 11:
                        nmonth = "Noviembre";
                        break;
                    case 12:
                        nmonth = "Diciembre";
                        break;
                }
                var day = date.getDate();
                return day + " de " + nmonth;
            }

            $(document).ready(function () {
                //Variables


                //Inicio

                initComponents();

                //Funciones
                function initComponents() {
                    $('.contresumen').hide();
                    $('#lista').DataTable({
                        "pageLength": 25,
                        "bLengthChange": false
                    });
                    $('#lista_filter').addClass('pull-right');
                    listar();
                    listarDistrito("../../", $('.CDistrito'), $('.CEscuela'), $('.CGrupo'));
                }
            });

        </script>



    </body>
</html>
