/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function errorMessage(messagge) {
    showPnotify(messagge,"error");
}

function infoMessage(messagge) {
    showPnotify(messagge,"info");
}

function successMessage(messagge) {
    showPnotify(messagge,"success");
}

function showPnotify(message, type){
    PNotify.removeAll(); 
    var title;
    switch (type){
        case "info":title="Info";break;
        case "error":title="Error";break;
        case "success":title="Success";break;
    }
    var notice=new PNotify({
        title: title+" Message",
        text: message,
        type: type,
        delay: "2500",
        hide:true
    });
    
}