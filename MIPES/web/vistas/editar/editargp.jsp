<%-- 
    Document   : editargp
    Created on : 13/06/2016, 10:23:34 AM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/md5.js" type="text/javascript"></script>
        <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../../js/materialize.js" type="text/javascript"></script>
        <script src="../../js/materialize.min.js" type="text/javascript"></script>
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page" ></jsp:useBean>
        <div style="width: 80%;margin: auto;">
            <form method="post" action="../../gp">
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
                <input type="date"  name="n_hora" class="validate">                    
            </div>
            <br/><br/>
            <button class="btn waves-effect waves-light" type="submit" name="action" style="float:right;">Registrar
                <i class="material-icons right">send</i>
            </button>
        </form>
        </div>
    </body>
</html>
