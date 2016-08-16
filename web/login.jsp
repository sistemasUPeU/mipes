<%-- 
    Document   : loginn
    Created on : 17/07/2016, 10:18:43 PM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Expires" content="0" /> 
        <meta http-equiv="Pragma" content="no-cache" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>MIPES</title>
        <jsp:include page="/css/jspf/impbt.jspf"></jsp:include>
        <link rel="icon" href="images/ico/Home-48.png">


        <script>
            Meteor.startup(function () {
                sAlert.config({
                    effect: '',
                    position: 'top-right',
                    timeout: 5000,
                    html: false,
                    onRouteClose: true,
                    stack: true,
                    offset: 0, // in px - will be added to first alert (bottom or top - depends of the position in config)
                    beep: false,
                    onClose: _.noop //
                });

            });
        </script>
    </head>

    <body style="background:#F7F7F7;">
        <header class="page-header">
            <center><h3>Sistema de Gestion de Grupos Pequeños y Trabajo Misionero MIPES</h3></center>
            <center><h4>Bienvenidos</h4></center>
        </header>
        <div class="container">
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>

            <div id="wrapper" style="margin: 0 auto">
                <div id="login" class="animate form">
                    <section class="login_content">
                        <form id="validaForm" action="home" method="post">
                            <h1>Iniciar Sesión</h1>
                            <div class="form-group contUser">
                                <input type="text" id="usuario" name="user" class="form-control" placeholder="Ingrese su DNI o Usuario" required >
                                <input type="password" id="clave" name="pass" class="form-control" placeholder="Ingrese su Clave" required style="display: none">
                            </div>
                            <div class="form-group">
                                <div class="alert alert-danger alert-dismissible fade in alertError" role="alert" style="display: none">
                                    <strong>Error!</strong>El usuario ingresado no existe o es incorrecto.
                                </div>
                            </div>
                            <div class="form-group contBtn">
                                <a class="btn btn-info btnNext" onclick="prevalidate()" style="width:100%; ">Siguiente</a>
                                <input type="hidden" name="opc" value="validate">
                                <input type="submit" class="btn btn-success btn-block btnLogin" style="width:100%;display: none;margin-left: 0px" value="Entrar"/>
                            </div>
                            <div class="clearfix"></div>
                            <div class="separator">
                                <p class="change_link">¿No estas registrado?
                                    <a href="#toregister" class="btn btn-warning">Crear Cuenta</a>
                                </p>
                                <div class="clearfix"></div>
                                <br />
                                <div>
                                    <h1><i class="fa fa-group"></i> MIPES</h1>
                                    <p>©2016 Mipes v 1.0</p>
                                </div>
                            </div>
                        </form>
                        <!-- form -->
                    </section>
                    <!-- content -->
                </div>
                <div id="register" class="animate form">
                    <section class="login_content">
                        <h1>Registrarse</h1>
                        <form id="regPer">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Nombres" required="required" />
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <input type="text" id="apellido" name="apellido" class="form-control" placeholder="Apellidos" required="required"/>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <input type="text" id="dni" name="dni" class="form-control" placeholder="DNI" required="required" />
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <input type="email" id="correo" name="correo" class="form-control" placeholder="Correo"/>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <input type="text" id="telefono" name="telefono" class="form-control" placeholder="Teléfono"/>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <input type="text" id="direccion" name="direccion" class="form-control" placeholder="Direccion"/>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <input  type="text" class="form-control has-feedback-left" id="single_cal2" placeholder="Fecha de Nacimiento" aria-describedby="inputSuccess2Status3">
                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                <span id="inputSuccess2Status3" class="sr-only">(success)</span>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <button type="submit" class="btn btn-danger" id="send">Registrar</button>
                            </div>
                        </form>
                        <div class="clearfix"></div>
                        <div class="separator">

                            <p class="change_link">¿Ya es un miembro?
                                <a href="#tologin" class="to_register">Ingresar</a>
                            </p>
                            <div class="clearfix"></div>
                            <br />
                            <div>
                                <h1><i class="fa fa-paw" style="font-size: 26px;"></i> MIPES</h1>
                                <p>©2016 Mipes v 1.0</p>
                            </div>
                        </div>

                        <!-- form -->
                    </section>
                    <!-- content -->
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#usuario').keypress(function (e) {
                    if (e.which === 13) {
                        prevalidate();
                    }
                });
            });
            function crear() {
                var fecha = $('#single_cal2').val();
                if (fecha !== "") {
                    var orf = fecha.split("/");
                    var dia = orf[1];
                    var mes = orf[0];
                    var an = orf[2];
                    var fecenv = an + "-" + mes + "-" + dia;
                }
                var url = "crud?ent=pers&opc=3";
                var data = "";
                data += "nombres=" + $('#nombre').val();
                data += "&apellidos=" + $('#apellido').val();
                data += "&direccion=" + $('#direccion').val();
                data += "&correo=" + $('#correo').val();
                data += "&telefono=" + $('#telefono').val();
                data += "&dni=" + $('#dni').val();
                data += "&fecha=" + fecenv;
                $.post(url, data, function (objJson) {
                    var respuesta = objJson.result;
                    if (respuesta) {
                        swal({
                            title: "¡Genial!",
                            text: "El registro se realizó correctamente, ya puede iniciar sesión",
                            type: "success",
                            button: "success"},
                        function () {
                            location.href = "login";
                        });
                    } else {
                        swal("Ups...", "Ocurrió un problema al momento de registrarte", "warning");
                    }
                });
            }
            function prevalidate() {
                $('.alertError').hide();
                var url = "login?opc=prevalidate";
                var data = "user=" + $('#usuario').val();
                $.post(url, data, function (objJson) {
                    var respuesta = objJson.result;
                    if (respuesta === 'validar') {
                        $('#usuario').hide();
                        $('#clave').show();
                        $('#clave').focus();
                        $('.btnNext').hide();
                        $('.btnLogin').show();
                    } else if (respuesta === 'error') {
                        $('.alertError').show();
                    } else {
                        $('#clave').val(respuesta);
                        $('#validaForm').submit();
                    }
                });
            }
            $('#regPer').on('blur', 'input[required], input.optional, select.required', validator.checkField)
                    .on('change', 'select.required', validator.checkField)
                    .on('keypress', 'input[required][pattern]', validator.keypress);

            $('.multi.required').on('keyup blur', 'input', function () {
                validator.checkField.apply($(this).siblings().last()[0]);
            });
            $('#regPer').submit(function (e) {
                e.preventDefault();
                var submit = true;
                if (!validator.checkAll($(this))) {
                    submit = false;
                }
                if (submit) {
                    $("#send").attr("type", "button");
                    crear();
                }
                return false;
            });
        </script>
    </body>
</html>
