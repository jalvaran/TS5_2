<?php
/* 
 * Clase donde se realizaran procesos de compras u otros modulos.
 * Julian Alvaran
 * Techno Soluciones SAS
 */
//include_once '../../php_conexion.php';
class Restaurante extends ProcesoVenta{
    //Agregar un Producto a un pedido
        /**
         * Agregue un producto a un pedido
         * @param type $idMesa  -> Mesa
         * @param type $fecha   -> Fecha
         * @param type $hora    -> Hora
         * @param type $Cantidad -> Cantidad
         * @param type $idProducto ->id del producto
         * @param type $Observaciones ->Observaciones
         * @param type $Vector ->uso futuro
         * @return type -> Retorna el id del pedido
         */
        public function AgregueProductoAPedido($idMesa,$fecha,$hora,$Cantidad,$idProducto,$Observaciones,$Vector) {
            $idUser=$this->idUser;
            $FechaHora=$fecha." ".$hora;
            $sql="SELECT ID FROM restaurante_pedidos WHERE idMesa='$idMesa' AND idUsuario='$idUser' AND Estado='AB'";
            $Consulta=$this->Query($sql);
            if($this->NumRows($Consulta)){
                $DatosPedido=$this->FetchArray($Consulta);
                $idPedido=$DatosPedido["ID"];
            }else{
                $tab="restaurante_pedidos";
                $NumRegistros=6; 

                $Columnas[0]="Fecha";               $Valores[0]=$fecha;
                $Columnas[1]="Hora";                $Valores[1]=$hora;
                $Columnas[2]="idUsuario";           $Valores[2]=$idUser;
                $Columnas[3]="idMesa";              $Valores[3]=$idMesa;
                $Columnas[4]="Estado";              $Valores[4]="AB";
                $Columnas[5]="FechaCreacion";       $Valores[5]=$FechaHora;
               
                $this->InsertarRegistro($tab,$NumRegistros,$Columnas,$Valores);
                $idPedido=$this->ObtenerMAX($tab,"ID", 1,"");
            }
            $DatosProductos=$this->DevuelveValores("productosventa", "idProductosVenta", $idProducto);
            $ValoresProducto=$this->CalculeValoresItem($fecha, $idProducto, "productosventa", $Cantidad, "");
            $tab="restaurante_pedidos_items";
            $NumRegistros=19; 

            $Columnas[0]="idProducto";          $Valores[0]=$idProducto;
            $Columnas[1]="NombreProducto";      $Valores[1]=$DatosProductos["Nombre"];
            $Columnas[2]="Cantidad";            $Valores[2]=$Cantidad;
            $Columnas[3]="ValorUnitario";       $Valores[3]=$ValoresProducto["ValorUnitario"];
            $Columnas[4]="Subtotal";            $Valores[4]=$ValoresProducto["Subtotal"];
            $Columnas[5]="IVA";                 $Valores[5]=$ValoresProducto["IVA"];
            $Columnas[6]="Total";               $Valores[6]=$ValoresProducto["Total"];
            $Columnas[7]="Observaciones";       $Valores[7]=$Observaciones;
            $Columnas[8]="idPedido";            $Valores[8]=$idPedido;
            $Columnas[9]="idUsuario";           $Valores[9]=  $this->idUser;
            $Columnas[10]="Fecha";              $Valores[10]=$fecha;
            $Columnas[11]="Hora";               $Valores[11]= $hora;
            $Columnas[12]="ProcentajeIVA";      $Valores[12]=($DatosProductos["IVA"]*100)."%";
            $Columnas[13]="Departamento";       $Valores[13]=$DatosProductos["Departamento"];
            $Columnas[14]="Sub1";               $Valores[14]=$DatosProductos["Sub1"];
            $Columnas[15]="Sub2";               $Valores[15]= $DatosProductos["Sub2"];
            $Columnas[16]="Sub3";               $Valores[16]= $DatosProductos["Sub3"];
            $Columnas[17]="Sub4";               $Valores[17]= $DatosProductos["Sub4"];
            $Columnas[18]="Sub5";               $Valores[18]= $DatosProductos["Sub5"];
            $this->InsertarRegistro($tab,$NumRegistros,$Columnas,$Valores);
            
            return($idPedido);
        }
        
       //Agregar un Producto a un domicilio
        
        public function AgregueProductoADomicilio($idDomicilio,$fecha,$hora,$Cantidad,$idProducto,$Observaciones,$Vector) {
            $idUser=$this->idUser;
            $FechaHora=$fecha." ".$hora;
            
            $DatosProductos=$this->DevuelveValores("productosventa", "idProductosVenta", $idProducto);
            $ValoresProducto=$this->CalculeValoresItem($fecha, $idProducto, "productosventa", $Cantidad, "");
            $tab="restaurante_pedidos_items";
            $NumRegistros=19; 

            $Columnas[0]="idProducto";          $Valores[0]=$idProducto;
            $Columnas[1]="NombreProducto";      $Valores[1]=$DatosProductos["Nombre"];
            $Columnas[2]="Cantidad";            $Valores[2]=$Cantidad;
            $Columnas[3]="ValorUnitario";       $Valores[3]=$ValoresProducto["ValorUnitario"];
            $Columnas[4]="Subtotal";            $Valores[4]=$ValoresProducto["Subtotal"];
            $Columnas[5]="IVA";                 $Valores[5]=$ValoresProducto["IVA"];
            $Columnas[6]="Total";               $Valores[6]=$ValoresProducto["Total"];
            $Columnas[7]="Observaciones";       $Valores[7]=$Observaciones;
            $Columnas[8]="idPedido";            $Valores[8]=$idDomicilio;
            $Columnas[9]="idUsuario";           $Valores[9]= $this->idUser;
            $Columnas[10]="Fecha";              $Valores[10]=$fecha;
            $Columnas[11]="Hora";               $Valores[11]= $hora;
            $Columnas[12]="ProcentajeIVA";      $Valores[12]=($DatosProductos["IVA"]*100)."%";
            $Columnas[13]="Departamento";       $Valores[13]=$DatosProductos["Departamento"];
            $Columnas[14]="Sub1";               $Valores[14]=$DatosProductos["Sub1"];
            $Columnas[15]="Sub2";               $Valores[15]= $DatosProductos["Sub2"];
            $Columnas[16]="Sub3";               $Valores[16]= $DatosProductos["Sub3"];
            $Columnas[17]="Sub4";               $Valores[17]= $DatosProductos["Sub4"];
            $Columnas[18]="Sub5";               $Valores[18]= $DatosProductos["Sub5"];
            $this->InsertarRegistro($tab,$NumRegistros,$Columnas,$Valores);
            
            
        }
         
            /*
     * Registra una Venta Por Restaurante
     * 
     */
    
    public function RegistreVentaRestaurante($idPedido, $idCliente, $TipoPago, $Paga, $Devuelta, $CuentaDestino, $DatosVentaRapida){
  	
                
        $CentroCostos=$DatosVentaRapida["CentroCostos"];
        $ResolucionDian=$DatosVentaRapida["ResolucionDian"];
        $Cheques=$DatosVentaRapida["PagaCheque"];
        $Tarjetas=$DatosVentaRapida["PagaTarjeta"];
        $idTarjetas=$DatosVentaRapida["idTarjeta"];
        $PagaOtros=$DatosVentaRapida["PagaOtros"];
        $Observaciones=$DatosVentaRapida["Observaciones"];
        
        $OrdenCompra="";
        $OrdenSalida="";
        $ObservacionesFactura=$Observaciones;
        $FechaFactura=date("Y-m-d");
        
        $Consulta=$this->DevuelveValores("centrocosto", "ID", $CentroCostos);
        $EmpresaPro=$Consulta["EmpresaPro"];
        if($TipoPago=="Contado"){
            $SumaDias=0;
        }else{
            $SumaDias=$TipoPago;
        }
        ////////////////////////////////Preguntamos por disponibilidad
        ///////////
        ///////////
        $ID="";
        $DatosResolucion=$this->DevuelveValores("empresapro_resoluciones_facturacion", "ID", $ResolucionDian);
        if($DatosResolucion["Completada"]=="NO"){           ///Pregunto si la resolucion ya fue completada
            $Disponibilidad=$DatosResolucion["Estado"];
                                              //si entra a verificar es porque estaba ocupada y cambiará a 1
            while($Disponibilidad=="OC"){                   //miro que esté disponible para facturar, esto para no crear facturas dobles
                print("Esperando disponibilidad<br>");
                usleep(300);
                $DatosResolucion=$this->DevuelveValores("empresapro_resoluciones_facturacion", "ID", $ResolucionDian);
                $Disponibilidad=$DatosResolucion["Estado"];
                
            }
            
            $DatosResolucion=$this->DevuelveValores("empresapro_resoluciones_facturacion", "ID", $ResolucionDian);
            if($DatosResolucion["Completada"]<>"SI"){
                $this->ActualizaRegistro("empresapro_resoluciones_facturacion", "Estado", "OC", "ID", $ResolucionDian); //Ocupo la resolucion
                
                $sql="SELECT MAX(NumeroFactura) as FacturaActual FROM facturas WHERE Prefijo='$DatosResolucion[Prefijo]' "
                        . "AND TipoFactura='$DatosResolucion[Tipo]' AND idResolucion='$ResolucionDian'";
                $Consulta=$this->Query($sql);
                $Consulta=$this->FetchArray($Consulta);
                $FacturaActual=$Consulta["FacturaActual"];
                $idFactura=$FacturaActual+1;
                
                //Verificamos si ya se completó el numero de la resolucion y si es así se cambia su estado
                if($DatosResolucion["Hasta"]==$idFactura){ 
                    $this->ActualizaRegistro("empresapro_resoluciones_facturacion", "Completada", "SI", "ID", $ResolucionDian);
                }
                //Verificamos si es la primer factura que se creará con esta resolucion
                //Si es así se inicia desde el numero autorizado
                if($idFactura==1){
                   $idFactura=$DatosResolucion["Desde"];
                }
                //Convertimos los dias en credito
                $FormaPagoFactura=$TipoPago;
                if($TipoPago<>"Contado"){
                    $FormaPagoFactura="Credito a $TipoPago dias";
                }
                ////////////////Inserto datos de la factura
                /////
                ////
                $DatosSucursal=  $this->DevuelveValores("empresa_pro_sucursales", "Actual", 1); 
                $ID=date("YmdHis").microtime(false);
                $tab="facturas";
                $NumRegistros=32; 
                
                $Columnas[0]="TipoFactura";		    $Valores[0]=$DatosResolucion["Tipo"];
                $Columnas[1]="Prefijo";                     $Valores[1]=$DatosResolucion["Prefijo"];
                $Columnas[2]="NumeroFactura";               $Valores[2]=$idFactura;
                $Columnas[3]="Fecha";                       $Valores[3]=$FechaFactura;
                $Columnas[4]="OCompra";                     $Valores[4]=$OrdenCompra;
                $Columnas[5]="OSalida";                     $Valores[5]=$OrdenSalida;
                $Columnas[6]="FormaPago";                   $Valores[6]=$FormaPagoFactura;
                $Columnas[7]="Subtotal";                    $Valores[7]="";
                $Columnas[8]="IVA";                         $Valores[8]="";
                $Columnas[9]="Descuentos";                  $Valores[9]="";
                $Columnas[10]="Total";                      $Valores[10]="";
                $Columnas[11]="SaldoFact";                  $Valores[11]="";
                $Columnas[12]="Cotizaciones_idCotizaciones";$Valores[12]="";
                $Columnas[13]="EmpresaPro_idEmpresaPro";    $Valores[13]=$EmpresaPro;
                $Columnas[14]="Usuarios_idUsuarios";        $Valores[14]=$this->idUser;
                $Columnas[15]="Clientes_idClientes";        $Valores[15]=$idCliente;
                $Columnas[16]="TotalCostos";                $Valores[16]="";
                $Columnas[17]="CerradoDiario";              $Valores[17]="";
                $Columnas[18]="FechaCierreDiario";          $Valores[18]="";
                $Columnas[19]="HoraCierreDiario";           $Valores[19]="";
                $Columnas[20]="ObservacionesFact";          $Valores[20]=$ObservacionesFactura;
                $Columnas[21]="CentroCosto";                $Valores[21]=$CentroCostos;
                $Columnas[22]="idResolucion";               $Valores[22]=$ResolucionDian;
                $Columnas[23]="idFacturas";                 $Valores[23]=$ID;
                $Columnas[24]="Hora";                       $Valores[24]=date("H:i:s");
                $Columnas[25]="Efectivo";                   $Valores[25]=$Paga;
                $Columnas[26]="Devuelve";                   $Valores[26]=$Devuelta;
                $Columnas[27]="Cheques";                    $Valores[27]=$Cheques;
                $Columnas[28]="Otros";                      $Valores[28]=$PagaOtros;
                $Columnas[29]="Tarjetas";                   $Valores[29]=$Tarjetas;
                $Columnas[30]="idTarjetas";                 $Valores[30]=$idTarjetas;
                $Columnas[31]="idSucursal";                 $Valores[31]=$DatosSucursal["ID"];
                
                $this->InsertarRegistro($tab,$NumRegistros,$Columnas,$Valores);
                
                //libero la resolucion
                $this->ActualizaRegistro("empresapro_resoluciones_facturacion", "Estado", "", "ID", $ResolucionDian);
                
                //////////////////////Agrego Items a la Factura desde la devolucion
                /////
                /////
                
                
                $Datos["idPedido"]=$idPedido;
                $Datos["NumFactura"]=$idFactura;
                $Datos["FechaFactura"]=$FechaFactura;
                $Datos["ID"]=$ID;
                $Datos["CuentaDestino"]=$CuentaDestino;
                $Datos["EmpresaPro"]=$EmpresaPro;
                $Datos["CentroCostos"]=$CentroCostos;
                $this->InsertarItemsPedidoAItemsFactura($Datos);///Relaciono los items de la factura
                
                $this->InsertarFacturaLibroDiario($Datos);///Inserto Items en el libro diario
               
                if($TipoPago<>"Contado"){                   //Si es a Credito
                    $Datos["Fecha"]=$FechaFactura; 
                    $Datos["Dias"]=$SumaDias;
                    $FechaVencimiento=$this->SumeDiasFecha($Datos);
                    $Datos["idFactura"]=$Datos["ID"]; 
                    $Datos["FechaFactura"]=$FechaFactura; 
                    $Datos["FechaVencimiento"]=$FechaVencimiento;
                    $Datos["idCliente"]=$idCliente;
                    $this->InsertarFacturaEnCartera($Datos);///Inserto La factura en la cartera
                }
                 
            }    
          
        }else{
            exit("La Resolucion de facturacion fue completada");
        }
	return ($ID);	
		
	}
        
                 /*
 * Funcion Agregar items de un pedido a una factura
 */
    
    public function InsertarItemsPedidoAItemsFactura($Datos){
        
        $idPedido=$Datos["idPedido"];
        $NumFactura=$Datos["ID"];
        $FechaFactura=$Datos["FechaFactura"];
        
        $sql="SELECT * FROM restaurante_pedidos_items WHERE idPedido='$idPedido'";
        $Consulta=$this->Query($sql);
        $TotalSubtotal=0;
        $TotalIVA=0;
        $GranTotal=0;
        $TotalCostos=0;
        
        while($DatosCotizacion=  $this->FetchArray($Consulta)){

            $DatosProducto=$this->DevuelveValores("productosventa", "idProductosVenta", $DatosCotizacion["idProducto"]);
            ////Empiezo a insertar en la tabla items facturas
            ///
            ///
            $SubtotalItem=$DatosCotizacion["Subtotal"];
            $TotalSubtotal=$TotalSubtotal+$SubtotalItem; //se realiza la sumatoria del subtotal
            
            $IVAItem=$DatosCotizacion["IVA"];
            $TotalIVA=$TotalIVA+$IVAItem; //se realiza la sumatoria del iva
            
            $TotalItem=$DatosCotizacion['Total'];
            $GranTotal=$GranTotal+$TotalItem;//se realiza la sumatoria del total
            
            $SubtotalCosto=$DatosCotizacion['Cantidad']*$DatosProducto["CostoUnitario"];
            $TotalCostos=$TotalCostos+$SubtotalCosto;//se realiza la sumatoria de los costos
            
            //$ID=date("YmdHis").microtime(false);
            $tab="facturas_items";
            $NumRegistros=26;
            $Columnas[0]="ID";			$Valores[0]="";
            $Columnas[1]="idFactura";           $Valores[1]=$NumFactura;
            $Columnas[2]="TablaItems";          $Valores[2]="productosventa";
            $Columnas[3]="Referencia";          $Valores[3]=$DatosProducto["Referencia"];
            $Columnas[4]="Nombre";              $Valores[4]=$DatosProducto["Nombre"];
            $Columnas[5]="Departamento";	$Valores[5]=$DatosProducto["Departamento"];
            $Columnas[6]="SubGrupo1";           $Valores[6]=$DatosProducto['Sub1'];
            $Columnas[7]="SubGrupo2";           $Valores[7]=$DatosProducto['Sub2'];
            $Columnas[8]="SubGrupo3";           $Valores[8]=$DatosProducto['Sub3'];
            $Columnas[9]="SubGrupo4";           $Valores[9]=$DatosProducto['Sub4'];
            $Columnas[10]="SubGrupo5";          $Valores[10]=$DatosProducto['Sub5'];
            $Columnas[11]="ValorUnitarioItem";	$Valores[11]=$DatosCotizacion['ValorUnitario'];
            $Columnas[12]="Cantidad";		$Valores[12]=$DatosCotizacion['Cantidad'];
            $Columnas[13]="Dias";		$Valores[13]=1;
            $Columnas[14]="SubtotalItem";       $Valores[14]=$SubtotalItem;
            $Columnas[15]="IVAItem";		$Valores[15]=$IVAItem;
            $Columnas[16]="TotalItem";		$Valores[16]=$TotalItem;
            $Columnas[17]="PorcentajeIVA";	$Valores[17]=($DatosProducto['IVA']*100)."%";
            $Columnas[18]="PrecioCostoUnitario";$Valores[18]=$DatosProducto['CostoUnitario'];
            $Columnas[19]="SubtotalCosto";	$Valores[19]=$SubtotalCosto;
            $Columnas[20]="TipoItem";		$Valores[20]="PR";
            $Columnas[21]="CuentaPUC";		$Valores[21]=$DatosProducto['CuentaPUC'];
            $Columnas[22]="GeneradoDesde";	$Valores[22]="cotizacionesv5";
            $Columnas[23]="NumeroIdentificador";$Valores[23]="";
            $Columnas[24]="FechaFactura";       $Valores[24]=$FechaFactura;
            $Columnas[25]="idUsuarios";         $Valores[25]= $this->idUser;
            
            $this->InsertarRegistro($tab,$NumRegistros,$Columnas,$Valores);
            
                
        $DatosKardex["Cantidad"]=$DatosCotizacion['Cantidad'];
        $DatosKardex["idProductosVenta"]=$DatosProducto["idProductosVenta"];
        $DatosKardex["CostoUnitario"]=$DatosProducto['CostoUnitario'];
        $DatosKardex["Existencias"]=$DatosProducto['Existencias'];
        $DatosKardex["Detalle"]="Factura";
        $DatosKardex["idDocumento"]=$NumFactura;
        $DatosKardex["TotalCosto"]=$SubtotalCosto;
        $DatosKardex["Movimiento"]="SALIDA";
        $DatosKardex["CostoUnitarioPromedio"]=$DatosProducto["CostoUnitarioPromedio"];
        $DatosKardex["CostoTotalPromedio"]=$DatosProducto["CostoUnitarioPromedio"]*$DatosKardex["Cantidad"];
        $this->InserteKardex($DatosKardex);
            
        }
        $ID=$Datos["ID"]; 
        $TotalSubtotal=$TotalSubtotal;
        $TotalIVA=$TotalIVA;
        $GranTotal=$GranTotal;
        $TotalCostos=round($TotalCostos);
        $sql="UPDATE facturas SET Subtotal='$TotalSubtotal', IVA='$TotalIVA', Total='$GranTotal', "
                . "SaldoFact='$GranTotal', TotalCostos='$TotalCostos' WHERE idFacturas='$ID'";
        $this->Query($sql);
        
    } 
    
    //Fin Clases
}