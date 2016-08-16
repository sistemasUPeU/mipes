$(document).ready(function () {
    $("#titulo").append($("#nGrupoUser").val());
    dataCalendar();
});

function dataCalendar() {
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
            'Hace una semana': [moment().subtract(6, 'days'), moment()],
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

function graficar(fxa, fxb) {
    var id = $("#idGrupoUser").val();
    var url = "rep?opc=reportgp&op=1";
    var data = "";
    data += "idgrupo=" + id;
    data += "&fechai=" + fxa;
    data += "&fechaf=" + fxb;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            dataFechas(fxa, fxb);
            $(".advice").attr("class", "hidden");
            $(".contenedor").empty();
            if (document.getElementById('body').offsetWidth > 696) {
                var c = createCont();
                $(".contenedor").append(c);
                var fechas = [];
                var pres = [];
                var falt = [];
                var vis = [];
                var cpre = 0;
                var cfal = 0;
                for (var i = 0; i < lista.length; i++) {
                    var fecha = lista[i].fecha;
                    var orf = fecha.split("-");
                    var dia = orf[2];
                    var mes = orf[1];
                    var an = orf[0];
                    var fecenv = dia + "/" + mes + "/" + an;
                    fechas[i] = fecenv;
                    pres[i] = lista[i].presentes;
                    falt[i] = lista[i].faltas;
                    vis[i] = lista[i].visitas;
                    cpre = cpre + lista[i].presentes;
                    cfal = cfal + lista[i].faltas;
                }
                var myChart = echarts.init(document.getElementById('echart_line'), theme);
                myChart.setOption({
                    title: {
                        text: 'Asistencia',
                        subtext: 'Grupo Pequeño ' + $("#nGrupoUser").val()
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['Presentes', 'Faltas', 'Visitas']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            magicType: {
                                show: true,
                                type: ['line', 'bar', 'stack', 'tiled']
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
                    xAxis: [{
                            type: 'category',
                            boundaryGap: false,
                            data: fechas
                        }],
                    yAxis: [{
                            type: 'value'
                        }],
                    series: [{
                            name: 'Visitas',
                            type: 'line',
                            smooth: true,
                            itemStyle: {
                                normal: {
                                    areaStyle: {
                                        type: 'default'
                                    }
                                }
                            },
                            data: vis
                        }, {
                            name: 'Faltas',
                            type: 'line',
                            smooth: true,
                            itemStyle: {
                                normal: {
                                    areaStyle: {
                                        type: 'default'
                                    }
                                }
                            },
                            data: falt
                        }, {
                            name: 'Presentes',
                            type: 'line',
                            smooth: true,
                            itemStyle: {
                                normal: {
                                    areaStyle: {
                                        type: 'default'
                                    }
                                }
                            },
                            data: pres
                        }]
                });
                $(".contenedorM").empty();
                var m = createGraphPie();
                $(".contenedorM").append(m);
                var tot=cpre+cfal;
                var porp=Math.round(cpre*100/tot);
                var porf=Math.round(cfal*100/tot);
                Morris.Donut({
                    element: 'graph_donut',
                    data: [
                        {label: 'Presentes', value: porp},
                        {label: 'Faltas', value: porf}
                    ],
                    colors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                    formatter: function (y) {
                        return y + "%";
                    },
                    resize: true
                });
            } else {
                var c = createContM();
                $(".contenedor").append(c);
                var fechas = [];
                var datos = [];
                var data = {};
                var cpre = 0;
                var cfal = 0;
                for (var i = 0; i < lista.length; i++) {
                    var fecha = lista[i].fecha;
                    var orf = fecha.split("-");
                    var dia = orf[2];
                    var mes = orf[1];
                    var an = orf[0];
                    var fecenv = dia + "/" + mes + "/" + an;
                    cpre = cpre + lista[i].presentes;
                    cfal = cfal + lista[i].faltas;
                    data = {"fecha": fecenv, "presentes": lista[i].presentes, "faltas": lista[i].faltas, "visitas": lista[i].visitas};
                    datos.push(data);
                }
                Morris.Bar({
                    element: 'graph_bar_group',
                    data: datos,
                    xkey: 'fecha',
                    barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                    ykeys: ['presentes', 'faltas', 'visitas'],
                    labels: ['Presentes', 'Faltas', 'Visitas'],
                    hideHover: 'auto',
                    xLabelAngle: 60,
                    resize: true
                });
                $(".contenedorM").empty();
                var m = createGraphPie();
                $(".contenedorM").append(m);
                var tot=cpre+cfal;
                var porp=Math.round(cpre*100/tot);
                var porf=Math.round(cfal*100/tot);
                Morris.Donut({
                    element: 'graph_donut',
                    data: [
                        {label: 'Presentes', value: porp},
                        {label: 'Faltas', value: porf}
                    ],
                    colors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
                    formatter: function (y) {
                        return y + "%";
                    },
                    resize: true
                });
            }
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

function createCont() {
    var g = '<div class="col-md-9 col-sm-12 col-xs-12">';
    g += '<div class="x_panel">';
    g += '<div class="x_title">';
    g += '<h2><i class="fa fa-bar-chart-o"></i>   Asistencia por fechas</h2>';
    g += '<div class="clearfix"></div>';
    g += '</div>';
    g += '<div class="x_content">';
    g += '<div id="echart_line" style="height:350px;"></div>';
    g += '</div>';
    g += '</div>';
    g += '</div>';
    return g;
}

function createContM() {
    var g = '<div class="col-md-12 col-sm-12 col-xs-12">';
    g += '<div class="x_panel">';
    g += '<div class="x_title">';
    g += '<h2><i class="fa fa-bar-chart-o"></i>   Asistencia</h2>';
    g += '<div class="clearfix"></div>';
    g += '</div>';
    g += '<div class="x_content1">';
    g += '<div id="graph_bar_group" style="width:100%; height:280px;"></div>';
    g += '</div>';
    g += '</div>';
    g += '</div>';
    return g;
}

function createGraphPie() {
    var g = '<div class="col-md-3 col-sm-3 col-xs-12">';
    g += '<div class="x_panel">';
    g += '<div class="x_title">';
    g += '<h2><i class="fa fa-pie-chart"></i>   Asistencia</h2>';
    g += '<div class="clearfix"></div>';
    g += '</div>';
    g += '<div class="x_content2">';
    g += '<div id="graph_donut" style="width:100%; height:300px;"></div>';
    g += '</div>';
    g += '</div>';
    g += '</div>';
    return g;
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
    $("#ifechas").empty();
    $("#ifechas").append("<i class='fa fa-bar-chart-o'></i>   Reporte de Asistencias entre " + di + " y " + dif + "");
}