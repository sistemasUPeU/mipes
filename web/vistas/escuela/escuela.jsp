<%-- 
    Document   : escuela
    Created on : 15/07/2016, 11:44:35 AM
    Author     : Andres
--%>

<%@page import="com.upeu.mipes.controller.MainControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%boolean enable = false;%>
<%//MIPES Iglesia =5
    if (MainControl.validateRol("5", session)) {
        enable = true;
    }
%>
<%if (enable) {%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/datatables/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
        <link href="css/custommin.css" rel="stylesheet" type="text/css"/>
        <title>Gestion de Escuelas Sabáticas</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
        <div class="container">
            <br>
            <div class="panel panel-default">
                <div class="panel-heading">Agregar nueva Escuela Sabática</div>
                <div class="panel-body">
                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <form id="addForm" class="form-horizontal">
                            <div class="form-group">
                                <input class="form-control" type="text" maxlength="64" id="nomEsc" name="nombre" placeholder="Nombre de la nueva Escuela Sabática">
                            </div>
                            <input type="hidden" name="ent" value="escuela">
                            <input type="hidden" name="opc" value="2">
                            <input type="button" value="Agregar" class="btn btn-primary pull-right agregar">
                        </form>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Lista de Escuelas Sabáticas de la Iglesia <strong id="nombreIG"></strong></div>
                <div class="panel-body">
                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 contTable">
                        <table class="table table-responsive table-hover datatable" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th class="hidden-xs" rowspan="2">Nro</th>
                                    <th rowspan="2">Nombre</th>
                                    <th rowspan="2">Lider MIPES</th>
                                    <th class="hidden-xs" rowspan="2">Estado</th>
                                    <th colspan="3">Acciones</th>
                                </tr>
                                <tr>
                                    <th>Editar</th>
                                    <th>Asignar</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody class="tbodys">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal fade myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="mySmallModalLabel">Editar Escuela Sabática</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-horizontal col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="nombre">Escuela Sabática:</label>
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
                            <input type="hidden" id="ide" value="0">
                            <input type="button" value="Editar" class="btn btn-primary pull-right editar">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" role="dialog">
            <div class="modal-dialog" role="document" id="modalC">
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
                listar($('#idIglesiaUser').val());
            }
            ;
            function registrarLiderError() {
                //Accion a realizarse cuando hay error
                errorMessage("Error al asignar Lider");
            }
            ;
        </script>
        <script>
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
            //FUNCION DEL MODAL
            function cancelBuscadorP() {
                search.core.container.parent().modal('hide');
            }
            function getPersonaId(id) {
                search.core.container.parent().modal('hide');
                registrarMIPESEscuela(id, $('#ide').val());
            }

            $(document).ready(function () {
                $('.datatable').DataTable();
                listar($('#idIglesiaUser').val());
                $('.agregar').click(function () {
                    var nom = $('#nomEsc').val();
                    if (nom != "") {
                        var data = $('#addForm').serialize();
                        data += "&idiglesia=" + $('#idIglesiaUser').val();
                        $.post("crud", data, function (objJson) {
                            if (objJson.result === true) {
                                successMessage("Escuela Sabática agregada con exito!");
                                listar($('#idIglesiaUser').val());
                            } else {
                                errorMessage("Error al agregar Escuela Sabática");
                            }
                        });
                    } else {
                        errorMessage("Debe asignarle un nombre a la Escuela Sabatica")
                    }

                });
                $('.editar').click(function () {
                    $('.myModal').modal('hide');
                    var data = "ent=escuela&opc=3&nombre=" + $('#nom').val();
                    data += "&estado=" + $('#est').val();
                    data += "&idescuela=" + $('#ide').val();
                    $.post("crud", data, function (objJson) {
                        if (objJson.result === true) {
                            successMessage("Escuela Sabática editada con exito!");
                            listar($('#idIglesiaUser').val());
                        } else {
                            errorMessage("Error al editar Escuela Sabática");
                        }
                    });
                });
            });
            function listar(idIglesia) {
                $('#nombreIG').text($('#nIglesiaUser').val());
                if (idIglesia === '0' || idIglesia === undefined) {
                    $('.contTable').empty();
                } else {
                    var url = "crud";
                    var data = "ent=escuela&opc=1&idiglesia=" + idIglesia;
                    var t = "";
                    $.post(url, data, function (objJson) {
                        var lista = objJson.lista;
                        if (lista.length > 0) {
                            for (var i = 0; i < lista.length; i++) {
                                t += "<tr>";
                                t += "<td class='hidden-xs'>" + (i + 1) + "</td>";
                                t += "<td id='nom" + lista[i].idescuela + "'>" + lista[i].nombre + "</td>";
                                t += "<td>" + lista[i].lider + "</td>";
                                if (lista[i].estado === "1") {
                                    t += "<td class='hidden-xs' id='est" + lista[i].idescuela + "'>Activo</td>";
                                } else {
                                    t += "<td class='hidden-xs' id='est" + lista[i].idescuela + "'>Inactivo</td>";
                                }
                                t += "<td id ='" + lista[i].idescuela + "'><a class='btn btn-info btnEditar'><i class='fa fa-pencil'></i></a></td>";
                                if (lista[i].lider === 'Ninguno Asignado') {
                                    t += "<td id ='" + lista[i].idescuela + "'><a class='btn btn-success btnAsignar'><i class='fa fa-male'></i></a></td>";
                                } else {
                                    t += "<td id ='" + lista[i].idescuela + "'><a class='btn btn-warning btnAsignar'><i class='fa fa-exchange'></i></a></td>";
                                }
                                t += "<td id ='" + lista[i].idescuela + "'><a class='btn btn-danger btnEliminar'><i class='fa fa-trash-o'></i></a></td>";
                                t += "</tr>";
                            }
                            $('.contTable').empty();
                            var a = createTable();
                            $('.contTable').append(a);
                            $('.tbodys').empty();
                            $('.tbodys').append(t);
                            $('.datatable').DataTable();
                            $('.btnEditar').click(function () {
                                $('.myModal').modal('show');
                                $('#nom').val($('#nom' + $(this).parent().attr('id')).text());
                                var estado = $('#est' + $(this).parent().attr('id')).text();
                                if (estado === 'Activo') {
                                    $('#est').val(1);
                                } else {
                                    $('#est').val(0);
                                }
                                $('#ide').val($(this).parent().attr('id'));
                            });
                            $('.btnAsignar').click(function () {
                                search.core.container.parent().modal('show');
                                $('#ide').val($(this).parent().attr('id'));
                            });
                            $('.btnEliminar').click(function () {
                                var del = confirm("Desea eliminar la Escuela Sabática " + $('#nom' + $(this).parent().attr('id')).text());
                                if (del) {
                                    var url = "crud";
                                    var data = "ent=escuela&opc=4";
                                    data += "&idescuela=" + $(this).parent().attr('id');
                                    $.post(url, data, function (objJson) {
                                        if (objJson.result === true) {
                                            successMessage("Escuela Sabática eliminada con exito!");
                                            listar($('.selIglesia').val());
                                        } else {
                                            errorMessage("Error al eliminar Escuela Sabática");
                                        }
                                    });
                                }
                            });
                        }
                    });
                }

            }
            function createTable() {
                var t = '<table class="table table-responsive table-hover datatable" cellspacing="0" width="100%">';
                t += '<thead>';
                t += '<tr><th class="hidden-xs" rowspan="2">Nro</th><th rowspan="2">Nombre</th>';
                t += '<th rowspan="2">Lider MIPES</th><th class="hidden-xs" rowspan="2">Estado</th><th colspan="3">Acciones</th>';
                t += '</tr><tr><th>Editar</th><th>Asignar</th><th>Eliminar</th></tr>';
                t += '</thead><tbody class="tbodys"></tbody></table>';
                return t;
            }
        </script>
    </body>
</html>
<%} else {%>
<%@include file="../error/errorUnauthorized.html" %>  
<%}%>