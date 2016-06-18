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
        <script src="js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <jsp:include page="../../jspf/impmaterialize.jspf"></jsp:include>
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
    <body style="width: 100%;padding: 5% 2%;box-sizing: border-box;background:#F7F7F7; ">
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page" ></jsp:useBean>
            <div style="width:75%;margin: auto;">
                <center><h2 style="margin: auto; color:#009688">Grupo Pequeño</h2></center>
                <br/><br/><br/>
                <form method="post" action="gp">
                    <h5>Datos Generales</h5>
                    <input type="hidden" name="opc" value="1">
                    <div id="d_distrito" class="input-field col s12">
                    <%ResultSet rs = di.listar_Distritos("SELECT * FROM distritom order by NOMBRE");%>
                    <select name="n_distrito" id="distrito" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <% while (rs.next()) {%>
                        <option value="<%= rs.getString("idDISTRITOM")%>"><%= rs.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                </div>
                <div id="iescuela" class="input-field col s12">
                    <select name="n_escuela" id="escuela">
                        <option value="" disabled selected >Elegir Escuela Sabática</option>
                    </select>
                </div>
                <div class="input-field col s6">
                    <input id="igp" name="n_grupo" type="text" class="validate">
                    <label for="igp">Nombre del Grupo Pequeño</label>
                </div>
                <div>
                    <label for="ifecha" >Fecha de Creación</label>
                    <input name="fecha" id="ifecha" type="date">
                </div>
                <div class="input-field col s6">
                    <input placeholder="Color(es) distintivo del Grupo" id="icolor" name="n_color" type="text" class="validate">
                    <label for="icolor">Color representativo</label>
                </div>
                <div class="input-field col s6">
                    <input placeholder="Escriba el nombre del canto" name="n_canto" id="icanto" type="text" class="validate">
                    <label for="icanto">Canto</label>
                </div>
                <div class="input-field col s6">
                    <input placeholder="Escriba el lema representativo" id="ilema" name="n_lema" type="text" class="validate">
                    <label for="ilema">Lema</label>
                </div>
                <div class="input-field col s6">
                    <input placeholder="Escriba el versículo distintivo. Ej. Mateo 2:11" id="iver" name="n_ver" type="text" class="validate">
                    <label for="iver">Versículo</label>
                </div>
                <br/><br/>
                <h5>Datos oficiales de reunión</h5>
                <div class="input-field col s6">
                    <input id="ilreu" name="n_lugar" type="text" class="validate">
                    <label for="ilreu">Lugar de Reunión</label>
                </div>
                <div class="input-field col s6" >
                    <select id="idia" name="n_dia">
                        <option disabled selected>Escoger un día</option>
                        <option value="1">Domingo</option>
                        <option value="2">Lunes</option>
                        <option value="3">Martes</option>
                        <option value="4">Miércoles</option>
                        <option value="5">Jueves</option>
                        <option value="6">Viernes</option>
                        <option value="7">Sábado</option>
                    </select>
                    <label for="idia">Día de Reunión</label>
                </div>
                <div>
                    <label>Hora de Reunión</label>
                    <input type="time"  name="n_hora" class="validate">                    
                </div>
                <br/><br/>
                <button class="btn waves-effect waves-light" type="submit" name="action" style="float:right;">Registrar
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
