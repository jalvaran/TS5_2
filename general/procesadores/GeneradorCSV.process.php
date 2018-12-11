<?php 
ession_start();
if (!isset($_SESSION['username'])){
  exit("<a href='../../index.php' ><img src='../images/401.png'>Iniciar Sesion </a>");
  
}

if(isset($_REQUEST["Opcion"])){
    $myPage="GeneradorCSV.php";
    include_once("../../modelo/php_conexion.php");
    
    session_start();    
    $idUser=$_SESSION['idUser'];
    $obVenta = new conexion($idUser);
    
    $OuputFile="../exports/";
    $Link1=substr($OuputFile, -17);
    $Link="../../".$Link1;
    //print($Link);
    $a='"';
    $Enclosed=" ENCLOSED BY '$a' ";
    $Opcion=$_REQUEST["Opcion"];
    
    switch ($Opcion){
        case 1: //Exportar CSV 
            
            unlink($Link);
            $Tabla=$obVenta->normalizar(base64_decode($_REQUEST["TxtT"]));
            $statement=$obVenta->normalizar(urldecode($_REQUEST["TxtL"]));
            $Columnas=$obVenta->ShowColums($Tabla);
            $sqlColumnas="SELECT ";
            $CamposShow="";
            foreach($Columnas["Field"] as $Campo){
                $consulta=$obVenta->ConsultarTabla("tablas_campos_control", "WHERE NombreTabla='$Tabla' AND Campo='$Campo'");
                $DatosCampo=$obVenta->FetchArray($consulta);
                if($DatosCampo["Visible"]=='' or $DatosCampo["Visible"]=='1'){
                    $sqlColumnas.="'$Campo',";
                    $CamposShow.="`$Campo`,";
                }
                
            }
            $sqlColumnas=substr($sqlColumnas, 0, -1);
            $CamposShow=substr($CamposShow, 0, -1);
            $sqlColumnas.=" UNION ALL ";
            $Indice=$Columnas["Field"][0];
            //print($Indice);
            $sql=$sqlColumnas."SELECT $CamposShow FROM $statement INTO OUTFILE '$OuputFile' FIELDS TERMINATED BY ';' $Enclosed LINES TERMINATED BY '\r\n';";
            $obVenta->Query($sql);
            print("<a href='$Link' target='_top'><img src='../../images/download.gif'>Download</img></a>");
            break;
        case 2:   //Resumen de facturacion agrupado por referencia en un periodo de tiempo
            unlink($Link);
            $FechaIni=$obVenta->normalizar($_REQUEST["TxtFechaIni"]);
            $FechaFin=$obVenta->normalizar($_REQUEST["TxtFechaFin"]);
            $sql="SELECT 'ID', 'FECHA', 'REFERENCIA','NOMBRE', 'DEPARTAMENTO', 'SUB1', 'SUB2','SUB3', 'SUB4','SUB5', 'CANTIDAD','TOTAL VENTA','COSTOS','EXISTENCIA' UNION ALL ";
            $sql.="SELECT ID,`FechaFactura`, `Referencia`,`Nombre`,`Departamento`,`SubGrupo1`,`SubGrupo2`,"
                . "`SubGrupo3`,`SubGrupo4`,`SubGrupo5`,SUM(`Cantidad`) as Cantidad,round(SUM(`TotalItem`)) as TotalVenta,"
                . "round(SUM(`SubtotalCosto`)) as Costo,(SELECT Existencias FROM productosventa WHERE productosventa.Referencia=facturas_items.Referencia) as Existencias"
                    . " FROM `facturas_items` "
                . "WHERE `FechaFactura`>='$FechaIni' AND `FechaFactura`<='$FechaFin' "
                . "GROUP BY `Referencia` "
                . " INTO OUTFILE '$OuputFile' FIELDS TERMINATED BY ';' $Enclosed LINES TERMINATED BY '\r\n';";
            $obVenta->Query($sql);
            print("Resumen de Facturacion Generado exitosamente <a href='$Link'>Abrir</a>");
            break;
        }
}else{
    print("No se recibió parametro de opcion");
}

?>