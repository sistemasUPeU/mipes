/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function registrarLiderMIPES(idLider, esLider, idTabla){
    var url="reg?tipo=mipes";
    var data="opc="+esLider;
    data+="&idlider="+idLider;
    data+="&idtabla="+idTabla;
    $.post(url,data, function (objJson){
        if (objJson.result===true) {
            registrarLiderSuccess();
        }else{
            registrarLiderError();
        }
    });
}
function registrarMIPESCampo(idLider, idTabla){
    registrarLiderMIPES(idLider,1,idTabla);
}
function registrarMIPESDistrito(idLider, idTabla){
    registrarLiderMIPES(idLider,2,idTabla);
}
function registrarMIPESIglesia(idLider, idTabla){
    registrarLiderMIPES(idLider,3,idTabla);
}
function registrarMIPESEscuela(idLider, idTabla){
    registrarLiderMIPES(idLider,4,idTabla);
}
function registrarLiderGrupo(idLider, idTabla){
    registrarLiderMIPES(idLider,5,idTabla);
}
function registrarLiderMinisterio(idLider, idTabla){
    registrarLiderMIPES(idLider,6,idTabla);
}