<?php
session_start();
$idUser=$_SESSION['idUser'];
include_once '../../modelo/php_conexion.php';
include_once("../clases/Restaurante.class.php");
$obRest = new Restaurante($idUser);

if( !empty($_REQUEST["idDepartamento"]) and !empty($_REQUEST["Cantidad"]) and !empty($_REQUEST["idProducto"])){
        $idMesa="";
        if(!empty($_REQUEST["idMesa"])){
            $idMesa=$obRest->normalizar($_REQUEST["idMesa"]);
        }
        
        $idPedido="";
        if(!empty($_REQUEST["idPedido"])){
            
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
        }
        $idDepartamento=$obRest->normalizar($_REQUEST["idDepartamento"]);
        $Cantidad=$obRest->normalizar($_REQUEST["Cantidad"]);
        $idProducto=$obRest->normalizar($_REQUEST["idProducto"]);
        $Observaciones="";
        if(isset($_REQUEST["Observaciones"])){
            $Observaciones=$obRest->normalizar($_REQUEST["Observaciones"]);
        }
        $fecha=date("Y-m-d");
        $hora=date("H:i:s");
        
        if(empty($_REQUEST["idPedido"])){
            $idPedido=$obRest->AgregueProductoAPedido($idMesa, $fecha, $hora, $Cantidad, $idProducto, $Observaciones,$idUser, "");
            $Respuesta["msg"]="OK";
            $Respuesta["idPedido"]=$idPedido;
            echo json_encode($Respuesta);
        }
         
        if(!empty($_REQUEST["idPedido"])){
            $obRest->AgregueProductoADomicilio($idPedido, $fecha, $hora, $Cantidad, $idProducto, $Observaciones, $idUser, "");
            $Respuesta["msg"]="OK";
            $Respuesta["idPedido"]=$idPedido;
            echo json_encode($Respuesta);   
        }
    
    
}else{
    $Respuesta["msg"]="SD";
    echo json_encode($Respuesta);
}
    
