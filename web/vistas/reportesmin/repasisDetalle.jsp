<%-- 
    Document   : repasisDetalle
    Created on : 12/08/2016, 08:27:22 AM
    Author     : LEANDRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%
    boolean enable = false;
    String rol = "";
    if (MainControl.validateRol("5", session) || MainControl.validateRol("6", session) || MainControl.validateRol("7", session)) {
        enable = true;
        if (MainControl.validateRol("5", session)) {
            rol = "iglesia";
        }
        if (MainControl.validateRol("6", session)) {
            rol = "distrito";
        }
        if (MainControl.validateRol("7", session)) {
            rol = "campo";
        }
    }
    if (enable) {


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../../css/jspf/impbt.jspf"></jsp:include>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
    </head>
    <body id="body" style="background-color: white;padding: 3%;box-sizing: border-box;">
        <input id="irol" type="hidden" value="<%=rol%>">
        <input id="itipo" type="hidden" value="">
        <input id="inom" type="hidden" value="">
    <center>
        <div style="width: 90%;">
            <h1 id="titulo">Reporte Detallado</h1>
            <div class="alert alert-info alert-dismissible fade in advice" role="alert" style="box-shadow: 0 0 20px 0 black;">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                </button>
                <strong>Puedes escoger entre estos reportes para ver</strong><br/>
                <i class="fa fa-arrow-down"></i>
            </div>
            <div class="alert alert-info alert-dismissible fade in cfechas hidden" role="alert" style="background-color: #6d4c41;border: none;box-shadow: 0 0 20px 0 black;">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                </button>
                <strong id="textfec"></strong><br/>
            </div>
            <div id="contButtons">
                <button onclick="modDistrito(this.value)" value="<%=rol%>" class="btn btn-success hidden bdistrito" type="button" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-globe"></i>   Ver por Distrito</button>
                <button onclick="modIglesia(this.value)" value="<%=rol%>" class="btn btn-info hidden biglesia" type="button" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-home"></i>   Ver por Iglesia</button>
                <button onclick="modMinisterio(this.value)" value="<%=rol%>" class="btn btn-warning bministerio" type="button" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-users"></i>   Ver por Ministerio</button>
            </div>
        </div>
        <div style="background-color: #34495E;border:none;box-shadow: 0 0 10px 0 black;" class="alert alert-info fec hidden" role="alert">
            <strong id="fechas"></strong>
        </div>
        <div class="contenedor"></div>
        <div class="contenedorM"></div>

        <div id="modalM" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">Datos para el reporte</h4>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Intervalo de Fechas</h3>
                            </div>
                            <div class="panel-body">
                                <label>Fecha Inicial:</label>
                                <input id="fechai" type="date" class="form-control" onchange="validFechas()">
                                <label>Fecha Final:</label>
                                <input id="fechaf" type="date" class="form-control" onchange="validFechas()">
                            </div>                               
                        </div>
                        <div id="selContainer" class="hidden"></div> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button onclick="validar()" id="ireportar" type="button" class="btn btn-success disabled">Graficar</button>
                    </div>

                </div>
            </div>
        </div>
        <script src="vistas/reportesmin/opdetalle.js"></script>
        <script src="js/selector/customSelector.js" type="text/javascript"></script>
    </center>
</body>
</html>
<% }%>