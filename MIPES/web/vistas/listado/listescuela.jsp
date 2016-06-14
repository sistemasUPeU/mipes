<jsp:useBean class="com.upeu.mipes.dao.EscuelaDAO" id="es" scope="page" ></jsp:useBean>
    <link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/animate.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/custom.css" rel="stylesheet">
    <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../css/icheck/flat/green.css" rel="stylesheet">
    <link href="../../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="../../js/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="../../js/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../js/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../js/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../../js/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery.min.js"></script>

    <script src="../../js/bootstrap.min.js"></script>

    <!-- bootstrap progress js -->
    <script src="../../js/progressbar/bootstrap-progressbar.min.js"></script>
    <!-- icheck -->
    <script src="../../js/icheck/icheck.min.js"></script>

    <script src="../../js/custom.js"></script>

    <script src="../../js/datatables/jquery.dataTables.min.js"></script>
    <script src="../../js/datatables/dataTables.bootstrap.js"></script>
    <script src="../../js/datatables/dataTables.buttons.min.js"></script>
    <script src="../../js/datatables/buttons.bootstrap.min.js"></script>
    <script src="../../js/datatables/jszip.min.js"></script>
    <script src="../../js/datatables/pdfmake.min.js"></script>
    <script src="../../js/datatables/vfs_fonts.js"></script>
    <script src="../../js/datatables/buttons.html5.min.js"></script>
    <script src="../../js/datatables/buttons.print.min.js"></script>
    <script src="../../js/datatables/dataTables.fixedHeader.min.js"></script>
    <script src="../../js/datatables/dataTables.keyTable.min.js"></script>
    <script src="../../js/datatables/dataTables.responsive.min.js"></script>
    <script src="../../js/datatables/responsive.bootstrap.min.js"></script>
    <script src="../../js/datatables/dataTables.scroller.min.js"></script>


    <!-- pace -->
    <script src="../../js/pace/pace.min.js"></script>
<%@page import="java.sql.ResultSet"%>

<%String dis = request.getParameter("n_distrito"); %>
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
                        <th>Nombre</th>
                        <th>Fecha de Creación</th>
                        <th>Color Distintivo</th>
                        <th>Lema</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="itbody">
                    <% String sql = "SELECT * FROM escuela where iddistritom =" + dis + " and estado =1 order by nombre";
                        ResultSet rs = es.listar_escuelas(sql);
                        while (rs.next()) {%>
                    <tr>
                        <td><%= rs.getString("NOMBRE")%></td>
                        <td><%= rs.getString("FECHA_CREACION")%></td>
                        <td><%= rs.getString("COLOR")%></td>
                        <td><%= rs.getString("LEMA")%></td>
                        <td>
                            <a href="dis?opc=2" class="btn btn-success">Editar</a>
                        </td>
                        <td>
                            <a href="dis?opc=3" class="btn btn-warning">Desactivar</a>
                        </td>
                        <td>
                            <a href="dis?opc=4" class="btn btn-danger">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
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
            ajax: "../../js/datatables/json/scroller-demo.json",
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