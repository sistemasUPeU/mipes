<%-- 
    Document   : RegistroParejaMisionera
    Created on : 20/05/2016, 11:07:24 PM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <script>
            function disesc() {
                $.post("ComboDistrito.jsp", $("#distrito"), function (data) {
                    $("#iescuela").html(data);
                });
            }
        </script>

    </head>
    <body>
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="dist" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.MinisterioDAO" id="mi" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.GrupoDAO" id="gp" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.CargoDAO" id="cg" scope="page" ></jsp:useBean>

            <div class="row">   
                <h1 style="text-align: center; color: #26A69A">Registro Pareja Misionera</h1>
                <form class="col s10 offset-s1">

                    <!--------------DISTRITO PERSONA 1---------------->
                    <div id="d_distrito" class="input-field col s12 m12" style="margin-top: 2%">
                    <%ResultSet rsdis1 = dist.listar_Distritos("SELECT * FROM distritom order by NOMBRE");%>
                    <select name="n_distrito" id="distrito" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <% while (rsdis1.next()) {%>
                        <option value="<%= rsdis1.getString("idDISTRITOM")%>"><%= rsdis1.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                    <label>Distrito</label>
                </div>
                <div id="iescuela" class="input-field col s12 m12" style="margin-top: 2%">
                    <select name="n_escuela" id="escuela">
                        <option value="" disabled selected >Elegir Escuela Sabática</option>
                    </select>
                    <label>Escuela Sabática</label>
                </div>
                <div class="input-field col s12 m12" style="margin-top: 2%">
                    <select name="n_grupo" id="grupo" >
                        <option value="" disabled selected>Elegir Grupo Pequeño</option>
                        <%ResultSet rsp = gp.listar_grupos();
                            while (rsp.next()) {%>
                        <option value="<%= rsp.getString("idGRUPO")%>"><%= rsp.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                    <label>Seleccione Grupo Pequeño</label>
                </div>
                <div class="input-field col s12 m12">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="icon_prefix" type="text" class="validate">
                    <label for="icon_prefix">Persona 1</label>
                </div>


                <button class="btn waves-effect waves-light" type="submit" name="action">Registrar
                    <i class="material-icons right">send</i>
                </button>
                <!--------------------------------------->
            </form>

        </div>
        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="../../js/materialize.min.js" type="text/javascript"></script>
        <script>
                        $('.datepicker').pickadate({
                            selectMonths: true, // Creates a dropdown to control month
                            selectYears: 15 // Creates a dropdown of 15 years to control year
                        });
        </script>
        <script>
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>
    </body>
</html>
