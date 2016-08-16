<%-- 
    Document   : repasisMin
    Created on : 04/08/2016, 11:12:36 AM
    Author     : Leandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%
    boolean enable = false;
    int us = 0;
    if (MainControl.validateRol("3", session) || MainControl.validateRol("5", session) || MainControl.validateRol("6", session)) {
        enable = true;
        if (MainControl.validateRol("3", session)) {
            us = 1;
        }
        if (MainControl.validateRol("5", session)) {
            us = 2;
        }
        if (MainControl.validateRol("6", session)) {
            us = 3;
        }
    }
    if (enable) {
        if (us == 1) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <jsp:include page="../../css/jspf/impbt.jspf"></jsp:include>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
    </head>
    <body style="background-color: white;margin: auto;padding: 4%;box-sizing: border-box;height: 650px;">
    <center>
        <div class="row x_title" style="padding: 1% 10%;box-sizing: border-box;">
            <div class="col-md-6">
                <h3 id="titulo">Reporte de Asistencia al Trabajo Misionero del Ministerio </h3>
            </div>
            <label class="col-md-6">Intervalo de Fechas:</label>
            <div class="col-md-6">
                <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                    <span></span><b class="caret"></b>
                </div>
            </div>                
        </div>
        <div style="width: 70%;" class="alert alert-warning advice" role="alert">
            <h2><i class="fa fa-info-circle"></i>   ¡Hey!</h2>
            <strong>Debe escoger un intervalo de fechas para poder ver un reporte</strong><br/>
        </div>
        <div class="contenedorP">
            <div class="col-md-4 col-sm-4 col-xs-12 cM hidden" style="width: 40%;">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-pie-chart"></i>   Porcentaje calculado</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content2">
                        <div id="graph_donut" style="width:100%; height:300px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="contenedor">
            <div class="col-md-6 col-sm-6 col-xs-12 cM hidden" style="width: 60%;">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-line-chart"></i>   Asistencia del Ministerio</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div id="echart_line" style="height:350px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </center>
    <script src="vistas/reportesmin/opmin.js" type="text/javascript"></script>
</body>
</html>
<%
    }
    if (us == 2) {%>
<%@include file="/vistas/reportesmin/repasisIgl.jsp" %>  
<%  }
    if (us == 3) {%>
<%@include file="/vistas/reportesmin/repasisDis.jsp" %>     
<%    }
    } else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>
