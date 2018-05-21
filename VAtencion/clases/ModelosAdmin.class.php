<?php
include_once '../../modelo/PrintPos.php';
/* 
 * Clase donde se realizaran procesos de agendamiento y facturacion del modulo de admin modelos.
 * Julian Alvaran
 * Techno Soluciones SAS
 */
        
class Modelos extends ProcesoVenta{
    
    /**
     * Metodo agregar agenda a una modelo
     * @param type $idModelo ->atr.  modelo que prestará el servicio
     * @param type $Valor ->atr.  valor negociado por la modelo
     * @param type $ValorModelo ->atr.  Valor que se le debe pagar a la modelo
     * @param type $Tiempo ->atr.  Tiempo que tarda el servicio
     * @param type $HoraInicial ->atr.  Hora en que inicia el servicio
     * @param type $idUser ->atr. Usuario que registra el servicio
     * @param type $Vector ->vector futuro
     */
    public function NuevaAgenda($idModelo,$Valor,$ValorModelo,$Tiempo,$HoraInicial,$idUser, $Vector) {
        $ValorCasa=$Valor-$ValorModelo;
        if($ValorModelo>$Valor){
            $ValorModelo=$Valor;
            $ValorCasa=0;
        }
        //////Ingreso a agenda          
        $tab="modelos_agenda";
        $NumRegistros=8;

        $Columnas[0]="idModelo";	$Valores[0]=$idModelo;
        $Columnas[1]="ValorPagado";     $Valores[1]=$Valor;
        $Columnas[2]="ValorModelo";     $Valores[2]=$ValorModelo;
        $Columnas[3]="ValorCasa";	$Valores[3]=$Valor-$ValorModelo;
        $Columnas[4]="Minutos";         $Valores[4]=$Tiempo;
        $Columnas[5]="HoraInicial";	$Valores[5]=date("Y-m-d")." ".$HoraInicial;
        $Columnas[6]="HoraATerminar";	$Valores[6]=date( "Y-m-d H:i:s" ,strtotime($Valores[5])+($Tiempo*60));  //Arreglar
        $Columnas[7]="idUser";          $Valores[7]=$idUser;
        $this->InsertarRegistro($tab,$NumRegistros,$Columnas,$Valores);
        
    }
    
    /**
     * Metodo crear una factura  a partir de la agenda 
     * @param type $idAgenda ->atr.  id de la agenda a facturar
     * @param type $idUser ->atr. usuario que factura
     * 
     */
    public function FacturarServicioModelos($idAgenda,$idUser,$Vector) {
        $DatosAgenda=$this->DevuelveValores("modelos_agenda", "ID", $idAgenda);
        $DatosConfigFacturaModel=$this->DevuelveValores("modelos_config_factura", "ID", 1);
        $fecha=date("Y-m-d");
        $idPreventa=99;// se utiliza esta para no interferir en la operacion
        //Agrego el item a la preventa 99
        
        $this->AgregaPreventa($fecha,1,$idPreventa,$DatosConfigFacturaModel['idItemFactura'],"servicios",$DatosAgenda["ValorPagado"]);
        
        //Registro la venta y creo la factura
        $Parametros= $this->DevuelveValores("parametros_contables", "ID", 21); // en este registro se encuentra la cuenta por defecto a utilizar en caja
        $CuentaDestino=$Parametros["CuentaPUC"];
        $DatosVentaRapida["PagaCheque"]=0;
        $DatosVentaRapida["PagaTarjeta"]=0;
        $DatosVentaRapida["idTarjeta"]=0;
        $DatosVentaRapida["PagaOtros"]=0;
        $DatosCaja=$this->DevuelveValores("cajas", "idUsuario", $idUser);
        $DatosVentaRapida["CentroCostos"]=$DatosCaja["CentroCostos"];
        $DatosVentaRapida["ResolucionDian"]=$DatosCaja["idResolucionDian"];
        $DatosVentaRapida["Observaciones"]="";
        $NumFactura=$this->RegistreVentaRapida($idPreventa, 1, "Contado", $DatosAgenda["ValorPagado"], 0, $Parametros["CuentaPUC"], $DatosVentaRapida);
        $this->FacturaKardex($NumFactura,$CuentaDestino, $idUser, "");
        //print("<script>alert('Entra 2')</script>");
        $this->BorraReg("preventa","VestasActivas_idVestasActivas",$idPreventa);
        
        return($NumFactura);
    }
    /**
     * Funcion para cerrar el turno de las modelos
     * @param type $idModelo = id de la modelo a cerrar, si está vacío se cerrará el turno de todas
     * @param type $idUser = usuario que cierra turno
     * @param type $Vector = futuro
     */    
    public function CerrarTurnoModelos($idModelo,$idUser,$Vector) {
        
        $tab="modelos_cierres";
        $NumRegistros=3;

        $Columnas[0]="Fecha";           $Valores[0]=date("Y-m-d");
        $Columnas[1]="Hora";            $Valores[1]=date("H:i:s");
        $Columnas[2]="idUser";          $Valores[2]=$idUser;
       
        $this->InsertarRegistro($tab,$NumRegistros,$Columnas,$Valores);
        $idCierre=$this->ObtenerMAX($tab, "ID", 1, "");
        $CondicionAdicional="";
        if($idModelo > 0){
            $CondicionAdicional=" AND idModelo='$idModelo'";
        }
        $sql="UPDATE modelos_agenda SET idCierre='$idCierre' WHERE idUser='$idUser' AND idCierre='' $CondicionAdicional";
        $this->Query($sql);
        return($idCierre);
    }
    //Fin Clases
}

/* 
 * Clase para imprimir facturas y cierres
 * Julian Alvaran
 * Techno Soluciones SAS
 */
        
class PrintPosModels extends PrintPos{
    /**
     * Funcion para imprimir un cierre del modulo de modelos
     * @param type $idCierre  id del cierre a imprimir
     * @param type $Vector uso futuro
     */
    public function PrintCierre($idCierre,$Vector) {
        $DatosImpresora=$this->DevuelveValores("config_puertos", "ID", 1);   
        if($DatosImpresora["Habilitado"]<>"SI"){
            return;
        }
        $COMPrinter= $this->COMPrinter;
        if(($handle = @fopen("$COMPrinter", "w")) === FALSE){
            die('ERROR:\nNo se puedo Imprimir, Verifique la conexion de la IMPRESORA');
        }
        $Titulo="Comprobante de Cierre No. $idCierre";
        $DatosCierre=$this->DevuelveValores("modelos_agenda", "ID", $idCierre);
        $Fecha=$DatosCierre["Fecha"];
        $Hora=$DatosCierre["Hora"];
        $idUsuario=$DatosCierre["idUser"];
        $Usuarios[]="";
        $sql="SELECT Estado,`ValorPagado`,`ValorModelo`, idModelo, ValorCasa ,HoraInicial,Minutos  FROM `modelos_agenda` "
                . "WHERE `idCierre`='$idCierre' ORDER BY idModelo";
        $Consulta=$this->Query($sql);
        while($DatosCierre=$this->FetchArray($Consulta)){
            $Estado=$DatosCierre["Estado"];
            $idModelo=$DatosCierre["idModelo"];            
            $TotalesPedidos[$idModelo][$Estado]=$DatosCierre["Total"];            
        }
        for($i=1; $i<=$Copias;$i++){
        fwrite($handle,chr(27). chr(64));//REINICIO
        fwrite($handle, chr(27). chr(112). chr(48));//ABRIR EL CAJON
        fwrite($handle, chr(27). chr(100). chr(0));// SALTO DE CARRO VACIO
        fwrite($handle, chr(27). chr(33). chr(8));// NEGRITA
        fwrite($handle, chr(27). chr(97). chr(1));// CENTRADO
        fwrite($handle,"*************************************");
        fwrite($handle, chr(27). chr(100). chr(1));// SALTO DE LINEA
        fwrite($handle,$Titulo); // Titulo
        fwrite($handle, chr(27). chr(100). chr(1));// SALTO DE LINEA
        fwrite($handle,"*************************************");
        
        fwrite($handle, chr(27). chr(100). chr(1));// SALTO DE LINEA
        fwrite($handle, chr(27). chr(97). chr(0));// IZQUIERDA
        fwrite($handle,"FECHA: $Fecha      HORA: $Hora");
        fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
        fwrite($handle,"*************************************");
        fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
        foreach($Usuarios as $idUser){
            $DatosUsuario=$this->DevuelveValores("usuarios", "idUsuarios", $idUser);
            fwrite($handle,"USUARIO $DatosUsuario[Nombre] $DatosUsuario[Apellido]:");
            fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
            if(isset($TotalesPedidos[$idUser]["FAPE"])){
                fwrite($handle,"PEDIDOS FACTURADOS: ".number_format($TotalesPedidos[$idUser]["FAPE"]));
                fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
            }
            if(isset($TotalesPedidos[$idUser]["DEPE"])){
                fwrite($handle,"PEDIDOS DESCARTADOS: ".number_format($TotalesPedidos[$idUser]["DEPE"]));
                fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
            }
            if(isset($TotalesPedidos[$idUser]["FADO"])){
                fwrite($handle,"DOMICILIOS FACTURADOS: ".number_format($TotalesPedidos[$idUser]["FADO"]));
                fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
            }
            if(isset($TotalesPedidos[$idUser]["DEDO"])){
                fwrite($handle,"DOMICILIOS DESCARTADOS: ".number_format($TotalesPedidos[$idUser]["DEDO"]));
                fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
            }
            
        }
        fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
        fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
        fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
        fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
        fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
        fwrite($handle, chr(27). chr(100). chr(1));//salto de linea
    fwrite($handle, chr(29). chr(86). chr(49));//CORTA PAPEL
    }
    fclose($handle); // cierra el fichero PRN
    $salida = shell_exec('lpr $COMPrinter');
    }
}