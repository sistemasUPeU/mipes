<%-- 
    Document   : tbmDiscipulador
    Created on : 02/08/2016, 06:02:22 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%try {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/customSwitch.css" rel="stylesheet" type="text/css"/>
        <link href="css/datatables/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/ico/Home-48.png">
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
        <link href="css/custommin.css" rel="stylesheet" type="text/css"/>
        <title>Registro de Trabajo Misionero del Discipulador</title>
    </head>
    <body>
        <input type="hidden" id="idpersona" value="<%=session.getAttribute("idpersona")%>">
        <header class="page-header">
            <center><h3>Registro del Trabjo Misionero del Discipulador</h3></center>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <a type="button" class="btn btn-primary btn-block btnDiscipulador" style="margin-top: 25px;">
                            <i class="fa fa-plus-circle"></i> Asignar Discípulos</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 pull-right">
                    <div class="form-group">
                        <label>Seleccione Tipo de Discipulados:</label>
                        <select class="form-control" id="seltipo">
                            <option value="1">Discipulos por Conversión</option>
                            <option value="2">Discipulos por Adopción</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Lista de <strong id="tipod"></strong></div>
                        <div class="panel-body" id="contTable">
                            <table id="datatable" class="table table-bordered table-condensed table-responsive table-striped">
                                <thead>
                                    <tr>
                                        <th class="hidden-xs">Nro</th>
                                        <th>Nombres y Apellidos</th>
                                        <th class="hidden-xs">Progreso</th>
                                        <th>Registro</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodys"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        Registro de Estudio de Cursos Bíblicos
                    </div>                    
                    <div class="modal-body">
                        <div class="row" id="contSL">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label>Seleccione Curso Bíblico:</label>
                                    <select class="form-control" id="selLeccion"></select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label>Registre una Leccion de Estudios:</label>
                                </div>
                                <div class="container-fluid">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Nro</th>
                                                <th>Nombre</th>
                                                <th>Registrar</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbdLeccion"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>                    
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="button" class="btn btn-default" value="Cancelar" data-dismiss='modal'>
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        Cursos Bíblicos del Discípulo
                    </div>                    
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label>Asigne un Curso Bíblico de Estudios:</label>
                                </div>
                                <div class="container-fluid">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Nro</th>
                                                <th>Nombre</th>
                                                <th>Seleccionar</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbdLeccion2"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="button" class="btn btn-default" value="Cancelar" data-dismiss='modal'>
                            </div>
                        </div>
                    </div>                    
                </div>
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
        <script>
            var tipo = 1;
            var iddi = 0;
            $(document).ready(function () {
                loadDefault();
                
                $('#seltipo').change(function () {
                    $('#tipod').text($('#seltipo :selected').text());
                    listar($('#seltipo').val());
                });
                $('.btnDiscipulador').click(function () {
                    var url = "home?orden=8&opc=2";
                    var data = "&iddiscipulador=" + iddi;
                    document.location = url + data;
                });
            });
            function getIDDI() {
                var url = "crud?ent=discipulador&opc=9&idpersona=" + $('#idpersona').val();
                $.post(url, function (obj) {
                    if (obj.result !== 0) {
                        iddi = obj.result;
                    }
                });
            }
            function loadDefault() {
                $('#datatable').DataTable();
                $('#tipod').text($('#seltipo :selected').text());
                listar($('#seltipo').val());
            }
            function listar(tipo) {
                var url = "crud?ent=discipulador&opc=1";
                var data = "idpersona=" + $('#idpersona').val();
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista !== undefined) {
                        var cont = 0;
                        for (var i = 0; i < lista.length; i++) {
                            if (lista[i].tipo === tipo) {
                                t += "<tr>";
                                t += "<td class='hidden-xs'>" + (cont + 1) + "</td>";
                                t += "<td><i class='fa fa-user'></i>&nbsp;" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                                t += "<td class='hidden-xs'>";
                                t += '<div class="progress" style="margin-bottom:0px">';
                                var col = "";
                                if (lista[i].progreso < 25) {
                                    col = "progress-bar-danger";
                                } else if (lista[i].progreso >= 25 && lista[i].progreso < 75) {
                                    col = "progress-bar-warning";
                                }
                                else if (lista[i].progreso >= 75) {
                                    col = "";
                                }
                                t += '<div class="progress-bar ' + col + '" role="progressbar"';
                                t += 'aria-valuenow="' + lista[i].progreso + '" aria-valuemin="0" aria-valuemax="100"';
                                t += 'style="min-width: 2em;width: ' + lista[i].progreso + '%;">' + lista[i].progreso + '%</div></div>';
                                t += "</td>";
                                t += "<td id='" + lista[i].iddiscipulado + "'><a class='btn btn-primary btnAL'><i class='fa fa-book'></i></a></td>";
                                t += "<td id='" + lista[i].iddiscipulado + "'><a class='btn btn-success btnRegistrar'><i class='fa fa-pencil'></i></a></td>";
                                t += "</tr>";
                                cont++;
                            }
                        }
                        $('#contTable').empty();
                        $('#contTable').append(getTableConstructor());
                        $('#tbodys').append(t);
                        $('#datatable').DataTable();
                        $('.btnRegistrar').click(function () {
                            listarTipoLeccion($(this).parent().attr('id'));
                        });
                        $('.btnAL').click(function () {
                            listarAllTipoLeccion($(this).parent().attr('id'));
                        });
                    } else {
                        $('#contTable').empty();
                        $('#contTable').append(getEmptyConstructor());
                    }
                    getIDDI();
                });
            }
            
            function listarTipoLeccion(id) {
                var url = "crud?ent=leccion&opc=1";
                var data = "iddiscipulado=" + id;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista !== undefined) {
                        if (lista.length > 1) {
                            for (var i = 0; i < lista.length; i++) {
                                if (lista[i].estado === '1') {
                                    t += "<option value='" + lista[i].idtipoleccion + "'>" + lista[i].nombre + "</option>";
                                }
                            }
                            $('#myModal').modal('show');
                            $('#selLeccion').empty();
                            $('#selLeccion').append(t);
                            $('#selLeccion').change(function () {
                                var idt = $('#selLeccion :selected').val();
                                listarLeccion(id, idt);
                            });
                        } else {
                            if (lista.length === 1) {
                                $('#selLeccion').empty();
                                $('#selLeccion').append("<option value='" + lista[0].idtipoleccion + "'>" + lista[0].nombre + "</option>");
                                $('#myModal').modal('show');
                                listarLeccion(id, lista[0].idtipoleccion);
                            } else {
                                infoMessage('No hay Curso Bíblico Asignado');
                            }
                        }
                    }
                });
            }
            function listarAllTipoLeccion(id) {
                alert('hi');
                var url = "crud?ent=leccion&opc=5";
                $.post(url, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista !== undefined) {
                        if (lista.length > 0) {
                            for (var i = 0; i < lista.length; i++) {
                                if (lista[i].estado === '1') {
                                    t += "<tr>";
                                    t += "<td>" + (i + 1) + "</td>";
                                    t += "<td>" + lista[i].nombre + "</td>";
                                    t += "<td id='" + lista[i].idtipoleccion + "'><a class='btn btn-primary btnSelCurso'><i class='fa fa-check'></i></a></td>";
                                    t += "</tr>";
                                }
                            }
                            $('#myModal2').modal('show');
                            $('#tbdLeccion2').empty();
                            $('#tbdLeccion2').append(t);
                            $('.btnSelCurso').click(function () {
                                url = "crud?ent=leccion&opc=8";
                                var data = "idtipoleccion=" + $(this).parent().attr('id');
                                data += "&iddiscipulado=" + id;
                                $.post(url, data, function (obj) {
                                    if (obj.result) {
                                        successMessage("Curso Bíblico asignado correctamente!");
                                        $('#myModal2').modal('hide');
                                    } else {
                                        infoMessage("El Curso Bíblico ya esta asignado para el Discipulo!");
                                    }
                                });
                            });
                        }
                    }
                });
            }
            function listarLeccion(idd, id) {
                var url = "crud?ent=leccion&opc=2";
                var data = "idtipoleccion=" + id;
                data += '&iddiscipulado=' + idd;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista !== undefined) {
                        for (var i = 0; i < lista.length; i++) {
                            t += "<tr>";
                            t += "<td>" + (i + 1) + "</td>";
                            t += "<td>" + lista[i].nombre + "</td>";
                            if (lista[i].trabajo >0) {
                                t += "<td><span class='label label-success'>Completado</span></td>";
                            } else {
                                t += "<td id='" + lista[i].idleccion + "'><a class='btn btn-success btnSeleccionar'><i class='fa fa-check'></i></a></td>";
                            }
                            t += "</tr>";
                        }
                        $('#tbdLeccion').empty();
                        $('#tbdLeccion').append(t);
                        $('.btnSeleccionar').click(function () {
                            var idleccion = $(this).parent().attr("id");
                            var url = "crud?ent=leccion&opc=9";
                            var data = "idleccion=" + idleccion;
                            data += "&iddiscipulado=" + idd;
                            data += "&iddiscipulador=" + iddi;
                            $.post(url, data, function (obj) {
                                $('#myModal').modal('hide');
                                if (obj.result) {
                                    successMessage("Estudio de Leccion registrado con Éxito!");
                                    listar($('#seltipo').val());
                                }else{
                                    errorMessage("Error al registrar el estudio de la Leccion!");
                                } 
                            });
                        });
                    }
                });
            }
            function getTableConstructor() {
                var t = '<table id="datatable" class="table table-bordered table-condensed table-responsive table-striped">';
                t += '<thead>';
                t += '<tr>';
                t += '<th class="hidden-xs">Nro</th>';
                t += '<th>Nombres y Apellidos</th>';
                t += '<th class="hidden-xs">Progreso</th>';
                t += '<th>Curso</th>';
                t += '<th>Registro</th>';
                t += '</tr>';
                t += '</thead>';
                t += '<tbody id="tbodys"></tbody>';
                t += '</table>';
                return t;
            }
            function getEmptyConstructor() {
                var t = '<div class="alert alert-warning" role="alert">';
                t += '<p>No tiene discipulos asignados, puede <a href="home?orden=8&opc=2"><strong>Registrarlos</strong></a> o pedir a su lider que le asigne.';
                t += '</p>';
                t += '</div>';
                return t;
            }
        </script>
    </body>
</html>
<%} catch (Exception e) {%>
<%@include file="../error/errorServer.html" %>
<%}%>