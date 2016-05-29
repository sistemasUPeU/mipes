<%-- 
    Document   : RegistroIntegrante
    Created on : 20/05/2016, 07:10:48 PM
    Author     : Andrew
--%>

<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
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
    </head>
    <body>
        <jsp:useBean class="com.upeu.mipes.dao.MinisterioDAO" id="mi" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.GrupoDAO" id="gp" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.CargoDAO" id="cg" scope="page" ></jsp:useBean>
            <div class="row ">  
                <form class="col s10 offset-s1"  role="form" method="post" action="../../IntCnt"> 
                    <input type="hidden" name="op" value="1" />
                    <h1 style="text-align: center; color: #26A69A">Registro Integrante</h1>
                    <div class="row">
                        <div class="input-field col s12 m6">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="icon_prefix" name="nombre" type="text" class="validate">
                            <label for="icon_prefix">Nombres</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="icon_prefix" name="apellido" type="text" class="validate">
                            <label for="icon_prefix">Apellidos</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <i class="material-icons prefix">store</i>
                            <input id="icon_prefix" name="direccion" type="text" class="validate">
                            <label for="icon_prefix">Dirección</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <i class="material-icons prefix">email</i>
                            <input id="icon_prefix" name="email" type="email" class="validate">
                            <label for="icon_prefix">Email</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <i class="material-icons prefix">phone</i>
                            <input id="icon_telephone" name="telefono" type="number" class="validate">
                            <label for="icon_telephone">Teléfono</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <i class="material-icons prefix">android</i>
                            <input name="nacimiento" type="date"  class="datepicker">
                            <label for="nacimiento">Fecha de Nacimiento</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <i class="material-icons prefix">android</i>
                            <input name="bautizo" type="date" class="datepicker">
                            <label for="bautizo">Fecha de Bautizo</label>
                        </div>
                    </div>
                    <div class="input-field col s12 m6">
                    <%ResultSet rs = cg.listar_Cargo();%>
                    <select name="n_cargo" id="cargo" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Cargo</option>
                        <% while (rs.next()) {%>
                        <option value="<%= rs.getString("idCARGO")%>"><%= rs.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                    <label>Seleccione Cargo</label>
                </div>
                <div class="input-field col s12 m6">
                    <%ResultSet rsm = mi.listar_Ministerios();%>
                    <select name="n_ministerio" id="ministerio" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <% while (rsm.next()) {%>
                        <option value="<%= rsm.getString("idMINISTERIO")%>"><%= rsm.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                    <label>Seleccione Ministerio</label>
                </div>
                <div class="input-field col s12 m6">
                    <%ResultSet rsp = gp.listar_grupos();%>
                    <select name="n_grupo" id="grupo" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Grupo Pequeño</option>
                        <% while (rsp.next()) {%>
                        <option value="<%= rsp.getString("idGRUPO")%>"><%= rsp.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                    <label>Seleccione Grupo Pequeño</label>
                </div>
                <div class="col s12 m6"></div>
                <button class="btn waves-effect waves-light" type="submit" name="action">Registrar
                    <i class="material-icons right">send</i>
                </button>
                
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
