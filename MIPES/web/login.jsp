<%-- 
    Document   : login
    Created on : 16/05/2016, 07:21:59 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login | MIPES</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/icheck/flat/green.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
    </head>

    <body style="background:#F7F7F7;">
        <div class="">
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>

            <div id="wrapper">
                <div id="login" class="animate form">
                    <section class="login_content">
                        <form method="post" action="login">
                            <h1>Ingresar</h1>
                            <div>
                                <input name="user" type="text" class="form-control" placeholder="Usuario" />
                            </div>
                            <div>
                                <input name="pass" type="password" class="form-control" placeholder="Password"/>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-success" style="width: 100%;">Ingresar</button>

                            </div>
                            <div class="clearfix"></div>
                            <div class="separator">

                               
                                <br />
                                <div>
                                    <h1><i class="fa fa-group" style="font-size: 26px;"></i> MIPES</h1>

                                    <p>©2016</p>
                                </div>
                            </div>
                        </form>
                    </section>
                </div>
            
            </div>
        </div>

    </body>

</html>
