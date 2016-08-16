$(document).ready(function () {
    var idiglesia = $("#idIglesiaUser").val();
    var nomigl = $("#nIglesiaUser").val();
    var opcval = $("#tipojsp").val();
    if (opcval == "listar") {
        listar(idiglesia);
        datIgl(idiglesia, nomigl);
        var buscador = new BuscadorP();
        buscador.core.setContainer($('.buscadorC'));
        buscador.core.parametros.setFiltroNull();
        buscador.core.parametros.setUrl("rep?opc=buscarPersona");
        buscador.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
        buscador.show();
    }
    if (opcval == "registrar") {
        $("#inigl").attr("value", nomigl);
    }
    if (opcval == "listard") {
        var idig = $("#idigl").val();
        var url = "crud?ent=iglesia&opc=7";
        var data = "";
        data += "idiglesia=" + idig;
        $.post(url, data, function (objJson) {
            var lista = objJson.lista;
            if (lista.length > 0) {
                for (var i = 0; i < lista.length; i++) {
                    var nombre = lista[i].nombre;
                    datIgl(idig, nombre);
                }
            }
        });
        listar(idig);
    }
});

function datIgl(id, nombre) {
    $("#titulo").empty();
    $("#titulo").append("Ministerios");
    $("#subtitulo").empty();
    $("#subtitulo").append("Lista de Ministerios de la Iglesia " + nombre);
}

function listar(iglesia) {
    var url = "crud?ent=ministerio&opc=1";
    var data = "";
    data += "idiglesia=" + iglesia;
    $.post(url, data, function (objJson) {
        var m = "";
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var opcion = "";
                var clase = "";
                var valor = "";
                var icon = "";
                var act = "";
                var estilo = "";
                var cl = "";
                if (lista[i].idlider != 0 & lista[i].idlider != "") {
                    act = "refresh";
                    estilo = "class='btn' style='background:#ff7043;color:white;'";
                } else {
                    act = "plus";
                    estilo = "class='btn btn-warning'";
                }
                if (lista[i].estado == 1) {
                    opcion = "Desactivar";
                    clase = "primary";
                    valor = "5";
                    icon = "check-square-o";
                } else {
                    opcion = "Activar";
                    clase = "info";
                    valor = "6";
                    icon = "square-o";
                }
                if ($("#tipojsp").val() == "listard") {
                    cl = "hidden";
                }
                m += "<tr>";
                m += "<td><center>" + lista[i].nombre + "</center></td>";
                m += "<td><center>" + lista[i].fecha + "</center></td>";
                m += "<td><center>" + lista[i].lider + "</center></td>";
                m += "<td><center><a onclick='confirmDes(" + valor + "," + lista[i].id + ")' class='btn btn-" + clase + "'><i class='fa fa-" + icon + "'></i></a></center></td>";
                m += "<td class='" + cl + "'><center><a onclick='confirmEdit(" + lista[i].id + ")' class='btn btn-success'><i class='fa fa-pencil'></i></a></center></td>";
                m += "<td class='" + cl + "'><center><a onclick='obtMin(" + lista[i].id + ")' data-toggle='modal' data-target='#exampleModal' " + estilo + "><i class='fa fa-" + act + "'></i></a></center></td>";
                m += "<td><center><a href='home?orden=7&opc=3&i=" + lista[i].id + "' class='btn btn-danger' style='background:#7e57c2;border:none;'><i class='fa fa-users'></i></a></center></td>";
                m += "<td class='" + cl + "'><center><a onclick='confirmDel(" + lista[i].id + ")'  class='btn btn-danger'><i class='fa fa-trash'></i></a></center></td>";
                m += "</tr>";
            }
            $('.x_content').empty();
            var a = createTable();
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
                title: "No hay Ministerios",
                text: "Esta Iglesia aún no tiene Ministerios Registrados",
                type: "info",
                confirmButtonText: "Registrar",
                closeOnConfirm: false},
            function (isConfirm) {
                if (isConfirm) {
                    location.href = "home?orden=7&opc=1";
                }
            });
        }
    });
}
function createTable() {
    var cl = "";
    if ($("#tipojsp").val() == "listard") {
        cl = "hidden";
    }
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center><i class="fa fa-users"></i>   Nombre</center></th>';
    t += '<th><center><i class="fa fa-calendar"></i>   Fecha de Creación</center></th>';
    t += '<th><center><i class="fa fa-child"></i>   Lider Actual</center></th>';
    t += '<th><center><i class="fa fa-exchange"></i>   Estado</center></th>';
    t += '<th class="' + cl + '"><center><i class="fa fa-pencil"></i>   Editar</center></th>';
    t += '<th class="' + cl + '"><center><i class="fa fa-male"></i>   Lider</center></th>';
    t += '<th><center><i class="fa fa-users"></i>   Miembros</center></th>';
    t += '<th class="' + cl + '"><center><i class="fa fa-close"></i>   Eliminar</center></th>';
    t += '</tr>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody id="datos">';
    t += '</tbody>';
    t += '</table>';
    return t;
}
function confirmDes(dir, id) {
    var estado, es, est;
    if (dir == 5) {
        estado = "desactivar";
        es = "desactivalo";
        est = "desactivado";
    } else {
        estado = "activar";
        es = "activalo";
        est = "activado";
    }
    swal({
        title: "¿Seguro que desea " + estado + " este Ministerio?",
        text: "Se realizará cambios en el estado del Ministerio",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡" + es + "!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=ministerio&opc=' + dir;
            var data = '';
            data = 'idministerio=' + id;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal({
                        title: "¡Ministerio " + est + "!",
                        text: "El ministerio fue " + est + " correctamente",
                        type: "success",
                        button: "success"},
                    function () {
                        location.href = "home?orden=7&opc=2";
                    });
                } else {
                    swal("Error al " + estado, "Ocurrió un problema al " + estado, "error");
                }
            });

        } else {
            swal("Cancelado", "El ministerio no fue " + est + " ", "error");
        }
    });
}
function confirmEdit(id) {
    var url = "crud?ent=ministerio&opc=7";
    var data = "";
    data += "idministerio=" + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var nombre = lista[i].nombre;
                swal({title: "Editar Ministerio",
                    text: "Nombre:",
                    type: "input",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    inputPlaceholder: "Nombre del Ministerio",
                    inputValue: nombre
                },
                function (inputValue) {
                    if (inputValue === false)
                        return false;
                    if (inputValue === "") {
                        swal.showInputError("Campo Vacio");
                        return false;
                    } else {
                        var url = 'crud?ent=ministerio&opc=2&idministerio=' + id;
                        var data = 'nombre=' + inputValue;
                        $.post(url, data, function (objJson) {
                            var ed = objJson.respuesta;
                            if (ed == true) {
                                swal({
                                    title: "¡Actualización correcta!",
                                    text: "El Ministerio '" + inputValue + "' fue correctamente actualizado",
                                    type: "success",
                                    button: "success"},
                                function () {
                                    location.href = "home?orden=7&opc=2";
                                });

                            } else {
                                swal("Error al editar", "Ocurrió un problema al editar", "error");
                            }
                        });
                    }
                });
            }

        }



    });
}
function confirmDel(dir) {
    swal({
        title: "¿Seguro que desea eliminar este Ministerio?",
        text: "Se eliminará definitivamente este Ministerio",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡eliminalo!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=ministerio&opc=4';
            var data = 'idministerio=' + dir;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal({
                        title: "Eliminación correcta",
                        text: "El Ministerio fue correctamente eliminado",
                        type: "success",
                        button: "success"},
                    function () {
                        location.href = "home?orden=7&opc=2";
                    });
                } else {
                    swal("Error al eliminar", "Ocurrió un problema al eliminar", "error");
                }
            });

        } else {
            swal("Eliminación cancelada", "La eliminación del ministerio fue cancelada", "error");
        }
    });
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

function crear() {
    /*var fecha = $('#single_cal2').val();
     if (fecha != "") {
     var orf = fecha.split("/");
     var dia = orf[1];
     var mes = orf[0];
     var an = orf[2];
     var fecenv = an + "-" + mes + "-" + dia;
     }*/
    var url = "crud?ent=ministerio&opc=3";
    var data = "";
    data += "idiglesia=" + $("#idIglesiaUser").val();
    data += "&nombre=" + $('#name').val();
    data += "&uscreador=" + $('#uscreador').val();
    //data += "&fecha=" + fecenv;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.ministerio;
        if (respuesta == true) {
            swal({
                title: "¡Ministerio Creado!",
                text: "El Ministerio fue creado correctamente",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=7&opc=2";
            });

        } else {
            swal("Error al Crear", "Ocurrió un problema al crear el Ministerio", "error");
        }
    });
}
function getPersonaId(id) {
    swal({
        title: "¿Seguro que desea escoger a esta persona como Líder?",
        text: "Se realizarán cambios en la Ministerio",
        type: "info",
        showCancelButton: true,
        confirmButtonText: "Aceptar",
        cancelButtonText: "Cancelar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            lideradd(id);
        } else {
            swal("Cancelado", "No se ejecutaron cambios", "error");
        }
    });
}
function obtMin(idmin) {
    $("#iministerio").attr("value", idmin);
}
function lideradd(id) {
    var idministerio = $("#iministerio").val();
    var url = "crud?ent=ministerio&opc=8";
    var data = "";
    data += "lider=" + id + "&idministerio=" + idministerio;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.anex;
        if (respuesta == true) {
            swal({
                title: "¡Lider Añadido!",
                text: "El Lider fue asignado correctamente",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=7&opc=2";
            });
        } else {
            swal("Error", "Ocurrió un problema al anexar Lider", "error");
        }
    });
}

