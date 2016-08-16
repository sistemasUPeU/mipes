/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function customModal(container, title, content) {
    this.id = idGenerator();
    this.title = title;
    this.titleId = idGenerator();
    this.bodyId = idGenerator();
    this.content = content;
    this.container = container;
    this.cancelButton = true;
    this.getId = function () {
        return this.id;
    };
    this.getTitle = function () {
        return this.title;
    };
    this.getBodyId = function () {
        return this.bodyId;
    };
    this.enableCancelButton = function () {
        this.cancelButton = true;
    };
    this.disableCancelButton = function () {
        this.cancelButton = false;
    };
    this.setContainer = function (container) {
        this.container = container;
    };
    this.setTitle = function (title) {
        this.title = title;
    };
    this.setContent = function (content) {
        this.content = content;
    };
    this.getConstructor = function () {
        var t = '<div id="' + this.id + '" class="modal fade" tabindex="-1" role="dialog"';
        t += 'aria-labelledby="' + this.titleId + '">';
        t += '<div class="modal-dialog" role="document">';
        t += '<div class="modal-content">';
        t += '<div class="modal-header">';
        t += '<h4 class="modal-title" id="' + this.titleId + '">' + this.title + '</h4>';
        t += '</div>';
        t += '<div id="' + this.bodyId + '" class="modal-body">' + this.content + '</div>';
        t += '<div class="modal-footer">';
        if (this.cancelButton) {
            t += '<input type="button" value="Cancelar" onclick="javascript:modalCancelButton();" class="btn btn-default pull-left">';
        }
        t += '<input type="button" value="Aceptar" onclick="javascript:modalOkButton();" class="btn btn-primary pull-right">';
        t += '</div>';
        t += '</div>';
        t += '</div>';
        t += '</div>';
        return t;
    };
    this.refreshContent = function () {
        this.container.empty();
        this.container.append(this.getConstructor());
    };
    function idGenerator() {
        var text = "";
        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        for (var i = 0; i < 8; i++)
            text += possible.charAt(Math.floor(Math.random() * possible.length));
        return text;
    }

}

function showCustomModal(modal) {
    $('#' + modal.getId()).modal('show');
}

function hideCustomModal(modal){
    $('#' + modal.getId()).modal('hide');
}

