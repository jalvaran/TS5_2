<?php
ini_set("display_errors","On");
session_start();
if (!isset($_SESSION['username'])){
  exit("<a href='../../index.php' ><img src='../../images/401.png'>Iniciar Sesion </a>");
  
}
$idUser=$_SESSION['idUser'];

if(isset($_REQUEST["idAccion"])){
    include_once '../../../modelo/php_conexion.php';
    include_once '../clases/facturacion_electronica.class.php';
    $obCon = new Factura_Electronica($idUser);
    
    switch ($_REQUEST["idAccion"]) {

        case 1://Emitir Comprobante
            $idFactura=$obCon->normalizar($_REQUEST["idFactura"]);
            $WebService=$obCon->DevuelveValores("fe_webservice", "ID", 1); //Tabla que aloja la direccion del web service
            $client = new SoapClient($WebService["DireccionWebService"]);
            $layout=$obCon->ConstruyaLayoutEmitirFactura($idFactura);
                        
            // Call RemoteFunction () 
            $error = 0; 
            try { 
                $result= $client->__call("EmitirComprobante", array($layout)); 
            } catch (SoapFault $fault) { 
                $error = 1; 
                print("Error: ".$fault->faultcode." ".$fault->faultstring);

            } 

            //Validamos la respuesta
            if($client->fault) {
                echo '<pre>';
                echo 'Fallo';
                print_r($result);
                echo '</pre>';
            }else {	// Recibido
                echo '<pre>';
                print_r ($result);
                echo '</pre>';
                print($result->EmitirComprobanteResult->MensajeEmisor);
            }
           
            break;

        default:
            break;
    }
}else{
    print("No se recibieron parametros");
}
?>