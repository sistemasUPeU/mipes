<%-- 
    Document   : inicio
    Created on : 27/08/2016, 06:54:13 AM
    Author     : Andres
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="com.upeu.mipes.dao.UsuarioDAO"%>
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
    <body style="background: #F7F7F7">
        <style>
            .btn-full{
                width: 95%;
                margin-bottom: 16px;
                position: static;
            }
        </style>
        <br>
        <div class="container">
            <div class="row">
                <div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">Anuncios</div>
                            <div class="panel-body">
                                <ul class="list-unstyled">
                                    <li>Es necesario que realize el cambio a su clave de acceso. <a href="home?orden=1&opc=1" class="btn btn-success btn-xs pull-right">Click Aqui</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col col-lg-9 col-md-9 col-sm-12 col-xs-12">
                        <div class="panel panel-success">
                            <div class="panel-heading">Menú Principal</div>
                            <div class="panel-body">
                                <div class="row">
                                    <%UsuarioDAO ud = new UsuarioDAO();
                                        ArrayList<Map<String, Object>> lista = ud.getLinks(request.getSession().getAttribute("iduser"));
                                    %>
                                    <%for (int i = 0; i < lista.size(); i++) {
                                    %>
                                    <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <a class="btn btn-success btn-full" href="<%=lista.get(i).get("link")%>">
                                            <i class="<%=lista.get(i).get("icon")%>"></i>
                                            <p><%=lista.get(i).get("nombrelink")%></p>
                                        </a>
                                    </div>
                                    <%}%>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
            });
        </script>
    </body>
</html>
