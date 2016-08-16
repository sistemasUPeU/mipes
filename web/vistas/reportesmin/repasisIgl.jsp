<%-- 
    Document   : repasisIgl
    Created on : 10/08/2016, 06:06:09 PM
    Author     : Leandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title></title>
        <jsp:include page="../../css/jspf/impbt.jspf"></jsp:include>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
    </head>
    <body id="body" style="background-color: white;margin: auto;padding: 4%;box-sizing: border-box;height: 650px;">
    <center>
        <div class="row x_title" style="padding: 1% 10%;box-sizing: border-box;">
            <div class="col-md-6">
                <h3 id="titulo">Reporte de Asistencia a los Ministerios de </h3>
            </div>
            <label class="col-md-6">Intervalo de Fechas:</label>
            <div class="col-md-6">
                <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                    <span></span><b class="caret"></b>
                </div>
            </div>                
        </div>
    </center>
    <div style="box-shadow: 0 0 20px 0 black;" class="alert alert-success advice" role="alert">
        <h4><i id="iadvice" class="fa fa-info-circle"></i>   ¡Hey!</h4>
        <strong>Debe escoger un intervalo de fechas para poder ver un reporte de asistencia a los Ministerios</strong>
    </div>
    <center>    
        <div style="background-color: #34495E;border:none;box-shadow: 0 0 10px 0 black;" class="alert alert-info fec hidden" role="alert">
            <strong id="fechas"></strong>
        </div>
    </center>
    <div class="hidden" style="float: right;">
        <a class="btn btn-warning" href="home?orden=9&opc=6"><i class="fa fa-bar-chart-o"></i>   Ver Reporte Detallado</a>
    </div>

    <center>
        <div class="contenedor"></div>
        <div class="contenedorM"></div>
    </center>
    <script src="vistas/reportesmin/opminig.js"></script>
</body>
</html>
