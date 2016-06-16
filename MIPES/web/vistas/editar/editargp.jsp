<%-- 
    Document   : editargp
    Created on : 13/06/2016, 10:23:34 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/md5.js" type="text/javascript"></script>
        <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../../js/materialize.js" type="text/javascript"></script>
        <script src="../../js/materialize.min.js" type="text/javascript"></script>
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <form method="post" action="../../gp">
            <input name="opc" value="2" type="hidden" >
        <div style="width: 50%;margin: auto;">
            <center><h3>Editar Grupo Pequeño</h3></center><br/><br/>
            <div class="input-field col s6">
                <input id="inom" type="text" class="validate" placeholder="Nombre">
                <label for="inom">Nombre del G.P.</label>
            </div>
            <label for="ifec">Fecha de Creación</label>
            <input type="date" id="ifec">
            

            <button style="float: right;" class="btn waves-effect waves-light" type="submit" name="action">Guardar Cambios</button>            


        </div>

        </form>
    </body>
</html>
