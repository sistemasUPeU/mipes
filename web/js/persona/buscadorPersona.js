/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function parametrosBuscador(urls, filtro, nombres, apellidos, dni) {
    this.urls = urls;
    this.filtro = filtro;
    this.nombres = nombres;
    this.apellidos = apellidos;
    this.dni = dni;
    this.setFiltroGP = function () {
        this.setFiltro(1);
    };
    this.setFiltroMI = function () {
        this.setFiltro(2);
    };
    this.setFiltroNull = function () {
        this.setFiltro(0);
    };
    this.setFiltro = function (filtro) {
        this.filtro = filtro;
    };
    this.setUrl = function (url) {
        this.urls = url;
    };
    this.setNombres = function (nombres) {
        this.nombres = nombres;
    };
    this.setApellidos = function (apellidos) {
        this.apellidos = apellidos;
    };
    this.setDNI = function (dni) {
        this.dni = dni;
    };
}
;

function parametrosRegPersona(nombres, apellidos, dni, telefono, correo, direccion, fecha, urls) {
    this.nombres = nombres;
    this.apellidos = apellidos;
    this.dni = dni;
    this.telefono = telefono;
    this.correo = correo;
    this.direccion = direccion;
    this.fecha = fecha;
    this.urls = urls;
    this.setNombres = function (nombres) {
        this.nombres = nombres;
    };
    this.setApellidos = function (apellidos) {
        this.apellidos = apellidos;
    };
    this.setDNI = function (dni) {
        this.dni = dni;
    };
    this.setTelefono = function (telefono) {
        this.telefono = telefono;
    };
    this.setCorreo = function (correo) {
        this.correo = correo;
    };
    this.setDireccion = function (direccion) {
        this.direccion = direccion;
    };
    this.setFecha = function (fecha) {
        this.fecha = fecha;
    };
    this.setUrl = function (urls) {
        this.urls = urls;
    };
}

function BuscadorObject() {
    this.parametros = new parametrosBuscador();
    this.paramRegistro = new parametrosRegPersona();
    this.setContainer = function (container) {
        this.container = container;
    };
    this.getConstructor = function () {
        var t = '<div class="panel panel-default"><div class="panel-heading">Buscar Persona</div>';
        t += '<div class="panel-body"><div class="row"><div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">';
        t += '<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12"><div class="form-group">';
        t += '<input type="text" class="form-control nombresBuscador" placeholder="Nombres" maxlength="64">';
        t += '</div></div><div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12">';
        t += '<div class="form-group"><input type="text" class="form-control apellidosBuscador" placeholder="Apellidos" maxlength="64">';
        t += '</div></div><div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12"><div class="form-group">';
        t += '<input type="number" class="form-control dnibuscador" placeholder="DNI" maxlength=10></div></div>';
        t += '<div class="col col-lg-3 col-md-3 col-sm-12 col-xs-12"><div class="form-group">';
        t += '<input type="button" class="btn btn-primary btnBuscarPersona"  value="Buscar"></div></div></div></div><div class="row">';
        t += '<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12 tableContainer">';
        t += '</div></div></div>';
        t += '<div class="panel-footer"><div class="row"><div class="col col-lg-12">';
        t += '<a class="btn btn-default pull-left" id="btnCancelRegPersona" href="javascript:cancelBuscadorP()">Cancelar</a>';
        t += '<a class="btn btn-primary pull-right" id="btnShowRegPersona" href="#">Agregar Persona</a></div></div></div>';
        t += "</div>";
        return t;
    };
    this.getTableConstructor = function () {
        var t = '<table class="table table-bordered table-hover tableResults">';
        t += '<thead><tr><th>Nombres y Apellidos</th><th>DNI</th><th>Opciones</th></tr></thead>';
        t += '<tbody class="tableBody"></tbody></table>';
        return t;
    };
    this.getSearchNoFoundError = function () {
        return '<div class="alert alert-info" role="alert">Búsqueda sin Resultados</div>';
    };
    this.getRegConstructor = function () {
        var t = '<div class="panel panel-default">';
        t += '<div class="panel-heading">Registro de Persona</div>';
        t += '<div class="panel-body">';
        t += '<div class="row">';
        t += '<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">';
        t += '<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">';
        t += '<div class="form-group">';
        t += '<label for="nombrePersona">Nombres</label>';
        t += '<input name="nombrePersona" placeholder="Nombres de la Persona"';
        t += 'id="nombrePersona" class="form-control" type="text" maxlength="64">';
        t += '</div>';
        t += '</div>';
        t += '<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">';
        t += '<div class="form-group">';
        t += '<label for="apellidosPersona">Apellidos</label>';
        t += '<input name="apellidosPersona" placeholder="Apellidos de la Persona"';
        t += 'id="apellidosPersona" class="form-control" type="text" maxlength="64">';
        t += '</div>';
        t += '</div>';
        t += '<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">';
        t += '<div class="form-group">';
        t += '<label for="dniPersona">DNI</label>';
        t += '<input name="dniPersona" placeholder="DNI de la Persona"';
        t += 'id="dniPersona" class="form-control" type="number" maxlength="10" ';
        t += 'oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);">';
        t += '</div>';
        t += '</div>';
        t += '<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">';
        t += '<div class="form-group">';
        t += '<label for="telefonoPersona">Teléfono</label>';
        t += '<input name="telefonoPersona" placeholder="Teléfono de la Persona"';
        t += 'id="telefonoPersona" class="form-control" type="tel" maxlength="15">';
        t += '</div>';
        t += '</div>';
        t += '<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">';
        t += '<div class="form-group">';
        t += '<label for="correoPersona">Correo</label>';
        t += '<input name="correoPersona" placeholder="Correo de la Persona"';
        t += 'id="correoPersona" class="form-control" type="email" maxlength="128">';
        t += '</div>';
        t += '</div>';
        t += '<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">';
        t += '<div class="form-group">';
        t += '<label for="direccionPersona">Direccion</label>';
        t += '<input name="direccionPersona" placeholder="Direccion de la Persona"';
        t += 'id="direccionPersona" class="form-control" type="text" maxlength="255">';
        t += '</div>';
        t += '</div>';
        t += '<div class="col col-lg-6 col-md-6 col-sm-12 col-xs-12">';
        t += '<div class="form-group">';
        t += '<label for="fechaPersona">Fecha de Nacimiento</label>';
        t += '<input name="fechaPersona" placeholder="Fecha de nacimiento de la Persona"';
        t += 'id="fechaPersona" class="form-control" type="date">';
        t += '</div>';
        t += '</div>';
        t += '</div>';
        t += '</div>';
        t += '<div class="row">';
        t += '<div id="errorReg" class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">';        
        t += '</div>';
        t += '</div>';
        t += '</div>';
        t += '<div class="panel-footer">';
        t += '<div class="row">';
        t += '<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12">';
        t += '<input value="Cancelar"';
        t += 'id="btnCancelar" class="btn btn-default pull-left" type="button">';
        t += '<input name="registroPersona" value="Registrar"';
        t += 'id="btnRegistroPersona" class="btn btn-primary pull-right" type="button">';
        t += '</div>';
        t += '</div>';
        t += '</div>';
        t += '</div>';
        return t;
    };

    this.showRegPersona = function (b) {//REGISTRO DE PERSONA
        this.container.empty();
        this.container.append(this.getRegConstructor());
        $('#btnCancelar').click(function () {
            showBuscador(b);
        });
        $('#btnRegistroPersona').click(function () {
            if ($('#nombrePersona').val() == "" || ($('#apellidosPersona').val()) == "" || ($('#dniPersona').val()) == "") {
                //swal("Campos Vacios", "Debe completar correctamente los campos", "warning");
                $('#errorReg').empty();
                $('#errorReg').append(b.getAddError());
            } else {
            b.paramRegistro.setNombres($('#nombrePersona').val());
            b.paramRegistro.setApellidos($('#apellidosPersona').val());
            b.paramRegistro.setDNI($('#dniPersona').val());
            b.paramRegistro.setCorreo($('#correoPersona').val());
            b.paramRegistro.setTelefono($('#telefonoPersona').val());
            b.paramRegistro.setDireccion($('#direccionPersona').val());
            b.paramRegistro.setFecha($('#fechaPersona').val());
            var data = "nombres=" + b.paramRegistro.nombres;
            data += "&apellidos=" + b.paramRegistro.apellidos;
            data += "&dni=" + b.paramRegistro.dni;
            data += "&correo=" + b.paramRegistro.correo;
            data += "&telefono=" + b.paramRegistro.telefono;
            data += "&direccion=" + b.paramRegistro.direccion;
            data += "&fecha=" + b.paramRegistro.fecha;
            $.post(b.paramRegistro.urls, data, function (objJson) {
                if (objJson.result !== null) {
                    getPersonaId(objJson.result);
                }
                showBuscador(b);
            });
            }

        });

    };

    this.getAddError = function () {
        return '<div class="alert alert-danger" role="alert"><i class="fa fa-info-circle"></i>   Debe Especificar : Nombres, Apellidos y DNI</div>';
    };

}

function showBuscador(b) {
    b.container.empty();
    b.container.append(b.getConstructor());
    $('.nombresBuscador').keyup(function () {
        buscar();
    });
    $('.apellidosBuscador').keyup(function () {
        buscar();
    });
    $('.dnibuscador').keyup(function () {
        buscar();
    });
    $('.btnBuscarPersona').click(function () {
        buscar();
    });
    $('#btnShowRegPersona').click(function () {
        b.showRegPersona(b);
    });

    function buscar() {
        b.parametros.setNombres($('.nombresBuscador').val());
        b.parametros.setApellidos($('.apellidosBuscador').val());
        b.parametros.setDNI($('.dnibuscador').val());
        var data = "nombres=" + b.parametros.nombres;
        data += "&apellidos=" + b.parametros.apellidos;
        data += "&dni=" + b.parametros.dni;
        data += "&filtro=" + b.parametros.filtro;

        $.post(b.parametros.urls, data, function (objJson) {
            var lista = objJson.lista;
            if (lista.length > 0) {
                var tableData = "";
                for (var i = 0; i < lista.length; i++) {
                    tableData += "<tr>";
                    tableData += "<td>" + lista[i].nya + "</td>";
                    tableData += "<td>" + lista[i].dni + "</td>";
                    tableData += "<td><a class='btn btn-primary btnSelect' ";
                    tableData += "href='javascript:getPersonaId(" + lista[i].idp +",\""+lista[i].nya + "\")'>Seleccionar</a></td>";
                    tableData += "</tr>";
                }
                $('.tableContainer').empty();
                $('.tableContainer').append(b.getTableConstructor());
                $('.tableBody').append(tableData);
                $('.tableResults').DataTable({
                    "bLengthChange": false
                });
                $('.dataTables_filter').css('display', 'none');
            } else {
                $('.tableContainer').empty();
                $('.tableContainer').append(b.getSearchNoFoundError());
            }
        });
    }
}
;

function BuscadorP() {
    var buscador = new BuscadorObject();
    buscador.parametros = new parametrosBuscador();
    this.core = buscador;
    this.show = function () {
        showBuscador(buscador);
    };

}


