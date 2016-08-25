$(document).ready(function () {
    var tipo = $("#tipojsp").val();
    if (tipo == "listarmiembros") {
        var idgrupo = $("#idGrupoUser").val();
        var nomgrupo = $("#nGrupoUser").val();
        listarmiembros(idgrupo);
        datosGP(idgrupo, nomgrupo);
        abc();
    }
    if (tipo == "listarmiembroses") {
        var idgrupoes = $("#otp").val();
        var nom = "";
        var url = "crud?ent=grupo&opc=7";
        var data = "";
        data += "idgrupo=" + idgrupoes;
        $.post(url, data, function (objJson) {
            var lista = objJson.lista;
            if (lista.length > 0) {
                for (var i = 0; i < lista.length; i++) {
                    nom = lista[i].nombre;
                    datosGP(idgrupoes, nom);
                    listarmiembros(idgrupoes);
                }
            }
        });
    }

});
function datosGP(idgrupo, nombre) {
    var m = 'Grupo Pequeño ' + nombre;
    var n = 'Integrantes del Grupo Pequeño ' + nombre;
    $('#titulo').empty();
    $('#titulo').append(m);
    $('#subtitulo').empty();
    $('#subtitulo').append(n);
    $("#igp").attr("value", idgrupo);
}

function confirmDesvin(idRegistro) {
    swal({
        title: "¿Seguro que desea quitar a esta persona?",
        text: "Se quitará esta persona de la lista del Grupo Pequeño",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡desvincularlo!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = "crud?ent=intgp&opc=4";
            var data = "";
            data += "idregistro=" + idRegistro;
            $.post(url, data, function (objJson) {
                var respuesta = objJson.respuesta;
                if (respuesta == true) {
                    swal({
                        title: "¡Desvinculación Correcta!",
                        text: "La persona fue retirada correctamente",
                        type: "success",
                        button: "success"},
                    function () {
                        location.href = "home?orden=6&opc=3";
                    });
                } else {
                    swal("Error", "Ocurrió un problema al quitar Persona ", "error");
                }
            });

        } else {
            swal("Desvinculación cancelada", "La desvinculación fue cancelada", "error");
        }
    });
}

function getPersonaId(id) {
    personaValid(id);
}

function personaValid(id) {
    var idgrupo = $("#igp").val();
    var url = "crud?ent=intgp&opc=3";
    var data = "";
    data += "idpersona=" + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var estado = lista[i].estado;
                var grupo = lista[i].nomGrupo;
                if (estado == "1") {
                    swal({
                        title: "Persona con Grupo",
                        text: "Esta persona pertenece actualmente al G.P. '" + grupo + "', para unirla debe ser desvinculada por el líder de su G.P. actual",
                        type: "warning",
                        confirmButtonText: "Aceptar",
                        closeOnConfirm: false});
                }
            }

        } else {

            swal({
                title: "¿Seguro que desea agregar a esta persona?",
                text: "Se anexará a esta persona al Grupo Pequeño",
                type: "info",
                showCancelButton: true,
                confirmButtonText: "Aceptar",
                cancelButtonText: "Cancelar",
                closeOnConfirm: false,
                closeOnCancel: false},
            function (isConfirm) {
                if (isConfirm) {
                    personaadd(id, idgrupo);
                } else {
                    swal("Cancelado", "No se ejecutaron cambios", "error");
                }
            });


        }
    });
}

function personaadd(id, idgrupo) {
    var url = "crud?ent=intgp&opc=2";
    var data = "";
    data += "idpersona=" + id + "&idgrupo=" + idgrupo;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.respuesta;
        if (respuesta == true) {
            swal({
                title: "¡Persona Anexada!",
                text: "Se añadió a la persona correctamente",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=6&opc=3";
            });
        } else {
            swal("Error", "Ocurrió un problema al anexar Persona ", "error");
        }
    });
}

function quitardegrupo(idRegistro, id, idgrupo) {
    var url = "crud?ent=intgp&opc=4";
    var data = "";
    data += "idregistro=" + idRegistro;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.respuesta;
        if (respuesta == true) {
            personaadd(id, idgrupo);
        } else {
            swal("Error", "Ocurrió un problema al quitar Persona ", "error");
        }
    });
}

function abc() {
    var buscador = new BuscadorP();
    buscador.core.setContainer($('.buscadorC'));
    buscador.core.parametros.setFiltroGP();
    buscador.core.parametros.setUrl("rep?opc=buscarPersona");
    buscador.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
    buscador.show();
}


function listarmiembros(grupo) {
    var url = "crud?ent=intgp&opc=1";
    var data = "";
    data += "idgrupo=" + grupo;
    $.post(url, data, function (objJson) {
        var m = "";
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var opcion = "";
                var clase = "";
                var icon = "";
                if (lista[i].estado == 1) {
                    opcion = "Desvincular";
                    clase = "danger";
                    icon = "close";
                }
                var clas = "";
                if ($("#tipojsp").val() == "listarmiembroses") {
                    clas = "hidden";
                }
                m += "<tr>";
                m += "<td><center>" + lista[i].nombres + " " + lista[i].apellidos + "</center></td>";
                m += "<td><center>" + lista[i].dni + "</center></td>";
                m += "<td><center>" + lista[i].telefono + "</center></td>";
                m += "<td><center>" + lista[i].correo + "</center></td>";
                m += "<td class=" + clas + "><center><a onclick='confirmDesvin(" + lista[i].idRegistro + ")' class='btn btn-" + clase + "'><i class='fa fa-" + icon + "'></i></a></center></td>";
                m += "<td><center><a href='home?orden=1&opc=2&idpersona=" + lista[i].idPersona + "' class='btn btn-success'><i class='fa fa-user'></i></a></center></td>";
                m += "</tr>";
            }
            $('.x_content').empty();
            var a = createTableMiem();
            $('.x_content').append(a);
            $('#datos').empty();
            $('#datos').append(m);
            $('#datatable').dataTable();
            $('#datatable-keytable').DataTable({
                keys: true
            });
            $('#datatable-responsive').DataTable();
            $('#datatable-scroller').DataTable({
                ajax: "js/datatables/json/scroller-demo.json",
                deferRender: true,
                scrollY: 380,
                scrollCollapse: true,
                scroller: true
            });

        } else {
            swal({
                title: "No hay Miembros Registrados",
                text: "Este Grupo Pequeño no cuenta con miembros registrados",
                type: "info",
                closeOnConfirm: true});
        }
    });
}

function createTableMiem() {
    var clase = "";
    if ($("#tipojsp").val() == "listarmiembroses") {
        clase = "hidden";
    }
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center><i class="fa fa-user"></i>   Nombres y Apellidos</center></th>';
    t += '<th><center><i class="fa fa-credit-card"></i>   DNI</center></th>';
    t += '<th><center><i class="fa fa-phone"></i>   Celular</center></th>';
    t += '<th><center><i class="fa fa-envelope-o"></i>   Correo</center></th>';
    t += '<th class=' + clase + ' ><center><i class="fa fa-close"></i>   Desvincular</center></th>';
    t += '<th><center><i class="fa fa-child"></i>   Ver Perfil</center></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody id="datos">';
    t += '</tbody>';
    t += '</table>';
    return t;
}