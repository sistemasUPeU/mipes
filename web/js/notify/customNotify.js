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
    var notice=new PNotify({
        title: type+" Message",
        text: message,
        type: type,
        delay: "1500",
        hide:true
    });
    
}