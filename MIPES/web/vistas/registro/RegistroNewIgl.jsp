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
                <form method="post" action="esc" id="data" onsubmit="validar()">
                    <input type="hidden" name="opc" value="1">
                    <center><h2 style="color:#00bfa5">Nueva Iglesia</h2></center>
                    <br/><br/>
                    <div class="input-field col s12">
                        <select name="n_distrito" id="distrito">
                            <option  disabled selected>Elegir Distrito</option>
                        <%
                            ResultSet rs = di.listar_Distritos("SELECT * FROM distritom order by NOMBRE");
                            while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("idDISTRITOM")%>"><%= rs.getString("NOMBRE")%></option>
                        <%
                            }
                        %>
                    </select>
                    <label id="dis">Distrito</label>
                </div>
                <div class="input-field col s6">
                    <input  type="text" class="validate" onkeyup="validar(this.value, this.id)">
                    <label >Nombre de la Iglesia</label>
                </div>                
                <br/><br/>
                <button id="boton" class="btn waves-effect waves-light" type="button" onclick="ver()" name="action" style="float: right">Registrar
                    <i class="material-icons right">send</i>
                </button>
            </form>


            <script>
                function validar(texto, id) {
                    if (/^([a-zA-Z])*$/.test(texto)) {
                        $('#' + id + '').attr("class", "validate");
                        $('#boton').attr("type", "submit");
                    } else {
                        $('#' + id + '').attr("class", "invalid");
                        $('#boton').attr("type", "button");
                    }
                }
            </script>
            <script>
                function ver() {
                    dis = $('#distrito').val();
                    esc = $("#i_es").val();
                    if (dis == null || esc == "") {

                        $('#boton').attr("type", "button");
                        swal("¡Error!", "Debe completar todos los campos", "error");

                        if (dis == null) {
                            $("#dis").css("color", "red");
                        } else {
                            $("#dis").css("color", "#616161");
                        }
                        if (esc == "") {
                            $("#i_es").attr("class", "invalid");
                        }
                    } else {
                        $("#dis").css("color", "#616161");
                    }
                }
            </script>
        </div>
    </body>
</html>
