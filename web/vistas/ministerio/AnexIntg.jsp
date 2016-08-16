<%-- 
    Document   : ListIglesia
    Created on : 14/07/2016, 09:10:56 PM
    Author     : LEANDRO
--%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%
    boolean enable = false;
    String idmin = "";
    String tp = "";
    String clase = "";
    if (MainControl.validateRol("3", session) || MainControl.validateRol("5", session)|| MainControl.validateRol("6", session)) {
        enable = true;
        if (MainControl.validateRol("3", session)) {//LIDER DE MINISTERIO
            tp = "listar";
            clase = "";
        }
        if (MainControl.validateRol("5", session)|| MainControl.validateRol("6", session)) {//LIDER DE IGLESIA o LIDER DE DISTRITO
            tp = "listarig";
            idmin = request.getAttribute("idministerio").toString();
            clase = "hidden";
        }
    }
    if (enable) {%>
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
    <body class="nav-md" style="background-color: white;width: 80%;margin: auto;height: 650px;">
        <br/><br/>
        <div class="main_container">
            <input type="hidden" value="<%=tp%>" id="tipojsp">
            <input type="hidden" value="<%=idmin%>" id="idm">
            <div class="right_col" role="main" style="box-sizing: border-box;">
                <div class="" style="box-sizing: border-box;">
                    <div class="page-title">
                        <div class="title_left" style="width: 70%;">
                            <h3 id="titulo"></h3>
                            <br/>
                            <button class="btn btn-danger <%=clase%>" data-toggle='modal' data-target='#exampleModal' onclick="abc()" type="button"><i class="fa fa-plus"></i>   Añadir Persona</button>
                        </div>
                    </div>

                    <br/><br/><br/>
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
                                                <th><center><i class="fa fa-user"></i>Nombres y Apellidos</center></th>
                                        <th><center><i class="fa fa-credit-card"></i>   DNI</center></th>
                                        <th><center><i class="fa fa-phone"></i>   Celular</center></th>
                                        <th><center><i class="fa fa-envelope-o"></i>   Correo</center></th>
                                        <th class="<%=clase%>"><center><i class="fa fa-close"></i>   Desvincular</center></th>
                                        <th><center><i class="fa fa-child"></i>   Ver Perfil</center></th>
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
        <input id="inministerio" type="hidden" value="0">
        <div class="modal fade" id="exampleModal"  role="dialog" style="width:100%;margin: auto;box-sizing: border-box; ">
            <div style="width: 100%;padding: 4% 10%;box-sizing: border-box;margin: auto;overflow: hidden; ">
                <div class="col col-lg-12 buscadorC" style="width: 100%;" ></div>
            </div>
        </div>
        <script src="js/persona/buscadorPersona.js" type="text/javascript"></script>
        <script src="vistas/ministerio/acMinisterio.js"></script>
    </body>

</html>
<%
} else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>
