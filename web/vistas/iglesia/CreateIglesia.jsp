<%-- 
    Document   : CreateIglesia
    Created on : 27/07/2016, 08:50:07 PM
    Author     : LEANDRO
--%>

<%@page import="com.upeu.mipes.dao.UsuarioDAO"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%boolean enable = false;

    if (MainControl.validateRol("6", session)) {
        enable = true;
    }if (enable) { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title></title>
        <jsp:include page="../../css/jspf/impbt.jspf"></jsp:include>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
        </head>
        <body class="nav-md" style="background-color: white;width: 80%;margin: auto;">
            <div class="right_col" role="main">
                <input type="hidden" value="registrar" id="tipojsp">
                <div class="">
                    <div class="page-title">
                        <div class="title_left" style="width: 100%;">
                            <br/>
                            <h3>
                                Registro de una Iglesia
                            </h3>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                    <br/>
                    <div class="row" style="width: 100%;">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Iglesia<small>sub title</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <form class="form-horizontal form-label-left" novalidate>
                                        <span class="section">Información</span>

                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Distrito Misionero<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input disabled="" id="nomdis" class="form-control col-misabledd-7 col-xs-12" data-validate-length-range="10"  name="name" placeholder="" required="required" type="text">
                                            <input type="hidden" value="">
                                            </div>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nombre<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="10"  name="name" placeholder="Ingrese el nombre de la Iglesia" required="required" type="text">
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group" style="width: 100%;">
                                        <div class="col-md-6 col-md-offset-3">
                                            <button id="send" type="submit" class="btn btn-success" style="width: 100%;">Registrar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/selector/customSelector.js" type="text/javascript"></script>
        <script src="vistas/iglesia/acIglesia.js" type="text/javascript"></script>        
        <script src="js/validator/validator.js"></script>
        <script>
            // initialize the validator function
            validator.message['date'] = 'not a real date';

            // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
            $('form')
                    .on('blur', 'input[required], input.optional, select.required', validator.checkField)
                    .on('change', 'select.required', validator.checkField)
                    .on('keypress', 'input[required][pattern]', validator.keypress);

            $('.multi.required')
                    .on('keyup blur', 'input', function () {
                        validator.checkField.apply($(this).siblings().last()[0]);
                    });

            // bind the validation to the form submit event
            //$('#send').click('submit');//.prop('disabled', true);

            $('form').submit(function (e) {
                e.preventDefault();
                var submit = true;
                // evaluate the form using generic validaing
                if (!validator.checkAll($(this))) {
                    submit = false;
                }

                if (submit) {
                    $("#send").attr("type", "button");
                    crear();
                }

                return false;
            });

            /* FOR DEMO ONLY */
            $('#vfields').change(function () {
                $('form').toggleClass('mode2');
            }).prop('checked', false);

            $('#alerts').change(function () {
                validator.defaults.alerts = (this.checked) ? false : true;
                if (this.checked)
                    $('form .alert').remove();
            }).prop('checked', false);
        </script>
    </body>

</html>
<%
    } else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>

