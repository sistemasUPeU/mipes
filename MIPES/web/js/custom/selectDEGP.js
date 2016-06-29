/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function listarDistrito(url, cdistrito, cescuela, cgrupo) {
    var urls = url + "distrito?opc=listar";
    $.post(urls, function (objJson) {
        var lista = objJson.lista;
        var t = "";
        for (var i = 0; i < lista.length; i++) {
            t += "<option value='" + lista[i].idDISTRITOM + "'>" + lista[i].NOMBRE + "</option>";
        }
        cdistrito.empty();
        cdistrito.append('<select title="Seleccione Distrito" class="selDis selectpicker form-control" data-live-search="true"></select>');
        $('.selDis').append(t);
        $('.selDis').addClass("selectpicker");
        $('.selDis').attr("data-live-search", true);
        $('.selectpicker').selectpicker({
            style: 'btn-success'
        });
        $('.selDis').change(function () {
            listarEscuela(url,$(this).val(),cescuela,cgrupo);
        });
    });

}
function listarEscuela(url, idDistrito, cescuela, cgrupo) {
    var urls = url + "Asistencia?opc=listes&iddistrito=" + idDistrito;
    $.post(urls, function (objJson) {
        var lista = objJson.lista;
        var t = "";
        for (var i = 0; i < lista.length; i++) {
            t += "<option value='" + lista[i].idEscuela + "'>" + lista[i].NOMBRE + "</option>";
        }
        cescuela.empty();
        cescuela.append('<select title="Seleccione Escuela Sabática" class="selEs selectpicker form-control" data-live-search="true"></select>');
        $('.selEs').empty();
        $('.selEs').append(t);
        $('.selEs').addClass("selectpicker");
        $('.selEs').attr("data-live-search", true);
        $('.selectpicker').selectpicker({
            style: 'btn-success'
        });
        $('.selEs').change(function () {
            listarGrupo(url,$(this).val(),cgrupo);
        });
    });
}

function listarGrupo(url, idEscuela, cgrupo) {
    var urls = url+"Asistencia?opc=listgru&idescuela=" + idEscuela;
    $.post(urls, function (objJson) {
        var lista = objJson.lista;
        var t = "";
        for (var i = 0; i < lista.length; i++) {
            t += "<option value='" + lista[i].idGrupo + "'>" + lista[i].NOMBRE + "</option>";
        }
        cgrupo.empty();
        cgrupo.append('<select title="Seleccione Grupo Pequeño" class="selGru selectpicker form-control" data-live-search="true"></select>');
        $('.selGru').empty();
        $('.selGru').append(t);
        $('.selGru').addClass("selectpicker");
        $('.selGru').attr("data-live-search", true);
        $('.selectpicker').selectpicker({
            style: 'btn-success'
        });
        $('.selGru').change(function () {
            selgruActions($(this));
        });

    });
}


