<%-- 
    Document   : intgp
    Created on : 12/08/2016, 03:28:09 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%boolean enable = false;
    if (MainControl.validateRol("2", session)) {
        enable = true;
    }
    if (enable) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <jsp:include page="../../css/jspf/impbt.jspf"></jsp:include>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
    </head>
    <body id="body" style="background-color: white;padding: 3%;box-sizing: border-box;">
    <center>
        <div style="width: 90%;">
            <h1 id="titulo">Integrantes del Grupo Pequeño </h1>            
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Porcentajes Generales</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-12 col-xs-12">
                        <div class="row">
                            <div class="col-md-6 col-xs-6">
                                <label>Presentes</label>
                                <span class="chart presente" data-percent="">
                                    <span class="percent"></span>
                                </span>
                            </div>
                            <div class="col-md-6 col-xs-6">
                                <label>Faltas</label>
                                <span class="chart falta" data-percent="">
                                    <span class="percent"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Lista de Intregrantes</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="x_panel">                        
                            <div class="x_content">
                                <div id="conTab"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </center>
    <script src="vistas/reporteint/opintgp.js"></script>
</body>
</html>
<%} else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>