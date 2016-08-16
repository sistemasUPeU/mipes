<%-- 
    Document   : CreateDiscipulador
    Created on : 26/07/2016, 04:22:36 PM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%
    boolean enable = false;
    if (MainControl.validateRol("2", session) || MainControl.validateRol("4", session)) {
        enable = true;
    }
    if (enable) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Gestion de Discipuladores</title>
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
        <header class="page-header">
            <center><h3>Gestion de Discipuladores</h3></center>
        </header>
        <div class="container">
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Grupo Pequeño <strong id="nombreGP"></strong></div>
                        <div class="panel-body" id="contTable">
                            <table class="table table-bordered table-hover" id="datatable">
                                <thead>
                                    <tr>
                                        <th class="hidden-xs">Nro</th>
                                        <th>Nombres y Apellidos</th>
                                        <th>Discipulador</th>
                                    </tr>                                    
                                </thead>
                                <tbody id="tbodys"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade myModal" role="dialog" tabindex="-1">
            <div class="modal-dialog" role="document">
                <div  class="modal-content">
                    <div class="modal-header">Asignar Asociado</div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12" id="cT">
                                <table class="table table-bordered table-hover" id="datatable2">
                                    <thead>
                                        <tr>
                                            <th class="hidden-xs">Nro</th>
                                            <th>Nombres y Apellidos</th>
                                            <th>Asociado</th>
                                        </tr>                                    
                                    </thead>
                                    <tbody id="tbodys2"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="button" class="btn btn-default pull-left" value="Cancelar" data-dismiss='modal'> 
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
            var search = new BuscadorP();
            var dis = [];
            search.core.setContainer($('#searchC'));
            search.core.parametros.setFiltroNull();
            search.core.parametros.setUrl("rep?opc=buscarPersona");
            search.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
            search.show();
            $(document).ready(function () {
                $('#datatable').DataTable();
                $('#nombreGP').text($('#nGrupoUser').val());
                listarMiembros($('#idGrupoUser').val());
            });
            function listarMiembros(idgrupo) {
                var url = "crud?ent=discipulador&opc=2&idgrupo=" + idgrupo;
                $.post(url, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    var s = "";
                    if (lista.length > 0) {
                        dis = [];
                        for (var i = 0; i < lista.length; i++) {
                            t += "<tr>";
                            t += "<td class='hidden-xs'>" + (i + 1) + "</td>";
                            s += "<tr>";
                            s += "<td class='hidden-xs'>" + (i + 1) + "</td>";
                            var d = new Discipulador();
                            d.idDiscipulador = lista[i].discipulador;
                            d.idMiembro = lista[i].idmiembrogp;
                            d.idAsociado = lista[i].asociado;
                            dis[i] = d;
                            if (lista[i].discipulador === 0) {
                                t += "<td id='no" + i + "'>" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                                t += "<td id='" + i + "'><a class='btn btn-success btnDiscipulador'><i class='fa fa-briefcase'></i> Asignar</a></td>";
                            } else {
                                t += "<td id='no" + i + "'>" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                                t += "<td id='" + i + "'><a class='btn btn-primary btnDiscipulos'><i class='fa fa-users'></i> Discipulos</a>";
                                t += "&nbsp;<a class='btn btn-info btnAsociado'><i class='fa fa-user'></i> Asociado</a>";
                                t += "&nbsp;<a class='btn btn-danger btnDel'><i class='fa fa-trash'></i></a></td>";
                            }
                            s += "<td id='n" + i + "'>" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                            s += "<td id='id" + i + "'><a class='btn btn-warning btnSelA'><i class='fa fa-user'></i> Seleccionar</a></td>";
                            t += "</tr>";
                            s += "</tr>";
                        }
                        $('#contTable').empty();
                        $('#contTable').append(getTableConstructor());
                        $('#cT').empty();
                        $('#cT').append(getTable2Constructor());
                        $('#tbodys2').empty();
                        $('#tbodys2').append(s);
                        $('#tbodys').append(t);
                        $('#datatable').DataTable();
                        $('#datatable2').DataTable();
                        $('.btnDel').click(function () {
                            var r = confirm("¿Está seguro(a) de quitar el cargo de Discipulador a este Miembro?");
                            if (r) {
                                var d = dis[parseInt($(this).parent().attr('id'))];
                                url = "crud?ent=discipulador&opc=8&iddiscipulador=" + d.idDiscipulador;
                                $.post(url, function (obj) {
                                    if (obj.result) {
                                        successMessage("Discipulador eliminado con Éxio!");
                                        listarMiembros(idgrupo);
                                    } else {
                                        errorMessage("Error al quitar cargo al Discipulador!. Es posible que aún tenga discipulos en curso.");
                                    }
                                });
                            }
                        });
                        $('.btnDiscipulos').click(function () {
                            url = "home?orden=8&opc=2";
                            var d = dis[parseInt($(this).parent().attr('id'))];
                            var data = "&iddiscipulador=" + d.idDiscipulador;
                            document.location = url+data;
                        });
                        $('.btnDiscipulador').click(function () {
                            var r = confirm('¿Desea asignar el cargo de Discipulador?');
                            if (r) {
                                var d = dis[parseInt($(this).parent().attr('id'))];
                                var id = d.idMiembro;
                                url = "crud?ent=discipulador&opc=3&idmiembrogp=" + id;
                                $.post(url, function (obj) {
                                    if (obj.result) {
                                        listarMiembros($('#idGrupoUser').val());
                                    } else {
                                        errorMessage('Error al asignar como Discipulador!');
                                    }
                                });
                            }
                        });
                        $('.btnAsociado').click(function () {
                            var d = dis[parseInt($(this).parent().attr('id'))];
                            listarAsociados($('#idGrupoUser').val(), d);
                            $('.myModal').modal('show');
                        });
                    }
                });
            }
            function listarAsociados(idgrupo, d) {
                var url = "crud?ent=discipulador&opc=2&idgrupo=" + idgrupo;
                $.post(url, function (objJson) {
                    var lista = objJson.lista;
                    var s = "";
                    if (lista.length > 0) {
                        for (var i = 0; i < lista.length; i++) {
                            if (lista[i].discipulador !== d.idDiscipulador) {
                                s += "<tr>";
                                s += "<td class='hidden-xs'>" + (i + 1) + "</td>";
                                s += "<td id='n" + i + "'>" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                                if (lista[i].asociado === d.idDiscipulador || lista[i].discipulador === d.idAsociado && d.idAsociado>0) {
                                    s += "<td><a class='btn btn-success'><i class='fa fa-user'></i> Actual</a></td>";
                                } else {
                                    s += "<td id='id" + lista[i].idmiembrogp + "'><a class='btn btn-warning btnSelA'><i class='fa fa-user'></i> Seleccionar</a></td>";
                                }
                                s += "</tr>";
                            }
                        }
                        $('#cT').empty();
                        $('#cT').append(getTable2Constructor());
                        $('#tbodys2').empty();
                        $('#tbodys2').append(s);
                        $('#datatable2').DataTable();
                        $('.btnSelA').click(function () {
                            var tmp = $(this).parent().attr('id');
                            var idm = tmp.substring(2, tmp.length);
                            url = "crud?ent=discipulador&opc=7";
                            var data = "idmiembrogp=" + idm;
                            data += "&iddiscipulador=" + d.idDiscipulador;
                            $.post(url, data, function (obj) {
                                if (obj.result) {
                                    successMessage('Asociado asignado con éxito!');
                                    $('.myModal').modal('hide');
                                    listarMiembros(idgrupo);
                                } else {
                                    errorMessage("Error al asignar Asociado!");
                                }
                            });
                        });
                    }
                });
            }
            
            
            function getTableConstructor() {
                var t = '<table class="table table-bordered table-hover" id="datatable">';
                t += '<thead>';
                t += '<tr>';
                t += '<th class="hidden-xs">Nro</th>';
                t += '<th>Nombres y Apellidos</th>';
                t += '<th>Discipulador</th>';
                t += '</tr>';
                t += '</thead>';
                t += '<tbody id="tbodys"></tbody>';
                t += '</table>';
                return t;
            }
            function getTable2Constructor() {
                var t = '<table class="table table-bordered table-hover" id="datatable2">';
                t += '<thead>';
                t += '<tr>';
                t += '<th class="hidden-xs">Nro</th>';
                t += '<th>Nombres y Apellidos</th>';
                t += '<th>Asociado</th>';
                t += '</tr>';
                t += '</thead>';
                t += '<tbody id="tbodys2"></tbody>';
                t += '</table>';
                return t;
            }
            function Discipulador(idDiscipulador, idMiembro, idAsociado) {
                this.idDiscipulador = idDiscipulador;
                this.idMiembro = idMiembro;
                this.idAsociado = idAsociado;
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