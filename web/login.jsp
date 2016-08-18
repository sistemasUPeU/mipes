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
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
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
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 hidden">
                                    <center><img src="images/ico/Home-48.png" alt="..." width="48" height="48"></center>
                                </div>
                                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px">
                                    <center><span class="text-center" style="font-size: 14px">Sistema de Gestion de Grupos Pequeños y Trabajo Misionero</span></center>

                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <center><span class="text-center" style="font-size: 18px;font-weight: 700">CRM Digital</span></center>
                            <center><span class="text-center">Bienvenido(a)</span></center>
                            <br>
                            <div id="loginForm">
                                <form id="validaForm" action="home" method="post">
                                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <input type="text" id="usuario" name="user" class="form-control has-feedback-left" 
                                               placeholder="Ingrese su DNI o Usuario" required >
                                        <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                    </div>                                           
                                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 form-group has-feedback hidden">
                                        <input type="password" id="clave" name="pass" class="form-control has-feedback-left" 
                                               placeholder="Ingrese su Clave" required>
                                        <span class="fa fa-key form-control-feedback left" aria-hidden="true"></span>
                                    </div>                                           
                                    <div class=" col col-lg-12 col-md-12 col-sm-12 col-xs-12 form-group">
                                        <div class="alert alert-danger alert-dismissible fade in hidden alertError" role="alert">
                                            <strong>Error!</strong>El usuario ingresado no existe o es incorrecto.
                                        </div>
                                    </div>
                                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 form-group contBtn">
                                        <a class="btn btn-dark btnNext" onclick="prevalidate()" style="width:100%; ">Siguiente</a>
                                        <input type="hidden" name="opc" value="validate">
                                        <input type="submit" class="btn btn-success btn-block btnLogin" style="width:100%;display: none;margin-left: 0px" value="Entrar"/>
                                    </div>
                                    <a id="btnRegistro" class="btn btn-link pull-left">Regístrate</a>
                                    <a id="btnLost" class="btn btn-link pull-right">¿Olvidaste tu contraseña?</a>
                                </form>
                            </div>
                            <div id="regForm" class="hidden">
                                <form id="regPer">
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <input type="text" id="nombre" name="nombre" class="form-control has-feedback-left" 
                                               placeholder="Nombres" required="required" />
                                        <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <input type="text" id="apellido" name="apellido" class="form-control has-feedback-left"
                                               placeholder="Apellidos" required="required"/>
                                        <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <input type="text" id="dni" name="dni" class="form-control has-feedback-left"
                                               placeholder="DNI" required="required" />
                                        <span class="fa fa-credit-card form-control-feedback left" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <input type="email" id="correo" name="correo" class="form-control has-feedback-left"
                                               placeholder="Correo"/>
                                        <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <input type="text" id="telefono" name="telefono" class="form-control has-feedback-left"
                                               placeholder="Teléfono"/>
                                        <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <input type="text" id="direccion" name="direccion" class="form-control has-feedback-left"
                                               placeholder="Direccion"/>
                                        <span class="fa fa-tag form-control-feedback left" aria-hidden="true"></span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group has-feedback">
                                        <input  type="text" class="form-control has-feedback-left" id="single_cal2" placeholder="Fecha de Nacimiento" aria-describedby="inputSuccess2Status3">
                                        <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                        <span id="inputSuccess2Status3" class="sr-only">(success)</span>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <button type="submit" class="btn btn-danger btn-block" id="send">Registrarse</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <hr>
        <footer class="myfooter">
            <div class="row">
                <div class="col col-lg-2 col-md-2 col-sm-2 hidden-xs" style="margin-top: 30px;">
                    <center><img src="images/AlphaLogo-black.png" width="96" height="60" alt="alphaLogo"/></center>
                </div>
                <div class="col col-lg-10 col-md-10 col-sm-10 col-xs-12">
                    <div class="row">
                        <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-8">
                            <ul class="list-unstyled">
                                <li>
                                    <label>Alpha Team Developers</label>
                                    <p>Somos un equipo de investigación de la Sociedad Científica de Estudiantes de 
                                        Ingeniería de Sistemas, de la Universidad Peruana Union.</p>
                                </li>
                                <li>
                                    <label>Sistema de Gestion de Grupos Pequeños y Trabajo Misionero</label>
                                    <p>CRM DIGITAL 1.0 desarrolado por Alpha Team &copy; 2016. Todos los derechos reservados.</p>
                                </li>
                            </ul>
                        </div>
                        <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-4">
                            <ul class="list-unstyled">
                                <li>
                                    <label>Contáctenos:</label>
                                    <ul class="list-unstyled list-inline">
                                        <li>
                                            <a href="mailto:imerrosas@upeu.edu.pe" class="btn btn-dark btn-circle">
                                                <i class="fa fa-envelope"></i>
                                            </a>
                                            <span class="hidden-xs">imerrosas@upeu.edu.pe</span>
                                        </li>
                                        <li>
                                            <a href="mailto:leandroburgos@upeu.edu.pe" class="btn btn-dark btn-circle">
                                                <i class="fa fa-envelope"></i>
                                            </a>
                                            <span class="hidden-xs">leandroburgos@upeu.edu.pe</span>
                                        </li>
                                        <li>
                                            <a href="https://www.facebook.com/Soceis-931586496886002/" target="blank" class="btn btn-dark btn-circle">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                            <span class="hidden-xs">SOCEIS</span>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <script>
            $(document).ready(function () {
                $('#usuario').keypress(function (e) {
                    if (e.which === 13) {
                        prevalidate();
                    }
                });
                $('#btnRegistro').click(function () {
                    $('#loginForm').hide();
                    $('#regForm').removeClass('hidden');
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
                $('.alertError').removeClass('hidden');
                $('.alertError').hide();
                var url = "login?opc=prevalidate";
                var data = "user=" + $('#usuario').val();
                $.post(url, data, function (objJson) {
                    var respuesta = objJson.result;
                    if (respuesta === 'validar') {
                        $('#usuario').parent().hide();
                        $('#clave').parent().removeClass('hidden');
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
