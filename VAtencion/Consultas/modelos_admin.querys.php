<?php
include_once("../../modelo/php_conexion.php");
include_once("../css_construct.php");
$css =  new CssIni("");
$obVenta = new ProcesoVenta(1);
$idModelo=$obVenta->normalizar($_REQUEST["Modelo"]);
$HoraInicial=$obVenta->normalizar($_REQUEST["HoraInicio"]);
$Valor=$obVenta->normalizar($_REQUEST["Valor"]);
$Tiempo=$obVenta->normalizar($_REQUEST["Tiempo"]);
$DatosModelos=$obVenta->DevuelveValores("modelos_db", "ID", $idModelo);
$sql="SELECT ID FROM modelos_agenda WHERE idModelo='$idModelo' AND Estado='Abierto'";
$Datos=$obVenta->Query($sql);

if(!$obVenta->FetchArray($Datos)){
    if($Tiempo==20){
        $ValorModelo=$DatosModelos["ValorServicio1"];
    }

    if($Tiempo==30){
        $ValorModelo=$DatosModelos["ValorServicio2"];
    }

    if($Tiempo==60){
        $ValorModelo=$DatosModelos["ValorServicio3"];
    }
    //////Ingreso a agenda          
    $tab="modelos_agenda";
    $NumRegistros=7;

    $Columnas[0]="idModelo";	$Valores[0]=$idModelo;
    $Columnas[1]="ValorPagado";     $Valores[1]=$Valor;
    $Columnas[2]="ValorModelo";     $Valores[2]=$ValorModelo;
    $Columnas[3]="ValorCasa";	$Valores[3]=$Valor-$ValorModelo;
    $Columnas[4]="Minutos";         $Valores[4]=$Tiempo;
    $Columnas[5]="HoraInicial";	$Valores[5]=date("Y-m-d")." ".$HoraInicial;
    $Columnas[6]="HoraATerminar";	$Valores[6]=date( "Y-m-d H:i:s" ,strtotime($Valores[5])+($Tiempo*60));  //Arreglar

    $obVenta->InsertarRegistro($tab,$NumRegistros,$Columnas,$Valores);
}else{
    $css->CrearNotificacionRoja("La modelo seleccionada actualmente está en servicio, debe seleccionar otra", 16);
}
$css->CrearTabla();
    
$css->FilaTabla(16);
    $css->ColTabla("<strong>Modelo<strong>", 1);
    $css->ColTabla("<strong>ValorServicio<strong>", 1);
    $css->ColTabla("<strong>Minutos<strong>", 1);
    $css->ColTabla("<strong>Termina<strong>", 1);
    $css->ColTabla("<strong>Estado<strong>", 1);
    $css->ColTabla("<strong>Opciones<strong>", 1);
$css->CierraFilaTabla();
$consulta=$obVenta->ConsultarTabla("modelos_agenda", "WHERE Estado='Abierto' ORDER BY HoraATerminar Asc");
while ($DatosAgenda=$obVenta->FetchArray($consulta)){
    $DatosModelos=$obVenta->DevuelveValores("modelos_db", "ID", $DatosAgenda["idModelo"]);
    $css->FilaTabla(16);
        $css->ColTabla($DatosModelos["NombreArtistico"], 1);
        $css->ColTabla(number_format($DatosAgenda["ValorPagado"]), 1);
        $css->ColTabla($DatosAgenda["Minutos"], 1);
        print("<td>");
            print("<p><strong>".$DatosAgenda["HoraATerminar"]."</strong></p>");
        print("</td>");
        print("<td style='text-align:center'>");
            print("<div name='Shape' style='background-color:green;color:green;height:20px;width:20px;border-radius:10px;text-align:center'>_</div>");
        print("</td>");
        print("<td>");
        print("</td>");
    $css->CierraFilaTabla();
}

$css->CerrarTabla();
?>