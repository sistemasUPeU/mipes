<%-- 
    Document   : Reg_asis
    Created on : 20/05/2016, 05:32:34 PM
    Author     : USER
--%>

<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="../../jspf/imptbbootstrap.jspf"></jsp:include>
            <title></title>
        <jsp:useBean class="com.upeu.mipes.dao.EscuelaDAO" id="es" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="dis" scope="page" ></jsp:useBean>
            <script>
                function listesc() {
                    $.post("vistas/listado/listescuela.jsp", $("#idis"), function (data) {
                        $("#listaesc").html(data);
                    });
                }
            </script>
        </head>
        <body style="padding: 5%;box-sizing: border-box;">
            <div style="width: 95%;margin: auto;padding: 3%;box-sizing: border-box;overflow: hidden;">
                <h2>Lista de Escuelas Sabáticas por Distrito</h2>
                <br/><br/>
            <div>
                <label>Distrito</label>
                <select class="form-control" id="idis" name="n_distrito" onchange="listesc()">
                    <option class="hidden">Elegir Distrito</option>
                <% String sqld = "SELECT * FROM distritom order by nombre";
                    ResultSet rsd = dis.listar_Distritos(sqld);
                    while (rsd.next()) {%>
                <option value="<%= rsd.getString("iddistritom")%>"><%= rsd.getString("NOMBRE")%> </option>
                <% }%>
            </select>
            
        </div><br/><br/>
        <div id="listaesc">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Escuelas sabáticas</h2>                    
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" ><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">1</a>
                                </li>
                                <li><a href="#">2</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content" id="ab">
                    <p class="text-muted font-13 m-b-30">
                        Lista de Escuelas Sabáticas</p>
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th><span style="color: #999999;">Escuela Sabática</span></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="itbody">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

        <script>
            var handleDataTableButtons = function () {
                "use strict";
                0 !== $("#datatable-buttons").length && $("#datatable-buttons").DataTable({
                    dom: "Bfrtip",
                    buttons: [{
                            extend: "copy",
                            className: "btn-sm"
                        }, {
                            extend: "csv",
                            className: "btn-sm"
                        }, {
                            extend: "excel",
                            className: "btn-sm"
                        }, {
                            extend: "pdf",
                            className: "btn-sm"
                        }, {
                            extend: "print",
                            className: "btn-sm"
                        }],
                    responsive: !0
                })
            },
                    TableManageButtons = function () {
                        "use strict";
                        return {
                            init: function () {
                                handleDataTableButtons()
                            }
                        }
                    }();
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#datatable').dataTable();
                $('#datatable-keytable').DataTable({
                    keys: true
                });
                $('#datatable-responsive').DataTable();
                $('#datatable-scroller').DataTable({
                    ajax: "js/datatables/json/scroller-demo.json",
                    deferRender: true,
                    scrollY: 380,
                    scrollCollapse: true,
                    scroller: true
                });
                var table = $('#datatable-fixed-header').DataTable({
                    fixedHeader: true
                });
            });
            TableManageButtons.init();
        </script>
        </div>
    </body>
</html>
