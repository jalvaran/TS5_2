<?php
/* 
 * Aqui se establecen los datos de conexion a la base de datos
 */

$host="localhost";
$user="techno";
$pw="techno";
$db="ts5";
 
const HOST="localhost", USER="techno",PW="techno",DB="ts5"; //para uso 

/* Para un servidor la combinacion deberá ser $TipoPC="Server"; $TipoKardex="Caja";
 * Para una Caja la combinacion deberá ser $TipoPC="Caja"; $TipoKardex="Caja";
 * Para un ServidorCaja la combinacion deberá ser $TipoPC="Caja"; $TipoKardex="Automatico";
 */
$TipoPC="Server";         // Server para que al abrir el menu un timer registre las facturas en el libro diario y en el kardex, Caja para la otra opcion
$TipoKardex="NO"; // Automatico Para que registre automaticamente las facturas en el kardex, NO para que sea caja
$PrintAutomatico="SI";    //IMPRIME LAS FACTURAS POS AUTOMATICAMENTE SI ES SI, SI ES NO NO IMPRIME FACTURA POR POR DEFECTO
?>