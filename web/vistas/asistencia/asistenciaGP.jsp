<%-- 
    Document   : asistenciaGP
    Created on : 20/07/2016, 06:35:13 PM
    Author     : Andres
--%>

<%@page import="com.upeu.mipes.controller.MainControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%boolean enable = false;%>
<%//Lider de Grupo =2
    if (MainControl.validateRol("2", session)) {
        enable = true;
    }
%>
<%if (enable) {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/customSwitch.css" rel="stylesheet" type="text/css"/>
        <link href="css/datatables/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/ico/Home-48.png">
        <link href="css/custommin.css" rel="stylesheet" type="text/css"/>
        <title>Registro de Asistencia de Integrantes de GP</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
        <header>
            <center><h3>Registro de Asistencia de Grupos Pequeños</h3></center>
        </header>
        <div class="container" id="containerMessage" style="display: none">
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="alert alert-success" role="alert">
                        <p><strong>¡Felicidades!</strong> Ha registrado la asistencia de su Grupo Pequeño
                            a la reunion de esta semana, espere a la otra semana para poder registrar su asistencia.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" id="containerReg" style="display: none">
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Grupo Pequeño: <strong id="nombreGP"></strong></div>
                        <div class="panel-body">
                            <div id="contTable" class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <table id="tableAsistencia" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th class='hidden-xs'>Nro</th>
                                            <th>Nombres y Apellidos</th>
                                            <th>Nivel de Asistencia</th>
                                            <th>Asistencia</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableBody"></tbody>
                                </table>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <input id="buttonSave" class="btn btn-primary pull-right" value="Guardar Cambios"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
            <div id="modalContainer">

            </div>
        </div>
        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!--DataTables-->
        <script src="js/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="js/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- Alert Plugin-->
        <script src="js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="js/notify/pnotify.nonblock.js" type="text/javascript"></script>
        <script src="js/notify/customNotify.js" type="text/javascript"></script>

        <!--Selector Plugin-->
        <script src="js/selector/customSelector.js" type="text/javascript"></script>

        <!--Modal Plugin-->
        <script src="js/modal/customModal.js" type="text/javascript"></script>
        <script>
            var modal = new customModal();
            var listId = [];
            var listA = [];
            var presentes = 0;
            var faltas = 0;
            var idGrupo = $('#idGrupoUser').val();
            $('#nombreGP').text($('#nGrupoUser').val());
            modal.setContainer($('#modalContainer'));
            modal.setTitle("Resumen de Asistencia");
            modal.setContent(getmodalContent());
            modal.refreshContent();
            $(document).ready(function () {
                verficarRegistro();
                $('#buttonSave').click(function () {
                    showCustomModal(modal);
                });
                
            });
            

            function verficarRegistro() {
                var url = "reg?tipo=asistencia&opc=puedereg&idgrupo=" + idGrupo;
                $.post(url, function (objJson) {
                    if (objJson.result === true) {
                        enableRegAsistencia();
                    } else {
                        showMessageNextWeek();
                    }
                });
            }

            function enableRegAsistencia() {
                $('#containerReg').show();
                $('#containerMessage').hide();
                $('#tableAsistencia').DataTable();
                listarAsistencia();
            }

            function showMessageNextWeek() {
                $('#containerReg').hide();
                $('#containerMessage').show();
            }

            function modalCancelButton() {
                hideCustomModal(modal);
            }

            function modalOkButton() {
                hideCustomModal(modal);
                regAsistenciaGP();
            }

            function listarAsistencia() {
                var url = "reg?tipo=asistencia&opc=lista&idgrupo=" + idGrupo;
                $.post(url, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista.length > 0) {
                        for (var i = 0; i < lista.length; i++) {
                            t += "<tr>";
                            t += "<td class='hidden-xs'>" + (i + 1) + "</td>";
                            //Apellidos y Nombres
                            t += "<td>" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                            //Porcentaje
                            t += "<td>";
                            t += '<div class="progress" style="margin-bottom:0px">';
                            var col = "";
                            if (lista[i].porcentaje < 25) {
                                col = "progress-bar-danger";
                            } else if (lista[i].porcentaje >= 25 && lista[i].porcentaje < 75) {
                                col = "progress-bar-warning";
                            }
                            else if (lista[i].porcentaje >= 75) {
                                col = "";
                            }
                            t += '<div class="progress-bar ' + col + '" role="progressbar"';
                            t += 'aria-valuenow="' + lista[i].porcentaje + '" aria-valuemin="0" aria-valuemax="100"';
                            t += 'style="min-width: 2em;width: ' + lista[i].porcentaje + '%;">' + lista[i].porcentaje + '%</div></div>';
                            t += "</td>";
                            //Asistencia
                            t += "<td>";
                            t += '<div class="onoffswitch">';
                            t += '<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox asistencia" id="switch' + i + '">';
                            t += '<label class="onoffswitch-label" for="switch' + i + '"></label>';
                            t += '</div>';
                            t += "</td>";
                            t += "</tr>";
                            listId[i] = lista[i].idmiembrogp;
                            listA[i] = false;
                        }
                        faltas = lista.length;
                        updateValues();
                        $('#contTable').empty();
                        $('#contTable').append(getTableConstructor());
                        $('#tableBody').append(t);
                        $('#tableAsistencia').DataTable({
                            "pageLength": 10,
                            "bLengthChange": false
                        });
                        $('.asistencia').click(function () {
                            var tmp = $(this).attr('id');
                            var id = tmp.substring(6, 7);
                            if ($('#switch' + id).is(':checked')) {
                                presentes = presentes + 1;
                                faltas = faltas - 1;
                                listA[id] = true;
                                updateValues();
                            } else {
                                presentes = presentes - 1;
                                faltas = faltas + 1;
                                listA[id] = false;
                                updateValues();
                            }
                        });

                    }
                });
            }

            function regAsistenciaGP() {
                var visitas = $('#visitas').val();
                var lugar = $('#lugar').val();
                var url = "reg?tipo=asistencia&opc=grupo&idgrupo=" + idGrupo;
                var data = "presentes=" + presentes;
                data += "&faltas=" + faltas;
                data += "&visitas=" + visitas;
                data += "&lugar=" + lugar;
                if (lugar !== '' && visitas !== '') {
                    $.post(url, data, function (objJson) {
                        var idAsistencia = objJson.idasistencia;
                        if (idAsistencia !== undefined || idAsistencia !== '') {
                            url = "reg?tipo=asistencia&opc=integrante&idasistenciagp=" + idAsistencia;
                            var count = false;
                            for (var i = 0; i < listA.length; i++) {
                                if (listA[i] === true) {
                                    data = "asistencia=1";
                                } else {
                                    data = "asistencia=0";
                                }
                                data += "&idmiembrogp=" + listId[i];
                                $.post(url, data, function (obj) {
                                    if (obj.result === false) {
                                        errorMessage("Hubo un error al momento de registrar la asistencia!");
                                        count = true;
                                        i = listA.length - 1;
                                    }
                                });
                            }
                            if (count === false) {
                                successMessage("Asistencia registrada correctamente");
                                verficarRegistro();
                            }

                        } else {
                            errorMessage("Error al registrar la Asistencia del Grupo");
                        }
                    });
                } else {
                    errorMessage("Debe especificar el Lugar y la cantidad de visitas, vuelva a intentarlo!");
                }
            }

            function updateValues() {
                $('#presentes').val(presentes);
                $('#faltas').val(faltas);
            }

            function getTableConstructor() {
                var t = '<table id="tableAsistencia" class="table table-bordered table-hover">';
                t += '<thead>';
                t += '<tr>';
                t += '<th class="hidden-xs">Nro</th>';
                t += '<th>Nombres y Apellidos</th>';
                t += '<th>Nivel de Asistencia</th>';
                t += '<th>Asistencia</th>';
                t += '</tr>';
                t += '</thead>';
                t += '<tbody id="tableBody"></tbody>';
                t += '</table>';
                return t;
            }
            function getmodalContent() {
                var t = '<div class="row">';
                t += '<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">';
                t += '<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">';
                t += '<div class="form-group">';
                t += '<label for="presentes">Presentes:</label>';
                t += '<input class="form-control" type="number" id="presentes" readonly>';
                t += '</div>';
                t += '</div>';
                t += '<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">';
                t += '<div class="form-group">';
                t += '<label for="faltas">Faltas:</label>';
                t += '<input class="form-control" type="number" id="faltas" readonly>';
                t += '</div>';
                t += '</div>';
                t += '<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">';
                t += '<div class="form-group">';
                t += '<label for="faltas">Visitas:</label>';
                t += '<input class="form-control" type="number" id="visitas" placeholder="Cantidad de Visitas">';
                t += '</div>';
                t += '</div>';
                t += '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">';
                t += '<div class="form-group">';
                t += '<label for="lugar">Lugar:</label>';
                t += '<input class="form-control" type="text" id="lugar" placeholder="Lugar de Reunion">';
                t += '</div>';
                t += '</div>';
                t += '</div>';
                t += '</div>';
                return t;
            }

        </script>
    </body>
</html>
<%} else {%>
<%@include file="../error/errorUnauthorized.html" %>  
<%}%>