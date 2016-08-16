$(document).ready(function () {
    $("#titulo").append($("#nEscuelaUser").val());
    activeCalendar();
});

function activeCalendar() {
    var cb = function (start, end, label) {
        var fi = start.toISOString();
        var feci = "";
        var ff = end.toISOString();
        var fecf = "";
        for (var i = 0; i < 10; i++) {
            feci = feci + fi[i];
        }
        ;
        for (var i = 0; i < 10; i++) {
            fecf = fecf + ff[i];
        }
        ;
        graficar(feci, fecf);
        console.log(start.toISOString(), end.toISOString(), label);
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    };
    var optionSet1 = {
        startDate: moment().subtract(29, 'days'),
        endDate: moment(),
        minDate: '01/06/2016',
        maxDate: '12/31/2030',
        dateLimit: {
            days: 60
        },
        showDropdowns: true,
        showWeekNumbers: true,
        timePicker: false,
        timePickerIncrement: 1,
        timePicker12Hour: false,
        ranges: {
            'Hoy': [moment(), moment()],
            'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Esta Semana': [moment().subtract(6, 'days'), moment()],
            'Hace un mes': [moment().subtract(29, 'days'), moment()],
            'Este mes': [moment().startOf('month'), moment().endOf('month')],
            'Mes pasado': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        opens: 'left',
        buttonClasses: ['btn btn-primary'],
        applyClass: 'btn-large btn-success',
        cancelClass: 'btn-default',
        format: 'MM/DD/YYYY',
        separator: ' to ',
        locale: {
            applyLabel: 'Aceptar',
            cancelLabel: 'Limpiar',
            fromLabel: 'De',
            toLabel: 'A',
            customRangeLabel: '<i class="fa fa-search"></i>   Escoger Intervalo',
            daysOfWeek: ['D', 'L', 'Ma', 'Mi', 'J', 'V', 'S'],
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            firstDay: 1
        }
    };
    $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
    $('#reportrange').daterangepicker(optionSet1, cb);
    $('#reportrange').on('show.daterangepicker', function () {
        console.log("show event fired");
    });
    $('#reportrange').on('hide.daterangepicker', function () {
        console.log("hide event fired");
    });
    $('#reportrange').on('apply.daterangepicker', function (ev, picker) {
        console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
    });
    $('#reportrange').on('cancel.daterangepicker', function (ev, picker) {
        console.log("cancel event fired");
    });
    $('#options1').click(function () {
        $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
    });
    $('#options2').click(function () {
        $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
    });
    $('#destroy').click(function () {
        $('#reportrange').data('daterangepicker').remove();
    });
}
function graficar(feci, fecf) {
    var id = $("#idEscuelaUser").val();
    var url = "rep?opc=reportgp&op=2";
    var data = "";
    data += "idescuela=" + id;
    data += "&fechai=" + feci;
    data += "&fechaf=" + fecf;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            if (document.getElementById('body').offsetWidth > 696) {
                graphM();
            } else {
                graphMb();
            }
            $(".advice").attr("class", "hidden");
            $(".contenedor").empty();
            var c = createGraph();
            $(".contenedor").append(c);
            dataFechas(feci, fecf);
            var pres = 0;
            var tot = 0;
            var datos = [];
            var data = {};
            var porcen = 0;
            for (var i = 0; i < lista.length; i++) {
                pres = lista[i].presentes;
                tot = lista[i].presentes + lista[i].faltas;
                porcen = Math.round(pres * 100 / tot);
                data = {grupo: lista[i].grupo, porcentaje: porcen};
                datos.push(data);
            }
            Morris.Bar({
                element: 'graph_bar',
                data: datos,
                xkey: 'grupo',
                ykeys: ['porcentaje'],
                labels: ['Porcentaje'],
                barRatio: 0.4,
                barColors: ['#34495E'],
                xLabelAngle: 35,
                hideHover: 'auto',
                resize: true
            });

        } else {
            new PNotify({
                title: "Sin Registros",
                type: "warning",
                text: "No hay registro de asistencias entre estas fechas, intentalo otra vez",
                nonblock: {
                    nonblock: true
                }
            });
            $(".advice").attr("class", "alert alert-danger advice");
            $("#iadvice").attr("class", "fa fa-warning");
        }
    });
}

function createGraph() {
    var g = '<div class="col-md-6 col-sm-6 col-xs-12">';
    g += '<div class="x_panel">';
    g += '<div class="x_title">';
    g += '<h2><i class="fa fa-bar-chart-o"></i>   Porcentaje de Asistencia</h2>';
    g += '<div class="clearfix"></div>';
    g += '</div>';
    g += '<div class="x_content">';
    g += '<div id="graph_bar" style="height:280px;"></div>';
    g += '</div>';
    g += '</div>';
    g += '</div>';
    return g;
}
function createGM(m) {
    var g = '<div class="col-md-6 col-sm-6 col-xs-12">';
    g += '<div class="x_panel">';
    g += '<div class="x_title">';
    g += '<h2><i class="fa fa-pie-chart"></i>   Miembros Actuales de ' + $("#nEscuelaUser").val() + '</h2>';
    g += '<div class="clearfix"></div>';
    g += '</div>';
    if (m == 1) {
        g += '<div class="x_content">';
        g += '<div id="echart_pie2" style="height:350px;"></div>';
        g += '</div>';
    } else {
        g += '<div class="x_content2">';
        g += '<div id="graph_donut" style="width:100%; height:300px;"></div>';
        g += '</div>';
    }
    g += '</div>';
    g += '</div>';
    return g;
}

function graphM() {
    var id = $("#idEscuelaUser").val();
    var url = "crud?ent=intgp&opc=7";
    var data = "";
    data += "idescuela=" + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            $(".contenedorM").empty();
            var c = createGM(1);
            $(".contenedorM").append(c);
            var grupos = [];
            var datos = [];
            var data = {};
            for (var i = 0; i < lista.length; i++) {
                grupos[i] = lista[i].grupo;
                data = {value: lista[i].miembros, name: lista[i].grupo};
                datos.push(data);
            }
            var myChart = echarts.init(document.getElementById('echart_pie2'), theme);
            myChart.setOption({
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    x: 'center',
                    y: 'bottom',
                    data: grupos
                },
                toolbox: {
                    show: true,
                    feature: {
                        magicType: {
                            show: true,
                            type: ['pie', 'funnel']
                        },
                        restore: {
                            show: true
                        },
                        saveAsImage: {
                            show: true
                        }
                    }
                },
                calculable: true,
                series: [{
                        name: 'Area Mode',
                        type: 'pie',
                        radius: [25, 90],
                        center: ['50%', 170],
                        roseType: 'area',
                        x: '50%',
                        max: 40,
                        sort: 'ascending',
                        data: datos
                    }]
            });
        }
    });
}

function graphMb() {
    var id = $("#idEscuelaUser").val();
    var url = "crud?ent=intgp&opc=7";
    var data = "";
    data += "idescuela=" + id;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            $(".contenedorM").empty();
            var c = createGM(2);
            $(".contenedorM").append(c);
            var datos = [];
            var data = {};
            var contm = 0;
            var porp = 0;
            var gp="";
            for (var i = 0; i < lista.length; i++) {
                contm = contm + lista[i].miembros;
            }
            for (var i = 0; i < lista.length; i++) {
                porp = lista[i].miembros * 100 / contm;
                gp=lista[i].grupo;
                data = {label: gp,value: porp};
                datos.push(data);
            }
            Morris.Donut({
                element: 'graph_donut',
                data: datos,
                colors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                formatter: function (y) {
                    return y + "%";
                },
                resize: true
            });
        }
    });

}

function dataFechas(fechai, fechaf) {
    var meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
    var fi = fechai.split("-");
    var dia = fi[2];
    var mes = fi[1];
    var di = dia + " de " + meses[mes - 1];
    var ff = fechaf.split("-");
    var diaf = ff[2];
    var mesf = ff[1];
    var dif = diaf + " de " + meses[mesf - 1];
    $(".fec").attr("class", "alert alert-info fec");
    $("#fechas").empty();
    $("#fechas").append("<i class='fa fa-bar-chart-o'></i>   Reporte de Asistencias entre " + di + " y " + dif + "");
}