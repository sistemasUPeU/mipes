<%-- 
    Document   : lecciones
    Created on : 03/08/2016, 05:33:13 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>Gestion de Lecciones de Estudio</title>
    </head>
    <body>
        <header class="page-header">
            <center><h3>Gestion de Lecciones de Estudio</h3></center>
        </header>
        <div class="container">
            <div class="row" style="display: none" id="contAdd">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Agregar Lecciones de Estudio:</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label>Nombre:</label>
                                <input class="form-control" type="text" maxlength="64" placeholder="Nombre de la nueva Leccion" id="nleccion">
                                <input type="hidden" value="0" id="idtipoleccion">
                            </div>
                            <hr>
                            <label>Lista de Items:</label>
                            <form id="contItems">
                                <div class="row" style="margin-bottom: 10px">
                                    <div class="col-lg-10 col-md-10 col-sm-9 col-xs-8">
                                        <input type="text" class="form-control" maxlength="128" placeholder="Nombre del Item">
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
                                        <a class="btn btn-primary" onclick="addItem()"><i class="fa fa-plus"></i></a>&nbsp;
                                        <a class="btn btn-danger" onclick="delItem()"><i class="fa fa-minus"></i></a>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <input type="button" value="Cancelar" class="btn btn-default pull-left" id="btnCancel">
                                    <input type="button" value="Registrar" class="btn btn-primary pull-right" onclick="agregarLeccion()">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
            <div class="row" id="contLista">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Lista de Lecciones de Estudio</div>
                        <div class="panel-body" id="contTable">
                            <table class="table table-bordered table-hover" id="datatable">
                                <thead>
                                    <tr>
                                        <th>Nro</th>
                                        <th>Nombre</th>
                                        <th>Editar</th>
                                        <th>Desactivar</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodys"></tbody>
                            </table>                            
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <a class="btn btn-primary pull-right" id="btnAdd"><i class="fa fa-plus"></i> Agregar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        <div class="modal fade myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header" id="tituloL"></div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Nombre de Leccion:</label>
                            <input type="text" class="form-control" id="nombreLeccion">
                        </div>
                        <table class="table table-hover table-responsive" id="tableL">
                            <thead>
                                <tr>
                                    <th>Nro</th>
                                    <th>Nombre</th>
                                    <th><center>Editar</center></th>
                                    <th><center>Eliminar</center></th>
                                </tr>
                            </thead>
                            <tbody id="bodyL"></tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="button" class="btn btn-default pull-left" value="Cancelar" data-dismiss='modal'>
                                <input type="button" class="btn btn-primary pull-right" value="Guardar Cambios" data-dismiss='modal'>
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
                                        var cont = 1;
                                        $(document).ready(function () {
                                            showTabla();
                                            $('#btnAdd').click(function () {
                                                showAgregar();
                                            });
                                            $('#btnCancel').click(function () {
                                                showTabla();
                                            });
                                        });
        </script>
        <script>
            function showTabla() {
                listarLeccion();
                $('#contAdd').toggle(false);
                $('#contLista').toggle(true);
            }
            function showAgregar() {
                $('#contAdd').toggle(true);
                $('#contLista').toggle(false);
            }
            function agregarLeccion() {
                var url = "crud?ent=leccion&opc=3";
                var data = "nombre=" + $('#nleccion').val();
                $.post(url, data, function (obj) {
                    if (obj.result > 0) {
                        agregarItems(obj.result, 0);
                    }
                });
            }
            function agregarItems(id, ind) {
                var url = "crud?ent=leccion&opc=4";
                var data = "";
                var t = $('#contItems input').length;
                $('#contItems input').each(function (index) {
                    if (ind === index) {
                        var input = $(this);
                        data = "idtipoleccion=" + id + "&nombre=" + input.val();
                        $.post(url, data, function (obj) {
                            if (obj.result === true) {
                                if (index === (t - 1)) {
                                    successMessage("Leccion Registrada con Éxito!");
                                    showTabla();
                                } else {
                                    agregarItems(id, index + 1);
                                }
                            } else {
                                errorMessage("Ha ocurrido un error al Guardar el Item " + input.val());
                            }
                        }).fail(function () {
                            errorMessage("Ha ocurrido un error al Guardar el Item " + input.val());
                        });
                    }
                });
            }
            
            function listarLeccion() {
                $('#datatable').DataTable();
                var url = "crud?ent=leccion&opc=5";
                $.post(url, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista.length > 0) {
                        for (var i = 0; i < lista.length; i++) {
                            t += "<tr>";
                            t += "<td>" + (i + 1) + "</td>";
                            t += "<td id='nl" + lista[i].idtipoleccion + "'>" + lista[i].nombre + "</td>";
                            t += "<td id='" + lista[i].idtipoleccion + "'><a class='btn btn-success btnEditar'><i class='fa fa-pencil'></i></a></td>";
                            t += "<td id='" + lista[i].idtipoleccion + "'><a class='btn btn-danger btnDesactivar'><i class='fa fa-ban'></i></a></td>";
                            t += "</tr>";
                        }
                        $('#contTable').empty();
                        $('#contTable').append(getTableConstructor());
                        $('#tbodys').append(t);
                        $('#datatable').DataTable();
                        $('.btnEditar').click(function () {
                            var idt = $(this).parent().attr('id');
                            $('#tituloL').text('Lista de Items de la Leccion ' + $('#nl' + idt).text());
                            $('#nombreLeccion').val($('#nl' + idt).text());
                            listarItems(idt);
                            $('.myModal').modal('show');
                        });
                        $('.btnDesactivar').click(function () {
                            var idt = $(this).parent().attr('id');
                        });
                    } else {
                        infoMessage("No existen Lecciones de Estudio Registradas!");
                    }
                });
            }
            function listarItems(idt) {
                var url = "crud?ent=leccion&opc=2&idtipoleccion=" + idt;
                $.post(url, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista.length > 0) {
                        for (var i = 0; i < lista.length; i++) {
                            t += "<tr>";
                            t += "<td>" + (i + 1) + "</td>";
                            t += "<td id='nle" + lista[i].idleccion + "'>" + lista[i].nombre + "</td>";
                            t += "<td id='" + lista[i].idleccion + "'><center><a class='btn btn-success btnEditarL'><i class='fa fa-pencil'></i></a></center></td>";
                            t += "<td id='" + lista[i].idleccion + "'><center><a class='btn btn-danger btnEliminarL'><i class='fa fa-trash'></i></a></center></td>";
                            t += "</tr>";
                        }
                        $('#bodyL').empty();
                        $('#bodyL').append(t);
                        $('.btnEditarL').click(function () {
                            $('.inpL').focusout();
                            var idl = $(this).parent().parent().attr('id');
                            var n = $('#nle' + idl).text();
                            $('#nle' + idl).empty();
                            $('#nle' + idl).append('<input type="text" class="form-control inpL" value="' + n + '">');
                            $('.inpL').focusout(function () {
                                var l = $(this).val();
                                var url = "crud?ent=leccion&opc=6&idtipoleccion=" + idt + "&idleccion=" + idl + "&nombre=" + l + "&estado=1";
                                $.post(url, function (objJson) {
                                    if (objJson.result === true) {
                                        $('#nle' + idl).empty();
                                        $('#nle' + idl).append(l);
                                    } else {
                                        errorMessage("Ha ocurrido un error al momento de editar!");
                                    }
                                });
                            });
                        });
                        $('.btnEliminarL').click(function () {
                            var idl = $(this).parent().parent().attr('id');
                            var url = "crud?ent=leccion&opc=7&idleccion=" + idl;
                            $.post(url, function (objJson) {
                                if (objJson.result === true) {
                                    listarItems(idt);
                                }else{
                                    errorMessage("Ha ocurrido un error al momento de Eliminar!");
                                }
                            });                        
                        });
                    }
                });
            }
            function addItem() {
                var t = '<div class="row" id="cit' + cont + '" style="margin-bottom: 10px">';
                t += '<div class="col-lg-10 col-md-10 col-sm-9 col-xs-8">';
                t += '<input type="text" class="form-control" maxlength="128" placeholder="Nombre del Item">';
                t += '</div>';
                t += '<div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">';
                t += '<a class="btn btn-primary" onclick="addItem()"><i class="fa fa-plus"></i></a>&nbsp;';
                t += '<a class="btn btn-danger" onclick="delItem(' + cont + ')"><i class="fa fa-minus"></i></a>';
                t += '</div>';
                t += '</div>';
                $('#contItems').append(t);
                
                cont++;
            }
            function delItem(c) {
                $('#cit' + c).remove();
                cont--;
            }
            
            function getTableConstructor() {
                var t = '<table class="table table-bordered table-hover" id="datatable">';
                t += '<thead>';
                t += '<tr>';
                t += '<th>Nro</th>';
                t += '<th>Nombre</th>';
                t += '<th>Editar</th>';
                t += '<th>Desactivar</th>';
                t += '</tr>';
                t += '</thead>';
                t += '<tbody id="tbodys"></tbody>';
                t += '</table>';
                return t;
            }
        </script>
    </body>
</html>
