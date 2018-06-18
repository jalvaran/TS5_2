<?php
include_once("../../modelo/php_conexion.php");
include_once("../css_construct.php");
include_once("../clases/Restaurante.class.php");

session_start();
$idUser=$_SESSION['idUser'];
$css =  new CssIni("");

$obRest=new Restaurante($idUser);

$css->CrearNotificacionAzul("Pedidos", 16);

if(isset($_REQUEST["TipoPedido"])){
    //Tipo pedido AB= pedidos abiertos, DO=Domicilios abieros, LL=para llevar Abiertos
    $TipoPedido=$obRest->normalizar($_REQUEST["TipoPedido"]);
}
$consulta=$obRest->ConsultarTabla("restaurante_pedidos", " WHERE Estado='$TipoPedido' ORDER BY ID ASC LIMIT 100");
if($obRest->NumRows($consulta)){
    $css->CrearTabla();
    $css->FilaTabla(16);
        $css->ColTabla("<strong>ID</strong>", 1);
        $css->ColTabla("<strong>Fecha y Hora</strong>", 1);
        $css->ColTabla("<strong>Cliente</strong>", 1);
        $css->ColTabla("<strong>Direccion</strong>", 1);
        $css->ColTabla("<strong>Telefono</strong>", 1);
        $css->ColTabla("<strong>Estado</strong>", 1);
        $css->ColTabla("<strong>Opciones</strong>", 1);
    $css->CierraFilaTabla();
    while($DatosPedidos=$obRest->FetchArray($consulta)){
        $css->FilaTabla(14);
        $css->ColTabla($DatosPedidos["ID"], 1);
        $css->ColTabla($DatosPedidos["Fecha"]." ".$DatosPedidos["Hora"], 1);
        $css->ColTabla($DatosPedidos["NombreCliente"], 1);
        $css->ColTabla($DatosPedidos["DireccionEnvio"], 1);
        $css->ColTabla($DatosPedidos["TelefonoConfirmacion"], 1);
        $css->ColTabla($DatosPedidos["Estado"], 1);
        print("<td>");
            $Page="Consultas/Restaurante_pedidos_items.query.php?idPedido=".$DatosPedidos["ID"]."&carry=";
            $evento="onClick";
            $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivItems`,`99`);return false;";
            $css->CrearBotonEvento("BtnVer", "+", 1, $evento, $funcion, "naranja", "");
        print("</td>");
    $css->CierraFilaTabla();
    }
    
    $css->CerrarTabla();
}
?>