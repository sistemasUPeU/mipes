<%-- 
    Document   : RegistroNewES
    Created on : 22/05/2016, 12:22:03 PM
    Author     : USER
--%>

<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
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
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page"></jsp:useBean>
        </head>
        <body>
            <div style="width: 65%; margin: auto">
                <form method="post" action="esc" id="data">
                    <input type="hidden" name="opc" value="1">
                    <center><h2 style="color:#00bfa5">Nueva Escuela Sabática</h2></center>
                    <br/><br/>
                    <div class="input-field col s12" >
                        <select name="n_distrito" id="distrito">
                            <option value="" disabled selected>Elegir Distrito</option>
                        <%
                            ResultSet rs = di.listar_Distritos("SELECT * FROM distritom order by NOMBRE");
                            while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("idDISTRITOM")%>"><%= rs.getString("NOMBRE")%></option>
                        <%
                            }
                        %>
                    </select>
                    <label>Distrito</label>
                </div>
                <div class="input-field col s6">
                    <input id="i_es" name="n_es" type="text" class="validate">
                    <label for="i_es" style="margin-top: 1%">Nombre de la Escuela Sabática</label>
                </div>
                <!--<div >
                    <label for="ifecha" >Fecha de Creación</label>
                    <input name="fecha" id="ifecha" type="date">

                </div>
                <div class="input-field col s6">
                    <input id="icolor" name="color" type="text" class="validate">
                    <label for="icolor"  style="margin-top: 1%">Color Distintivo</label>
                </div>
                <div class="input-field col s6">
                    <input id="ilema" name="lema" type="text" class="validate">
                    <label for="ilema" style="margin-top: 1%">Lema de la Escuela Sabática</label>
                </div>-->
                <br/><br/>
                <button class="btn waves-effect waves-light" type="submit" name="action" style="float: right">Registrar
                    <i class="material-icons right">send</i>
                </button>
            </form>


            <script>
                $(document).ready(function () {
                    $('select').material_select();
                });
            </script>
        </div>

    </body>
</html>
