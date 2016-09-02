<%-- 
    Document   : CreateGrupo
    Created on : 15/07/2016, 05:30:01 PM
    Author     : LEANDRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%boolean enable = false;
    String op = "";
    String cla = "";
    String clab = "";
    String clabt = "";
    if (MainControl.validateRol("10", session)) {
        op = "registrar";
        cla = "btn btn-danger hidden";
        clab = "btn btn-success";
        clabt = "btn btn-success hidden";
        enable = true;
        out.print(10);
    }
    if (MainControl.validateRol("5", session)) {
        op = "registrarIg";
        cla = "btn btn-danger";
        clab = "btn btn-success hidden";
        clabt = "btn btn-success";
        enable = true;
    }
    if (enable) {
        String us = session.getAttribute("iduser").toString();
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title></title>
        <jsp:include page="../../css/jspf/impbt.jspf"></jsp:include>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
    </head>
    <body class="nav-md" style="background-color: white;width: 80%;margin: auto;height: 680px;">
        <input type="hidden" value="<%=op%>" id="tipojsp">
        <br/><br/>
        <div class="modal fade" id="exampleModal"  role="dialog" style="width:100%;margin: auto;box-sizing: border-box; ">
            <div style="width: 100%;padding: 4% 10%;box-sizing: border-box;margin: auto;overflow: hidden; ">
                <div id="selContainer"></div>           
            </div>
        </div>
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>Registro de Grupo Pequeño</h3>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Formulario</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br />
                                <form class="form-horizontal form-label-left" novalidate>
                                    <input id="uscreador" type="hidden" value="<%=us%>">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Escuela Sabática<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input disabled id="nomEsc" class="form-control col-misabledd-7 col-xs-12" data-validate-length-range="10"  name="name" placeholder="" required="required" type="text">
                                            <input id="idesc" type="hidden" value="">
                                        </div>
                                        <button type="button" data-toggle='modal' data-target='#exampleModal' style="float: right;" class="<%=cla%>"><i class="fa fa-plus"></i> Escuela Sabática</button>
                                    </div>
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nombre<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="inombre" required="required" class="form-control col-md-7 col-xs-12" placeholder="Nombre del Grupo Pequeño">
                                        </div>
                                    </div>
                                    <!--<fieldset>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Fecha de Creación<span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="single_cal2" placeholder="Fecha de Creación" aria-describedby="inputSuccess2Status3" required="required">
                                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                <span id="inputSuccess2Status3" class="sr-only">(success)</span>
                                            </div>
                                        </div>
                                    </fieldset>-->
                                    <div class="item form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Lugar de Reunión<span class="required"></span>
                                        </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input id="ilugar" class="form-control col-md-7 col-xs-12" type="text" name="middle-name" placeholder="Lugar de Reunión Oficial" required="required">
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group" style="width: 100%;">
                                        <div class="col-md-6 col-md-offset-3">
                                            <button id="sendb" type="button" onclick="alesc()" class="<%=clabt%>" style="width: 100%;">Registrar</button>
                                            <button id="send" type="submit" class="<%=clab%>" style="width: 100%;">Registrar</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <script src="js/selector/customSelector.js" type="text/javascript"></script>
                <script src="vistas/grupo/aopGrupo.js"></script>
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
                                                        agregarGrupo();
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

            </div>
        </div>
    </body>

</html>
<%
} else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>

