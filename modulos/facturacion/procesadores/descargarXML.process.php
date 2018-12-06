<?php
ini_set("display_errors","On");
//Instanciamos el servicio
$client = new SoapClient('http://69.160.41.171/WSfacturatech.asmx?wsdl');
//$client = new SoapClient('http://69.160.41.171:445/WSfacturatech.asmx?wsdl');
$param = array('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">

   <soapenv:Header/>

   <soapenv:Body>

      <tem:ConsultaDocumentStatus>

         <!--Optional:-->

         <tem:documentID>4af54ea328944c83b1ffe615b5867e6a</tem:documentID>

         <!--Optional:-->

         <tem:companyID>901143311</tem:companyID>

         <!--Optional:-->

         <tem:accountID>901143311-01</tem:accountID>

         <!--Optional:-->

         <tem:Correo>programacion@facturatech.co</tem:Correo>

         <!--Optional:-->

         <tem:Password>Demo.Col2018.1</tem:Password>

      </tem:ConsultaDocumentStatus>

   </soapenv:Body>

</soapenv:Envelope>');

// Call RemoteFunction () 
$error = 0; 
$ID='fff23f27950d469ab96644f7b071e641';
try { 
	$result= $client->__call("DescargarXML", $ID); 
} catch (SoapFault $fault) { 
    $error = 1; 
    print(" 
    alert('Sorry, blah returned the following ERROR: ".$fault->faultcode."-".$fault->faultstring.". We will now take you back to our home page.'); 
    window.location = 'main.php'; 
    "); 
} 

//Validamos la respuesta
if($client->fault) {
	echo 'Fallo';
	print_r($result);
}else {	// Recibido
	echo '<pre>';
	print_r ($result);
        echo '</pre>';
	print($result->EmitirComprobanteResult->MensajeEmisor);
}
?>