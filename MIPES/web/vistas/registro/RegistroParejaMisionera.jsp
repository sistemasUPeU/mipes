<%-- 
    Document   : RegistroParejaMisionera
    Created on : 20/05/2016, 11:07:24 PM
    Author     : Andrew
--%>

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

        <div class="row ">  
            <form class="col s10 offset-s1">    
                <h1 style="text-align: center; color: #26A69A">Registro Pareja Misionera</h1>
                <div class="row">
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="icon_prefix" type="text" class="validate">
                        <label for="icon_prefix">Persona 1</label>
                    </div>

                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="icon_prefix" type="text" class="validate">
                        <label for="icon_prefix">Persona2</label>
                    </div>

                    <div class="input-field col s12 m6">
                        <select>
                            <option value="" disabled selected>Seleccione Cargo</option>
                            <option value="1">Option 1</option>
                            <option value="2">Option 2</option>
                            <option value="3">Option 3</option>
                        </select>
                        <label>Seleccione Cargo</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <select>
                            <option value="" disabled selected>Seleccione Ministerio</option>
                            <option value="1">JASS</option>
                            <option value="2">SOS</option>
                            <option value="3">Ayuda Urbana</option>
                            <option value="4">Tomas</option>
                            <option value="5">Los Milagros Existen</option>
                            <option value="6">Ministerio de Ingles</option>
                            <option value="7">Ministerio de Quechua</option>
                            <option value="8">Ministerio de Música</option>
                            <option value="9">Ministerio de Cibernética</option>
                            <option value="10">Ministerio de Manos Ayudadoras</option>
                            <option value="11">Ministerio Los Pequeñitos de Jesús</option>
                            <option value="12">Narices de Esperanza</option>
                        </select>
                        <label>Seleccione Ministerio</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <select>
                            <option value="" disabled selected>Seleccione G.P</option>
                            <option value="1">Option 1</option>
                            <option value="2">Option 2</option>
                            <option value="3">Option 3</option>
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
