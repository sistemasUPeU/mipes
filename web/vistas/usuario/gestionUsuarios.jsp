<%-- 
    Document   : gestionUsuarios
    Created on : 17/07/2016, 02:49:31 PM
    Author     : Andres
--%>

<%@page import="com.upeu.mipes.controller.MainControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%boolean enable = false;%>
<%if(MainControl.validateRol("8", session)){
    enable=true;
}%>
<%if(enable){%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/datatables/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.css" rel="stylesheet" type="text/css"/>
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
        <link href="css/custommin.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/ico/Home-48.png">
        <title>Gestion de Usuarios y Privilegios</title>
    </head>
    <body>
        <header class="page-header">
            <center><h3>Gestion de Usuarios, Roles y Privilegios</h3></center>
        </header>
        <div class="container">

            <br>
            <div class="col col-lg-12 buscadorC"></div>
            <br>
            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Detalles de Usuario
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover table-striped table-responsive">
                            <thead>
                                <tr>
                                    <th class="hidden-xs">Nombres y Apellidos</th>
                                    <th>Usuario</th><th>Clave</th>
                                    <th class="hidden-xs">Fecha de Creacion</th>
                                    <th class="hidden-xs">Estado</th>
                                    <th>Opciones</th>
                                </tr>                                
                            </thead>
                            <tbody class="tbodyDetalleU"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-heading">Roles de Usuario</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <label for="rol">Asignar Roles</label>
                                <select class="form-control" name="rol" id="selRolUser"></select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <input type="button" value="Asignar" class="btn btn-primary pull-right" onclick="asignarRol();">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <table class="table table-hover table-bordered table-responsive">
                                    <thead>
                                        <tr>
                                            <th>Rol</th>
                                            <th>Opciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id="bodyRolUser"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="mySmallModalLabel">Editar Usuario</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="usuario">Usuario</label>
                                    <input id="user" class="form-control" 
                                           type="text" maxlength="35" name="usuario" placeholder="Usuario">
                                </div>
                                <div class="form-group">
                                    <label for="clave">Clave</label>
                                    <input id="clav" class="form-control" 
                                           type="text" maxlength="35" name="clave" placeholder="Clave">
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
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="idu" value="0">
                        <input type="hidden" id="idp" value="0">
                        <input type="button" value="Editar" class="btn btn-primary pull-right editar">
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/persona/buscadorPersona.js" type="text/javascript"></script>
        <script src="js/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="js/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        <!-- Alert Plugin-->
        <script src="js/notify/pnotify.core.js" type="text/javascript"></script>
        <script src="js/notify/pnotify.buttons.js" type="text/javascript"></script>
        <script src="js/notify/pnotify.nonblock.js" type="text/javascript"></script>
        <script src="js/notify/customNotify.js" type="text/javascript"></script>
        <script>
                                    var idUsuarioSelected = 0;
                                    $(document).ready(function () {
                                        //Uso del Modulo Buscador
                                        var buscador = new BuscadorP();
                                        buscador.core.setContainer($('.buscadorC'));
                                        buscador.core.parametros.setFiltroNull();
                                        buscador.core.parametros.setUrl("rep?opc=buscarPersona");
                                        buscador.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
                                        buscador.show();
                                        listarRol();

                                        $('.editar').click(function () {
                                            var user = $('#user').val();
                                            var clave = $('#clav').val();
                                            var estado = $('#est').val();
                                            var iduser = $('#idu').val();
                                            var url = "crud?ent=usuario&opc=3";
                                            var data = "usuario=" + user;
                                            data += "&clave=" + clave;
                                            data += "&estado=" + estado;
                                            data += "&idusuario=" + iduser;
                                            alert(data);
                                            $.post(url, data, function (objJson) {
                                                if (objJson.result === true) {
                                                    successMessage("Usuario Editado con exito!");
                                                    $('.myModal').modal("hide");
                                                    getPersonaId($('#idp').val());
                                                } else {
                                                    errorMessage("Error al editar el usuario!");
                                                }
                                            });
                                        });
                                        //ROL
                                        $('.btnAgregarRol').click(function () {
                                            var url = "crud?ent=rol&opc=2";
                                            url += "&nombre=" + $('.nombreRol').val();
                                            $.post(url, function (objJson) {
                                                if (objJson.result === true) {
                                                    successMessage("Rol agregado con exito!");
                                                    listarRol();
                                                } else {
                                                    errorMessage("Error al agregar Rol!");
                                                }
                                            });
                                        });
                                    });
                                    function listarRol() {
                                        var url = "crud?ent=rol&opc=1";
                                        $.post(url, function (objJson) {
                                            var lista = objJson.lista;
                                            if (lista.length > 0) {
                                                var t = "";
                                                var s = "";
                                                for (var i = 0; i < lista.length; i++) {
                                                    t += "<tr>";
                                                    t += "<td>" + lista[i].nombre + "</td>";
                                                    t += "<td><a class='btn btn-info' href='javascript:seleccionaRol(" + lista[i].idrol + ")'>Seleccionar</a></td>";
                                                    t += "<td><a class='btn btn-success'>Editar</a></td>";
                                                    t += "<td><a class='btn btn-warning'>Eliminar</a></td>";
                                                    t += "</tr>";
                                                    //Select
                                                    if (lista[i].estado === '1') {
                                                        s += "<option value='" + lista[i].idrol + "'>" + lista[i].nombre + "</option>";
                                                    }
                                                }
                                                $('.bodyRol').empty();
                                                $('.bodyRol').append(t);
                                                $('#selRolUser').empty();
                                                $('#selRolUser').append(s);
                                            }
                                        });
                                    }

                                    function seleccionaRol(idRol) {

                                    }

                                    function asignarRol() {
                                        var idRol = $('#selRolUser').val();
                                        var idUsuario = idUsuarioSelected;
                                        if (idUsuarioSelected > 0) {
                                            var url = "crud?ent=rol&opc=6&idusuario=" + idUsuario + "&idrol=" + idRol;
                                            $.post(url, function (objJson) {
                                                if (objJson.result) {
                                                    successMessage("Rol asignado correctamente!");
                                                    listarRolUsuario(idUsuarioSelected);
                                                } else {
                                                    errorMessage("Error al asignar Rol");
                                                }
                                            });
                                        }
                                    }

                                    function listarRolUsuario(id) {
                                        $('#bodyRolUser').empty();
                                        var url = "crud?ent=rol&opc=5&idusuario=" + id;
                                        $.post(url, function (objJson) {
                                            var lista = objJson.lista;
                                            if (lista.length > 0) {
                                                var t = "";
                                                for (var i = 0; i < lista.length; i++) {
                                                    t += "<tr>";
                                                    t += "<td>" + lista[i].nombre + "</td>";
                                                    t += "<td id='" + lista[i].idrol + "'><a class='btn btn-warning btnDelRolUser'>Eliminar</a></td>";
                                                    t += "</tr>";
                                                }
                                                $('#bodyRolUser').empty();
                                                $('#bodyRolUser').append(t);
                                                $('.btnDelRolUser').click(function () {
                                                    var a = confirm("¿Esta seguro de quitar este rol del usuario?");
                                                    if (a) {
                                                        var url = "crud?ent=rol&opc=7";
                                                        var data = "idusuario=" + id + "&idrol=" + $(this).parent().attr('id');
                                                        $.post(url, data, function (obj) {
                                                            if (obj.result) {
                                                                listarRolUsuario(id);
                                                            } else {
                                                                errorMessage("Error al quitar rol de Usuario!");
                                                            }
                                                        });

                                                    }
                                                });
                                            }
                                        });
                                    }



                                    //Funcion que recibe el id de la Persona Seleccionada. Para que funcione no se tiene que cambiar de nombre.
                                    function getPersonaId(id) {
                                        idUsuarioSelected = 0;
                                        var url = "crud";
                                        var data = "ent=usuario&opc=1&idpersona=" + id;
                                        $.post(url, data, function (objJson) {
                                            var lista = objJson.lista;
                                            var t = "";
                                            if (lista.length > 0) {
                                                for (var i = 0; i < lista.length; i++) {
                                                    t += "<tr>";
                                                    t += "<td>" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                                                    t += "<td id='user" + lista[i].idusuario + "'>" + lista[i].usuario + "</td>";
                                                    t += "<td id='clave" + lista[i].idusuario + "'>" + lista[i].clave + "</td>";
                                                    t += "<td>" + lista[i].fe_creacion + "</td>";
                                                    if (lista[i].estado === "1") {
                                                        t += "<td id='est" + lista[i].idusuario + "'>Activo</td>";
                                                    } else {
                                                        t += "<td id='est" + lista[i].idusuario + "'>Inactivo</td>";
                                                    }
                                                    t += "<td id='" + lista[i].idusuario + "'>";
                                                    t += "<a href='javascript:getSelectedUser(" + lista[i].idusuario + ")' class='btn btn-primary'>Seleccionar</a>&nbsp;&nbsp;";
                                                    t += "<a href='#' class='btn btn-info btnEditarU'>Editar</a>";
                                                    t += "&nbsp;&nbsp;<a href='#' class='btn btn-danger btnEliminarU'>Eliminar</a></td>";
                                                    t += "</tr>";
                                                }
                                                $('.tbodyDetalleU').empty();
                                                $('.tbodyDetalleU').append(t);
                                                $('.btnEditarU').click(function () {
                                                    editarUsuario($(this).parent().attr("id"), id);
                                                });
                                                $('.btnEliminarU').click(function () {
                                                    eliminarUsuario($(this).parent().attr("id"), id);
                                                });
                                            } else {
                                                t += '<div class="alert alert-success" role="alert">';
                                                t += 'Esta persona no tiene un usuario registrado en el sistema,';
                                                t += ' puede <a href ="#" class ="alert-link btnCrearUser" > Crear un nuevo usuario</a></div>';
                                                $('.tbodyDetalleU').empty();
                                                $('.tbodyDetalleU').append(t);
                                                $('.btnCrearUser').click(function () {
                                                    agregarUsuario(id);
                                                });
                                            }
                                        });
                                    }

                                    function getSelectedUser(id) {
                                        idUsuarioSelected = id;
                                        listarRolUsuario(id);
                                    }

                                    function agregarUsuario(idp) {
                                        var url = "crud?ent=usuario&opc=2&idpersona=" + idp;
                                        $.post(url, function (objJson) {
                                            if (objJson.result === true) {
                                                infoMessage("Usuario creado con exito!");
                                                getPersonaId(idp);
                                            } else {
                                                errorMessage("Error al crear el usuario");
                                            }
                                        });

                                    }

                                    function editarUsuario(idUser, idPersona) {
                                        $('.myModal').modal("show");
                                        $('#user').val($('#user' + idUser).text());
                                        $('#clav').val($('#clave' + idUser).text());
                                        if ($('#est' + idUser).text() === "Activo") {
                                            $('#est').val("1");
                                        } else {
                                            $('#est').val("0");
                                        }

                                        $('#idu').val(idUser);
                                        $('#idp').val(idPersona);
                                    }

                                    function eliminarUsuario(idUser, idPersona) {
                                        var r = confirm("¿Esta seguro de eliminar el usuario?");
                                        if (r) {
                                            $.post("crud?ent=usuario&opc=4&idusuario=" + idUser, function (objJson) {
                                                if (objJson.result === true) {
                                                    successMessage("Usuario eliminado con exito!");
                                                    getPersonaId(idPersona);
                                                } else {
                                                    errorMessage("Error al eliminar el usuario!");
                                                }
                                            });
                                        }
                                    }

        </script>
    </body>
</html>
<%}else{%>
<%@include file="../error/errorUnauthorized.html"%>
<%}%>