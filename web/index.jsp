
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
        <title>MIPES</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <!-- Custom Theme Style -->
        <link href="css/custom.css" rel="stylesheet">
        <link rel="icon" href="images/ico/Home-48.png">
        <link href="css/openSansFont.css" rel="stylesheet" type="text/css"/>
        <link href="css/indexStyle.css" rel="stylesheet" type="text/css"/>
    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="inicio.jsp" target="frame" class="site_title"><i class="fa fa-home"></i> <span>MIPES | UPeU</span></a>
                        </div>
                        <div class="clearfix"></div>
                        <!-- menu prile quick info -->
                        <div class="profile">
                            <div class="profile_pic">
                                <img src="images/default.png" alt="..." class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Bienvenido(a)</span>

                                <h2><%=nombre + " " + apellido%></h2>

                            </div>
                        </div>
                        <!-- /menu prile quick info -->
                        <br />
                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>MENÚ</h3>
                                <ul class="nav side-menu">
                                    <%
                                        UsuarioDAO ud = new UsuarioDAO();
                                        ArrayList<Map<String, Object>> lista = ud.getLinks(request.getSession().getAttribute("iduser"));

                                    %>
                                    <!--PERFIL: ORDEN 1-->
                                    <%                                        ArrayList<Map<String, Object>> l1 = ud.listOrden(lista, 1);
                                        if (!l1.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-smile-o"></i>Perfil<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l1.size(); i++) {%>
                                            <li><a target="frame" href="<%=l1.get(i).get("link")%>">
                                                    <i class="<%=l1.get(i).get("icon")%>"></i>
                                                    <%=l1.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--CAMPO ORDEN 2-->
                                    <%
                                        ArrayList<Map<String, Object>> l2 = ud.listOrden(lista, 2);
                                        if (!l2.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-globe"></i>Campo<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l2.size(); i++) {%>
                                            <li><a target="frame" href="<%=l2.get(i).get("link")%>">
                                                    <i class="<%=l2.get(i).get("icon")%>"></i>
                                                    <%=l2.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--DISTRITO ORDEN 3-->
                                    <%
                                        ArrayList<Map<String, Object>> l3 = ud.listOrden(lista, 3);
                                        if (!l3.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-cubes"></i>Distrito Misionero<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l3.size(); i++) {%>
                                            <li><a target="frame" href="<%=l3.get(i).get("link")%>">
                                                    <i class="<%=l3.get(i).get("icon")%>"></i>
                                                    <%=l3.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--IGLESIA ORDEN 4-->
                                    <%
                                        ArrayList<Map<String, Object>> l4 = ud.listOrden(lista, 4);
                                        if (!l4.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-cube"></i>Iglesia<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l4.size(); i++) {%>
                                            <li><a target="frame" href="<%=l4.get(i).get("link")%>">
                                                    <i class="<%=l4.get(i).get("icon")%>"></i>
                                                    <%=l4.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--ESCUELA SABATICA ORDEN 5-->
                                    <%
                                        ArrayList<Map<String, Object>> l5 = ud.listOrden(lista, 5);
                                        if (!l5.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-university"></i>Escuela Sabática<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l5.size(); i++) {%>
                                            <li><a target="frame" href="<%=l5.get(i).get("link")%>">
                                                    <i class="<%=l5.get(i).get("icon")%>"></i>
                                                    <%=l5.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--GRUPOS PEQUEÑOS ORDEN 6-->
                                    <%
                                        ArrayList<Map<String, Object>> l6 = ud.listOrden(lista, 6);
                                        if (!l6.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-home"></i>Grupos Pequeños<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l6.size(); i++) {%>
                                            <li><a target="frame" href="<%=l6.get(i).get("link")%>">
                                                    <i class="<%=l6.get(i).get("icon")%>"></i>
                                                    <%=l6.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--MINISTERIOS ORDEN 7-->
                                    <%
                                        ArrayList<Map<String, Object>> l7 = ud.listOrden(lista, 7);
                                        if (!l7.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-group"></i>Ministerios<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l7.size(); i++) {%>
                                            <li><a target="frame" href="<%=l7.get(i).get("link")%>">
                                                    <i class="<%=l7.get(i).get("icon")%>"></i>
                                                    <%=l7.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--TRABAJO MISIONERO ORDEN 8-->
                                    <%
                                        ArrayList<Map<String, Object>> l8 = ud.listOrden(lista, 8);
                                        if (!l8.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-suitcase"></i>Trabajo Misionero<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l8.size(); i++) {%>
                                            <li><a target="frame" href="<%=l8.get(i).get("link")%>">
                                                    <i class="<%=l8.get(i).get("icon")%>"></i>
                                                    <%=l8.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--REPORTES ORDEN 9-->
                                    <%
                                        ArrayList<Map<String, Object>> l9 = ud.listOrden(lista, 9);
                                        if (!l9.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-bar-chart"></i>Reportes<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l9.size(); i++) {%>
                                            <li><a target="frame" href="<%=l9.get(i).get("link")%>">
                                                    <i class="<%=l9.get(i).get("icon")%>"></i>
                                                    <%=l9.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                    <!--USUARIO ORDEN 10-->
                                    <%
                                        ArrayList<Map<String, Object>> l10 = ud.listOrden(lista, 10);
                                        if (!l10.isEmpty()) {
                                    %>
                                    <li><a><i class="fa fa-user"></i>Usuario<span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu" style="display: none">
                                            <%for (int i = 0; i < l10.size(); i++) {%>
                                            <li><a target="frame" href="<%=l10.get(i).get("link")%>">
                                                    <i class="<%=l10.get(i).get("icon")%>"></i>
                                                    <%=l10.get(i).get("nombrelink")%></a></li>
                                                    <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- top navigation -->
                <div class="top_nav">
                    <div class="nav_menu" style="margin-bottom: 0px">
                        <nav class="" role="navigation">
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <img src="images/default.png" alt="">
                                        <%=usuario%>
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                                        <li><a href="javascript:;">Perfil</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">Ayuda</a>
                                        </li>
                                        <li><a href="login?opc=logout"><i class="fa fa-sign-out pull-right"></i> Salir</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main" style="height: 100%;margin-top: 0px;margin-bottom: 0px; padding: 0px;background: #fff">
                    <iframe name="frame" id="idframe" onload="loadFrame(this.contentWindow.location);"
                            style="height: 650px;width: 103%; border: none; overflow-y: hidden">
                    </iframe>
                </div>
                <!-- /page content -->

                <!-- footer content -->
                <footer>
                    <div class="row">
                        <div class="col col-lg-2 col-md-2 col-sm-2 hidden-xs" style="margin-top: 30px;">
                            <center><img src="images/alphaLogo.png" width="96" height="60" alt="alphaLogo"/></center>
                        </div>
                        <div class="col col-lg-10 col-md-10 col-sm-10 col-xs-12">
                            <div class="row">
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-8">
                                    <ul class="list-unstyled">
                                        <li>
                                            <label>Alpha Team Developers</label>
                                            <p>Somos un equipo de investigación de la Sociedad Científica de Estudiantes de 
                                                Ingeniería de Sistemas, de la Universidad Peruana Union.</p>
                                        </li>
                                        <li>
                                            <label>Sistema de Gestion de Grupos Pequeños y Trabajo Misionero</label>
                                            <p>CRM DIGITAL 1.0 desarrolado por Alpha Team &copy; 2016. Todos los derechos reservados.</p>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col col-lg-6 col-md-6 col-sm-6 col-xs-4">
                                    <ul class="list-unstyled">
                                        <li>
                                            <label>Contáctenos:</label>
                                            <ul class="list-unstyled list-inline">
                                                <li>
                                                    <a href="mailto:imerrosas@upeu.edu.pe" class="btn btn-dark btn-circle">
                                                        <i class="fa fa-envelope"></i>
                                                    </a>
                                                    <span class="hidden-xs">imerrosas@upeu.edu.pe</span>
                                                </li>
                                                <li>
                                                    <a href="mailto:leandroburgos@upeu.edu.pe" class="btn btn-dark btn-circle">
                                                        <i class="fa fa-envelope"></i>
                                                    </a>
                                                    <span class="hidden-xs">leandroburgos@upeu.edu.pe</span>
                                                </li>
                                                <li>
                                                    <a href="https://www.facebook.com/Soceis-931586496886002/" target="blank" class="btn btn-dark btn-circle">
                                                        <i class="fa fa-facebook"></i>
                                                    </a>
                                                    <span class="hidden-xs">SOCEIS</span>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- /footer content -->
            </div>
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
                            if (url.toString().indexOf("login")!==-1) {
                                document.location=url;
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