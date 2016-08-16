/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function customSelector(container) {
    this.container = container;
    this.campo = true;
    this.distrito = true;
    this.iglesia = true;
    this.escuela = true;
    this.grupo = true;
    this.idCampo = -1;
    this.idDistrito = -1;
    this.idIglesia = -1;
    this.idEscuela = -1;
    this.idGrupo = -1;
    this.nombreCampo = "";
    this.nombreDistrito = "";
    this.nombreIglesia = "";
    this.nombreEscuela = "";
    this.nombreGrupo = "";
    this.urls = "";
    this.postParam = "";
    this.postResult = "";
    this.enableCampo = function () {
        this.campo = true;
    };
    this.enableDistrito = function () {
        this.distrito = true;
    };
    this.enableIglesia = function () {
        this.iglesia = true;
    };
    this.enableEscuela = function () {
        this.escuela = true;
    };
    this.enableGrupo = function () {
        this.grupo = true;
    };
    this.disableCampo = function () {
        this.campo = false;
    };
    this.disableDistrito = function () {
        this.distrito = false;
    };
    this.disableIglesia = function () {
        this.iglesia = false;
    };
    this.disableEscuela = function () {
        this.escuela = false;
    };
    this.disableGrupo = function () {
        this.grupo = false;
    };
    this.setContainer = function (container) {
        this.container = container;
    };
    this.setUrl = function (urls) {
        this.urls = urls;
    };

    this.loadFromCampo = function () {
        this.campo = true;
        this.distrito = true;
        this.iglesia = true;
        this.escuela = true;
        this.grupo = true;
    };
    this.loadFromDistrito = function (idCampo) {
        this.campo = false;
        this.distrito = true;
        this.iglesia = true;
        this.escuela = true;
        this.grupo = true;
        this.idCampo = idCampo;
    };
    this.loadFromIglesia = function (idDistrito) {
        this.campo = false;
        this.distrito = false;
        this.iglesia = true;
        this.escuela = true;
        this.grupo = true;
        this.idDistrito = idDistrito;
    };
    this.loadFromEscuela = function (idIglesia) {
        this.campo = false;
        this.distrito = false;
        this.iglesia = false;
        this.escuela = true;
        this.grupo = true;
        this.idIglesia = idIglesia;
    };
    this.loadFromGrupo = function (idEscuela) {
        this.campo = false;
        this.distrito = false;
        this.iglesia = false;
        this.escuela = false;
        this.grupo = true;
        this.idEscuela = idEscuela;
    };
    
    this.loadUntilCampo=function(){
        this.distrito=false;
        this.iglesia = false;
        this.escuela = false;
        this.grupo = false;
    };    
    this.loadUntilDistrito= function (){
        this.iglesia = false;
        this.escuela = false;
        this.grupo = false;
    };
    this.loadUntilIglesia= function (){
        this.escuela = false;
        this.grupo = false;
    };
    this.loadUntilEscuela= function (){
        this.grupo = false;
    };
    this.clearFromCampo = function () {
        this.idDistrito = -1;
        this.idIglesia = -1;
        this.idEscuela = -1;
        this.idGrupo = -1;
    };
    this.clearFromDistrito = function () {
        this.idIglesia = -1;
        this.idEscuela = -1;
        this.idGrupo = -1;
    };
    this.clearFromIglesia = function () {
        this.idEscuela = -1;
        this.idGrupo = -1;
    };
    this.clearFromEscuela = function () {
        this.idGrupo = -1;
    };

    this.loadCampo = function () {
        this.postParam = "ent=selector&opc=1";
        this.loadPostRequest("Campo", $('#selCampo'));
    };
    this.loadDistrito = function (idCampo) {
        if (idCampo > 0) {
            this.postParam = "ent=selector&opc=2&idcampo=" + idCampo;
            this.loadPostRequest("Distrito", $('#selDistrito'));
        } else {
            $('#selDistrito').empty();
            $('#selDistrito').append(this.getSelectMessage("Campo"));
        }
    };
    this.loadIglesia = function (idDistrito) {
        if (idDistrito > 0) {
            this.postParam = "ent=selector&opc=3&iddistrito=" + idDistrito;
            this.loadPostRequest("Iglesia", $('#selIglesia'));
        } else {
            $('#selIglesia').empty();
            $('#selIglesia').append(this.getSelectMessage("Distrito"));
        }
    };
    this.loadEscuela = function (idIglesia) {
        if (idIglesia > 0) {
            this.postParam = "ent=selector&opc=4&idiglesia=" + idIglesia;
            this.loadPostRequest("Escuela Sabática", $('#selEscuela'));
        } else {
            $('#selEscuela').empty();
            $('#selEscuela').append(this.getSelectMessage("Iglesia"));
        }

    };
    this.loadGrupo = function (idEscuela) {
        if (idEscuela > 0) {
            this.postParam = "ent=selector&opc=5&idescuela=" + idEscuela;
            this.loadPostRequest("Grupo Pequeño", $('#selGrupo'));
        } else {
            $('#selGrupo').empty();
            $('#selGrupo').append(this.getSelectMessage("Escuela Sabática"));
        }
    };

    this.loadPostRequest = function (name, select) {
        this.postResult = "";
        $.post(this.urls, this.postParam, function (objJson) {
            var lista = objJson.lista;
            if (lista !== undefined) {
                this.postResult += "<option value='0'>[Seleccione " + name + "]</option>";
                for (var i = 0; i < lista.length; i++) {
                    this.postResult += "<option value='" + lista[i].id + "'>" + lista[i].nombre + "</option>";
                }
            } else {
                this.postResult += "<option value='0'>[No ha registrado " + name + "]</option>";
            }
            select.empty();
            select.append(this.postResult);
        });
    };

    this.getSelectMessage = function (parent) {
        return "<option value='0'>[Seleccione " + parent + "]</option>";
    };
    this.getConstructor = function () {
        var t = '<div class="panel panel-default">';
        t += '<div class="panel-heading">Selector</div>';
        t += '<div class="panel-body" id="panelSelectorBody">';
        t += '</div>';
        t += '<div class="panel-footer">';
        t += '<div class="row">';
        t += '<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">';
        t += '<input type="button" class="btn btn-default pull-left" id="btnClearSelection" value="Limpiar">';
        t += '<input type="button" class="btn btn-primary pull-right" id="btnSelectGroup" value="Seleccionar">';
        t += '</div>';
        t += '</div>';
        t += '</div>';
        t += '</div>';
        return t;
    };
    this.getCampoConstructor = function () {
        var t = '<div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12" id="contCampo">';
        t += '<div class="form-group">';
        t += '<label>Campo:</label>';
        t += '<select class="form-control" id="selCampo"></select>';
        t += '</div>';
        t += '</div>';
        return t;
    };
    this.getDistritoConstructor = function () {
        var t = '<div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12" id="contDistrito">';
        t += '<div class="form-group">';
        t += '<label>Distrito:</label>';
        t += '<select class="form-control" id="selDistrito"></select>';
        t += '</div>';
        t += '</div>';
        return t;
    };
    this.getIglesiaConstructor = function () {
        var t = '<div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12" id="contIglesia">';
        t += '<div class="form-group">';
        t += '<label>Iglesia:</label>';
        t += '<select class="form-control" id="selIglesia"></select>';
        t += '</div>';
        t += '</div>';
        return t;
    };
    this.getEscuelaConstructor = function () {
        var t = '<div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12" id="contEscuela">';
        t += '<div class="form-group">';
        t += '<label>Escuela:</label>';
        t += '<select class="form-control" id="selEscuela"></select>';
        t += '</div>';
        t += '</div>';
        return t;
    };
    this.getGrupoConstructor = function () {
        var t = '<div class="col col-lg-4 col-md-4 col-sm-6 col-xs-12" id="contGrupo">';
        t += '<div class="form-group">';
        t += '<label>Grupo:</label>';
        t += '<select class="form-control" id="selGrupo"></select>';
        t += '</div>';
        t += '</div>';
        return t;
    };
}

function showCustomSelector(selector) {
    //selector = new customSelector();
    selector.container.empty();
    selector.container.append(selector.getConstructor());
    if (selector.campo) {
        $('#panelSelectorBody').append(selector.getCampoConstructor());
        selector.loadCampo();
    }
    if (selector.distrito) {
        $('#panelSelectorBody').append(selector.getDistritoConstructor());
        selector.loadDistrito(selector.idCampo);
    }
    if (selector.iglesia) {
        $('#panelSelectorBody').append(selector.getIglesiaConstructor());
        selector.loadIglesia(selector.idDistrito);
    }
    if (selector.escuela) {
        $('#panelSelectorBody').append(selector.getEscuelaConstructor());
        selector.loadEscuela(selector.idIglesia);
    }
    if (selector.grupo) {
        $('#panelSelectorBody').append(selector.getGrupoConstructor());
        selector.loadGrupo(selector.idEscuela);
    }

    $('#selCampo').change(function () {
        selector.clearFromCampo();
        selector.idCampo = $(this).val();
        selector.nombreCampo=$('#selCampo option:selected').text();
        if (selector.distrito) {
            selector.loadDistrito($(this).val());
        }else{
            getItemSelected(selector.idCampo,selector.nombreCampo);
        }
    });
    $('#selDistrito').change(function () {
        selector.clearFromDistrito();
        selector.idDistrito = $(this).val();
        selector.nombreDistrito=$('#selDistrito option:selected').text();;
        if (selector.iglesia) {
            selector.loadIglesia($(this).val());
        }else{
            getItemSelected(selector.idDistrito,selector.nombreDistrito);
        }
    });
    $('#selIglesia').change(function () {
        selector.clearFromIglesia();
        selector.idIglesia = $(this).val();
        selector.nombreIglesia=$('#selIglesia option:selected').text();
        if (selector.escuela) {
            selector.loadEscuela($(this).val());
        }else{
            getItemSelected(selector.idIglesia,selector.nombreIglesia);
        }
    });
    $('#selEscuela').change(function () {
        selector.clearFromEscuela();
        selector.idEscuela = $(this).val();
        selector.nombreEscuela=$('#selEscuela option:selected').text();
        if (selector.grupo) {
            selector.loadGrupo($(this).val());
        }else{
            getItemSelected(selector.idEscuela,selector.nombreEscuela);
        }
    });
    $('#selGrupo').change(function () {
        selector.idGrupo = $(this).val();
        selector.nombreGrupo=$('#selGrupo option:selected').text();
    });

    $('#btnClearSelection').click(function () {
        selector.clearFromCampo();
        showCustomSelector(selector);
        onClearCustomSelector();
    });

    $('#btnSelectGroup').click(function () {
        if (selector.grupo) {
            if (selector.idGrupo > 0) {
                getItemSelected(selector.idGrupo, selector.nombreGrupo);
            } else {
                infoMessage("Debe seleccionar un Grupo");
            }
        } else if (selector.escuela) {
            if (selector.idEscuela > 0) {
                getItemSelected(selector.idEscuela, selector.nombreEscuela);
            } else {
                infoMessage("Debe seleccionar una Escuela Sabática");
            }
        } else if (selector.iglesia) {
            if (selector.idIglesia > 0) {
                getItemSelected(selector.idIglesia, selector.nombreIglesia);
            } else {
                infoMessage("Debe seleccionar una Iglesia");
            }
        }else if (selector.distrito) {
            if (selector.idDistrito > 0) {
                getItemSelected(selector.idDistrito, selector.nombreDistrito);
            } else {
                infoMessage("Debe seleccionar un Distrito");
            }
        }else if (selector.campo) {
            if (selector.idCampo > 0) {
                getItemSelected(selector.idCampo, selector.nombreCampo);
            } else {
                infoMessage("Debe seleccionar un Campo");
            }
        }
    });
}
