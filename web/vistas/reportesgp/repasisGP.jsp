<%-- 
    Document   : prueba
    Created on : 02/08/2016, 10:06:25 PM
    Author     : Leandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%
    boolean enable = false;
    int us = 0;
    if (MainControl.validateRol("2", session) || MainControl.validateRol("10", session) || MainControl.validateRol("5", session) || MainControl.validateRol("6", session)) {
        enable = true;
        if (MainControl.validateRol("2", session)) {
            us = 1;
        }
        if (MainControl.validateRol("10", session)) {
            us = 2;
        }
        if (MainControl.validateRol("5", session)) {
            us = 3;
        }
        if (MainControl.validateRol("6", session)) {
            us = 4;
        }
    }
    if (enable) {
        if (us == 1) {
%>
<!DOCTYPE html5>
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
    <body style="background-color: white;margin: auto;padding: 4%;box-sizing: border-box;height: 100%;" id="body">
    <center>
        <div class="row x_title" style="padding: 1% 10%;box-sizing: border-box;">
            <div class="col-md-6">
                <h3 id="titulo">Reporte de Asistencia del Grupo Pequeño </h3>
            </div>
            <label class="col-md-6">Intervalo de Fechas:</label>
            <div class="col-md-6">
                <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                    <span></span><b class="caret"></b>
                </div>
            </div>                
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12 cM hidden" style="width: 40%;">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Porcentaje calculado</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">

                    <div id="echart_mini_pie" style="height:350px;"></div>

                </div>
            </div>
        </div>
    </center>
    <div style="box-shadow: 0 0 20px 0 black;" class="alert alert-info advice" role="alert">
        <h4><i id="iadvice" class="fa fa-info-circle"></i>   ¡Hey!</h4>
        <strong>Debe escoger un intervalo de fechas para poder ver un reporte de asistencia al Grupos Pequeños</strong>
    </div>
    <div style="box-shadow: 0 0 20px 0 black;background-color: #34495E;border: none;" class="alert alert-info fec hidden" role="alert">
        <strong id="ifechas"></strong>
    </div>
    <center>
        <div class="contenedor"></div>
        <div class="contenedorM"></div>
    </center>
    <script src="vistas/reportesgp/opgp.js" type="text/javascript"></script>
</body>
</html>
<%
    }
    if (us == 2) {%>
<%@include file="/vistas/reportesgp/repasisGPES.jsp" %>  
<%  }
    if (us == 3) {%>
<%@include file="/vistas/reportesgp/repasisGPIG.jsp" %> 
<%  }
    if (us == 4) {%>
<%@include file="/vistas/reportesgp/repasisGPDIS.jsp" %> 
<%  }
    } else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>