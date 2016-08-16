$(document).ready(function () {
    var dis = $("#idDistritoUser").val();
    var nomdis = $("#nDistritoUser").val();
    $("#titulo").append("Iglesias del Distrito Misionero " + nomdis);
    $("#subtitulo").append("Lista de Iglesias del Distrito Misionero " + nomdis);
    var opcval = $("#tipojsp").val();
    if (opcval == "listar") {
        listar(dis);
        var buscador = new BuscadorP();
        buscador.core.setContainer($('.buscadorC'));
        buscador.core.parametros.setFiltroNull();
        buscador.core.parametros.setUrl("rep?opc=buscarPersona");
        buscador.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
        buscador.show();
    }
    if (opcval == "registrar") {
        var nom = "";
        var url = "crud?ent=iglesia&opc=9";
        var data = "";
        data += "iddis=" + dis;
        $.post(url, data, function (objJson) {
            var lista = objJson.lista;
            if (lista.length > 0) {
                for (var i = 0; i < lista.length; i++) {
                    nom = lista[i].nombre;
                    $("#nomdis").attr("value", nom);
                }
            }
        });
    }
});

function getItemSelected(id, name) {
}

function listar(distrito) {
    var url = "crud?ent=iglesia&opc=1";
    var data = "";
    data += "iddis=" + distrito;
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
                    icon = "minus-square-o";
                }
                m += "<tr>";
                m += "<td><center>" + lista[i].nombre + "</center></td>";
                m += "<td><center><a onclick='confirmDes(" + valor + "," + lista[i].id + ")' class='btn btn-" + clase + "'><i class='fa fa-" + icon + "'></i></a></center></td>";
                m += "<td><center><a onclick='confirmEdit(" + lista[i].id + ")' class='btn btn-success'><i class='fa fa-pencil'></i></a></center></td>";
                m += "<td><center><a onclick='obtIglesia(" + lista[i].id + ")' data-toggle='modal' data-target='#exampleModal' " + estilo + "><i class='fa fa-" + act + "'></i></a></center></td>";
                m += "<td><center><a href='home?orden=7&opc=2&m="+lista[i].id+"' class='btn btn-danger' style='background:#7e57c2;color:white;border:none;'><i class='fa fa-group'></i></a></center></td>";
                m += "<td><center><a onclick='confirmDel(" + lista[i].id + ")'  class='btn btn-danger'><i class='fa fa-trash'></i></a></center></td>";
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
                title: "No hay iglesias registradas",
                text: "Este distrito no cuenta con Iglesias Registradas",
                type: "info",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Registrar",
                cancelButtonText: "Aceptar",
                closeOnConfirm: false,
                closeOnCancel: false},
            function (isConfirm) {
                if (isConfirm) {
                    location.href = "home?orden=4&opc=1";

                } else {
                    location.href = "home?orden=4&opc=2";
                }
            });

        }
    });
}
function createTable() {
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center><i class="fa fa-home"></i>   Nombre</center></th>';
    t += '<th><center><i class="fa fa-exchange"></i>   Estado</center></th>';
    t += '<th><center><i class="fa fa-pencil"></i>   Editar</center></th>';
    t += '<th><center><i class="fa fa-male"></i>   Lider</center></th>';
    t += '<th><center><i class="fa fa-users"></i>   Ministerios</center></th>';
    t += '<th><center><i class="fa fa-close"></i>   Eliminar</center></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody id="datos">';
    t += '</tbody>';
    t += '</table>';
    return t;
}

$('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    var recipient = button.data('whatever'); // Extract info from data-* attributes
    var modal = $(this);
    modal.find('.modal-title').text('Registro de Persona');
    modal.find('.modal-body input').val(recipient);
});


function confirmDes(dir, id) {
    var estado, es, est;
    if (dir == 5) {
        estado = "desactivar";
        es = "desactivala";
        est = "desactivada";
    } else {
        estado = "activar";
        es = "activala";
        est = "activada";
    }
    swal({
        title: "¿Seguro que desea " + estado + " esta Iglesia?",
        text: "Se realizará cambios en el estado de la Iglesia",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡" + es + "!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=iglesia&opc=' + dir;
            var data = '';
            data = 'idiglesia=' + id;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal({
                        title: "¡Iglesia " + est + "!",
                        text: "La Iglesia fue " + est + " correctamente",
                        type: "success",
                        button: "success"},
                    function () {
                        location.href = "home?orden=4&opc=2";
                    });
                } else {
                    swal("Error al " + estado, "Ocurrió un problema al " + estado, "error");
                }
            });

        } else {
            swal("Cancelado", "La Iglesia no fue " + est + " ", "error");
        }
    });
}
function confirmEdit(id) {
    var url = "crud?ent=iglesia&opc=7";
    var data = "";
    data += "idiglesia=" + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var nombre = lista[i].nombre;
                swal({title: "Editar Iglesia",
                    text: "Nombre:",
                    type: "input",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    inputPlaceholder: "Nombre de la Iglesia",
                    inputValue: nombre
                },
                function (inputValue) {
                    if (inputValue === false)
                        return false;
                    if (inputValue === "") {
                        swal.showInputError("Campo Vacio");
                        return false;
                    } else {
                        var url = 'crud?ent=iglesia&opc=3&idiglesia=' + id;
                        var data = 'nombre=' + inputValue;
                        $.post(url, data, function (objJson) {
                            var ed = objJson.respuesta;
                            if (ed == true) {
                                swal({
                                    title: "¡Actualización correcta!",
                                    text: "La Iglesia '" + inputValue + "' fue correctamente actualizada",
                                    type: "success",
                                    button: "success"},
                                function () {
                                    location.href = "home?orden=4&opc=2";
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
        title: "¿Seguro que desea eliminar esta Iglesia?",
        text: "Se eliminará definitivamente esta Iglesia del Distrito Misionero",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡eliminalo!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=iglesia&opc=4';
            var data = 'idiglesia=' + dir;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal("Eliminación correcta", "La Iglesia fue eliminada correctamente", "success");
                    location.href = "home?orden=4&opc=2";
                } else {
                    swal("Error al eliminar", "Ocurrió un problema al eliminar", "error");
                }
            });

        } else {
            swal("Eliminación cancelada", "La eliminación de la Iglesia fue cancelada", "error");
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
    var url = "crud?ent=iglesia&opc=2";
    var data = "";
    data += "iddis=" + $("#idDistritoUser").val();
    data += "&nombre=" + $('#name').val();
    $.post(url, data, function (objJson) {
        var respuesta = objJson.iglesia;
        if (respuesta == true) {
            swal({
                title: "¡Iglesia Creada!",
                text: "La Iglesia fue creada correctamente",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=4&opc=2";
            });

        } else {
            swal("Error al Crear", "Ocurrió un problema al crear la iglesia", "error");
        }
    });
}

function getPersonaId(id) {
    swal({
        title: "¿Seguro que desea escoger a esta persona como Líder?",
        text: "Se realizarán cambios en la Iglesia",
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
function obtIglesia(idiglesia) {
    $("#iiglesia").attr("value", idiglesia);
}
function lideradd(id) {
    var idiglesia = $("#iiglesia").val();
    var url = "crud?ent=iglesia&opc=8";
    var data = "";
    data += "lider=" + id + "&idiglesia=" + idiglesia;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.anex;
        if (respuesta == true) {
            swal({
                title: "¡Lider Asignado!",
                text: "El lider fue asignado correctamente",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=4&opc=2";
            });
        } else {
            swal("Error", "Ocurrió un problema al anexar Lider", "error");
        }
    });
}