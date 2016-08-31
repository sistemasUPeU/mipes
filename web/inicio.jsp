<%-- 
    Document   : inicio
    Created on : 27/08/2016, 06:54:13 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Expires" content="0" /> 
        <meta http-equiv="Pragma" content="no-cache" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MIPES</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <!-- Custom Theme Style -->
        <link href="css/custommin.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="images/ico/Home-48.png">
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <br>
        <div class="container">
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <center><h3>CRM Digital</h3></center>
                </div>

            </div>
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">Anuncios</div>
                            <div class="panel-body">
                            </div>
                        </div>
                    </div>
                    <div class="col col-lg-9 col-md-9 col-sm-12 col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <img src="images/6d.jpg" alt="portada" style="width: 100%; height: auto;margin: 0 auto"/>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal fade adModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="adTitle">Urgente</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12" id="adContent">
                                <div class="alert alert-success" role="alert">
                                    <span>Es necesario que cambie su clave de acceso, si ya lo hizo, ignore este aviso</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="isAd" value="1">
                        <input type="button" value="Cerrar" class="btn btn-default pull-left" data-dismiss="modal">
                        <a href="home?orden=1&opc=1" class="btn btn-primary pull-right"><i class="fa fa-lock"></i> Cambiar Clave</a>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {

                if ($('#isAd').val() === '1') {
                    $('.adModal').modal('show');
                }
            });
        </script>
    </body>
</html>
