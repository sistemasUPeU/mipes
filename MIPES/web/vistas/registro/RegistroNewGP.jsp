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
                    $.post("vistas/registro/ComboDistrito.jsp", $("#distrito"), function (data) {
                        $("#iescuela").html(data);
                    });
                }
            </script>

        </head>
        <body style="width: 100%;padding: 5% 2%;box-sizing: border-box;background:#F7F7F7; ">
        <jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="di" scope="page" ></jsp:useBean>
            <div style="width:75%;margin: auto;">
                <center><h2 style="margin: auto; color:#009688">Grupo Pequeño</h2></center>
                <br/>
                <form method="post" action="gp">
                    <h5 id="gp_dg">Datos Generales</h5>
                    <input type="hidden" name="opc" value="1">
                    <div class="row">
                        <div id="d_distrito" class="input-field col s12 m6">
                        <%ResultSet rs = di.listar_Distritos("SELECT * FROM distritom order by NOMBRE");%>
                        <select name="n_distrito" id="distrito" onchange=" disesc()">
                            <option value="" disabled selected>Elegir Distrito</option>
                            <% while (rs.next()) {%>
                            <option value="<%= rs.getString("idDISTRITOM")%>"><%= rs.getString("NOMBRE")%></option>
                            <% }%>
                        </select>
                    </div>
                    <div id="iescuela" class="input-field col s12 m6">
                        <select name="n_escuela" id="escuela">
                            <option value="" disabled selected >Elegir Escuela Sabática</option>
                        </select>
                    </div>



                    <div class="input-field col s12 m6">
                        <input id="igp" name="n_grupo" type="text" class="validate" onkeyup="validar(this.value, this.id)">
                        <label for="igp">Nombre del Grupo Pequeño</label>
                    </div>
                    <label for="ifecha" >Fecha de Creación</label>
                    <div class="input-field col s12 m6">
                        <input name="fecha" id="ifecha" type="date" class="validate" max="2090-01-01" onkeyup="val_fh(this.value,this.id)" >
                    </div>
                    <div class="input-field col s12 m6">
                        <input placeholder="Color(es) distintivo del Grupo" id="icolor" name="n_color" type="text" class="validate" onkeyup="validar(this.value, this.id)">
                        <label for="icolor">Color representativo</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <input placeholder="Escriba el nombre del canto" name="n_canto" id="icanto" type="text" class="validate" onkeyup="val_fh(this.value,this.id)">
                        <label for="icanto">Canto</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <input placeholder="Escriba el lema representativo" id="ilema" name="n_lema" type="text" class="validate" onkeyup="val_fh(this.value,this.id)">
                        <label for="ilema">Lema</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <input placeholder="Escriba el versículo distintivo. Ej. Mateo 2:11" id="iver" name="n_ver" type="text" class="validate" onkeyup="val_fh(this.value,this.id)">
                        <label for="iver">Versículo</label>
                    </div>
                </div>
                <br/>
                <h5 id="gp_dr">Datos oficiales de reunión</h5>
                <div class="row">
                    <div class="input-field col s12 m6">
                        <input id="ilreu" name="n_lugar" type="text" class="validate" onkeyup="val_fh(this.value, this.id)">
                        <label for="ilreu">Lugar de Reunión</label>
                    </div>
                    <label for="ihora">Hora de Reunión</label>
                    <div class="input-field col s12 m6">
                        <input id="ihora" type="time"  name="n_hora" class="validate" onchange="val_fh(this.value,this.id)">                    
                    </div>
                    <div class="input-field col s12 m6" >
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

                </div>
                <br/><br/>
                <button onclick="validacion()" id="boton" class="btn waves-effect waves-light" type="button" name="action" style="float:right;">Registrar
                    <i class="material-icons right">send</i>
                </button>
            </form>
        </div>
        <script>
            $(document).ready(function () {
                $('.modal-trigger').leanModal();
            });
        </script>
        <script>
            function validar(texto, id) {
                //(/^([0-9]*$/.test(texto)) 

                if (/^([a-zA-Z])*$/.test(texto)) {
                    $('#' + id + '').attr("class", "validate");
                    //$('#boton').attr("type", "submit");
                } else {
                    $('#' + id + '').attr("class", "invalid");
                    $('#boton').attr("type", "button");
                }

            }
        </script>
        <script>
            function val_fh(texto, id) {
                if (texto == "") {
                    $('#' + id + '').attr("class", "invalid");
                }else{
                    $('#' + id + '').attr("class", "valid");
                }
            }
        </script>
        <script>
            function validacion() {
                dis = $('#distrito').val();
                esc = $("#escuela").val();
                dia = $("#idia").val();
                can = $("#icanto").val();
                lem = $("#ilema").val();
                ver = $("#iver").val();
                reu = $("#ilreu").val();
                hor = $("#ihora").val();
                fec = $("#ifecha").val();
                col = $("#icolor").val();
                igp = $("#igp").val();

                if (dis == null || esc == null || igp == "" || can == "" || dia == null || lem == "" || ver == "" || reu == "" || fec == "" || hor == "" || col == "") {

                    $('#boton').attr("type", "button");
                    swal("¡Error!", "Debe completar todos los campos para poder registrar", "error");

                    if (dis == null || esc == null || can == "" || lem == "" || ver == "" || fec == "") {
                        $("#gp_dg").css("color", "red");
                        if (fec == "") {
                            $('#ifecha').attr("class", "invalid");
                        } else {
                            $('#ifecha').attr("class", "valid");
                        }
                        if (can == "") {
                            $('#icanto').attr("class", "invalid");
                        }
                        if (lem == "") {
                            $('#ilema').attr("class", "invalid");
                        }
                        if (ver == "") {
                            $('#iver').attr("class", "invalid");
                        }
                        if (col == "") {
                            $('#icolor').attr("class", "invalid");
                        }
                        if (igp == "") {
                            $('#igp').attr("class", "invalid");
                        }
                    } else {
                        $("#gp_dg").css("color", "black");
                    }
                    if (dia == null || reu == "" || hor == "") {
                        $("#gp_dr").css("color", "red");
                        if (hor == "") {
                            $('#ihora').attr("class", "invalid");
                        } else {
                            $('#ihora').attr("class", "valid");
                        }
                        if (reu == "") {
                            $('#ilreu').attr("class", "invalid");
                        }
                    } else {
                        $("#gp_dr").css("color", "black");
                        $('#ihora').attr("class", "valid");
                    }
                } else {
                    $('#boton').attr("type", "submit");
                    $("#gp_dg").css("color", "black");
                    $("#gp_dr").css("color", "black");
                }
            }
        </script>

    </body>
</html>
