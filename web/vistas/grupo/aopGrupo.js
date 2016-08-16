$(document).ready(function () {
    var nomEs = $("#nEscuelaUser").val();
    var idEs = $("#idEscuelaUser").val();
    var idIg = $("#idIglesiaUser").val();
    var opc = $("#tipojsp").val();
    if (opc == "registrar") {
        $("#nomEsc").attr("value", nomEs);
        $("#idesc").attr("value", idEs);
    }
    if (opc == "listar") {
        $("#subtitulo").empty();
        $("#subtitulo").append("<i class='fa fa-list'></i>   Lista de Grupos Pequeños de la Escuela Sabática " + nomEs);
        listar(idEs);
        var buscador = new BuscadorP();
        buscador.core.setContainer($('.buscadorC'));
        buscador.core.parametros.setFiltroNull();
        buscador.core.parametros.setUrl("rep?opc=buscarPersona");
        buscador.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
        buscador.show();
    }
    if (opc == "registrarIg") {
        var selector = new customSelector($('#selContainer'));
        selector.setUrl("crud");
        selector.loadFromEscuela(idIg);
        selector.loadUntilEscuela();
        showCustomSelector(selector);
    }
    if (opc == "listarIg") {
        var selector = new customSelector($('#selContainer'));
        selector.setUrl("crud");
        selector.loadFromEscuela(idIg);
        selector.loadUntilEscuela();
        showCustomSelector(selector);
    }

});

function getItemSelected(id, nombre) {
    var opc = $("#tipojsp").val();
    if (opc == "registrarIg") {
        $("#nomEsc").attr("value", nombre);
        $("#idesc").attr("value", id);
        $("#send").attr("class", "btn btn-success");
        $("#sendb").attr("class", "btn btn-success hidden");
    }
    if (opc == "listarIg") {
        listar(id);
    }
    $('#exampleModal').modal('hide');
}

function alesc() {
    swal("Desbe escoger una Escuela Sabática", "El Grupo Pequeño debe pertecener a una Escuela Sabática ", "info");
}

function listar(escuela) {
    var url = "crud?ent=grupo&opc=1";
    var data = "";
    data += "idescuela=" + escuela;
    $.post(url, data, function (objJson) {
        var m = "";
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var clase = "";
                var valor = "";
                var icon = "";
                var act = "";
                var estilo = "";
                var iclid = "";
                if (lista[i].idlider != 0 & lista[i].idlider != "") {
                    estilo = "class='btn' style='background:#ff7043;color:white;'";
                    iclid = "refresh";
                } else {
                    estilo = "class='btn btn-warning'";
                    iclid = "plus-square";
                }
                if (lista[i].estado == 1) {
                    clase = "info";
                    valor = "5";
                    icon = "check-square-o";
                } else {
                    clase = "default";
                    valor = "6";
                    icon = "minus-square-o";
                }
                if ($("#tipojsp").val() == "listarIg") {
                    act = "hidden";
                } else {
                    act = "";
                }
                m += "<tr>";
                m += "<td><center>" + lista[i].nombre + "</center></td>";
                m += "<td><center>" + lista[i].fecha + "</center></td>";
                m += "<td><center>" + lista[i].lider + "</center></td>";
                m += "<td><center><a onclick='confirmDes(" + valor + "," + lista[i].id + ")' class='btn btn-" + clase + "'><i class='fa fa-" + icon + "'></i></a></center></td>";
                m += "<td class='" + act + "'><center><a onclick='confirmEdit(" + lista[i].id + ")' class='btn btn-success'><i class='fa fa-pencil'></i></a></center></td>";
                m += "<td class='" + act + "'><center><a onclick='obtGrupo(" + lista[i].id + ")' data-toggle='modal' data-target='#exampleModalL' " + estilo + "><i class='fa fa-" + iclid + "'></i></a></center></td>";
                m += "<td><center><a href='home?orden=6&opc=3&idgrupo=" + lista[i].id + "' class='btn btn-primary'><i class='fa fa-users'></i></a></center></td>";
                m += "<td class='" + act + "'><center><a onclick='confirmDel(" + lista[i].id + ")'  class='btn btn-danger'><i class='fa fa-trash'></i></a></center></td>";
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
                title: "No hay Grupos Pequeños",
                text: "Esta Escuela aún no tiene Grupos Pequeños registrados",
                type: "info",
                closeOnConfirm: false},
            function (isConfirm) {
                if (isConfirm) {
                    location.href = "home?orden=6&opc=2";
                }
            });
        }
    });
}

function verMiembros() {
    location.href = "home?orden=6&opc=3";
}

function createTable() {
    var est = "";
    if ($("#tipojsp").val() == "listarIg") {
        est = "hidden";
    }
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center><i class="fa fa-users"></i>   Nombre</center></th>';
    t += '<th><center><i class="fa fa-calendar"></i>   Fecha de Creación</center></th>';
    t += '<th><center><i class="fa fa-child"></i>   Lider Actual</center></th>';
    t += '<th><center><i class="fa fa-exchange"></i>   Estado</center></th>';
    t += '<th class="' + est + '"><center><i class="fa fa-pencil"></i>   Editar</center></th>';
    t += '<th class="' + est + '"><center><i class="fa fa-male"></i>   Lider</center></th>';
    t += '<th><center><i class="fa fa-users"></i>   Miembros<center></th>';
    t += '<th class="' + est + '"><center><i class="fa fa-close"></i>   Eliminar</center></th>';
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
        title: "¿Seguro que desea " + estado + " este Grupo Pequeño?",
        text: "Se realizará cambios en el estado del Grupo Pequeño",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡" + es + "!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=grupo&opc=' + dir;
            var data = '';
            data = 'idgrupo=' + id;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal({
                        title: "¡Grupo Pequeño " + est + "!",
                        text: "El Grupo Pequeño fue " + est + " correctamente",
                        type: "success",
                        button: "success"},
                    function () {
                        location.href = "home?orden=6&opc=2";
                    });
                } else {
                    swal("Error al " + estado, "Ocurrió un problema al " + estado, "error");
                }
            });
        } else {
            swal("Cancelado", "El Grupo Pequeño no fue " + est + " ", "error");
        }
    });
}



function confirmEdit(id) {
    var url = "crud?ent=grupo&opc=7";
    var data = "";
    data += "idgrupo=" + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var nombre = lista[i].nombre;
                swal({title: "Editar Grupo Pequeño",
                    text: "Nombre:",
                    type: "input",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    inputPlaceholder: "Nombre del Grupo Pequeño",
                    inputValue: nombre
                },
                function (inputValue) {
                    if (inputValue === false)
                        return false;
                    if (inputValue === "") {
                        swal.showInputError("Campo Vacio");
                        return false;
                    } else {
                        var url = 'crud?ent=grupo&opc=3&idgrupo=' + id;
                        var data = 'nombre=' + inputValue;
                        $.post(url, data, function (objJson) {
                            var ed = objJson.respuesta;
                            if (ed == true) {
                                swal({
                                    title: "¡Actualización correcta!",
                                    text: "El Grupo Pqueño '" + inputValue + "' fue correctamente actualizado",
                                    type: "success",
                                    button: "success"},
                                function () {
                                    location.href = "home?orden=6&opc=2";
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
        title: "¿Seguro que desea eliminar este Grupo Pequeño?",
        text: "Se eliminará definitivamente esta Grupo Pequeño",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡eliminalo!",
        cancelButtonText: "No, deseo cancenlar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=grupo&opc=4';
            var data = 'idgrupo=' + dir;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal({
                        title: "¡Eliminación Correcta!",
                        text: "El Grupo Pequeño fue eliminado correctamente",
                        type: "success",
                        button: "success"},
                    function () {
                        location.href = "home?orden=6&opc=2";
                    });

                } else {
                    swal("Error al eliminar", "Ocurrió un problema al eliminar", "error");
                }
            });
        } else {
            swal("Eliminación cancelada", "La eliminación del Grupo Pequeño fue cancelada", "error");
        }
    });
}
function agregarGrupo() {
    /*var fecha = $('#single_cal2').val();
    if (fecha != "") {
        var orf = fecha.split("/");
        var dia = orf[1];
        var mes = orf[0];
        var an = orf[2];
        var fecenv = an + "-" + mes + "-" + dia;
    }*/

    var url = "crud?ent=grupo&opc=2";
    var data = "";
    data += "idescuela=" + $('#idesc').val();
    data += "&nombre=" + $('#inombre').val();
    data += "&uscreador=" + $('#uscreador').val();
    //data += "&fecha=" + fecenv;
    data += "&lugar=" + $('#ilugar').val();
    $.post(url, data, function (objJson) {
        var respuesta = objJson.grupo;
        if (respuesta == true) {
            swal({
                title: "¡Grupo Pequeño Creado!",
                text: "El Grupo Pequeño fue creado correctamente",
                type: "success",
                button: "success"},
            function () {
                location.href = "home?orden=6&opc=2";
            });

        } else {
            swal("Error al Crear", "Ocurrió un problema al crear el Grupo Pequeño", "error");
        }
    });
}

function getPersonaId(id) {
    swal({
        title: "¿Seguro que desea escoger a esta persona como Líder?",
        text: "Se realizarán cambios en el Grupo Pequeño",
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
function obtGrupo(idgrupo) {
    $("#igrupo").attr("value", idgrupo);
}
function lideradd(id) {
    var idgrupo = $("#igrupo").val();
    var url = "crud?ent=grupo&opc=8";
    var data = "";
    data += "lider=" + id + "&idgrupo=" + idgrupo;
    $.post(url, data, function (objJson) {
        var respuesta = objJson.anex;
        if (respuesta == true) {
            location.href = "home?orden=6&opc=2";
        } else {
            swal("Error", "Ocurrió un problema al anexar Lider", "error");
        }
    });
}
