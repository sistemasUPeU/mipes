$(document).ready(function () {
    var buscador = new BuscadorP();
    buscador.core.setContainer($('.buscadorC'));
    buscador.core.parametros.setFiltroNull();
    buscador.core.parametros.setUrl("rep?opc=buscarPersona");
    buscador.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
    buscador.show();
    listarCampos();
});

function getPersonaId(id) {
    swal({
        title: "¿Seguro que desea escoger a esta persona como Líder?",
        text: "Se realizarán cambios en el Campo",
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
function obtCampo(idcampo) {
    $("#icampo").attr("value", idcampo);
}

$('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    var recipient = button.data('whatever'); // Extract info from data-* attributes
    var modal = $(this);
    modal.find('.modal-title').text('Registro de Persona');
    modal.find('.modal-body input').val(recipient);
});

function lideradd(id) {
    var idcampo = $("#icampo").val();
    var url = "crud?ent=campo&opc=7";
    var data = "";
    data += "lider=" + id + "&idcampo=" + idcampo;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.anex;
        if (respuesta == true) {
            swal({
                title: "¡Lider Asignado!",
                text: "Se asignó correctamente al Lider de este Campo",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=2&opc=2";
            });
        } else {
            swal("Error", "Ocurrió un problema al anexar Lider", "error");
        }
    });
}

function crear() {
    var url = "crud?ent=campo&opc=2";
    var data = "";
    data += "nombre=" + $('#inombre').val();
    $.post(url, data, function (objJson) {
        var respuesta = objJson.campo;
        if (respuesta == true) {
            swal({
                title: "¡Campo Creado!",
                text: "El Grupo Pequeño fue creado correctamente",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=2&opc=2";
            });

        } else {
            swal("Error al Crear", "Ocurrió un problema al crear el Campo", "error");
        }
    });
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
        title: "¿Seguro que desea " + estado + " este Campo?",
        text: "Se realizará cambios en el estado del Campo",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡" + es + "!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=campo&opc=' + dir;
            var data = '';
            data = 'idcampo=' + id;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal({
                        title: "¡Campo " + est + "!",
                        text: "El Campo fue " + est + " correctamente",
                        type: "success",
                        button: "success"},
                    function () {
                        location.href = "home?orden=2&opc=2";
                    });
                } else {
                    swal("Error al " + estado, "Ocurrió un problema al " + estado, "error");
                }
            });
        } else {
            swal("Cancelado", "El Campo no fue " + est + " ", "error");
        }
    });
}



function confirmEdit(id) {
    var url = "crud?ent=campo&opc=8";
    var data = "";
    data += "idcampo=" + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var nombre = lista[i].nombre;
                swal({title: "Editar Campo",
                    text: "Nombre:",
                    type: "input",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    inputPlaceholder: "Nombre del Campo",
                    inputValue: nombre
                },
                function (inputValue) {
                    if (inputValue === false)
                        return false;
                    if (inputValue === "") {
                        swal.showInputError("Campo Vacio");
                        return false;
                    } else {
                        var url = 'crud?ent=campo&opc=3&idcampo=' + id;
                        var data = 'nombre=' + inputValue;
                        $.post(url, data, function (objJson) {
                            var ed = objJson.respuesta;
                            if (ed == true) {
                                swal({
                                    title: "¡Actualización correcta!",
                                    text: "El Campo fue correctamente actualizado",
                                    type: "success",
                                    button: "success"},
                                function () {
                                    location.href = "home?orden=2&opc=2";
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
        title: "¿Seguro que desea eliminar este Campo?",
        text: "Se eliminará definitivamente este Campo del Sistema",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, deseo eliminarlo",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=campo&opc=4';
            var data = 'idcampo=' + dir;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal({
                        title: "Eliminación correcta",
                        text: "El campo fue eliminado correctamente",
                        type: "success"},
                    function (isConfirm) {
                        if (isConfirm) {
                            location.href = "home?orden=2&opc=2";
                        } else {
                            swal("Error al eliminar", "Ocurrió un problema al eliminar el campo", "error");
                        }
                    });
                } else {
                    swal("Error al eliminar", "Ocurrió un problema al eliminar el campo", "error");
                }
            });
        } else {
            swal("Eliminación cancelada", "La eliminación del campo fue cancelada", "error");
        }
    });
}

function listarCampos() {
    var url = "crud?ent=campo&opc=1";
    $.post(url, function (objJson) {
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
                if (lista[i].idlider != 0) {
                    act = "Cambiar";
                    estilo = "class='btn' style='background:#ff7043;color:white;'";
                } else {
                    act = "Asignar";
                    estilo = "class='btn btn-warning'";
                }
                if (lista[i].estado == 1) {
                    opcion = "Desactivar";
                    clase = "primary";
                    valor = "5";
                    icon = "on";
                } else {
                    opcion = "Activar";
                    clase = "info";
                    valor = "6";
                    icon = "off";
                }
                m += "<tr>";
                m += "<td><center><h5>" + lista[i].nombre + "</h5></center></td>";
                m += "<td><center><a onclick='confirmDes(" + valor + "," + lista[i].id + ")' class='btn btn-" + clase + "'><i class='fa fa-toggle-" + icon + "'></i>   " + opcion + "</a></center></td>";
                m += "<td><center><a onclick='confirmEdit(" + lista[i].id + ")' class='btn btn-success'><i class='fa fa-pencil'></i>   Editar</a></center></td>";
                m += "<td><center><a onclick='obtCampo(" + lista[i].id + ")' data-toggle='modal' data-target='#exampleModal' " + estilo + "><i class='fa fa-child'></i>   " + act + " Lider</a></center></td>";
                m += "<td><center><a onclick='confirmDel(" + lista[i].id + ")'  class='btn btn-danger'><i class='fa fa-trash'></i>   Eliminar</a></center></td>";
                m += "</tr>";
            }

        }
        $('#conTab').empty();
            var a = createTable();
            $('#conTab').append(a);
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
    });
}

function createTable() {
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center><i class="fa fa-globe"></i>   Nombre</center></th>';
    t += '<th><center></center></th>';
    t += '<th><center></center></th>';
    t += '<th></th>';
    t += '<th></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody id="datos">';
    t += '</tbody>';
    t += '</table>';
    return t;
}