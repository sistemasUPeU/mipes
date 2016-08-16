<%-- 
    Document   : perfil
    Created on : 28/07/2016, 02:23:18 PM
    Author     : Andres
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%boolean enable = false;%>
<%//MIEMBRO
    String idp = "-1";
    String tipo = request.getAttribute("tipo").toString();
    if (tipo.equals("1")) {
        idp = session.getAttribute("idpersona").toString();
        if (MainControl.validateRol("1", session)) {
            enable = true;
        }
    } else {
        idp = request.getAttribute("idpersona").toString();
        if (MainControl.validateRol("2", session) || MainControl.validateRol("3", session)
                || MainControl.validateRol("5", session) || MainControl.validateRol("6", session)
                || MainControl.validateRol("7", session) || MainControl.validateRol("8", session)
                || MainControl.validateRol("9", session) || MainControl.validateRol("10", session)) {
            enable = true;
        }
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
        <link href="css/easypie/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/ico/Home-48.png">
        <link href="css/custommin.css" rel="stylesheet" type="text/css"/>
        <title>Perfil de Usuario</title>
    </head>
    <%

    %>
    <body style="background: #F7F7F7" onload="listAll(<%=idp%>)">
        <style>
            .panel-heading.ph{
                background: rgba(38, 185, 154, 0.88);
                color: #fff
            }
            .hrseparator{
                margin-top: 10px;
                margin-bottom: 10px;
            }
        </style>
        <br>
        <input type="hidden" id="tipoPagina" value="<%=tipo%>">
        <div class="container-fluid">
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="col col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading ph">
                                <div class="row">
                                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <center>
                                            <div class="thumbnail" style="width: 128px;height: 128px;">
                                                <img width="128" height="128" class="img-responsive" src="images/user.png" alt="user"/>
                                            </div>
                                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <center>
                                            <h4 id="nombresUser"></h4>
                                        </center>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">

                                <div class="row">
                                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <h3><strong>Datos Generales:</strong></h3>
                                        <ul class="list-unstyled">
                                            <li style="margin-bottom: 5px"><strong>DNI:</strong>&nbsp;&nbsp;<span id="dniUser"></span></li>
                                            <li style="margin-bottom: 5px"><strong>Teléfono:</strong>&nbsp;&nbsp;<span id="telUser"></span></li>
                                            <li style="margin-bottom: 5px"><strong>Correo:</strong>&nbsp;&nbsp;<span id="emailUser"></span></li>
                                            <li style="margin-bottom: 5px"><strong>Direccion:</strong>&nbsp;&nbsp;<span id="dirUser"></span></li>
                                            <li style="margin-bottom: 5px"><strong>Fecha de Nacimiento:</strong>&nbsp;&nbsp;<span id="feUser"></span></li>
                                        </ul>
                                        <%if (tipo.equals("1")) {%>
                                        <a class="btn btn-success pull-right" href="#" id="btnMod"><i class="fa fa-pencil"></i><span> Modificar</span></a>
                                                <%}%>
                                    </div>
                                </div>
                                <%if (tipo.equals("1")) {%>
                                <hr>
                                <div class="row">
                                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <h4><strong>Roles:</strong></h4>
                                        <ul class="list-unstyled" id="listrol"></ul>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <h4><strong>Datos de Usuario:</strong></h4>
                                        <ul class="list-unstyled">
                                            <li style="margin-bottom: 5px"><strong>Usuario: </strong><span id="username"></span></li>

                                            <li style="margin-bottom: 5px">
                                                <strong>Clave:</strong> **** <a class="btn btn-warning pull-right" id="btnC">
                                                    <i class="fa fa-lock"></i> Cambiar</a>
                                            </li>

                                        </ul>

                                    </div>
                                </div>
                                <%}%>
                                <input type="hidden" id="idUser">
                            </div>
                        </div>
                    </div>
                    <div class="col col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Informacion de Grupos Pequeños</div>
                                    <div class="panel-body" id="bodyGP">
                                        <div class="alert alert-info" role="alert">
                                            <span>Todavia no está registrado en un Grupo Peque&ncaron;o, puede solicitar su registro con su lider.</span>
                                        </div>
                                    </div>                           
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Informacion de Ministerios</div>
                                    <div class="panel-body" id="bodyMI">
                                        <div class="alert alert-info" role="alert">
                                            <span>Todavia no está registrado en un Ministerio, puede solicitar su registro con su lider.</span>
                                        </div>
                                    </div>                           
                                </div>
                            </div>
                        </div>
                        <div class="row" style="display: none">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Informacion de Trabajo Misionero</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-4">
                                                    <h5><strong>Grupo: </strong>Palestina 1</h5>
                                                    <h5><strong>Escuela: </strong>Palestina</h5>
                                                    <h5><strong>Iglesia: </strong>Iglesia Joven</h5>
                                                </div>
                                                <div class="col col-lg-5 col-md-5 col-sm-5 col-xs-4">
                                                    <h5><strong>Cantidad de Discipulos estudiando: </strong>5</h5>
                                                    <h5><strong>Total de Discipulos: </strong>10</h5>
                                                    <h5><strong>Ultimo Trabajo: </strong>05/09/2016</h5>
                                                </div>
                                                <div class="col col-lg-2 col-md-2 col-sm-2 col-xs-4">
                                                    <span class="chart" data-percent="86" data-scale-color:="#fff">
                                                        <span class="percent"></span>
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>                           
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
                    <div class="modal-header">
                        <h4 class="modal-title" id="mySmallModalLabel">Editar Datos Personales</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Nombres:</label>
                                        <input class="form-control" type="text" name="nombres" id="nombresE">
                                    </div>                                    
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Apellidos:</label>
                                        <input class="form-control" type="text" name="apellidos" id="apellidosE">
                                    </div>                                    
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>DNI:</label>
                                        <input class="form-control" type="number" name="dni" maxlength="10" id="dniE">
                                    </div>                                    
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Correo:</label>
                                        <input class="form-control" type="email" name="correo" id="correoE">
                                    </div>                                    
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Telefono:</label>
                                        <input class="form-control" type="tel" name="telefono" maxlength="15" id="telefonoE">
                                    </div>                                    
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Direccion:</label>
                                        <input class="form-control" type="text" name="direccion" maxlength="64" id="direccionE">
                                    </div>                                    
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Fecha de Nacimiento:</label>
                                        <input class="form-control" type="date" name="fecha" id="fechaE">
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" value="Cancelar" class="btn btn-default pull-left" data-dismiss="modal">
                        <input type="button" value="Editar" class="btn btn-primary pull-right editar">
                    </div>
                </div>

            </div>
        </div>
        <div class="modal fade userModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="mySmallModalLabel">Es necesario Validar Usuario</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Usuario:</label>
                                        <input class="form-control" type="text" name="nombres" id="usuario">
                                    </div>                                    
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Clave:</label>
                                        <input class="form-control" type="password" name="apellidos" id="clave">
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" value="Cancelar" class="btn btn-default pull-left" data-dismiss="modal">
                        <input type="button" value="Verificar" class="btn btn-primary pull-right validar">
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade claveModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="mySmallModalLabel">Cambiar Clave</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Clave:</label>
                                        <input class="form-control" type="password" name="apellidos" id="claveC">
                                    </div>                                    
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label>Nueva Clave:</label>
                                        <input class="form-control" type="password" name="apellidos" id="newc" required>
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" value="Cancelar" class="btn btn-default pull-left" data-dismiss="modal">
                        <input type="button" value="Cambiar" class="btn btn-primary pull-right cambiar">
                    </div>

                </div>
            </div>
        </div>
        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/easypie/jquery.easing.min.js" type="text/javascript"></script>
        <script src="js/easypie/jquery.easypiechart.min.js" type="text/javascript"></script>
        <!-- Alert Plugin-->
        <script src="js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="js/notify/pnotify.nonblock.js" type="text/javascript"></script>
        <script src="js/notify/customNotify.js" type="text/javascript"></script>
        <script>
        $(function () {
            $('.chart').easyPieChart({
                easing: 'easeOutBounce',
                lineWidth: '6',
                barColor: '#75BCDD',
                scaleColor: false,
                size: 64,
                onStep: function (from, to, percent) {
                    $(this.el).find('.percent').text(Math.round(percent));
                }
            });
        });</script>
        <script>
            $(document).ready(function () {

                $('.editar').click(function () {
                    editarDatosPersonales();
                });
                $('.cambiar').click(function () {
                    cambiarClave();
                });
                $('.validar').click(function () {
                    $('.userModal').modal('hide');
                    url = "crud?ent=usuario&opc=5";
                    data = "usuario=" + $('#usuario').val();
                    data += "&clave=" + $('#clave').val();
                    $.post(url, data, function (objJson) {
                        if (objJson.result === true) {
                            $('.myModal').modal('show');
                        } else {
                            errorMessage('Usuario o clave invalidos!');
                            $('#usuario').val('');
                            $('#clave').val('');
                        }
                    });
                });
                $('#btnMod').click(function () {
                    $('.userModal').modal('show');
                });
                $('#btnC').click(function () {
                    $('.claveModal').modal('show');
                });

            });</script>
        <script>
            var idPersona = 0;
            var idUsuario = 0;
            var url = "";
            var data = "";
            var user = false;
            var rol = false;
            var ministerio = false;
            var grupo = false;
            var trabajo = false;
            function listAll(idp) {
                idPersona = idp;
                user = true;
                rol = true;
                ministerio = true;
                grupo = true;
                trabajo = true;
                listDatosPersonales();
                listInfoTrabajo();
            }
            function listDatosPersonales() {
                url = "crud?ent=pers&opc=2";
                data = "idpersona=" + idPersona;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    if (lista[0] !== undefined) {
                        if (lista[0].dni === undefined) {
                            $('#dniUser').text('Sin Datos');
                        }
                        $('#dniUser').text(lista[0].dni);
                        $('#dniE').val(lista[0].dni);
                        $('#telUser').text(lista[0].telefono);
                        $('#telefonoE').val(lista[0].telefono);
                        $('#emailUser').text(lista[0].correo);
                        $('#correoE').val(lista[0].correo);
                        $('#direccionE').val(lista[0].direccion);
                        $('#dirUser').text(lista[0].direccion);
                        $('#feUser').text(lista[0].fecha);
                        $('#fechaE').val(parseDate(lista[0].fecha));
                        $('#nombresUser').text(lista[0].nombres + " " + lista[0].apellidos);
                        $('#nombresE').val(lista[0].nombres);
                        $('#apellidosE').val(lista[0].apellidos);
                        if (lista[0].dni === undefined) {
                            $('#dniUser').text('Sin Datos');
                        }
                        if (lista[0].telefono === undefined) {
                            $('#telUser').text('Sin Datos');
                        }
                        if (lista[0].correo === undefined) {
                            $('#emailUser').text('Sin Datos');
                        }
                        if (lista[0].direccion === undefined) {
                            $('#dirUser').text('Sin Datos');
                        }
                        if (lista[0].fecha === undefined) {
                            $('#feUser').text('Sin Datos');
                        }
                        if (lista[0].nombres === undefined && lista[0].apellidos) {
                            $('#nombresUser').text('Sin Datos');
                        }
                        if ($('#tipoPagina').val() === '1' && user === true) {
                            listUser();
                        } else {
                            listInfoGrupo();
                        }

                    } else {
                        errorMessage('La Persona seleccionada no existe');
                    }


                });
            }
            function listUser() {
                url = "crud?ent=usuario&opc=1";
                data = "idpersona=" + idPersona;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    $('#username').text(lista[0].usuario);
                    $('#idUser').val(lista[0].idusuario);
                    idUsuario = lista[0].idusuario;
                    if (rol === true) {
                        listRol();
                    }

                });
            }
            function listRol() {
                url = "crud?ent=rol&opc=5";
                data = "idusuario=" + idUsuario;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    for (var i = 0; i < lista.length; i++) {
                        if (lista[i].nombre.toUpperCase() !== 'MIEMBRO') {
                            t += "<li style='margin-bottom:5px'>" + lista[i].nombre + "</li>";
                        } else {
                            if (lista.length === 1) {
                                t += "<li style='margin-bottom:5px'>" + lista[i].nombre + "</li>";
                            }
                        }
                    }
                    if (grupo === true) {
                        listInfoGrupo();
                    }
                    $('#listrol').empty();
                    $('#listrol').append(t);

                });
            }
            function listInfoMinisterio() {
                url = "crud?ent=pers&opc=5";
                data = "idpersona=" + idPersona;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista[0] !== undefined) {
                        for (var i = 0; i < lista.length; i++) {
                            t += '<div class="row">';
                            t += '<div class = "col col-lg-12 col-md-12 col-sm-12 col-xs-12">';
                            t += '<div class = "col col-lg-5 col-md-5 col-sm-5 col-xs-4">';
                            t += '<h5> <strong> Ministerio: </strong>' + lista[i].ministerio;
                            if (lista[i].estado === '1') {
                                t += ' <span class="label label-success">Actual</span>';
                            }
                            t += '</h5>';
                            t += '<h5> <strong> Iglesia: </strong>' + lista[i].iglesia + '</h5>';
                            t += '</div>';
                            t += '<div class = "col col-lg-5 col-md-5 col-sm-5 col-xs-4">';
                            if (lista[i].cargo === lista.idpersona) {
                                t += '<h5> <strong> Cargo: </strong>Lider</h5>';
                            } else {
                                t += '<h5> <strong> Cargo: </strong>Miembro</h5>';
                            }
                            t += '<h5> <strong> Fecha de Registro: </strong>' + lista[i].fe_union + '</h5>';
                            t += '</div>';
                            t += '<div class = "col col-lg-2 col-md-2 col-sm-2 col-xs-4">';
                            t += '<span class = "chart" data-percent = "' + lista[i].porcentaje + '" data - scale - color: = "#fff">';
                            t += '<span class = "percent"> </span>';
                            t += '</span>';
                            t += '</div>';
                            t += '</div>';
                            t += '</div>';
                            if (i !== (lista.length - 1)) {
                                t += '<hr class="hrseparator">';
                            }
                        }
                        $('#bodyMI').empty();
                        $('#bodyMI').append(t);
                        $('.chart').easyPieChart({
                            easing: 'easeOutBounce',
                            lineWidth: '6',
                            barColor: '#75BCDD',
                            scaleColor: false,
                            size: 64,
                            onStep: function (from, to, percent) {
                                $(this.el).find('.percent').text(Math.round(percent));
                            }
                        });
                    }
                });
            }
            function listInfoGrupo() {
                url = "crud?ent=pers&opc=4";
                data = "idpersona=" + idPersona;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    var t = "";
                    if (lista[0] !== undefined) {
                        for (var i = 0; i < lista.length; i++) {
                            t += '<div class="row">';
                            t += '<div class = "col col-lg-12 col-md-12 col-sm-12 col-xs-12">';
                            t += '<div class = "col col-lg-5 col-md-5 col-sm-5 col-xs-4">';
                            t += '<h5> <strong> Grupo: </strong>' + lista[i].grupo;
                            if (lista[i].estado === '1') {
                                t += ' <span class="label label-success">Actual</span>';
                            }
                            t += '</h5>';
                            t += '<h5> <strong> Escuela: </strong>' + lista[i].escuela + '</h5>';
                            t += '<h5> <strong> Iglesia: </strong>' + lista[i].iglesia + '</h5>';
                            t += '</div>';
                            t += '<div class = "col col-lg-5 col-md-5 col-sm-5 col-xs-4">';
                            t += '<h5> <strong> Cargo: </strong>' + lista[i].cargo + '</h5>';
                            t += '<h5> <strong> Fecha de Registro: </strong>' + lista[i].fe_union + '</h5>';
                            t += '</div>';
                            t += '<div class = "col col-lg-2 col-md-2 col-sm-2 col-xs-4">';
                            t += '<span class = "chart" data-percent = "' + lista[i].porcentaje + '" data - scale - color: = "#fff">';
                            t += '<span class = "percent"> </span>';
                            t += '</span>';
                            t += '</div>';
                            t += '</div>';
                            t += '</div>';
                            if (i !== (lista.length - 1)) {
                                t += '<hr class="hrseparator">';
                            }
                        }
                        $('#bodyGP').empty();
                        $('#bodyGP').append(t);
                        $('.chart').easyPieChart({
                            easing: 'easeOutBounce',
                            lineWidth: '6',
                            barColor: '#75BCDD',
                            scaleColor: false,
                            size: 64,
                            onStep: function (from, to, percent) {
                                $(this.el).find('.percent').text(Math.round(percent));
                            }
                        });
                    }
                    if (ministerio === true) {
                        listInfoMinisterio();
                    }
                });
            }
            function listInfoTrabajo() {

            }
            function editarDatosPersonales() {
                url = "crud?ent=pers&opc=6";
                data = "idpersona=" + idPersona;
                data += "&nombres=" + $('#nombresE').val();
                data += "&apellidos=" + $('#apellidosE').val();
                data += "&dni=" + $('#dniE').val();
                data += "&correo=" + $('#correoE').val();
                data += "&direccion=" + $('#direccionE').val();
                data += "&telefono=" + $('#telefonoE').val();
                data += "&fecha=" + $('#fechaE').val();
                $.post(url, data, function (objJson) {
                    if (objJson.result === true) {
                        user = false;
                        rol = false;
                        ministerio = false;
                        grupo = false;
                        trabajo = false;
                        successMessage("Datos Actualizados con Éxito!");
                        listDatosPersonales();
                        $('.myModal').modal('hide');
                    } else {
                        errorMessage('Error al Actualizar los datos!');
                    }
                });
            }
            function cambiarClave() {
                $('.claveModal').modal('hide');
                url = "crud?ent=usuario&opc=6";
                data = "usuario=" + idUsuario;
                data += "&clave=" + $('#claveC').val();
                data += "&newclave=" + $('#newc').val();
                $.post(url, data, function (objJosn) {
                    if (objJosn.result === true) {
                        successMessage('Clave cambiada con Éxito!');
                    } else {
                        errorMessage('Error al cambar la Clave');
                    }
                });

            }
            function parseDate(date) {
                var d = new Date(date);
                var day = d.getDate();
                var month = d.getMonth() + 1;
                var year = d.getFullYear();
                var dd = '';
                var mm = '';
                if (day < 10) {
                    dd = '0' + day;
                } else {
                    dd = '' + day;
                }
                if (month < 10) {
                    mm = "0" + month;
                } else {
                    mm = '' + month;
                }
                return year + "-" + mm + "-" + dd;

            }
        </script>

    </body>
</html>
<%} else {%>
<%@include file="../error/errorUnauthorized.html" %>  
<%}%>