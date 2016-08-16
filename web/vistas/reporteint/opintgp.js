$(document).ready(function () {
    graphIntegrantes($("#idGrupoUser").val());
    $("#titulo").append($("#nGrupoUser").val());
});

function porcGen(pr, fl) {
    $(".presente").attr("data-percent", pr);
    $(".falta").attr("data-percent", fl);
    $('.presente').easyPieChart({
        easing: 'easeOutBounce',
        lineWidth: '6',
        barColor: '#75BCDD',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent));
        }
    });
    $('.falta').easyPieChart({
        easing: 'easeOutBounce',
        lineWidth: '6',
        barColor: '#e53935',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent));
        }
    });
}
function graphIntegrantes(idGrupo) {
    var url = "reg?tipo=asistencia&opc=lista&idgrupo=" + idGrupo;
    $.post(url, function (objJson) {
        var m = "";
        var lista = objJson.lista;
        if (lista.length > 0) {
            var contp = 0;
            for (var i = 0; i < lista.length; i++) {
                var porcen = lista[i].porcentaje;
                contp = contp + porcen;
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
                m += "<td>" + lista[i].dni + "</td>";
                m += "<td>" + lista[i].celular + "</td>";
                m += '<td class="nasis"><center><div class="progress">';
                m += '<div class="progress-bar progress-bar-' + ran + ' progress-bar-striped active" role="progressbar" style="width:' + porcen + '%">';
                m += porcen + '%</div></div></center></td>';
                m += "</tr>";
            }
            var porf = 0;
            var porcentp = Math.round(contp / lista.length);
            if (porcentp === 0) {
                porf = 0;
            } else {
                porf = 100 - porcentp;
            }
            porcGen(porcentp, porf);
            $('#conTab').empty();
            var a = createTable();
            $('#conTab').append(a);
            $("#integrantes").append(m);
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
        }
    });
}

function createTable() {
    var t = '<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable" cellspacing="0" width="100%">';
    t += '<thead>';
    t += '<tr>';
    t += '<th><center><i class="fa fa-user"></i>   Nombres y Apellidos</center></th>';
    t += '<th><center><i class="fa fa-credit-card"></i>   DNI</center></th>';
    t += '<th><center><i class="fa fa-phone"></i>   Celular</center></th>';
    t += '<th class="nasis"><center><i class="fa fa-bar-chart"></i>   Nivel de Asistencia</center></th>';
    t += '</tr>';
    t += '</thead>';
    t += '<tbody id="integrantes">';
    t += '</tbody>';
    t += '</table>';
    return t;
}