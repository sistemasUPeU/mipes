<%-- 
    Document   : RegistroParejaMisionera
    Created on : 20/05/2016, 11:07:24 PM
    Author     : Andrew
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="com.upeu.mipes.dao.PersonaDAO" id="per" scope="page" ></jsp:useBean>
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
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="dist2" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.MinisterioDAO" id="mi" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.GrupoDAO" id="gp" scope="page" ></jsp:useBean>
        <jsp:useBean class="com.upeu.mipes.dao.CargoDAO" id="cg" scope="page" ></jsp:useBean>
        <%String esc = request.getParameter("n_escuela"); %>
            <div class="row">   
                <h1 style="text-align:center; color: #26A69A">Registro Pareja Misionera</h1>
                <form class="col s10 offset-s1">
                    <h3 style="color: #26A69A">Persona 1</h3>
                    <!--------------DISTRITO PERSONA 1---------------->
                    <div id="d_distrito" class="input-field col s12 m12">
                    <%ResultSet rsdis1 = dist.listar_Distritos("SELECT * FROM distritom order by NOMBRE");%>
                    <select name="n_distrito" id="distrito" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <% while (rsdis1.next()) {
                        %>
                        <option value="<%= rsdis1.getString("idDISTRITOM")%>"><%= rsdis1.getString("NOMBRE")%></option>
                        <%
                            }
                        %>
                    </select>
                    <label>Distrito</label>
                </div>
                <!-------------------------ESCUELA PERSONA 1----------------------------------->
                <div id="iescuela" class="input-field col s12 m12">
                    <select name="n_escuela" id="escuela" >
                        <option value="" disabled selected >Elegir Escuela Sabática</option>
                        
                    </select>
                    <label>Escuela Sabática</label>
                </div>
                <!----------------------------GRUPO PERSONA 1--------------------------------->
                <div id="grupo" class="input-field col s12 m12" >
                    <%ResultSet rsgp = dist.listar_Distritos("SELECT * FROM grupo where idescuela =" + esc + " and estado =1 order by nombre");%>
                    <select name="n_grupo" id="igrupo"  >
                        <option value="" disabled selected>Elegir Grupo Pequeño</option>
                        <% 
                            while (rsgp .next()) {
                        %>
                        <option value="<%= rsgp.getString("idGRUPO")%>"><%= rsgp .getString("NOMBRE")%></option>
                        <%
                            }
                        %>
                    </select>
                    <label>Seleccione Grupo Pequeño</label>
                </div>
                <div class="input-field col s12 m12">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="persona1" type="text" class="validate">
                    <label for="persona1">Persona 1</label>
                </div>
                <!------TABLA PERSONA 1-------->
                <table class="striped centered responsive-table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Teléfono</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String dis = request.getParameter("n_distrito");
                            String sql = "SELECT * FROM persona WHERE idPERSONA = " + dis + " ORDER BY NOMBRES";
                            ResultSet rs = per.listarPersonas(sql);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("NOMBRES")%></td>
                            <td><%= rs.getString("APELLIDOS")%></td>
                            <td><%= rs.getString("TELEFONO")%></td>
                            <td>
                                <a href="dis?opc=2" class="btn btn-success">Editar</a>
                            </td>
                            <td>
                                <a href="dis?opc=4" class="btn btn-danger">Eliminar</a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <h3 style="color: #26A69A">Persona 2</h3>
                <!--------------DISTRITO PERSONA 2---------------->

                <div id="d_distrito2" class="input-field col s12 m12">
                    <%ResultSet rsdis2 = dist2.listar_Distritos("SELECT * FROM distritom order by NOMBRE");%>   
                    <select name="n_distrito2" id="distrito2" onchange="disesc()">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <% while (rsdis2.next()) {
                        %>
                        <option value="<%= rsdis2.getString("idDISTRITOM")%>"><%= rsdis2.getString("NOMBRE")%></option>
                        <%
                            }
                        %>
                    </select>
                    <label>Distrito</label> 
                </div>
                <!----------------------------ESCUELA PERSONA 2-------------------------------->
                <div  id="iescuela2" class="input-field col s12 m12">
                    <select name="n_escuela2" id="escuela2">
                        <option value="" disabled selected >Elegir Escuela Sabática</option>
                    </select>
                    <label>Escuela Sabática</label>
                </div>
                <!------------------------GRUPO PERSONA 2------------------------------->
                <div id="grupo2" class="input-field col s12 m12" >
                    <select  name="n_grupo2" id="igrupo2">
                        <option value="" disabled selected>Elegir Grupo Pequeño</option>
                    </select>
                    <label>Seleccione Grupo Pequeño</label>
                </div>

                <div class="input-field col s12 m12">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="persona2" type="text" class="validate">
                    <label for="persona2">Persona 2</label>
                </div>
                <!------TABLA PERSONA 2-------->
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
