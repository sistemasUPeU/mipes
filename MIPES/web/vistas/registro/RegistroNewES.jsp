<%-- 
    Document   : RegistroNewES
    Created on : 22/05/2016, 12:22:03 PM
    Author     : USER
--%>

<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no ,initial-scale=1.0 , maximun-scale=1.0, minimun-scale=1.0">
        <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../../js/md5.js" type="text/javascript"></script>
        <script src="../../js/materialize.js" type="text/javascript"></script>
        <script src="../../js/materialize.min.js" type="text/javascript"></script>
        <link href="../../css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/materialize.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script>
            $(document).ready(function () {
                $('select').material_select();

            });
        </script>
    </head>
    <body>
        <div style="width: 75%; margin: auto">
        <form method="post" id="data"> 
                <div class="input-field col s12" >
                    <select name="n_distrito" id="distrito">
                        <option value="" disabled selected>Elegir Distrito</option>
                        <%
                             ResultSet rs = DistritomDAO.listaDistritos("SELECT * FROM distritom order by NOMBRE");
                            while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("idDISTRITOM")%>"><%= rs.getString("NOMBRE")%></option>
                        <%
                            }
                        %>
                    </select>
                    <label>Distrito</label>
                </div>
                <div class="input-field col s6">
                    <input id="n_gp" type="text" class="validate">
                    <label for="n_gp" style="margin-top: 1%">Nombre de la Escuela Sabática</label>
                </div>
                <a class="modal-trigger waves-effect waves-light btn" href="#modal1">Información</a>
                <div id="modal1" class="modal modal-fixed-footer">
                    <div class="modal-content">
                        <h4>Escuela Sabática</h4>
                        <p>Los grupos pequeños (GP) están compuestos por varias personas que se reúnen una vez a la semana con el propósito de estudiar la Biblia. La IASD toma este modelo de la experiencia de los primeros cristianos. Las reuniones son conducidas por un líder, quien dirige el estudio bíblico, apoyado también por una serie de materiales editados por la IASD. Los objetivos de los GP son: a) incentivar a las personas a experimentar el sentido de comunidad creado por Dios; b) vivir la experiencia de evangelizar; c) descubrir y desarrollar los dones espirituales de cada miembro del GP; d) fortalecer a cada miembro de iglesia para disminuir el abandono de la fe, o apostasía; e) promover la multiplicación del grupo con nuevos amigos y futuros miembros de la iglesia.
                            <br/>La celebración de la Semana Santa en pequeños grupos es una estrategia apropiada, porque permite fortalecer las relaciones interpersonales basadas en la hermandad y la fe, fomenta el desarrollo de los dones espirituales, favorece lazos de amistad entre los participantes por medio del intercambio de ideas y experiencias, desvanece el clima de formalidad y propicia la toma de decisiones más consistentes.</p>
                    </div>
                    <div class="modal-footer">
                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Listo</a>
                    </div>
                </div>

                <button class="btn waves-effect waves-light" type="submit" name="action">Registrar
                    <i class="material-icons right">send</i>
                </button>
                
             
            </form>
        
        <script>
            $(document).ready(function () {
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal();
            });

        </script>
        </div>
        
    </body>
</html>
