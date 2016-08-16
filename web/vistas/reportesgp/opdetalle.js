$(document).ready(function () {
    var rol = $("#irol").val();
    if (rol === "escuela") {
        pageEscuela();
    }
    if (rol === "iglesia") {
        pageIglesia();
    }
    if (rol === "distrito") {
        pageDistrito();
    }
    if (rol === "campo") {
        pageCampo();
    }
});

function pageEscuela() {

}
function pageIglesia() {
    $(".bescuela").attr("class", "btn btn-warning bescuela");
}
function pageDistrito() {
    $(".bescuela").attr("class", "btn btn-warning bescuela");
    $(".biglesia").attr("class", "btn btn-info biglesia");
}
function pageCampo() {
    $(".bescuela").attr("class", "btn btn-warning bescuela");
    $(".biglesia").attr("class", "btn btn-info biglesia");
    $(".bdistrito").attr("class", "btn btn-success bdistrito");
}

function modGrupo(rol) {
    $("#itipo").attr("value", "pgrupo");
    new PNotify({
        title: 'Paso 1',
        type: 'info',
        text: 'Elija un intervalo de fechas para poder ver un reporte',
        nonblock: {
            nonblock: true
        }
    });
    var selector = new customSelector($('#selContainer'));
    selector.setUrl("crud");
    if (rol === "escuela") {
        selector.loadFromGrupo($("#idEscuelaUser").val());
    }
    if (rol === "iglesia") {
        selector.loadFromEscuela($("#idIglesiaUser").val());
    }
    if (rol === "distrito") {
        selector.loadFromIglesia($("#idDistritoUser").val());
    }
    if (rol === "campo") {
        selector.loadFromDistrito($("#idCampoUser").val());
    }
    showCustomSelector(selector);
}
function modEscuela(rol) {
    $("#itipo").attr("value", "pescuela");
    new PNotify({
        title: 'Paso 1',
        type: 'info',
        text: 'Elija un intervalo de fechas para poder ver un reporte',
        nonblock: {
            nonblock: true
        }
    });
    var selector = new customSelector($('#selContainer'));
    selector.setUrl("crud");
    if (rol === "iglesia") {
        selector.loadFromEscuela($("#idIglesiaUser").val());
    }
    if (rol === "distrito") {
        selector.loadFromIglesia($("#idDistritoUser").val());
    }
    if (rol === "campo") {
        selector.loadFromDistrito($("#idCampoUser").val());
    }
    selector.loadUntilEscuela();
    showCustomSelector(selector);
}
function modIglesia(rol) {
    $("#itipo").attr("value", "piglesia");
    new PNotify({
        title: 'Paso 1',
        type: 'info',
        text: 'Elija un intervalo de fechas para poder ver un reporte',
        nonblock: {
            nonblock: true
        }
    });
    var selector = new customSelector($('#selContainer'));
    selector.setUrl("crud");
    if (rol === "distrito") {
        selector.loadFromIglesia($("#idDistritoUser").val());
    }
    if (rol === "campo") {
        selector.loadFromDistrito($("#idCampoUser").val());
    }
    selector.loadUntilIglesia();
    showCustomSelector(selector);
}
function modDistrito(rol) {
    $("#itipo").attr("value", "pdistrito");
    new PNotify({
        title: 'Paso 1',
        type: 'info',
        text: 'Elija un intervalo de fechas para poder ver un reporte',
        nonblock: {
            nonblock: true
        }
    });
    var selector = new customSelector($('#selContainer'));
    selector.setUrl("crud");
    if (rol === "campo") {
        selector.loadFromDistrito($("#idCampoUser").val());
    }
    selector.loadUntilDistrito();
    showCustomSelector(selector);
}
function validFechas() {
    var tipo = $("#itipo").val();
    var m = "";
    if (tipo === "pgrupo") {
        m = "un Grupo Pequeño";
    }
    if (tipo === "pescuela") {
        m = "una Escuela Sabática";
    }
    if (tipo === "piglesia") {
        m = "una Iglesia";
    }
    if (tipo === "pdistrito") {
        m = "un distrito";
    }
    var fi = $("#fechai").val();
    var ff = $("#fechaf").val();
    if (fi !== "" && ff !== "") {
        if (ff > fi) {
            new PNotify({
                title: 'Paso 2',
                type: 'info',
                text: 'Elija ' + m + ' y haga click en "Seleccionar"',
                nonblock: {
                    nonblock: true
                }
            });
            $("#selContainer").attr("class", "");
        } else {
            new PNotify({
                title: 'Fechas Incorrectas',
                type: 'error',
                text: 'La fecha final no puede ser menor a la fecha inicial',
                nonblock: {
                    nonblock: true
                }
            });
        }
    }
}

function getItemSelected(id, nombre) {
    $("#inom").attr("value", nombre);
    $("#ireportar").attr("class", "btn btn-success");
}

function validar() {
    var tipo = $("#itipo").val();
    var fei = $("#fechai").val();
    var fef = $("#fechaf").val();
    if (tipo === "pgrupo") {
        if ($("#selGrupo").val() > 0) {
            var idgp = $("#selGrupo").val();
            graphGrupo(idgp, fei, fef);
        }
        else {
            new PNotify({
                title: '¡Hey!',
                type: 'error',
                text: 'Debe escoger un Grupo Pequeño',
                nonblock: {
                    nonblock: true
                }
            });
        }
    }
    if (tipo === "pescuela") {
        if ($("#selEscuela").val() > 0) {
            var ides = $("#selEscuela").val();
            graphEscuela(ides, fei, fef);
        } else {
            new PNotify({
                title: '¡Hey!',
                type: 'error',
                text: 'Debe escoger una Escuela Sabática',
                nonblock: {
                    nonblock: true
                }
            });
        }
    }
    if (tipo === "piglesia") {
        if ($("#selIglesia").val() > 0) {
            var idig = $("#selIglesia").val();
            graphIglesia(idig, fei, fef);
        }
        else {
            new PNotify({
                title: '¡Hey!',
                type: 'error',
                text: 'Debe escoger una Iglesia',
                nonblock: {
                    nonblock: true
                }
            });
        }
    }
    if (tipo === "pdistrito") {
        if ($("#selDistrito").val() > 0) {
            graphDistrito();
        } else {
            new PNotify({
                title: '¡Hey!',
                type: 'error',
                text: 'Debe escoger un Distrito Misionero',
                nonblock: {
                    nonblock: true
                }
            });
        }
    }
}

function graphGrupo(id, fi, ff) {
    var url = "rep?opc=reportgp&op=1";
    var data = "";
    data += "idgrupo=" + id;
    data += "&fechai=" + fi;
    data += "&fechaf=" + ff;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            $("#titulo").empty();
            $("#titulo").append("Reporte del Grupo Pequeño "+$("#inom").val());
            $(".modal").modal('hide');
            $("#contButtons").attr("class", "hidden");
            $(".advice").attr("class", "alert alert-info alert-dismissible fade in advice hidden");
            dataFechas(fi, ff);
            $(".contenedor").empty();
            if (document.getElementById('body').offsetWidth > 696) {
                var c = createCont("grupo");
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
                        subtext: 'Grupo Pequeño ' + $("#inom").val()
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
                var m = createGraphPie("grupo");
                $(".contenedorM").append(m);
                var tot = cpre + cfal;
                var porp = Math.round(cpre * 100 / tot);
                var porf = Math.round(cfal * 100 / tot);
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
                var c = createContM("grupo");
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
                var m = createGraphPie("grupo");
                $(".contenedorM").append(m);
                var tot = cpre + cfal;
                var porp = Math.round(cpre * 100 / tot);
                var porf = Math.round(cfal * 100 / tot);
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
                title: 'Sin Registros',
                type: 'warning',
                text: 'Este Grupo Pequeño no tiene registros de asistencia entre las fechas indicadas',
                nonblock: {
                    nonblock: true
                }
            });
        }
    });
}

function graphEscuela(id, fi, ff) {
    var url = "rep?opc=reportgp&op=2";
    var data = "";
    data += "idescuela=" + id;
    data += "&fechai=" + fi;
    data += "&fechaf=" + ff;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            $("#titulo").empty();
            $("#titulo").append("Reporte de la Escuela Sabática "+$("#inom").val());
            dataFechas(fi, ff);
            $(".modal").modal('hide');
            $("#contButtons").attr("class", "hidden");
            $(".advice").attr("class", "alert alert-info alert-dismissible fade in advice hidden");
            if (document.getElementById('body').offsetWidth > 696) {
                var url = "crud?ent=intgp&opc=7";
                var data = "";
                data += "idescuela=" + id;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        $(".contenedorM").empty();
                        var c = createGraphPie(1);
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
            } else {
                var url = "crud?ent=intgp&opc=7";
                var data = "";
                data += "idescuela=" + id;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        $(".contenedorM").empty();
                        var c = createGraphPie(2);
                        $(".contenedorM").append(c);
                        var datos = [];
                        var data = {};
                        var contm = 0;
                        var porp = 0;
                        var gp = "";
                        for (var i = 0; i < lista.length; i++) {
                            contm = contm + lista[i].miembros;
                        }
                        for (var i = 0; i < lista.length; i++) {
                            porp = lista[i].miembros * 100 / contm;
                            gp = lista[i].grupo;
                            data = {label: gp, value: porp};
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
            $(".contenedor").empty();
            var c = createCont("escuela");
            $(".contenedor").append(c);
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
                title: '¡Hey!',
                type: 'warning',
                text: 'Los Grupos Pequeños de la Escuela Sabática ' + $("#inom").val() + ' no han registrado asistencia entre estas fechas',
                nonblock: {
                    nonblock: true
                }
            });
        }
    });
}

function graphIglesia(id, fi, ff) {
    var url = "rep?opc=reportgp&op=3";
    var data = "";
    data += "idiglesia=" + id;
    data += "&fechai=" + fi;
    data += "&fechaf=" + ff;
    $.post(url, data, function (objJson) {
        var lista = objJson.lista;
        if (lista.length > 0) {
            $("#titulo").empty();
            $("#titulo").append("Reporte de la Iglesia "+$("#inom").val());
            dataFechas(fi, ff);
            $(".modal").modal('hide');
            $("#contButtons").attr("class", "hidden");
            $(".advice").attr("class", "alert alert-info alert-dismissible fade in advice hidden");
            if (document.getElementById('body').offsetWidth > 696) {
                var url = "crud?ent=intgp&opc=8";
                var data = "";
                data += "idiglesia=" + id;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        $(".contenedorM").empty();
                        var c = createGraphPie(1);
                        $(".contenedorM").append(c);
                        var escuelas = [];
                        var datos = [];
                        var data = {};
                        for (var i = 0; i < lista.length; i++) {
                            escuelas[i] = lista[i].escuela;
                            data = {value: lista[i].miembros, name: lista[i].escuela};
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
                                data: escuelas
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
                                    name: 'Porcentaje',
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
            } else {
                var url = "crud?ent=intgp&opc=8";
                var data = "";
                data += "idiglesia=" + id;
                $.post(url, data, function (objJson) {
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        $(".contenedorM").empty();
                        var c = createGraphPie(2);
                        $(".contenedorM").append(c);
                        var datos = [];
                        var data = {};
                        var contm = 0;
                        var porp = 0;
                        var gp = "";
                        for (var i = 0; i < lista.length; i++) {
                            contm = contm + lista[i].miembros;
                        }
                        for (var i = 0; i < lista.length; i++) {
                            porp = lista[i].miembros * 100 / contm;
                            gp = lista[i].escuela;
                            data = {label: gp, value: porp};
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
            $(".advice").attr("class", "hidden");
            $(".contenedor").empty();
            var c = createCont("iglesia");
            $(".contenedor").append(c);
            var pres = 0;
            var tot = 0;
            var datos = [];
            var data = {};
            var porcen = 0;
            for (var i = 0; i < lista.length; i++) {
                pres = lista[i].presentes;
                tot = lista[i].total;
                porcen = Math.round(pres * 100 / tot);
                data = {escuela: lista[i].escuela, porcentaje: porcen};
                datos.push(data);
            }
            Morris.Bar({
                element: 'graph_bar',
                data: datos,
                xkey: 'escuela',
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
                text: "Los Grupos Pequeños de la Iglesia " + $("#inom").val() + " no han registrado asistencia entre las fechas indicadas",
                nonblock: {
                    nonblock: true
                }
            });
        }
    });
}

function createCont(tipo) {
    var g = "";
    if (tipo === "grupo") {
        g += '<div class="col-md-9 col-sm-12 col-xs-12">';
    } else {
        g += '<div class="col-md-6 col-sm-12 col-xs-12">';
    }
    g += '<div class="x_panel">';
    g += '<div class="x_title">';
    g += '<h2><i class="fa fa-bar-chart-o"></i>   Asistencia por fechas</h2>';
    g += '<div class="clearfix"></div>';
    g += '</div>';
    g += '<div class="x_content">';
    if (tipo === "grupo") {
        g += '<div id="echart_line" style="height:350px;"></div>';
    } else {
        g += '<div id="graph_bar" style="height:280px;"></div>';
    }
    g += '</div>';
    g += '</div>';
    g += '</div>';
    return g;
}

function createContM(tipo) {
    var g = '<div class="col-md-12 col-sm-12 col-xs-12">';
    g += '<div class="x_panel">';
    g += '<div class="x_title">';
    g += '<h2><i class="fa fa-bar-chart-o"></i>   Asistencia</h2>';
    g += '<div class="clearfix"></div>';
    g += '</div>';
    g += '<div class="x_content1">';
    if (tipo === "grupo") {
        g += '<div id="graph_bar_group" style="width:100%; height:280px;"></div>';
    } else {
        g += '<div id="graph_bar" style="height:280px;"></div>';
    }
    g += '</div>';
    g += '</div>';
    g += '</div>';
    return g;
}

function createGraphPie(tipo) {
    var g = "";
    if (tipo === 1) {
        g += '<div class="col-md-6 col-sm-6 col-xs-12">';
    } else {
        g += '<div class="col-md-3 col-sm-3 col-xs-12">';
    }
    g += '<div class="x_panel">';
    g += '<div class="x_title">';
    g += '<h2><i class="fa fa-pie-chart"></i>   Asistencia</h2>';
    g += '<div class="clearfix"></div>';
    g += '</div>';
    if (tipo === 1) {
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
    $(".cfechas").attr("class", "alert alert-info alert-dismissible fade in cfechas");
    $("#textfec").empty();
    $("#textfec").append("Reporte de asistencias entre el "+di+" y el "+dif+"");
}