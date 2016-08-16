$(document).ready(function () {
    var idgrupo = $("#idGrupoUser").val();
    var nomgrupo = $("#nGrupoUser").val();
    listarDiscipuladores(idgrupo);
    datosGP(idgrupo,nomgrupo);
    abc();
});

function datosGP(idgrupo,nombre) {
    var m = 'Grupo Pequeño ' + nombre;
    var n = 'Integrantes del Grupo Pequeño ' + nombre;
    $('#titulo').empty();
    $('#titulo').append(m);
    $('#subtitulo').empty();
    $('#subtitulo').append(n);
    $("#igp").attr("value", idgrupo);
}

function abc() {
    var buscador = new BuscadorP();
    buscador.core.setContainer($('.buscadorC'));
    buscador.core.parametros.setFiltroNull();
    buscador.core.parametros.setUrl("rep?opc=buscarPersona");
    buscador.core.paramRegistro.setUrl("crud?ent=pers&opc=3");
    buscador.show();
}

function aaa(){
    
}
function listarDiscipuladores(grupo){
    var url = "crud?ent=intgp&opc=11";
    var data = "";
    data += "idgrupo=" + grupo;
    $.post(url, data, function (objJson) {
        var m = "";
        var lista = objJson.lista;
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                var opcion = "";
                var clase = "";
                var estado = "";
                var icon = "";
                var valor = "";
                if (lista[i].estado == 1) {
                    estado = "Miembro Activo";
                    opcion = "No Discipulador";
                    clase = "info";
                    valor = "5";
                    icon = "off";
                }else{
                    clase = "primary";
                    valor = "6";
                    icon = "on";
                }
                m += "<tr>";
                m += "<td><center>" +  lista[i].nombres+"  "+lista[i].apellidos +"</center></td>";
                m += "<td><center>" + lista[i].fe_nacimiento + "</center></td>";
                m += "<td><center>"+  estado + "</center></td>";
                m += "<td><center><a onclick='confirmEst(" + valor + "," + lista[i].idPersona + ")' class='btn btn-" + clase + "'><i class='fa fa-toggle-" + icon + "'></i> " + opcion + "</a></center></td>";
                m += "</tr>";
            }
            $('.x_content').empty();
            var a = createTableDiscipulador();
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

function createTableDiscipulador(){
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%" style="box-sizing: border-box;">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center>Nombres y Apellidos</center></th>';
    t += '<th><center>Fecha de Registro</center></th>';
    t += '<th><center>Estado</center></th>';
    t += '<th></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody id="datos">';
    t += '</tbody>';
    t += '</table>';
    return t;
}

function confirmEst(dir, id) {
    var estado, es, est;
    if (dir == 5) {
        estado = "Discipulador";
        es = "Asignar como Miembro Regular";
        est = "desactivado";
    } else {
        estado = "No Discipulador";
        es = "Asignar como Discipulador";
        est = "activado";
    }
    alert(es);
    swal({
        
        title: "¿Seguro que desea asignar como " + estado + " a este Miembro?",
        text: "Se realizará cambios en el estado del Miembro",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sí, ¡" + es + "!",
        cancelButtonText: "No, deseo cancelar",
        closeOnConfirm: false,
        closeOnCancel: false},
    function (isConfirm) {
        if (isConfirm) {
            var url = 'crud?ent=intgp&opc=' + dir;
            var data = '';
            data = 'idpersona=' + id;
            $.post(url, data, function (objJson) {
                var del = objJson.respuesta;
                if (del == true) {
                    swal({
                        title: "¡Miembro " + est + "!",
                        text: "El Miembro fue " + est + " como Discipulador correctamente",
                        type: "success",
                        button: "success"},
                    function () {
                        location.href = "home?orden=6&opc=4";
                    });
                } else {
                    swal("Error al " + estado, "Ocurrió un problema al " + estado, "error");
                }
            });
        } else {
            swal("Cancelado", "El Miembro no fue " + est + " ", "error");
        }
    });
}
