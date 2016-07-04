<jsp:useBean class="com.upeu.mipes.dao.GrupoDAO" id="gp" scope="page" ></jsp:useBean>

<%@page import="java.sql.ResultSet"%>
<jsp:include page="../../jspf/imptbbootstrap.jspf"></jsp:include>
<%String esc = request.getParameter("n_escuela"); %>
<div id="listagp">
    <div class="x_panel">
        <div class="x_title">
            <h2>Grupos Pequeños</h2>                    
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
                Lista de Grupos Pequeños</p>
            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Fecha de Creación</th>
                        <th>Color</th>
                        <th>Lema</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% String sql = "SELECT * FROM grupo where idescuela =" + esc + " order by nombre";
                        ResultSet rs = gp.listar_grupos(sql);
                        while (rs.next()) {
                            String a = rs.getString("estado");
                            String estado = "";
                            String clase = "";
                            String opcion = "";
                            if (a.equals("1")) {
                                estado = "Desactivar";
                                clase = "primary";
                                opcion = "4";
                            } else {
                                estado = "Activar";
                                clase = "info";
                                opcion = "5";
                            }

                    %>
                    <tr>
                        <td><center><span><%= rs.getString("NOMBRE")%></span></center></td>
                <td><center><span><%= rs.getString("FECHA_CREACION")%></span></center></td>
                <td><center><span><%= rs.getString("COLOR")%></span></center></td>
                <td><center><span><%= rs.getString("LEMA")%></span></center></td>
                <td><center><a href="gp?opc=3&id=<%= rs.getString("idgrupo")%>" class="btn btn-success">Editar</a></center></td>
                <td><center><a onclick="confirmDes(<%=opcion%>,<%= rs.getString("idgrupo")%>)" class="btn btn-<%=clase%>" ><%=estado%></a></center></td>
                <td><center><a onclick="confirmDel(<%= rs.getString("idgrupo")%>)" class="btn btn-danger">Eliminar</a></center></td>
                </tr>
                <% }%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    function confirmDes(dir, id) {
        var estado, es, est;
        if (dir == 4) {
            estado = "desactivar";
            es = "desactivalo";
            est = "desactivado";
        } else {
            estado = "activar";
            es = "activalo";
            est = "activado";
        }
        swal({
            title: "¿Seguro que desea " + estado + " este Grupo Pequeño?",
            text: "Se realizará cambios en el estado del Grupo Pequeño",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Sí, ¡" + es + "!",
            cancelButtonText: "No, deseo cancenlar",
            closeOnConfirm: false,
            closeOnCancel: false},
        function (isConfirm) {
            if (isConfirm) {
                swal({
                    title: "¡Grupo Pequeño " + est + "!",
                    text: "El Grupo Pequeño fue " + est + " correctamente",
                    button: "success"},
                function () {
                    location.href = 'gp?opc=' + dir + '&id=' + id;
                });

            } else {
                swal("Cancelado", "El Grupo Pequeñ no fue " + est + " ", "error");
            }
        });
    }
</script>             
<script>
    function confirmDel(dir) {
        swal({
            title: "¿Seguro que desea eliminar este Grupo Pequeño?",
            text: "Se eliminará definitivamente este Grupo Pequeño",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Sí, ¡eliminalo!",
            cancelButtonText: "No, deseo cancenlar",
            closeOnConfirm: false,
            closeOnCancel: false},
        function (isConfirm) {
            if (isConfirm) {
                swal({
                    title: "¡Grupo Pequeño eliminado!",
                    text: "El Grupo Pequeño fue eliminado correctamente del sistema",
                    button: "success"},
                function () {
                    location.href = 'gp?opc=6&id=' + dir;
                });

            } else {
                swal("Eliminación cancelada", "La eliminación del Grupo Pequeño fue cancelada", "error");
            }
        });
    }
</script>
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