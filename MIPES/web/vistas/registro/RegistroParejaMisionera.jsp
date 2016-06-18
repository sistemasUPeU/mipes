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
                alert("Disescsss 1");
                $.post("ComboDistrito.jsp", $("#distrito"), function (data) {
                    alert("Disesc 1");
                    $("#iescuela").html(data);
                });
            }
        </script>
        <script type="text/javascript">
            function getSelectValue() {
                var texto;
                texto = "El numero de opciones del select: " + document.formul.n_grupo.length;
                var indice = document.formul.n_grupo.selectedIndex;
                texto += "nIndice de la opcion escogida: " + indice;
                var valor = document.formul.n_grupo.options[indice].value;
                texto += "nValor de la opcion escogida: " + valor;
                var textoEscogido = document.formul.n_grupo.options[indice].text;
                texto += "nTexto de la opcion escogida: " + textoEscogido;
                alert(texto);
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
                <form name="fomul" class="col s10 offset-s1">

                    <!--------------DISTRITO PERSONA 1---------------->
                    <div id="d_distrito" class="input-field col s12 m6">
                    <%ResultSet rsdis1 = dist.listar_Distritos("SELECT * FROM distritom order by NOMBRE");%>
                    <select name="n_distrito" id="distrito" onchange=" disesc()">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <% while (rsdis1.next()) {%>
                        <option value="<%= rsdis1.getString("idDISTRITOM")%>"><%= rsdis1.getString("NOMBRE")%></option>
                        <% }%>
                    </select>
                    <label>Distrito</label>
                </div>
                     <!--------------DISTRITO PERSONA 2---------------->
                    <div class="input-field col s12 m6">
                    <select>
                        <option value="" disabled selected>Elegir Distrito</option>
                    </select>
                    <label>Distrito</label>
                </div>
                <!-------------------------ESCUELA PERSONA 1----------------------------------->
                <div id="iescuela" class="input-field col s12 m6">
                    <select name="n_escuela" id="escuela" >
                        <option value="" disabled selected >Elegir Escuela Sabática</option>
                    </select>
                    <label>Escuela Sabática</label>
                </div>
                <!----------------------------ESCUELA PERSONA 2-------------------------------->
                <div  class="input-field col s12 m6">
                    <select >
                        <option value="" disabled selected >Elegir Escuela Sabática</option>
                    </select>
                    <label>Escuela Sabática</label>
                </div>
                <!----------------------------GRUPO PERSONA 1--------------------------------->
                <div id="grupo" class="input-field col s12 m6" >
                    <select name="n_grupo" id="grupo" onchange="getSelectValue()" >
                        <option value="" disabled selected>Elegir Grupo Pequeño</option>
                        <option value="10">Muy bien
                    </select>
                    <label>Seleccione Grupo Pequeño</label>
                </div>
                 <!------------------------GRUPO PERSONA 2------------------------------->
                <div  class="input-field col s12 m6" >
                    <select  >
                        <option value="" disabled selected>Elegir Grupo Pequeño</option>
                    </select>
                    <label>Seleccione Grupo Pequeño</label>
                </div>
                <div class="input-field col s12 m6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="persona1" type="text" class="validate">
                    <label for="persona1">Persona 1</label>
                </div>
                
                
               
                
               





                <div class="input-field col s12 m6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="persona2" type="text" class="validate">
                    <label for="persona2">Persona 2</label>
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
