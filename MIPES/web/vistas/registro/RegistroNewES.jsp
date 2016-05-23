<%-- 
    Document   : RegistroNewES
    Created on : 22/05/2016, 12:22:03 PM
    Author     : USER
--%>

<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no ,initial-scale=1.0 , maximun-scale=1.0, minimun-scale=1.0">
        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../../js/md5.js" type="text/javascript"></script>
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
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page"></jsp:useBean>
    </head>
    <body>
        <div style="width: 75%; margin: auto">
        <form method="post" id="data">
            <h2>Nueva Escuela Sabática</h2>
                <div class="input-field col s12" >
                    <select name="n_distrito" id="distrito">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <%
                             ResultSet rs = di.listar_Distritos();
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
                    <input id="n_gp" type="text" class="validate">
                    <label for="n_gp" style="margin-top: 1%">Nombre de la Escuela Sabática</label>
                </div>
                

                <button class="btn waves-effect waves-light" type="submit" name="action">Registrar
                    <i class="material-icons right">send</i>
                </button>
                
             
            </form>
        
        <script>
            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });

        </script>
        </div>
        
    </body>
</html>
