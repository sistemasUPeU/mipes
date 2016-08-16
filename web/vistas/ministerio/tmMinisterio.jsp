<%-- 
    Document   : tmMinisterio
    Created on : 27/07/2016, 09:20:35 PM
    Author     : USER
--%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%boolean enable = false;

    if (MainControl.validateRol("3", session)) {
        enable = true;
    }
    if (enable) { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../WEB-INF/jspf/idLider.jspf" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <jsp:include page="../../css/jspf/impbt.jspf"></jsp:include>
            <link href="css/customSwitch.css" rel="stylesheet" type="text/css"/>
            <link href="js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
            <script src="js/notify/pnotify.core.js" type="text/javascript"></script>
            <script src="js/notify/pnotify.buttons.js" type="text/javascript"></script>
            <script src="js/notify/pnotify.nonblock.js" type="text/javascript"></script>
            <script src="js/notify/customNotify.js" type="text/javascript"></script>
            <link href="css/pnotify.css" rel="stylesheet" type="text/css"/>
            <link rel="icon" href="images/ico/Home-48.png">
        </head>
        <body style="margin:auto;background-color: white;height: 650px;">
            <br/>            
        <center>
            <div class="container" id="containerMessage" style="display: none;width: 60%;">
                <div class="row">
                    <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                        <div class="alert alert-success" role="alert">
                            <p><strong>¡Felicidades!</strong> Ha registrado la asistencia de su Ministerio
                                al Trabajo Misionero de esta semana, espere a la otra semana para poder registrar su asistencia.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main_container hidden" style="width: 95%;" id="containerReg">
                <input type="hidden" value="listar" id="tipojsp">
                <div class="right_col" role="main" style="box-sizing: border-box;">
                    <div class="" style="box-sizing: border-box;">
                        <div class="page-title">
                            <div class="title_left" style="width: 70%;">
                                <h3 id="titulo">Registro de Asistencia al Trabajo Misionero</h3>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row" style="box-sizing: border-box;">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 id="subtitulo"></h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content" id="conTab">

                                        <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">
                                            <thead>
                                                <tr>
                                                    <th><center><i class="fa fa-user"></i>   Nombres y Apellidos</center></th>                                        
                                        <th><i class="fa fa-bar-chart"></i>   Nivel de Asistencia</th>
                                            <th><i class="fa fa-check"></i>   Asistencia</th>
                                            </tr>
                                            </thead>
                                            <tbody id="intmin">
                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </center>
        <div class="modal fade" id="exampleModal"  role="dialog" style="width:100%;margin: auto;box-sizing: border-box; ">
            <div style="width: 100%;padding: 4% 10%;box-sizing: border-box;margin: auto;overflow: hidden; ">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="presentes">Presentes:</label>
                                    <input class="form-control" type="number" id="presentes" readonly>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="faltas">Faltas:</label>
                                    <input class="form-control" type="number" id="faltas" readonly>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="ben">Beneficiarios:</label>
                                    <input class="form-control" type="number" id="ben" min="0" placeholder="Cantidad de Beneficiarios">
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="lugar">Lugar:</label>
                                    <input class="form-control" type="text" id="lugar" placeholder="Lugar de Reunion">
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="descripcion">Descripcion:</label>
                                    <textarea id="descripcion" class="form-control" rows="3" placeholder="Describa detalles de la actividad"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                        <button type="button" onclick="valid()" class="btn btn-primary">Registrar</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="vistas/ministerio/optmMini.js"></script>
        <script src="js/modal/customModal.js" type="text/javascript"></script>
    </body>
</html>
<%
} else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>