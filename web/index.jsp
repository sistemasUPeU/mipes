
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.upeu.mipes.dao.UsuarioDAO"%>
<%@page import="com.upeu.mipes.controller.MainControl"%>
<%
    String nombre, apellido, usuario;
    nombre = "";
    apellido = "";
    usuario = "";
    if (MainControl.validateSession(request)) {
        nombre = request.getSession().getAttribute("nombres").toString();
        apellido = request.getSession().getAttribute("apellidos").toString();
        usuario = request.getSession().getAttribute("usuario").toString();
%>
<!DOCTYPE html>
<html lang="es" style="height: 100%">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Expires" content="0" /> 
        <meta http-equiv="Pragma" content="no-cache" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRM Digital|MIPES UPeU</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <!-- Custom Theme Style -->
        <link rel="icon" href="images/ico/Home-48.png">
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
        <link href="css/material.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/indexStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="js/material.min.js" type="text/javascript"></script>
    </head>

    <body>
        <style>
            .demo-layout-transparent {
                background: rgb(42, 63, 84);
                //background-image: url(images/slide2.jpg);
            }
            .demo-layout-transparent .mdl-layout__header,
            .demo-layout-transparent .mdl-layout__drawer-button {
                /* This background is dark, so we set text to white. Use 87% black instead if
                   your background is light. */
                color: white;
            }
        </style>

        <div class="demo-layout-transparent mdl-layout mdl-js-layout">
            <header class="mdl-layout__header mdl-layout__header--transparent">
                <div class="mdl-layout__header-row">
                    <!-- Title -->
                    <a class="mdl-navigation__link" href="inicio.jsp" target="frame"><span class="mdl-layout-title">CRM Digital</span></a>
                    <!-- Add spacer, to align navigation to the right -->
                    <div class="mdl-layout-spacer"></div>
                    <!-- Navigation -->
                    <nav class="mdl-navigation">
                        <a class="mdl-navigation__link" href="inicio.jsp" target="frame">Inicio</a>
                        <button id="demo-menu-lower-right"
                                class="mdl-button mdl-js-button mdl-button--icon">
                            <i class="material-icons">person</i>
                        </button>
                        <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
                            for="demo-menu-lower-right">
                            <li>
                                <a href="home?orden=1&opc=1" class="mdl-menu__item btn" target="frame">
                                    <i class="fa fa-smile-o"></i>
                                    <span> Ver Perfil</span>
                                </a>
                            </li>
                            <li>
                                <a href="login?opc=logout" class="mdl-menu__item btn">
                                    <i class="fa fa-sign-out"></i>
                                    <span> Cerrar Sesion</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </header>
            <div class="mdl-layout__drawer" style="border: none;background: #fff;">
                <div style="background: rgb(42, 63, 84);">
                    <div class="mdl-list">
                        <div class="mdl-list__item">
                            <span class="mdl-list__item-primary-content" style="color: white">
                                <i class="material-icons mdl-list__item-avatar">person</i>
                                <span><%=nombre + " " + apellido%></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div>
                    <nav class="mdl-navigation" style="color: white">
                        <%UsuarioDAO ud = new UsuarioDAO();
                            ArrayList<Map<String, Object>> lista = ud.getLinks(request.getSession().getAttribute("iduser"));
                        %>
                        <!--PERFIL: ORDEN 1-->
                        <%ArrayList<Map<String, Object>> l1 = ud.listOrden(lista, 1);
                            if (!l1.isEmpty()) {
                        %>
                        <span class="menu-title">Perfil</span>
                        <%for (int i = 0; i < l1.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l1.get(i).get("link")%>" target="frame">
                            <i class="<%=l1.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l1.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>
                        <!--CAMPO ORDEN 2-->
                        <%
                            ArrayList<Map<String, Object>> l2 = ud.listOrden(lista, 2);
                            if (!l2.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Campo</span>
                        <%for (int i = 0; i < l2.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l2.get(i).get("link")%>" target="frame">
                            <i class="<%=l2.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l2.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                        <!--DISTRITO ORDEN 3-->
                        <%
                            ArrayList<Map<String, Object>> l3 = ud.listOrden(lista, 3);
                            if (!l3.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Distrito</span>
                        <%for (int i = 0; i < l3.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l3.get(i).get("link")%>" target="frame">
                            <i class="<%=l3.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l3.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                        <!--IGLESIA ORDEN 4-->
                        <%
                            ArrayList<Map<String, Object>> l4 = ud.listOrden(lista, 4);
                            if (!l4.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Iglesia</span>
                        <%for (int i = 0; i < l4.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l4.get(i).get("link")%>" target="frame">
                            <i class="<%=l4.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l4.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                        <!--ESCUELA SABATICA ORDEN 5-->
                        <%
                            ArrayList<Map<String, Object>> l5 = ud.listOrden(lista, 5);
                            if (!l5.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Escuela Sabática</span>
                        <%for (int i = 0; i < l5.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l5.get(i).get("link")%>" target="frame">
                            <i class="<%=l5.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l5.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                        <!--GRUPOS PEQUEÑOS ORDEN 6-->
                        <%
                            ArrayList<Map<String, Object>> l6 = ud.listOrden(lista, 6);
                            if (!l6.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Grupos Pequeños</span>
                        <%for (int i = 0; i < l6.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l6.get(i).get("link")%>" target="frame">
                            <i class="<%=l6.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l6.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                        <!--MINISTERIOS ORDEN 7-->
                        <%
                            ArrayList<Map<String, Object>> l7 = ud.listOrden(lista, 7);
                            if (!l7.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Ministerios</span>
                        <%for (int i = 0; i < l7.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l7.get(i).get("link")%>" target="frame">
                            <i class="<%=l7.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l7.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                        <!--TRABAJO MISIONERO ORDEN 8-->
                        <%
                            ArrayList<Map<String, Object>> l8 = ud.listOrden(lista, 8);
                            if (!l8.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Trabajo Misionero</span>
                        <%for (int i = 0; i < l8.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l8.get(i).get("link")%>" target="frame">
                            <i class="<%=l8.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l8.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                        <!--REPORTES ORDEN 9-->
                        <%
                            ArrayList<Map<String, Object>> l9 = ud.listOrden(lista, 9);
                            if (!l9.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Reportes</span>
                        <%for (int i = 0; i < l9.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l9.get(i).get("link")%>" target="frame">
                            <i class="<%=l9.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l9.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                        <!--USUARIO ORDEN 10-->
                        <%
                            ArrayList<Map<String, Object>> l10 = ud.listOrden(lista, 10);
                            if (!l10.isEmpty()) {
                        %>
                        <hr>
                        <span class="menu-title">Usuario</span>
                        <%for (int i = 0; i < l10.size(); i++) {%>
                        <a class="mdl-navigation__link" href="<%=l10.get(i).get("link")%>" target="frame">
                            <i class="<%=l10.get(i).get("icon")%>"></i>
                            <span style="margin-left: 8px;"><%=l10.get(i).get("nombrelink")%></span>
                        </a>
                        <%}%>
                        <%}%>                        
                    </nav>
                </div>
            </div>
            <main class="mdl-layout__content">
                <iframe src="inicio.jsp"
                        name="frame" id="idframe" onload="loadFrame(this.contentWindow.location);"
                        style="height:600px; width: 103%;border: none; overflow-y: hidden">
                </iframe>
                <footer class="mdl-mega-footer">
                    <div class="mdl-mega-footer__middle-section">

                        <div class="mdl-mega-footer__drop-down-section">
                            <input class="mdl-mega-footer__heading-checkbox" type="checkbox" checked>
                            <h1 class="mdl-mega-footer__heading">CRM DIGITAL 1.0</h1>
                            <ul class="mdl-mega-footer__link-list">
                                <li><p>Sistema de Gestion de Grupos Pequeños y Trabajo Misionero desarrolado por Alpha Team &copy; 2016. Todos los derechos reservados.</p></li>
                            </ul>
                        </div>

                        <div class="mdl-mega-footer__drop-down-section">
                            <input class="mdl-mega-footer__heading-checkbox" type="checkbox" checked>
                            <h1 class="mdl-mega-footer__heading">Contáctenos</h1>
                            <ul class="mdl-mega-footer__link-list">
                                <li>
                                    <a href="mailto:imerrosas@upeu.edu.pe" class="btn btn-dark btn-circle">
                                        <i class="fa fa-envelope"></i>
                                    </a>
                                    <span>imerrosas@upeu.edu.pe</span>
                                </li>
                                <li>
                                    <a href="mailto:leandroburgos@upeu.edu.pe" class="btn btn-dark btn-circle">
                                        <i class="fa fa-envelope"></i>
                                    </a>
                                    <span>leandroburgos@upeu.edu.pe</span>
                                </li>
                                <li>
                                    <a href="mailto:jeffreyvargas@upeu.edu.pe" class="btn btn-dark btn-circle">
                                        <i class="fa fa-envelope"></i>
                                    </a>
                                    <span>jeffreyvargas@upeu.edu.pe</span>
                                </li>
                                <li>
                                    <a href="https://www.facebook.com/Soceis-931586496886002/" target="blank" class="btn btn-dark btn-circle">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                    <span>SOCEIS</span>
                                </li>
                            </ul>
                        </div>
                        <div class="mdl-mega-footer__drop-down-section">
                            <input class="mdl-mega-footer__heading-checkbox" type="checkbox" checked>
                            <h1 class="mdl-mega-footer__heading">Alpha Team Developers</h1>
                            <ul class="mdl-mega-footer__link-list">
                                <li>
                                    <p>Somos un equipo de investigación de la Sociedad Científica de Estudiantes de 
                                        Ingeniería de Sistemas, de la Universidad Peruana Union.</p>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div class="mdl-mega-footer__bottom-section">
                        <center><img src="images/alphaLogo.png" width="96" height="60" alt="alphaLogo"/></center>
                        <center>Alpha Team &copy; 2016. Todos los derechos reservados.</center>
                    </div>
                </footer>
            </main>

        </div>


        <!-- jQuery -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- FastClick 
        <script src="../vendors/fastclick/lib/fastclick.js"></script>-->
        <!-- NProgress -->
        <script src="js/nprogress.js" type="text/javascript"></script>
        <!-- Custom Theme Scripts -->
        <script src="js/custom.js" type="text/javascript"></script>
        <script>
                            $(document).ready(function () {
                                loadFrame();
                            });
                            function loadFrame(url) {
                                if (url.toString().indexOf("login") !== -1) {
                                    document.location = url;
                                }
                            }
        </script>
    </body>
</html>

<%
    } else {
        response.sendRedirect("login");
    }
%>