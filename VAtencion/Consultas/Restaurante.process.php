<?php
session_start();
$idUser=$_SESSION['idUser'];
include_once '../../modelo/php_conexion.php';
include_once("../clases/Restaurante.class.php");
include_once("../../modelo/PrintPos.php");      //Imprime documentos en la impresora pos
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
    if(!isset($_REQUEST["Accion"])){
        $Respuesta["msg"]="SD";
        echo json_encode($Respuesta);
    }
    
}
    

if(isset($_REQUEST["Accion"])){
    switch($_REQUEST["Accion"]){
        //Eliminar un item de un pedido
        case 'DEL':
            $idItemDel=$obRest->normalizar($_REQUEST["idItem"]);
            $Observaciones=$obRest->normalizar($_REQUEST["Observaciones"]);
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
            $obRest->ElimineItemPedido($idItemDel, $idPedido, $Observaciones,$idUser, "");
            $Respuesta["msg"]="OK";
            $Respuesta["idPedido"]=$idPedido;
            $Respuesta["idItem"]=$idItemDel;
            $Respuesta["Observaciones"]=$Observaciones;
            echo json_encode($Respuesta); 
        break;
        //Crear un Domicilio
        case 'ADD_DOM':
            $Telefono=$obRest->normalizar($_REQUEST["Telefono"]);
            $Nombre=$obRest->normalizar($_REQUEST["Nombre"]);
            $Direccion=$obRest->normalizar($_REQUEST["Direccion"]);
            if($Telefono=="" or $Nombre=="" or $Direccion==""){
                $Respuesta["msg"]="SD";
                $Respuesta["idPedido"]=$idDomicilio;
                exit();
            }
            $Observaciones=$obRest->normalizar($_REQUEST["Observaciones"]);
            $fecha=date("Y-m-d");
            $hora=date("H:i:s");

            $idDomicilio=$obRest->CreeDomicilio($fecha, $hora, 1, $Nombre,$Direccion, $Telefono, $Observaciones,$idUser, "");
            $Respuesta["msg"]="OK";
            $Respuesta["idPedido"]=$idDomicilio;
            
            echo json_encode($Respuesta); 
        break;
    
    //Crear un para llevar
        case 'ADD_LLE':
            $Telefono=$obRest->normalizar($_REQUEST["Telefono"]);
            $Nombre=$obRest->normalizar($_REQUEST["Nombre"]);
            $Direccion=$obRest->normalizar($_REQUEST["Direccion"]);
            if($Telefono=="" or $Nombre=="" or $Direccion==""){
                $Respuesta["msg"]="SD";
                $Respuesta["idPedido"]=$idDomicilio;
                exit();
            }
            $Observaciones=$obRest->normalizar($_REQUEST["Observaciones"]);
            $fecha=date("Y-m-d");
            $hora=date("H:i:s");
            $Vector["Llevar"]=1;
            $idDomicilio=$obRest->CreeDomicilio($fecha, $hora, 1, $Nombre,$Direccion, $Telefono, $Observaciones,$idUser, $Vector);
            $Respuesta["msg"]="OK";
            $Respuesta["idPedido"]=$idDomicilio;
            
            echo json_encode($Respuesta); 
        break;
    
        //Descartar pedido 
        case 1:
            //$obPrint=new PrintPos($idUser);
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
            $Observaciones=$obRest->normalizar($_REQUEST["Observaciones"]);
            $obRest->ActualizaRegistro("restaurante_pedidos", "Estado", "DEPE", "ID", $idPedido);
            $obRest->ActualizaRegistro("restaurante_pedidos", "Observaciones", $Observaciones, "ID", $idPedido);
            $obRest->ActualizaRegistro("restaurante_pedidos_items", "Estado", "DEPE", "idPedido", $idPedido);
            $Respuesta["msg"]="OK";
            
            echo json_encode($Respuesta); 
        break;
    
        //Descartar Domicilio 
        case 2:
            //$obPrint=new PrintPos($idUser);
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
            $Observaciones=$obRest->normalizar($_REQUEST["Observaciones"]);
            $obRest->ActualizaRegistro("restaurante_pedidos", "Estado", "DEDO", "ID", $idPedido);
            $obRest->ActualizaRegistro("restaurante_pedidos", "Observaciones", $Observaciones, "ID", $idPedido);
            $obRest->ActualizaRegistro("restaurante_pedidos_items", "Estado", "DEDO", "idPedido", $idPedido);
            $Respuesta["msg"]="OK";
            
            echo json_encode($Respuesta); 
        break;
    
        //Descartar Un Para LLevar 
        case 3:
            //$obPrint=new PrintPos($idUser);
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
            $Observaciones=$obRest->normalizar($_REQUEST["Observaciones"]);
            $obRest->ActualizaRegistro("restaurante_pedidos", "Estado", "DELL", "ID", $idPedido);
            $obRest->ActualizaRegistro("restaurante_pedidos", "Observaciones", $Observaciones, "ID", $idPedido);
            $obRest->ActualizaRegistro("restaurante_pedidos_items", "Estado", "DELL", "idPedido", $idPedido);
            $Respuesta["msg"]="OK";
            
            echo json_encode($Respuesta); 
        break;
    
    //imprimir un pedido
        case 4:
            $obPrint=new PrintPos($idUser);
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
            $obPrint->ImprimePedidoRestaurante($idPedido,"",1,"");
            $Respuesta["msg"]="OK";
            
            echo json_encode($Respuesta); 
        break;
    
    //imrpimir un Domicilio 
        case 5:
            $obPrint=new PrintPos($idUser);
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
            $obPrint->ImprimeDomicilioRestaurante($idPedido,"",1,"");
            $Respuesta["msg"]="OK";
            
            echo json_encode($Respuesta); 
        break;
    
    //imrpimir un para llevar 
        case 6:
            $obPrint=new PrintPos($idUser);
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
            $obPrint->ImprimeDomicilioRestaurante($idPedido,"",1,"");
            $Respuesta["msg"]="OK";
            
            echo json_encode($Respuesta); 
        break;
    
        //imrpimir precuenta
        case 7:
            $obPrint=new PrintPos($idUser);
            $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
            $obPrint->ImprimePrecuentaRestaurante($idPedido,"",1,"");
            $Respuesta["msg"]="OK";
            
            echo json_encode($Respuesta); 
        break;
    
    //imrpimir factura
        case 8:
            $obPrint=new PrintPos($idUser);
            $idFactura=$obRest->normalizar($_REQUEST["idFactura"]);
            $obPrint->ImprimeFacturaPOS($idFactura, "", 1);
            $Respuesta["msg"]="OK";
            
            echo json_encode($Respuesta); 
        break;
    }
}
