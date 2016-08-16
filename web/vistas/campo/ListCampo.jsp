<%-- 
    Document   : ListCampo
    Created on : 17/07/2016, 06:14:51 PM
    Author     : LEANDRO
--%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%boolean enable = false;

    if (MainControl.validateRol("9", session)) {
        enable = true;
    }
    if (enable) { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../../css/jspf/impbt.jspf"></jsp:include>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
    </head>
    <body style="background-color: white;width: 80%;margin: auto;">
        <br/><br/>
        <h1>Lista de Campos de la Unión Peruana del Norte</h1>        
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i>   Campos</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div id="conTab">
                            </div>
                        </div>                            
                    </div>                        
                </div>
            </div>
        </div>
        <input id="icampo" type="hidden" value="0">
        <div class="modal fade" id="exampleModal"  role="dialog" style="width:100%;margin: auto;box-sizing: border-box; ">
            <div style="width: 100%;padding: 4% 10%;box-sizing: border-box;margin: auto;overflow: hidden; ">
                <div class="col col-lg-12 buscadorC" style="width: 100%;" ></div>
            </div>
        </div>
        <script src="js/persona/buscadorPersona.js" type="text/javascript"></script>
        <script src="vistas/campo/acCampo.js"></script>
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
                    lideradd();
                    $("#send").attr("type", "button");

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