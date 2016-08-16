$(document).ready(function () {
    $("#titulo").append($("#nMinisterioUser").val());
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
            'Semana pasada': [moment().subtract(6, 'days'), moment()],
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
});
function graficar(fxa, fxb) {
    var id = $("#idMinisterioUser").val();
    var url = "rep?opc=reportmin&op=1";
    var data = "";
    data += "idministerio=" + id;
    data += "&fechai=" + fxa;
    data += "&fechaf=" + fxb;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            $(".cM").attr("class", "col-md-6 col-sm-6 col-xs-12");
            $(".advice").attr("class", "hidden");
            $(".contenedor").empty();
            var c = createCont();
            $(".contenedor").append(c);
            $(".contenedorP").empty();
            var cp = createContP();
            $(".contenedorP").append(cp);
            var fechas = [];
            var pres = [];
            var falt = [];
            var ben = [];
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
                ben[i] = lista[i].beneficiarios;
                cpre = cpre + lista[i].presentes;
                cfal = cfal + lista[i].faltas;
            }
            var myChart = echarts.init(document.getElementById('echart_line'), theme);
            myChart.setOption({
                title: {
                    text: 'Asistencia',
                    subtext: 'Ministerio ' + $("#nMinisterioUser").val()
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['Presentes', 'Faltas', 'Beneficiarios']
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
                        name: 'Beneficiarios',
                        type: 'line',
                        smooth: true,
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data: ben
                    }, {
                        name: 'Faltas',
                        type: 'line',
                        smooth: true,
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data: falt
                    }, {
                        name: 'Presentes',
                        type: 'line',
                        smooth: true,
                        itemStyle: {normal: {areaStyle: {type: 'default'}}},
                        data: pres
                    }]
            });
            var dataStyle = {
                normal: {
                    label: {
                        show: false
                    },
                    labelLine: {
                        show: false
                    }
                }
            };
            var placeHolderStyle = {
                normal: {
                    color: 'rgba(0,0,0,0)',
                    label: {
                        show: false
                    },
                    labelLine: {
                        show: false
                    }
                },
                emphasis: {
                    color: 'rgba(0,0,0,0)'
                }
            };

            var tot = cpre + cfal;
            var porpre = 0;
            var porfal = 0;
            porpre = Math.round(cpre * 100 / tot);
            porfal = Math.round(cfal * 100 / tot);
            Morris.Donut({
                element: 'graph_donut',
                data: [
                    {label: 'Presentes', value: porpre},
                    {label: 'Faltas', value: porfal}
                ],
                colors: ['#26B99A', '#34495E'],
                formatter: function (y) {
                    return y + "%";
                },
                resize: true
            });
        } else {
            swal("¡Sin Registros!", "No hay registros de asistencia al Trabajo Misionero entre estas fechas", "warning");
        }
    });
}

function createCont() {
    var c = '<div class="col-md-6 col-sm-6 col-xs-12" style="width: 70%;">';
    c += '<div class="x_panel">';
    c += '<div class="x_title">';
    c += '<h2><i class="fa fa-line-chart"></i>   Asistencia del Ministerio</h2>';
    c += '<div class="clearfix"></div>';
    c += '</div>';
    c += '<div class="x_content">';
    c += '<div id="echart_line" style="height:350px;"></div>';
    c += '</div>';
    c += '</div>';
    c += '</div>';
    return c;
}
function createContP() {
    var c = '<div class="col-md-6 col-sm-6 col-xs-12" style="width: 30%;">';
    c += '<div class="x_panel">';
    c += '<div class="x_title">';
    c += '<h2><i class="fa fa-pie-chart"></i>   Porcentaje</h2>';
    c += '<div class="clearfix"></div>';
    c += '</div>';
    c += '<div class="x_content2">';
    c += '<div id="graph_donut" style="width:100%; height:300px;"></div>';
    c += '</div>';
    c += '</div>';
    c += '</div>';
    return c;
}

