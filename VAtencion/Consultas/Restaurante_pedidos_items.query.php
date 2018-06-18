<?php
include_once("../../modelo/php_conexion.php");
include_once("../css_construct.php");
include_once("../clases/Restaurante.class.php");

session_start();
$idUser=$_SESSION['idUser'];
$css =  new CssIni("");

$obRest=new Restaurante($idUser);

$css->CrearNotificacionVerde("Items del pedido", 16);

if(isset($_REQUEST["idPedido"])){
    $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
   
    $consulta=$obRest->ConsultarTabla("restaurante_pedidos_items", " WHERE idPedido='$idPedido'");
    if($obRest->NumRows($consulta)){
        $css->CrearTabla();
        $css->FilaTabla(16);
            $css->ColTabla("<strong>Cantidad</strong>", 1);
            $css->ColTabla("<strong>Nombre</strong>", 1);
            $css->ColTabla("<strong>Total</strong>", 1);
            $css->ColTabla("<strong>Opciones</strong>", 1);
            
        $css->CierraFilaTabla();
        while($DatosPedidos=$obRest->FetchArray($consulta)){
            $css->FilaTabla(14);
            $css->ColTabla($DatosPedidos["Cantidad"], 1);
            
            $css->ColTabla($DatosPedidos["NombreProducto"], 1);
            $css->ColTabla(number_format($DatosPedidos["Total"]), 1);
            
            print("<td>");
                $Page="Consultas/Restaurante_pedidos_items.query.php?idPedido=".$DatosPedidos["ID"]."&carry=";
                $evento="onClick";
                $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivItems`,`99`);return false;";
                $css->CrearBotonEvento("BtnVer", "x", 1, $evento, $funcion, "rojo", "");
            print("</td>");
        $css->CierraFilaTabla();
        }

        $css->CerrarTabla();
    }
}
?>