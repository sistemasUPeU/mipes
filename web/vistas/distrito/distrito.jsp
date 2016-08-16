<%-- 
    Document   : distrito
    Created on : 14/07/2016, 07:41:14 PM
    Author     : Andres
--%>

<%@page import="com.upeu.mipes.controller.MainControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%boolean enable = false;%>
<%//MIPES CAMPO 7
    if (MainControl.validateRol("7", session)) {
        enable = true;
    }
%>
<%if (enable) {%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/ico/Home-48.png">
        <link href="css/custommin.css" rel="stylesheet" type="text/css"/>
        <title>Gestion de Distritos</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
        <header class="page-header">
            <center><h3>Gestion de Distritos Misioneros</h3></center>
        </header>
        <div class="container">

            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="selectContainer"></div>                    
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default" id="contAddDistrito" style="display: none">
                        <div class="panel-heading">Agregar Distrito Misionero</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <form id="addForm">
                                    <label>Nombre:</label>
                                    <input type="text" class="form-control" name="nombre" maxlength="64" id="nomdis" placeholder="Nombre de Distrito">
                                    <input type="hidden" id="idlid" name="idlider" value="0">
                                    <input type="hidden" name="opc" value="2">
                                    <input type="hidden" name="ent" value="distrito">
                                    <input type="hidden" id="idcamp" name="idcampo" value="0"></form>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <input type="button" class="btn btn-default pull-left" id="btnCancelAdd" value="Cancelar">                
                                    <input type="button" class="btn btn-primary pull-right" id="btnAddDistrito" value="Agregar">                
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default" id="contListDistrito" style="display: none">
                        <div class="panel-heading">Lista de Distritos del campo <strong id="nombreCampo"></strong></div>
                        <div class="panel-body">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 contTable">
                                <table id="datatable" class="table table-responsive table-striped table-hover table-bordered" cellspacing="0" width="100%">
                                    <thead>
                                        <tr><th colspan="4">Datos de Distrito</th>
                                            <th colspan="3">Opciones</th>
                                        </tr>
                                        <tr>
                                            <th>Nro</th>
                                            <th>Nombre</th>
                                            <th>Lider de MIPES</th>
                                            <th>Estado</th>
                                            <th>Editar</th>
                                            <th>Asignar MIPES</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody class="tbodys">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="mySmallModalLabel">Editar Distrito Misionero</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-horizontal col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="nombre">Nombre:</label>
                                    <input id="nom" class="form-control" type="text" maxlength="35" name="nombre" placeholder="Nombre del nuevo Distrito">
                                </div>
                                <div class="form-group">
                                    <label for="estado">Estado:</label>
                                    <select id="est" name="estado" class="form-control">
                                        <option value="1">Activo</option>
                                        <option value="0">Inactivo</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="idd" value="0">
                            <input type="button" value="Editar" class="btn btn-primary pull-right editar">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" role="dialog">
                <div class="modal-dialog" role="document" id="modalC">
                </div>
            </div>
        </div>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!--DataTables-->
        <script src="js/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="js/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- Alert Plugin-->
        <script src="js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="js/notify/pnotify.nonblock.js" type="text/javascript"></script>
        <script src="js/notify/customNotify.js" type="text/javascript"></script>
        <!--Modal Plugin-->
        <script src="js/modal/customModal.js" type="text/javascript"></script>
        <!--Buscador Plugin-->
        <script src="js/persona/buscadorPersona.js" type="text/javascript"></script>
        <!--Registro Lider MIPES Plugin-->
        <script src="js/regLiderMipes.js" type="text/javascript"></script>
        <script>
            function registrarLiderSuccess() {
                //Accion a realizarse cuando se registra
                successMessage("MIPES Asignado con exito!");
                listar($('#idCampoUser').val());
            }
            ;
            function registrarLiderError() {
                //Accion a realizarse cuando hay error
                errorMessage("Error al asignar Lider");
            }
            ;
        </script>
        <script>
            //SELECTOR
            var idCampo = '0';
            //MODAL
            var mod = new customModal($('#modalC'));
            mod.setTitle("Asignar Lider de MIPES");
            mod.refreshContent();
            //BUSCADOR
            var search = new BuscadorP();
            search.core.setContainer($('#modalC'));
            search.core.parametros.setFiltroNull();
            search.core.parametros.setUrl("rep?opc=buscarPersona");
            search.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
            search.show();
            //FUNCION DEL BUSCADOR
            function getPersonaId(id) {
                $('#idlid').val(id);
                search.core.container.parent().modal('hide');
                asignarLider(id);
            }
            function asignarLider(id) {
                var url = "crud?ent=distrito&opc=6";
                var data = "idlider=" + id;
                data += "&iddistrito=" + $('#idd').val();
                $.post(url, data, function (objJson) {
                    if (objJson.result === true) {
                        successMessage("Lider Asignado Con exito!");
                        listar(idCampo);
                    } else {
                        errorMessage("Error al Asignar Lider");
                    }
                    modo = 1;
                });
            }
            //FUNCION DEL SELECTOR
            function getItemSelected(id, name) {
                idCampo = id;
                $('#nombreCampo').text(name);
                $('#contAddDistrito').show();
                $('#contListDistrito').show();
                $('#btnAddMIPES').show();
                $('#idcamp').val(idCampo);
                listar(idCampo);

            }
            function onClearCustomSelector() {
                $('#contAddDistrito').hide();
                $('#contListDistrito').hide();
                $('#idcamp').val(0);
                $('#idlid').val(0);
            }
            //FUNCION DEL MODAL
            function cancelBuscadorP() {
                search.core.container.parent().modal('hide');
            }
            $(document).ready(function () {
                idCampo = $('#idCampoUser').val();
                if (idCampo === '0') {
                    sel.setUrl("crud");
                    sel.loadFromCampo();
                    sel.loadUntilCampo();
                    showCustomSelector(sel);
                } else {
                    $('#nombreCampo').text($('#nCampoUser').val());
                    $('#contAddDistrito').show();
                    $('#contListDistrito').show();
                    $('#btnAddMIPES').show();
                    $('#idcamp').val(idCampo);
                    listar(idCampo);
                }

                $('#datatable').DataTable();
                $('#btnAddDistrito').click(function () {
                    var nom = $('#nomdis').val();
                    if (nom != "") {
                        var data = $('#addForm').serialize();
                        $.post("crud", data, function (objJson) {
                            if (objJson.result === true) {
                                new PNotify({
                                    title: "Resultado",
                                    text: "Distrito agregado con exito!",
                                    type: "success"
                                });
                                listar(idCampo);
                            } else {
                                new PNotify({
                                    title: "Resultado",
                                    text: "Error al agregar Distrito",
                                    type: "error"
                                });
                            }
                        });
                    } else {
                        new PNotify({
                            title: "Campo Vacio",
                            text: "Debe asignar un nombre al Distrito",
                            type: "error"
                        });
                    }
                });
                $('.editar').click(function () {
                    $('.myModal').modal('hide');
                    var data = "ent=distrito&opc=3&nombre=" + $('#nom').val();
                    data += "&estado=" + $('#est').val();
                    data += "&iddistrito=" + $('#idd').val();
                    $.post("crud", data, function (objJson) {
                        if (objJson.result === true) {
                            new PNotify({
                                title: "Resultado",
                                text: "Distrito editado con exito!",
                                type: "success"
                            });
                            listar(idCampo);
                        } else {
                            new PNotify({
                                title: "Resultado",
                                text: "Error al editar Distrito",
                                type: "error"
                            });
                        }
                    });
                });

            });
            function listar(id) {
                var t = "";
                var url = "crud?ent=distrito&opc=1&idcampo=" + id;
                $.post(url, function (objJson) {
                    var lista = objJson.lista;
                    for (var i = 0; i < lista.length; i++) {
                        t += "<tr>";
                        t += "<td><center>" + (i + 1) + "</center></td>";
                        t += "<td id='nom" + lista[i].id + "'><center>" + lista[i].nombre + "</center></td>";
                        t += "<td><center>" + lista[i].lider + "</center></td>";
                        if (lista[i].estado === "1") {
                            t += "<td id='est" + lista[i].id + "'><center>Activo</center></td>";
                        } else {
                            t += "<td id='est" + lista[i].id + "'><center>Inactivo</center></td>";
                        }
                        t += "<td><center id ='" + lista[i].id + "'><a class='btn btn-info btnEditar'><i class='fa fa-pencil'></i></a></center></td>";
                        if (lista[i].lider === 'Ninguno Asignado') {
                            t += "<td><center id ='" + lista[i].id + "'><a class='btn btn-success btnAsignar'><i class='fa fa-male'></i></a></center></td>";
                        } else {
                            t += "<td><center id ='" + lista[i].id + "'><a class='btn btn-warning btnCambiar'><i class='fa fa-exchange'></i></a></center></td>";
                        }
                        t += "<td><center id ='" + lista[i].id + "'><a class='btn btn-danger btnEliminar'><i class='fa fa-trash-o'></i></a></center></td>";
                        t += "</tr>";
                    }
                    $('.contTable').empty();
                    $('.contTable').append(createTable());
                    $('.tbodys').empty();
                    $('.tbodys').append(t);
                    $('#datatable').DataTable();
                    $('.btnAsignar').click(function () {
                        search.core.container.parent().modal('show');
                        $('#idd').val($(this).parent().attr('id'));
                    });
                    $('.btnCambiar').click(function () {
                        search.core.container.parent().modal('show');
                        $('#idd').val($(this).parent().attr('id'));
                    });
                    $('.btnEditar').click(function () {
                        $('.myModal').modal('show');
                        $('#nom').val($('#nom' + $(this).parent().attr('id')).text());
                        var estado = $('#est' + $(this).parent().attr('id')).text();
                        if (estado === 'Activo') {
                            $('#est').val(1);
                        } else {
                            $('#est').val(0);
                        }
                        $('#idd').val($(this).parent().attr('id'));
                    });
                    $('.btnEliminar').click(function () {
                        var del = confirm("Desea eliminar el distrito " + $('#nom' + $(this).parent().attr('id')).text());
                        if (del) {
                            var url = "crud";
                            var data = "ent=distrito&opc=4";
                            data += "&iddistrito=" + $(this).parent().attr('id');
                            $.post(url, data, function (objJson) {
                                if (objJson.result === true) {
                                    new PNotify({
                                        title: "Resultado",
                                        text: "Distrito eliminado con exito!",
                                        type: "success"
                                    });
                                    listar(idCampo);
                                } else {
                                    new PNotify({
                                        title: "Resultado",
                                        text: "Error al eliminar Distrito",
                                        type: "error"
                                    });
                                }
                            });
                        }
                    });

                });
            }

            function createTable() {
                var t = '<table id="datatable" class="table table-stripped table-responsive table-hover table-bordered" cellspacing="0" width="100%">';
                t += '<thead><tr><th colspan="4"><center>Datos de Distrito</center></th><th colspan="3"><center>Opciones</center></th></tr>';
                t += '<tr><th><center>Nro</center></th><th><center>Nombre</center></th><th><center>Lider de MIPES</center></th><th><center>Estado</center></th>';
                t += '<th><center>Editar</center></th><th><center>Asignar MIPES</center></th><th><center>Eliminar</center></th>';
                t += '</tr></thead><tbody class="tbodys"></tbody></table>';
                return t;
            }
        </script>
    </body>
</html>
<%} else {%>
<%@include file="../error/errorUnauthorized.html" %>  
<%}%>