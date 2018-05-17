
function startTime() {
    var today = new Date();
    var hr = today.getHours();
    var min = today.getMinutes();
    var sec = today.getSeconds();
    //Add a zero in front of numbers<10
    min = checkTime(min);
    sec = checkTime(sec);
    document.getElementById("clock").innerHTML = hr + ":" + min + ":" + sec;
    var time = setTimeout(function(){ startTime() }, 500);
}
function checkTime(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}


//Funcion para enviar el contenido de una caja de texto a una pagina y dibujarlo en un div
function EnvieConsultaModelos(Page,idElement,idTarget,BorrarId=1){
    if(document.getElementById('TxtTarifa').value>10000){
    document.getElementById(idTarget).innerHTML ='Procesando...<br><img src="../images/process.gif" alt="Cargando" height="100" width="100">';
    var  Modelo=  document.getElementById('CmbModelos').value;  
    var  Valor=  document.getElementById('TxtTarifa').value;  
    var  HoraInicio=  document.getElementById('clock').innerHTML; 
    document.getElementById('TxtTarifa').value='';
    
    Page = Page+"Modelo="+Modelo+"&Valor="+Valor+"&HoraInicio="+HoraInicio;
   
        if (window.XMLHttpRequest) {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                httpEdicion = new XMLHttpRequest();
            } else {
                // code for IE6, IE5
                httpEdicion = new ActiveXObject("Microsoft.XMLHTTP");
            }
            httpEdicion.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById(idTarget).innerHTML = this.responseText;
                    
                }
            };
        
        httpEdicion.open("GET",Page,true);
        httpEdicion.send();
    }else{
        alert("Debe escribir un valor mayor a 10000");
        document.getElementById('TxtTarifa').focus();
    }
        
}

startTime()
