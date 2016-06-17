<%-- 
    Document   : RegistroNewMin
    Created on : 03/06/2016, 04:33:46 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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

            <title>Registro de ministerio</title>
        </head>
        <body>
            <div style="width: 80%;margin: auto;padding: 5%;box-sizing: border-box;">
                <form method="post" action="min">
                    <center><h2>Nuevo Ministerio</h2></center><br/><br/>
                    <input type="hidden" name="opc" value="1">
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
                    <input id="i_min" name="n_min" type="text" class="validate">
                    <label for="i_min" style="margin-top: 1%">Nombre del Ministerio</label>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea name="n_des" id="ides" class="materialize-textarea" length="250"></textarea>
                        <label for="ides">Descripción</label>
                    </div>
                </div>
                <br/>    
                <button class="btn waves-effect waves-light" type="submit" name="action" style="float: right">Registrar
                    <i class="material-icons right">send</i>
                </button>
            </form>
        </div>
    </body>
</html>
