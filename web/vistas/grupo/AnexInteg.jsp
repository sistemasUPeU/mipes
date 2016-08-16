<%-- 
    Document   : AnexInteg
    Created on : 22/07/2016, 01:50:50 PM
    Author     : LEANDRO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%boolean enable = false;
    String idgp = "";
    String tp = "";
    String clase = "";
    if (MainControl.validateRol("2", session) || MainControl.validateRol("10", session) || MainControl.validateRol("5", session)) {
        enable = true;
        if (MainControl.validateRol("2", session)) {//LIDER DE G.P.
            tp = "listarmiembros";
            clase = "";
        }
        if (MainControl.validateRol("10", session) || MainControl.validateRol("5", session)) {//LIDER DE E.S. O LIDER DE IGLESIA
            tp = "listarmiembroses";
            idgp = request.getAttribute("idgrupo").toString();
            clase = "hidden";
        }
    }
    if (enable) {


%>
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
    <body class="nav-md" style="background-color: white;width: 80%;margin: auto;">
        <br/>
        <div class="main_container">
            <input type="hidden" value="<%=idgp%>" id="otp">
            <input type="hidden" value="<%=tp%>" id="tipojsp">
            <div class="right_col" role="main" style="box-sizing: border-box;">
                <div class="" style="box-sizing: border-box;">
                    <div class="page-title">
                        <div class="title_left" style="width: 70%;">
                            <h3 id="titulo">
                            </h3>
                            <br/>
                            <form class="form-horizontal form-label-left" novalidate>
                                <button class="btn btn-warning <%=clase%>" data-toggle='modal' data-target='#exampleModal' onclick="abc()" type="button"><i class="fa fa-plus"></i>   Agregar Persona</button>
                            </form>
                            <br/>
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
        <input type="hidden" value="0" id="igp">
        <div class="modal fade" id="exampleModal"  role="dialog" style="width:100%;margin: auto;box-sizing: border-box; ">
            <div style="width: 100%;padding: 4% 10%;box-sizing: border-box;margin: auto;overflow: hidden; ">
                <div class="col col-lg-12 buscadorC" style="width: 100%;" ></div>
            </div>
        </div>
        <script src="vistas/grupo/actGrupo.js"></script>
        <script src="js/persona/buscadorPersona.js"></script>
    </body>
</html>
<%} else { %>
<%@include file="../error/errorUnauthorized.html" %>  
<%    }
%>