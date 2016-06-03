<%-- 
    Document   : index
    Created on : 20/05/2016, 11:30:41 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no ,initial-scale=1.0 , maximun-scale=1.0, minimun-scale=1.0">
        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/md5.js" type="text/javascript"></script>
        <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../../js/materialize.js" type="text/javascript"></script>
        <script src="../../js/materialize.min.js" type="text/javascript"></script>
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script>
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>
        <script>
            function disesc() {
                $.post("ComboDistrito.jsp", $("#distrito"), function (data) {
                    $("#iescuela").html(data);
                });
            }
        </script>


    </head>
    <body>

        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page" ></jsp:useBean>
            <div style="width:85%;margin: auto;padding: 5% 2%;box-sizing: border-box">
                <h2 style="margin: auto; color: #00bfa5">Nuevo Grupo Pequeño</h2>

                <form method="post" action="../../gp" style="margin-top: 5%">
                    <input type="hidden" name="opc" value="1">
                    <div id="d_distrito" class="input-field col s12"  style="margin-top: 2%">
                        <i class="material-icons prefix">group_work</i>
                    <%ResultSet rs = di.listar_Distritos("SELECT * FROM distritom order by NOMBRE");%>
                    <select name="n_distrito" id="distrito" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <% while (rs.next()) {%>
                        <option value="<%= rs.getString("idDISTRITOM")%>"><%= rs.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                    <label>Distrito</label>
                </div>

                <div id="iescuela" class="input-field col s12" style="margin-top: 2%">

                    <select name="n_escuela" id="escuela">
                        <option value="" disabled selected >Elegir Escuela Sabática</option>

                    </select>
                    <label>Escuela Sabática</label>
                </div>
                <div class="input-field col s6" style="margin-top: 2%">
                    <input id="n_gp" name="n_grupo" type="text" class="validate">
                    
                    <label for="n_gp" style="margin-top: 1%">Nombre del Grupo Pequeño</label>
                </div>
                <div style="margin-top: 2%" >
                    <label for="ifecha" >Fecha de Creación</label>
                    <input name="fecha" id="ifecha" type="date">

                </div>

                <button class="btn waves-effect waves-light" type="submit" name="action" style="margin-top: 2%">Registrar
                    <i class="material-icons right">send</i>
                </button>


            </form>
        </div>




        <script>
            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });

        </script>
    </body>
</html>
