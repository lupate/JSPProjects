/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//DataTable
$(document).ready(function () {
    $('#results').DataTable();
});

//Jquery reading URI parameter
function GetURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}

// Check space to prevent double spaces
isSpace = false;
// filter Digits to prevent man in middle attack "Special Character"
function filterDigits(eventInstance) {
    eventInstance = eventInstance || window.event;
    key = eventInstance.keyCode || eventInstance.which;
    if ((64 < key) && (key < 91) || (96 < key) && (key < 123)) {
        isSpace = false;
        return true;
    } else if (key == 32 && !isSpace) {
        isSpace = true;
        return true;
    } else if (key == 32 && isSpace) {
        eventInstance.preventDefault();
        eventInstance.returnValue = false;
        return false;
    } else {
        if (eventInstance.preventDefault)
            eventInstance.preventDefault();
        eventInstance.returnValue = false;
        return false;
    }// if
} //filterDigits
