<%-- 
    Document   : Reg_asis
    Created on : 20/05/2016, 05:32:34 PM
    Author     : USER
--%>

<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no ,initial-scale=1.0 , maximun-scale=1.0, minimun-scale=1.0">
        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/materialize.js" type="text/javascript"></script>
        <script src="../../js/materialize.min.js" type="text/javascript"></script>
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <title>Registro de Asistencia</title>
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
        <script>
            function escgp() {
                $.post("ComboEscuela.jsp", $("#escuela"), function (data) {
                    $("#igrupo").html(data);
                });
            }
        </script>
    </head>
    <body>
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page"></jsp:useBean>
            <div class="fixed-action-btn horizontal" style="bottom: 45px; right: 24px;">
                <a class="btn-floating btn-large red">
                    <i class="large material-icons">mode_edit</i>
                </a>
                <ul>
                    <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
                    <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
                    <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
                    <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
                </ul>
            </div>
            <div style="width:60%;margin: auto;padding: 5% 2%;box-sizing: border-box" >
                <form method="post" id="data"> 
                    
                    <h2>Registro de Asistencia a GP</h2>
                    
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

                    <select name="n_escuela" id="escuela" onchange="escgp()">
                        <option value="" disabled selected >Elegir Escuela Sabática</option>

                    </select>
                    <label>Escuela Sabática</label>
                </div>
                <div id="igrupo" class="input-field col s12" style="margin-top: 2%" >
                    <select name="n_grupo" id="grupo">
                        <option value="" disabled selected>Elegir Grupo Pequeño</option>
                    </select>
                    <label>Grupo Pequeño</label>
                </div>

                <!--<div class="file-field input-field">
                    <div class="btn">
                        <span>Archivo</span>
                        <input type="file">
                    </div>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text">
                    </div>
                </div>-->
                <!--
                <label for="n_asis">Número de Asistentes</label>
                <input id="n_asis" type="number" min="0" placeholder="0"/>

                <label for="n_vis">Número de Visitas</label>
                <input id="n_vis" type="number" min="0" placeholder="0"/>
                -->



                <button class="btn waves-effect waves-light" type="submit" name="action">Enviar
                    <i class="material-icons right">send</i>
                </button>

            </form>
        </div>
    </body>
</html>
