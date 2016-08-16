$(document).ready(function () {
    var tipo = $("#tipojsp").val();
    if (tipo == "listar") {
        var idministerio = $("#idMinisterioUser").val();
        var nommin = $("#nMinisterioUser").val();
        datMinisterio(idministerio, nommin);
        listarmiembros(idministerio);
        abc();
    }
    if (tipo == "listarig") {
        var idmin = $("#idm").val();
        var url = "crud?ent=ministerio&opc=7";
        var data = "";
        data += "idministerio=" + idmin;
        $.post(url, data, function (objJson) {
            var lista = objJson.lista;
            if (lista.length > 0) {
                for (var i = 0; i < lista.length; i++) {
                    var nombre = lista[i].nombre;
                    datMinisterio(idmin, nombre);
                }
            }
        });
        listarmiembros(idmin);
    }

});

function datMinisterio(id, nombre) {
    $("#titulo").append('Ministerio ' + '"' + nombre + '"');
    $("#subtitulo").append("Lista de Integrantes del Ministerio " + nombre);
    $("#inministerio").attr("value", id);
}

var handleDataTableButtons = function () {
    "use strict";
    0 !== $("#datatable-buttons").length && $("#datatable-buttons").DataTable({
        dom: "Bfrtip",
        buttons: [{
                extend: "copy",
                className: "btn-sm"
            }, {
                extend: "csv",
                className: "btn-sm"
            }, {
                extend: "excel",
                className: "btn-sm"
            }, {
                extend: "pdf",
                className: "btn-sm"
            }, {
                extend: "print",
                className: "btn-sm"
            }],
        responsive: !0
    });
},
        TableManageButtons = function () {
            "use strict";
            return {
                init: function () {
                    handleDataTableButtons();
                }
            };
        }();
$(document).ready(function () {
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
    var table = $('#datatable-fixed-header').DataTable({
        fixedHeader: true
    });
});
TableManageButtons.init();


function confirmDesvin(idRegistro) {
    swal({
        title: "¿Seguro que desea quitar a esta persona?",
        text: "Se quitará esta persona de la lista del Ministerio",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡desvincularlo!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = "crud?ent=intmin&opc=4";
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
                        location.href = "home?orden=7&opc=3";
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
    var idministerio = $("#inministerio").val();
    var url = "crud?ent=intmin&opc=3";
    var data = "";
    data += "idpersona=" + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var estado = lista[i].estado;
                if (estado == "1") {
                    swal({
                        title: "Persona con Ministerio",
                        text: "Esta persona pertenece actualmente a otro Ministerio, para unirla debe ser desvinculada por el líder de su Ministerio actual",
                        type: "warning",
                        confirmButtonText: "Aceptar",
                        closeOnConfirm: false});
                }
            }

        } else {
            swal({
                title: "¿Seguro que desea agregar a esta persona?",
                text: "Se anexará a esta persona al Ministerio",
                type: "info",
                showCancelButton: true,
                confirmButtonText: "Aceptar",
                cancelButtonText: "Cancelar",
                closeOnConfirm: false,
                closeOnCancel: false},
            function (isConfirm) {
                if (isConfirm) {
                    personaadd(id, idministerio);
                } else {
                    swal("Cancelado", "No se ejecutaron cambios", "error");
                }
            });

        }
    });
}

function personaadd(id, idministerio) {
    var url = "crud?ent=intmin&opc=2";
    var data = "";
    data += "idpersona=" + id + "&idministerio=" + idministerio;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.respuesta;
        if (respuesta == true) {
            swal({
                title: "¡Persona Anexada!",
                text: "Se añadió a la persona correctamente",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=7&opc=3";
            });
        } else {
            swal("Error", "Ocurrió un problema al anexar Persona ", "error");
        }
    });
}

function quitardegrupo(idRegistro, id, idministerio) {//EDITAR
    var url = "crud?ent=intmin&opc=4";
    var data = "";
    data += "idregistro=" + idRegistro;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.respuesta;
        if (respuesta == true) {
            personaadd(id, idministerio);
        } else {
            swal("Error", "Ocurrió un problema al quitar Persona ", "error");
        }
    });
}

function abc() {
    var buscador = new BuscadorP();
    buscador.core.setContainer($('.buscadorC'));
    buscador.core.parametros.setFiltroNull();
    buscador.core.parametros.setUrl("rep?opc=buscarPersona");
    buscador.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
    buscador.show();
}



function listarmiembros(ministerio) {
    var url = "crud?ent=intmin&opc=1";
    var data = "";
    data += "idministerio=" + ministerio;
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
                var est = "";
                if ( $("#tipojsp").val() == "listarig") {
                    est = "hidden";
                }
                m += "<tr>";
                m += "<td><center>" + lista[i].nombres + " " + lista[i].apellidos + "</center></td>";
                m += "<td><center>" + lista[i].dni + "</center></td>";
                m += "<td><center>" + lista[i].telefono + "</center></td>";
                m += "<td><center>" + lista[i].correo + "</center></td>";
                m += "<td class='"+est+"'><center><a onclick='confirmDesvin(" + lista[i].idRegistro + ")' class='btn btn-" + clase + "'><i class='fa fa-" + icon + "'></i></a></center></td>";
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
                text: "Este Ministerio no cuenta con miembros registrados",
                type: "info",
                closeOnConfirm: true});
        }
    });
}

function createTableMiem() {
    var est = "";
    if ( $("#tipojsp").val() == "listarig") {
        est = "hidden";
    }
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center><i class="fa fa-user"></i>   Nombres y Apellidos</center></th>';
    t += '<th><center><i class="fa fa-credit-card"></i>   DNI</center></th>';
    t += '<th><center><i class="fa fa-phone"></i>   Celular</center></th>';
    t += '<th><center><i class="fa fa-envelope-o"></i>   Correo</center></th>';
    t += '<th class="'+est+'"><center><i class="fa fa-close"></i>   Desvincular</center></th>';
    t += '<th><center><i class="fa fa-child"></i>   Ver Perfil</center></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody id="datos">';
    t += '</tbody>';
    t += '</table>';
    return t;
}