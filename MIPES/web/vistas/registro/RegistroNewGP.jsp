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
                $("#i_opc").val("1");
                $.post("ComboDistrito.jsp", $("#data").serialize(), function (data) {
                    $("#escuela").html(data);
                });
            }
        </script>


    </head>
    <body>

        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page" ></jsp:useBean>
            <div style="width:85%;margin: auto;padding: 5% 2%;box-sizing: border-box">
                <h2 style="margin: auto; color: #00bfa5">Nuevo Grupo Pequeño</h2>

                <form method="post" id="data" style="margin-top: 5%"> 
                    <div class="input-field col s12"  style="margin-top: 5%">
                        
                    <%ResultSet rs = di.listar_Distritos();%>
                    <select name="n_distrito" id="distrito" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <% while (rs.next()) {%>
                        <option value="<%= rs.getString("idDISTRITOM")%>"><%= rs.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                    <label>Distrito</label>
                </div>
                    
                <div class="input-field col s12" style="margin-top: 5%">

                    <select name="n_escuela" id="escuela" >
                        <option value="" disabled selected >Elegir Escuela Sabática</option>

                    </select>
                    <label>Escuela Sabática</label>
                </div>
                <div class="input-field col s6" style="margin-top: 5%">
                    <input id="n_gp" type="text" class="validate">
                    <input type="hidden" name="f_opc" id="i_opc" value="1">
                    <label for="n_gp" style="margin-top: 1%">Nombre del Grupo Pequeño</label>
                </div>
                

                <button class="btn waves-effect waves-light" type="submit" name="action">Registrar
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
