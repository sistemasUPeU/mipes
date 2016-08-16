<%-- 
    Document   : Discipulado
    Created on : 29/07/2016, 02:29:16 AM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%
    boolean enable = false;
    if (MainControl.validateRol("2", session)) {
        enable = true;
    }
    if (enable && request.getAttribute("iddiscipulador") != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gestion de Discipulados</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/customSwitch.css" rel="stylesheet" type="text/css"/>
        <link href="fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.css" rel="stylesheet" type="text/css"/>
        <link href="css/animate.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/ico/Home-48.png">
        <link href="css/custommin.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
        <input type="hidden" id="iddi" value="<%=request.getAttribute("iddiscipulador")%>">
        <header class="page-header">
            <center><h3>Gestion de Discipulados</h3></center>
        </header>
        <div class="container">
            <div class="row" id="cn3" style="display: none">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h4>Asignar Discipulos para:</h4>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6" id="cn1" style="display: none">
                                    <span><i class="fa fa-lg fa-user"></i>&nbsp;&nbsp;&nbsp;<small id="nombre1"></small></span>
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-6" id="cn2" style="display: none">
                                    <span><i class="fa fa-lg fa-user"></i>&nbsp;&nbsp;&nbsp<small id="nombre2"></small></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div id="searchC"></div>
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Lista de Discipulos Asignados</div>
                        <div class="panel-body" id="contTable">
                            <table class="table table-bordered table-hover" id="datatable">
                                <thead>
                                    <tr>
                                        <th class="hidden-xs">Nro</th>
                                        <th>Nombres y Apellidos</th>
                                        <th class="hidden-xs">Tipo</th>
                                        <th>Quitar</th>
                                    </tr>                                    
                                </thead>
                                <tbody id="tbodys"></tbody>
                            </table> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade myModal" role="dialog">
            <div class="modal-dialog" role="document">
                <div  class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <span><i class="fa fa-lg fa-plus-circle"></i>&nbsp;&nbsp;&nbsp;<small id="nombre3"></small></span>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label>Seleccione Tipo de Discipulo:</label>
                                    <select class="form-control" id="seltipo">
                                        <option value="1">Discipulo por Conversión</option>
                                        <option value="2">Discipulo por Adopción</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="hidden" id="idp"> 
                                <input type="button" class="btn btn-default pull-left" value="Cancelar" data-dismiss='modal'> 
                                <input type="button" class="btn btn-primary pull-right" id="btnAsignar" value="Asignar" data-dismiss='modal'> 
                            </div>
                        </div>
                    </div>
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
        <script src="js/persona/buscadorPersona.js" type="text/javascript"></script>
        <script>
            var ida=0;
            var search = new BuscadorP();
            search.core.setContainer($('#searchC'));
            search.core.parametros.setFiltroNull();
            search.core.parametros.setUrl("rep?opc=buscarPersona");
            search.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
            search.show();
            $(document).ready(function () {
                $('#datatable').DataTable();
                obtenerNombres($('#iddi').val(), true);
                $('#btnAsignar').click(function () {
                    var url = "crud?ent=discipulador&opc=4";
                    var data = "iddiscipulador=" + $('#iddi').val();
                    data += "&idpersona=" + $('#idp').val();
                    data += "&tipo=" + $('#seltipo').val();
                    $.post(url, data, function (obj) {
                        if (obj.result) {
                            successMessage("Discípulo asignado con Éxito!");
                            listarDiscipulos();
                        } else {
                            errorMessage('Hubo un error al momento de Asignar Discípulo!');
                        }
                    });
                });
            });
            function getPersonaId(id, nya) {
                $('.tableContainer').empty();
                $('#idp').val(id);
                $('#nombre3').text(nya);
                $('.myModal').modal('show');
            }
            function obtenerNombres(idd, s) {
                var url = "crud?ent=discipulador&opc=5&iddiscipulador=" + idd;
                $.post(url, function (obj) {
                    var lista = obj.result;
                    if (lista.length > 0) {
                        if (s) {
                            $('#nombre1').text(lista[0].nombres + " " + lista[0].apellidos);
                            $('#cn3').show();
                            $('#cn1').show();
                            if (lista[0].idasociado > 0) {
                                ida=lista[0].idasociado;
                                obtenerNombres(lista[0].idasociado, false);
                            } else {
                                $('#nombre2').text("Sin Asociado Asignado");
                                $('#cn2').show();
                                listarDiscipulos();
                            }
                        } else {
                            $('#nombre2').text(lista[0].nombres + " " + lista[0].apellidos);
                            $('#cn2').show();
                            listarDiscipulos();
                        }
                    } else {
                        errorMessage('Error al Obtener datos del Discipulador');
                    }
                });
            }
            function listarDiscipulos() {
                var url = "crud?ent=discipulador&opc=1&iddiscipulador=" + $('#iddi').val();
                $.post(url, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista.length > 0) {
                        for (var i = 0; i < lista.length; i++) {
                            t += "<tr>";
                            t += "<td class='hidden-xs'>" + (i + 1) + "</td>";
                            t += "<td>" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                            if (lista[i].tipo === '1') {
                                t += "<td class='hidden-xs'>Discipulo por Conversión</td>";
                            } else if (lista[i].tipo === '2') {
                                t += "<td class='hidden-xs'>Discipulo por Adopción</td>";
                            } else {
                                t += "<td class='hidden-xs'>Ninguno</td>";
                            }
                            t += "<td id='" + lista[i].iddiscipulado + "'><a class='btn btn-danger btnQuitar'><i class='fa fa-trash'></i></a></td>";
                            t += "</tr>";
                        }
                        $('#contTable').empty();
                        $('#contTable').append(getTableConstructor());
                        $('#tbodys').append(t);
                        $('#datatable').DataTable();
                        $('.btnQuitar').click(function () {
                            var r = confirm('¿Esta seguro(a) de quitar al Dsicipulo de la lista?');
                            if (r) {
                                var url = "crud?ent=discipulador&opc=6";
                                var data = "iddiscipulador=" + $('#iddi').val();
                                data += "&iddiscipulado=" + $(this).parent().attr('id');
                                $.post(url, data, function (obj) {
                                    if (obj.result) {
                                        successMessage("El Discipulo ha sido quitado con éxito!");
                                        listarDiscipulos();
                                    }else{
                                        errorMessage('Error al quitar Discipulo!');
                                    } 
                                });
                            }
                        });
                    } else {
                        infoMessage("Ningun Discipulo ha sigo asignado hasta la fecha!");
                    }
                });
            }
            function getTableConstructor() {
                var t = '<table class="table table-bordered table-hover" id="datatable">';
                t += '<thead>';
                t += '<tr>';
                t += '<th class="hidden-xs">Nro</th>';
                t += '<th>Nombres y Apellidos</th>';
                t += '<th class="hidden-xs">Tipo</th>';
                t += '<th>Quitar</th>';
                t += '</tr>';
                t += '</thead>';
                t += '<tbody id="tbodys"></tbody>';
                t += '</table>';
                return t;
            }
        </script>
    </body>
</html>
<%
} else {
%>
<%@include file="../error/errorUnauthorized.html" %>  
<%        
    }
%>
