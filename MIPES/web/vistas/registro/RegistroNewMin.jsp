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
                    <label id="dis">Distrito</label>
                </div>
                <div class="input-field col s6">
                    <input id="i_min" name="n_min" type="text" class="validate" onkeyup="validar(this.value, this.id)">
                    <label for="i_min" style="margin-top: 1%">Nombre del Ministerio</label>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea name="n_des" id="ides" class="materialize-textarea" placeholder="Ingrese una pequeña descripción sobre el ministerio" length="250"></textarea>
                        <label id="i_des" for="ides">Descripción</label>
                    </div>
                </div>
                <br/>    
                <button id="boton" class="btn waves-effect waves-light" type="button" onclick="ver()" name="action" style="float: right">Registrar
                    <i class="material-icons right">send</i>
                </button>
            </form>
        </div>
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
                esc = $("#i_min").val();
                des = $("#ides").val();
                if (dis == null || esc == "" || des == "") {

                    $('#boton').attr("type", "button");
                    swal("¡Error!", "Debe completar todos los campos", "error");

                    if (dis == null) {
                        $("#dis").css("color", "red");
                    } else {
                        $("#dis").css("color", "#616161");
                    }
                    if (esc == "") {
                        $("#i_min").attr("class", "invalid");
                    }
                    if (des == "") {
                        $("#i_des").css("color", "red");
                    }else{
                        $("#i_des").css("color", "#616161");
                    }
                } else {
                    $("#dis").css("color", "#616161");
                    $('#boton').attr("type", "submit");
                }
            }
        </script>
    </body>
</html>
