<%-- 
    Document   : inicio
    Created on : 09/06/2016, 05:37:45 PM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
        <title>JSP Page</title>
        </head>
     <body>
      <div class="slider fullscreen">
  <ul class="slides">
    <li>
        <img src="images/slider/slide3.jpg"> <!-- random image -->
      <div class="caption center-align">
        <h3>Compartiendo Esperanza</h3>
        <h5 class="light grey-text text-lighten-3">Entregando Volantes.</h5>
      </div>
    </li>
    <li>
      <img src="images/slider/slide2.jpg"> <!-- random image -->
      <div class="caption left-align">
        <h3>Manitos de Esperanza</h3>
        <h5 class="light grey-text text-lighten-3">Llevando sonrisas a los niños.</h5>
      </div>
    </li>
    <li>
        <img src="images/slider/slide1.jpg"> <!-- random image -->
      <div class="caption right-align">
        <h3>Haciendo Proyección Social</h3>
        <h5 class="light grey-text text-lighten-3">Limpiando Basura :D</h5>
      </div>
    </li>
    <li>
        <img src="images/slider/slide4.jpg"> <!-- random image -->
      <div class="caption right-align">
        <h3>La Familia MIPES</h3>
        <h5 class="light grey-text text-lighten-3">:)</h5>
      </div>
    </li>
  </ul>
</div>

        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>

        <!--Materializecss Slider-->
        <script>
            $(document).ready(function () {
                $('.slider').slider({full_width: true});
            });
        </script>         
    </body>
</html>
