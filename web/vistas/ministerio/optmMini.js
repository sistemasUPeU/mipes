var listId = [];
var listA = [];
var presentes = 0;
var faltas = 0;

$(document).ready(function () {
    verficarRegistro();
});

function listar(ministerio) {
    var url = "reg?tipo=asisMin&opc=lista";
    var data = "";
    data += "idministerio=" + ministerio;
    $.post(url, data, function (objJson) {
        var m = "";
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var porcen = lista[i].porcentaje;
                var ran = "";
                if (porcen <= 25 & porcen > 0) {
                    ran = "danger";
                }
                if (porcen <= 50 & porcen > 25) {
                    ran = "warning";
                }
                if (porcen <= 75 & porcen > 50) {
                    ran = "info";
                }
                if (porcen <= 100 & porcen > 75) {
                    ran = "success";
                }
                m += '<tr>';
                m += "<td>" + lista[i].nombres + " " + lista[i].apellidos + "</td>";
                m += '<td class="nasis"><center><div class="progress">';
                m += '<div class="progress-bar progress-bar-' + ran + ' progress-bar-striped active" role="progressbar" style="width:' + porcen + '%">';
                m += porcen + '%</div></div></center></td>';
                m += "<td><center>";
                /*m += '<div class="checkbox"><label>';
                 m += '<input type="checkbox" id="blankCheckbox" class="asistencia" value="option1">';
                 m += "</label></div></center></td>";*/
                m += '<div class="onoffswitch">';
                m += '<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox asistencia" id="switch' + i + '">';
                m += '<label class="onoffswitch-label" for="switch' + i + '"></label>';
                m += '</div>';
                m += '</center></td>';
                m += "</tr>";
                listId[i] = lista[i].idmiembromi;
                listA[i] = false;
            }
            faltas = lista.length;
            updateValues();
            $('#conTab').empty();
            var a = createTableMiem();
            $('#conTab').append(a);
            $('#intmin').empty();
            $('#intmin').append(m);
            adaptar();
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
            $('.asistencia').click(function () {
                var tmp = $(this).attr('id');
                var id = tmp.substring(6, 7);
                if ($('#switch' + id).is(':checked')) {
                    presentes = presentes + 1;
                    faltas = faltas - 1;
                    listA[id] = true;
                    updateValues();
                } else {
                    presentes = presentes - 1;
                    faltas = faltas + 1;
                    listA[id] = false;
                    updateValues();
                }
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

function updateValues() {
    $('#presentes').val(presentes);
    $('#faltas').val(faltas);
}

function createTableMiem() {
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center><i class="fa fa-user"></i>   Nombres y Apellidos</center></th>';
    t += '<th class="nasis"><center><i class="fa fa-bar-chart"></i>   Nivel de Asistencia</center></th>';
    t += '<th><center><i class="fa fa-check"></i>   Asistencia</center></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody id="intmin">';
    t += '</tbody>';
    t += '</table>';
    t += '<button data-toggle="modal" data-target="#exampleModal" type="button" class="btn btn-danger" id="buttonSave" style="width:30%;">Guardar</button>';
    return t;
}
function mostrar() {
    swal({
        title: "¿Seguro que desea Registrar?",
        text: "Se registrará la asistencia de esta semana",
        type: "info",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Registrar",
        cancelButtonText: "Cancenlar",
        closeOnConfirm: true,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            regAsistenciaGP($("#idMinisterioUser").val());
        } else {
            swal("Registro cancelado", "No se registró", "error");
        }
    });
}

function valid() {
    var ben = $('#ben').val();
    var lugar = $('#lugar').val();
    var descripcion = $('#descripcion').val();
    if (lugar !== '' && ben !== '' && descripcion !== '') {
        mostrar();
    } else {
        swal("Registro incompleto", "Debe llenar todo el registro", "warning");
    }
}

function regAsistenciaGP(idMinisterio) {
    var ben = $('#ben').val();
    var lugar = $('#lugar').val();
    var descripcion = $('#descripcion').val();
    var url = "reg?tipo=asisMin&opc=ministerio&idministerio=" + idMinisterio;
    var data = "presentes=" + presentes;
    data += "&faltas=" + faltas;
    data += "&beneficiarios=" + ben;
    data += "&lugar=" + lugar;
    data += "&descripcion=" + descripcion;
    if (lugar !== '' && ben !== '' && descripcion !== '') {
        $.post(url, data, function (objJson) {
            var idAsistencia = objJson.idasistencia;
            if (idAsistencia !== undefined || idAsistencia !== '') {
                url = "reg?tipo=asisMin&opc=integrante&idasistenciami=" + idAsistencia;
                var count = false;
                for (var i = 0; i < listA.length; i++) {
                    if (listA[i] === true) {
                        data = "asistencia=1";
                    } else {
                        data = "asistencia=0";
                    }
                    data += "&idmiembromi=" + listId[i];
                    $.post(url, data, function (obj) {
                        if (obj.result === false) {
                            errorMessage("Hubo un error al momento de registrar la asistencia!");
                            count = true;
                            i = listA.length - 1;
                        }
                    });
                }
                if (count === false) {
                    successMessage("Asistencia registrada correctamente");
                    verficarRegistro();
                    location.href = "home?orden=7&opc=4";
                }

            } else {
                errorMessage("Error al registrar la Asistencia del Grupo");
            }
        });
    } else {
        swal({
            title: "Campo incompleto",
            text: "Debe ingresar la cantidad de beneficiarios",
            type: "warning",
            closeOnConfirm: true});

    }
}

function verficarRegistro() {
    var idministerio = $("#idMinisterioUser").val();
    var url = "reg?tipo=asisMin&opc=puedereg&idministerio=" + idministerio;
    $.post(url, function (objJson) {
        if (objJson.result === true) {
            $("#containerReg").attr("class", "main_container");
            var nomMin = $("#nMinisterioUser").val();
            $("#subtitulo").append("<i class='fa fa-list'></i>   Integrantes del Ministerio " + nomMin);
            enableRegAsistencia();
        } else {
            showMessageNextWeek();
        }
    });
}
function showMessageNextWeek() {
    $('#containerReg').attr("class", "hidden");
    $('#containerMessage').show();
}

function enableRegAsistencia() {
    /*$('#containerReg').show();
     $('#containerMessage').hide();
     $('#tableAsistencia').DataTable();*/
    var idMin = $("#idMinisterioUser").val();
    listar(idMin);
}

function adaptar() {
    if (document.getElementById('containerReg').offsetWidth < 350) {
        $(".nasis").attr("class", "hidden");
    }
}