<%-- 
    Document   : ListIglesia
    Created on : 14/07/2016, 09:10:56 PM
    Author     : LEANDRO
--%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%boolean enable = false;

    if (MainControl.validateRol("6", session)) {
        enable = true;
    }if (enable) { %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body class="nav-md" style="background-color: white;width: 80%;margin: auto;">
        <br/><br/>
        <h3 id="titulo"></h3>
        <div class="main_container">
            <input type="hidden" value="listar" id="tipojsp">
            <div class="right_col" role="main" style="box-sizing: border-box;">
                <div class="" style="box-sizing: border-box;">
                    <br/><br/>
                    <div class="clearfix"></div>
                    <div class="row" style="box-sizing: border-box;">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 id="subtitulo"></h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">
                                        <thead>
                                            <tr>
                                                <th><center>Nombre</center></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        </tr>
                                        </thead>
                                        <tbody id="datos">
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input id="iiglesia" type="hidden" value="0">
        <div class="modal fade" id="exampleModal"  role="dialog" style="width:100%;margin: auto;box-sizing: border-box; ">
            <div style="width: 100%;padding: 4% 10%;box-sizing: border-box;margin: auto;overflow: hidden; ">
                <div class="col col-lg-12 buscadorC" style="width: 100%;" ></div>
            </div>
        </div>
        <script src="vistas/iglesia/acIglesia.js"></script>
        <script src="js/persona/buscadorPersona.js" type="text/javascript"></script>
    </body>

</html>
<%
    } else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>
