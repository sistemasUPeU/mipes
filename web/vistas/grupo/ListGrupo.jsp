<%-- 
    Document   : ListIglesia
    Created on : 14/07/2016, 09:10:56 PM
    Author     : LEANDRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%boolean enable = false;
    String op = "";
    String cla = "";
    String clm = "";
    if (MainControl.validateRol("10", session) || MainControl.validateRol("5", session)) {
        if (MainControl.validateRol("10", session)) {
            op = "listar";
            cla = "btn btn-danger hidden";
            clm = "";
        }
        if (MainControl.validateRol("5", session)) {
            op = "listarIg";
            cla = "btn btn-danger";
            clm = "hidden";
        }
        enable = true;
    }
    if (enable) {%>
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
        <br/><br/>
        <div class="main_container">            
            <input type="hidden" value="<%=op%>" id="tipojsp">
            <div class="right_col" role="main" style="box-sizing: border-box;">
                <div class="" style="box-sizing: border-box;">
                    <div class="page-title">
                        <div class="title_left" style="width: 70%;">
                            <h3><i class="fa fa-users"></i>   Grupos Pequeños</h3>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="modal fade" id="exampleModal"  role="dialog" style="width:100%;margin: auto;box-sizing: border-box; ">
                        <div style="width: 100%;padding: 4% 10%;box-sizing: border-box;margin: auto;overflow: hidden; ">
                            <div id="selContainer"></div>           
                        </div>
                    </div>
                    <button type="button" class="<%=cla%>" data-toggle='modal' data-target='#exampleModal' style="float: right;"><i class="fa fa-search"></i>  Escoger Escuela</button>
                <div class="row" style="box-sizing: border-box;">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2 id="subtitulo">Lista de Grupos Pequeños</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">
                                    <thead>
                                        <tr>
                                            <th><center><i class="fa fa-users"></i>   Nombre</center></th>
                                    <th><center><i class="fa fa-calendar"></i>   Fecha de Creación</center></th>
                                    <th><center><i class="fa fa-child"></i>   Lider Actual</center></th>
                                    <th><center><i class="fa fa-exchange"></i>   Estado</center></th>
                                    <th class="<%=clm%>"><center><i class="fa fa-pencil"></i>   Editar</center></th>
                                    <th class="<%=clm%>"><center><i class="fa fa-male"></i>   Lider</center></th>
                                    <th><center><i class="fa fa-users"></i>   Miembros</center></th>
                                    <th class="<%=clm%>"><center><i class="fa fa-close"></i>   Eliminar</center></th>
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
        <input id="igrupo" type="hidden" value="0">
        <div class="modal fade" id="exampleModalL"  role="dialog" style="width:100%;margin: auto;box-sizing: border-box; ">
            <div style="width: 100%;padding: 4% 10%;box-sizing: border-box;margin: auto;overflow: hidden; ">
                <div class="col col-lg-12 buscadorC" style="width: 100%;" ></div>
            </div>
        </div>
        <script src="js/selector/customSelector.js" type="text/javascript"></script>
        <script src="vistas/grupo/aopGrupo.js"></script>
        <script src="js/persona/buscadorPersona.js" type="text/javascript"></script>
    </body>

</html>
<%
} else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>
