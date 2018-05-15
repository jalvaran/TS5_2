<?php 
$myPage="modelos_admin.php";
include_once("../sesiones/php_control.php");

include_once("css_construct.php");

$css =  new CssIni("Administracion de modelos");

//css del reloj

print('<style>
    .clockdate-wrapper {
    background-color: #333;
    padding:20px;
    max-width:180px;
    width:100%;
    text-align:center;
    border-radius:5px;
    margin:0 auto;
    margin-top:0%;
}
#clock{
    background-color:#333;
    font-family: sans-serif;
    font-size:40px;
    text-shadow:0px 0px 1px #fff;
    color:#fff;
}
#clock span {
    color:#888;
    text-shadow:0px 0px 1px #333;
    font-size:30px;
    position:relative;
    top:-27px;
    left:-10px;
}
#date {
    letter-spacing:10px;
    font-size:14px;
    font-family:arial,sans-serif;
    color:#fff;
}</style>');


$obVenta =  new ProcesoVenta($idUser);  
$css->CabeceraIni("Administracion de modelos"); 
    
$css->CabeceraFin();

$obTabla = new Tabla($db);

$css->CrearDiv("Principal", "container", "center", 1, 1);
    $css->CrearTabla();
        $css->FilaTabla(16);
            print("<td>");
                $css->CrearTableChosen("CmbModelos", "modelos_db", "WHERE Estado='A'", "NombreArtistico", "ID", "", "ID", 400, 1, "Selecciona una modelo", "");
            print("</td>");
            print("<td>");
                $css->CrearInputNumber("TxtTarifa", "number", "", "", "Valor Servicio", "", "", "", 200, 40, 0, 1, 10000, "", 10000, 'font-size: 16pt;');
            print("</td>");
                
            print("<td style='text-align:center'>");
                $funcion="";
                $css->CrearBotonEvento("BtnLiquidar", "Liquidar Modelos", 1, "onclick", $funcion, "naranja", "");
            print("</td>");
            print("<td style='text-align:center'>");
                $funcion="";
                $css->CrearBotonEvento("BtnCierre", "Cerrar Turno", 1, "onclick", $funcion, "rojo", "");
            print("</td>");
            print("<td>");
            
                $css->CrearDiv("clockdate", "", "center", 1, 1);
                    $css->CrearDiv("reloj", "clockdate-wrapper", "center", 1, 1);
                        $css->CrearDiv("clock", "", "center", 1, 1);
                        $css->CerrarDiv();
                        $css->CrearDiv("date", "", "center", 1, 1);
                        $css->CerrarDiv();
                    $css->CerrarDiv();
                $css->CerrarDiv();
            
            print("</td>");
        $css->CierraFilaTabla();
        $css->FilaTabla(16);
            print("<td>");
                $funcion="";
                $css->CrearBotonEvento("Btn20", "20 Minutos", 1, "onclick", $funcion, "verde", "");
            print("</td>");
            
            print("<td>");
                $funcion="";
                $css->CrearBotonEvento("Btn30", "30 Minutos", 1, "onclick", $funcion, "rojo", "");
            print("</td>");
            
            print("<td colspan=3>");
                $funcion="";
                $css->CrearBotonEvento("Btn1H", "60 Minutos", 1, "onclick", $funcion, "naranja", "");
            print("</td>");
        $css->CierraFilaTabla();
    $css->CerrarTabla();    
$css->CerrarDiv();
$css->CerrarDiv();
$css->AgregaJS(); //Agregamos javascripts
print('<script>function startTime() {
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
startTime()
</script>');
print('<script type="text/javascript" src="jsPages/modelos_admin.js"></script>');
$css->AgregaSubir();
$css->Footer();

ob_end_flush();
?>