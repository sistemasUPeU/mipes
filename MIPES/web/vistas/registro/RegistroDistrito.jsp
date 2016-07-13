<%-- 
    Document   : RegistroNewES
    Created on : 22/05/2016, 12:22:03 PM
    Author     : USER
--%>

<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no ,initial-scale=1.0 , maximun-scale=1.0, minimun-scale=1.0">
        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <jsp:include page="../../jspf/impmaterialize.jspf"></jsp:include>
    </head>
    <body>
        <div style="width: 65%; margin: auto">
            <form>
                <center><h2 style="color:#00bfa5">Nueva Distrito Misionero</h2></center>
                <br/>
                <div class="input-field col s6">
                    <input id="i_dis" name="n_distrito" type="text" class="validate" onkeyup="validar(this.value, this.id)">
                    <label for="i_dis" style="margin-top: 1%">Nombre del Distrito Misionero</label>
                </div>                
                <br/><br/>
                <button id="boton" class="btn waves-effect waves-light" type="reset" onclick="ver(this.type)" name="action" style="float: right">Registrar
                    <i class="material-icons right">send</i>
                </button>
            </form>


            <script>
                function validar(texto, id) {
                    if (/^([a-zA-Z])*$/.test(texto)) {
                        $('#' + id + '').attr("class", "validate");
                        $('#boton').attr("type", "button");
                    } else {
                        $('#' + id + '').attr("class", "invalid");
                        $('#boton').attr("type", "reset");
                    }
                }
            </script>
            <script>
                function ver(boton) {
                    var dis = $("#i_dis").val();
                    //alert(dis);
                    if (boton == "reset") {
                        swal("¡Error!", "Debe completar correctamente todos los campos", "error");
                    } else {
                        $('#i_dis').attr("value", dis);
                        swal({
                            title: "Confirmación",
                            text: "Usuario:",
                            type: "input",
                            inputType: "text",
                            showCancelButton: true,
                            closeOnConfirm: false,
                            animation: "slide-from-top",
                            inputPlaceholder: "Ingrese su Usuario"},
                        function (inputValue) {
                            if (inputValue === false)
                                return false;
                            if (inputValue === "") {
                                swal.showInputError("¡Debe ingresar su usuario!");
                                return false;
                            }
                            swal({
                                title: inputValue,
                                text: "Contraseña:",
                                type: "input",
                                inputType: "password",
                                showCancelButton: true,
                                closeOnConfirm: false,
                                animation: "slide-from-top",
                                inputPlaceholder: "Ingrese su Usuario"},
                            function (contra) {
                                if (contra === false || contra === "") {
                                    if (contra === false) {
                                        return false;
                                    }
                                    if (contra === "") {
                                        swal.showInputError("¡Debe ingresar su contraseña!");
                                        return false;
                                    }
                                } else {
                                    var url = "user?opc=validar";
                                    var data = "";
                                    data += "usuario=" + inputValue;
                                    data += "&clave=" + contra;
                                    $.post(url, data, function (objJson) {
                                        var valid = objJson.valid;
                                        if (valid) {
                                            swal({
                                                title: "Cuenta Confirmada",
                                                text: "Su cuenta fue confirmada exitosamente",
                                                type: "success",
                                                confirmButtonText: "¡Genial!",
                                                closeOnConfirm: false},
                                            function (isConfirm) {
                                                if (isConfirm) {
                                                    swal({
                                                        title: "¿Seguro que desea crear el Distrito Misionero '" + dis + "'?",
                                                        text: "Se realizará cambios en el sistema",
                                                        type: "info",
                                                        showCancelButton: true,
                                                        confirmButtonColor: "#DD6B55",
                                                        confirmButtonText: "Sí, deseo crearlo",
                                                        cancelButtonText: "No, deseo cancenlar",
                                                        closeOnConfirm: false,
                                                        closeOnCancel: false},
                                                    function (isConfirm) {
                                                        if (isConfirm) {
                                                            swal({
                                                                title: "¡Distrito Misionero '" + dis + "' creado!",
                                                                text: "El Distrito Misionero fue creado exitosamente",
                                                                type: "success",
                                                                button: "success"},
                                                            function () {
                                                                location.href = 'distrito?opc=2&dis='+dis;
                                                            });

                                                        } else {
                                                            swal("Cancelado", "No se registró el Distrito Misionero '"+dis+"'", "error");
                                                        }
                                                    });

                                                }
                                            });
                                        } else {
                                            swal("Error", "Cuenta no confirmada, no puedo registrar el Distrit Misionero '"+dis+"'", "error");
                                        }
                                    });
                                }
                            }


                            );
                        });
                    }
                }
            </script>
        </div>
    </body>
</html>
