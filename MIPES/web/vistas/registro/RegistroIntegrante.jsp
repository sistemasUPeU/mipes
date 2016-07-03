<%-- 
    Document   : RegistroIntegrante
    Created on : 20/05/2016, 07:10:48 PM
    Author     : Andrew
--%>

<%@page import="com.upeu.mipes.dao.DistritomDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="com.upeu.mipes.dao.DistritomDAO" id="dist" scope="page" ></jsp:useBean>
<jsp:useBean class="com.upeu.mipes.dao.MinisterioDAO" id="mi" scope="page" ></jsp:useBean>
<jsp:useBean class="com.upeu.mipes.dao.GrupoDAO" id="gp" scope="page" ></jsp:useBean>
<jsp:useBean class="com.upeu.mipes.dao.CargoDAO" id="cg" scope="page" ></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MIPES | Registro de Integrantes de Grupos Peque&ncaron;os</title>
        <link href="../../css/material.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/select/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>

        <style>
            .col{
                margin-bottom: 12px;
            }
        </style>
    </head>
    <body>
    <center><h4>Registro de Integrantes de Grupos Pequeños</h4></center>
    <div class="container">
        <div class="panel panel-default conDist">
            <div class="panel-heading">
                <h5 class="panel-title">Seleccionar Grupo Pequeño</h5>
            </div>
            <div class="panel-body">
                <div class="col col-lg-4 col-md-4 col-sm-12 col-xs-12 CDistrito">
                    <select title="Seleccione Distrito" 
                            class="selDis selectpicker form-control" data-live-search="true"></select>
                </div>
                <div class="col col-lg-4 col-md-4 col-sm-12 col-xs-12 CEscuela">
                    <select title="Seleccione Escuela Sabática" 
                            class="selEs selectpicker form-control" data-live-search="true"></select>
                </div>
                <div class="col col-lg-4 col-md-4 col-sm-12 col-xs-12 CGrupo">
                    <select title="Seleccione Grupo Pequeño" 
                            class="selGru selectpicker form-control" data-live-search="true">
                    </select>
                </div>
            </div>
        </div>
        <div class="panel panel-default contReg" style="display: none">
            <div class="panel-heading">
                <h5 class="panel-title">Grupo Pequeño <strong class="titGrupo"></strong></h5>
            </div>
            <div class="panel-body">
                <form class="form-horizontal formReg">
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>Nombres</label>
                        <input type="text" name="nombres" class="form-control" placeholder="Nombres del nuevo Integrante">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>Apellidos</label>
                        <input type="text" name="apellidos" class="form-control" placeholder="Apellidos del nuevo Integrante">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>Direccion</label>
                        <input type="text" name="direccion" class="form-control" placeholder="Direccion del nuevo Integrante">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>E-mail</label>
                        <input type="email" name="email" class="form-control" placeholder="E-mail del nuevo Integrante">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>Teléfono</label>
                        <input type="tel" name="telefono" class="form-control" placeholder="Teléfono del nuevo Integrante">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>DNI</label>
                        <input type="number" maxlength="8" name="dni" class="form-control" placeholder="DNI del nuevo Integrante">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>Fecha de Nacimiento</label>
                        <input type="date" name="nacimiento" class="form-control" placeholder="Fecha de Nacimiento del nuevo Integrante">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>Fecha de Bautizmo</label>
                        <input type="date" name="bautizmo" class="form-control" placeholder="Fecha de Bautizmo del nuevo Integrante">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>Género</label>
                        <select class="form-control" name="genero">
                            <option value="0">Seleccione el Género del nuevo integrante</option>
                            <option value="1">Masculino</option>
                            <option value="2">Femenino</option>
                        </select>
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label>Ocupacion</label>
                        <input type="text" name="ocupacion" class="form-control" placeholder="Si es estudiante o docente, especificar Carrera Profesional">
                    </div>
                    <div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12 pull-right">
                        <button class="btn btn-primary pull-right btn-block btnReg">Registrar</button> 
                    </div>
                </form>
            </div>
        </div>


    </div>


    <!--  Scripts-->
    <script src="../../js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../../js/material.min.js" type="text/javascript"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../js/select/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="../../js/custom/selectDEGP.js" type="text/javascript"></script>
    <script>
        function selgruActions(selgru) {
            idgrupo = selgru.val();
            $('.contReg').show(600);
            $('.titGrupo').text(selgru.children().attr('title'));

        }
        function regIntegrante() {
            var data=$('.formReg').serialize();
            var url="../../IntCnt?op";
            $.post(url, data, function (objJson){
                
            });
            
        }
    </script>
    <script>
        var idgrupo = 0;
        $(document).ready(function () {
            listarDistrito("../../", $('.CDistrito'), $('.CEscuela'), $('.CGrupo'));
            $('.btnReg').click(function (evt){
                regIntegrante();
                evt.preventDefault();
            });
        });
    </script>
</body>
</html>
