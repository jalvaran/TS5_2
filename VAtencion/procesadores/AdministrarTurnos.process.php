<?php
include_once("../../modelo/php_conexion.php");
include_once("../clases/Nomina.class.php");
session_start();
$idUser=$_SESSION['idUser'];

if(isset($_REQUEST["idAccion"])){
    $obNomina=new Nomina($idUser);
    $idAccion=$obNomina->normalizar($_REQUEST["idAccion"]);
    
    switch ($idAccion) {
        case 1://Agrega Turno a un Tercero
            $Fecha=$obNomina->normalizar($_REQUEST["Fecha"]);
            $idTercero=$obNomina->normalizar($_REQUEST["idTercero"]);
            $idSede=$obNomina->normalizar($_REQUEST["idSede"]); 
            $Valor=$obNomina->normalizar($_REQUEST["TxtValor"]); 
            $obNomina->AgregarTurnoNominaBasica($Fecha, $idTercero, $idSede, $Valor, $idUser, "");
            print("OK");
        break;
        case 2: //Dibujo los turnos
            include_once("../css_construct.php");
            $css =  new CssIni("",0);
            // Consultas enviadas a traves de la URL
            $statement=" vista_nomina_servicios_turnos WHERE Fecha<>'' ";
            $Separador=$obNomina->normalizar($_REQUEST['Separador']);
            $FechaInicial='';
            $FechaFinal='';
            //Paginacion
            if(isset($_REQUEST['Page'])){
                $NumPage=$obNomina->normalizar($_REQUEST['Page']);
            }else{
                $NumPage=1;
            }

            //////////////////
            //Busco por EPS
            if(!empty($_REQUEST["Tercero"])){
                $idTercero=$obNomina->normalizar($_REQUEST['Tercero']);
                $statement.=" AND Tercero='$idTercero' ";
                
            }
            // por Fecha Inicial
            if(!empty($_REQUEST["FechaInicial"])){
                $FechaInicial=$obNomina->normalizar($_REQUEST['FechaInicial']);
                     
                $statement.="  AND Fecha>='$FechaInicial' ";
            }
            
            // por Fecha Final
            if(!empty($_REQUEST["FechaFinal"])){
                $FechaFinal=$obNomina->normalizar($_REQUEST['FechaFinal']);
                     
                $statement.="  AND Fecha<='$FechaFinal' ";
            }

            //Busco por Sede
            $idSede="";
            if(!empty($_REQUEST["Sucursal"])){
                $idSede=$obNomina->normalizar($_REQUEST['Sucursal']);
                $statement.=" AND `Sucursal` = '$idSede'";
            }


            if(isset($_REQUEST['st'])){

                $statement= urldecode($_REQUEST['st']);
                
            }

            


            //Paginacion
            $limit = 10;
            $startpoint = ($NumPage * $limit) - $limit;
            $VectorST = explode("LIMIT", $statement);
            $statement = $VectorST[0]; 
            $query = "SELECT COUNT(*) as `num`,SUM(Valor) as Total FROM {$statement}";
            $row = $obNomina->FetchArray($obNomina->Query($query));
            $ResultadosTotales = $row['num'];
            $Total=$row['Total'];
            $Limites=" ORDER BY ID DESC LIMIT $startpoint,$limit ";
            
            //print("st:$statement");
            $consulta=$obNomina->Query("SELECT * FROM $statement $Limites");
            if($obNomina->NumRows($consulta)){
                
                //$css->CrearNotificacionNaranja("Historial de Turnos", 16);
                
                $css->CrearTabla();
                
                    $st= urlencode($statement);
                    $css->CrearDiv("DivActualizar", "", "center", 0, 1);
                            $Page="procesadores/AdministrarTurnos.process.php?st=$st&Page=$NumPage&idAccion=$idAccion&Separador=$Separador&Carry=";
                               
                            $FuncionJS="EnvieObjetoConsulta(`$Page`,`FiltroTercero`,`DivHistorialTurnos`,`5`);return false ;";

                            $css->CrearBotonEvento("BtnActualizarTurnos", "Actualizar", 1, "onclick", $FuncionJS, "naranja", "");
                        $css->CerrarDiv();
                    if($ResultadosTotales>$limit){
                        
                        $css->FilaTabla(14);
                            print("<td colspan='1' style=text-align:center>");
                            if($NumPage>1){
                                $NumPage1=$NumPage-1;
                                $Page="procesadores/AdministrarTurnos.process.php?st=$st&Page=$NumPage1&idAccion=$idAccion&Separador=$Separador&Carry=";
                                $FuncionJS="EnvieObjetoConsulta(`$Page`,`FiltroTercero`,`DivHistorialTurnos`,`5`);return false ;";

                                $css->CrearBotonEvento("BtnMas", "Página $NumPage1", 1, "onclick", $FuncionJS, "rojo", "");

                            }
                            print("</td>");
                            $TotalPaginas= ceil($ResultadosTotales/$limit);
                            print("<td colspan=4 style=text-align:center>");
                            print("<strong>Página: </strong>");

                            $Page="procesadores/AdministrarTurnos.process.php?st=$st&idAccion=$idAccion&Separador=$Separador&Page=";
                            $FuncionJS="EnvieObjetoConsulta(`$Page`,`CmbPage`,`DivHistorialTurnos`,`5`);return false ;";
                            $css->CrearSelect("CmbPage", $FuncionJS,70);
                                for($p=1;$p<=$TotalPaginas;$p++){
                                    if($p==$NumPage){
                                        $sel=1;
                                    }else{
                                        $sel=0;
                                    }
                                    $css->CrearOptionSelect($p, "$p", $sel);
                                }

                            $css->CerrarSelect();
                            print("</td>");
                            
                            print("<td colspan='1' style=text-align:center>");
                            if($ResultadosTotales>($startpoint+$limit)){
                                $NumPage1=$NumPage+1;
                                $Page="procesadores/AdministrarTurnos.process.php?st=$st&Page=$NumPage1&idAccion=$idAccion&Separador=$Separador&Carry=";
                                $FuncionJS="EnvieObjetoConsulta(`$Page`,`FiltroTercero`,`DivHistorialTurnos`,`5`);return false ;";

                                $css->CrearBotonEvento("BtnMas", "Página $NumPage1", 1, "onclick", $FuncionJS, "verde", "");
                            }
                            print("</td>");
                           $css->CierraFilaTabla(); 
                        }
                        
                    
                    
                  $MuestreEncabezado=0;  
                while($DatosTurnos=$obNomina->FetchArray($consulta)){
                    $idItem=$DatosTurnos["ID"];
                    if($MuestreEncabezado==0){
                        $MuestreEncabezado=1;  
                        $css->FilaTabla(14);
                            $css->ColTabla("<h4 style='color:red'>Total: ".number_format($Total)."</h4>", 1);
                        print("<td colspan=3>");
                            $css->CrearNotificacionNaranja("Historial de Turnos", 14);
                        print("</td>");
                        print("<td colspan='2' style='text-align:center'>");
                        
                        $css->CrearImageLink("ProcesadoresJS/GeneradorCSVReportes.php?Opcion=1&sp=$Separador&st=$st", "../images/csv.png", "_blank", 50, 50);

                    print("</td>");
                        $css->CierraFilaTabla();
                        $css->FilaTabla(14);
                        $css->ColTabla("<strong>Fecha</strong>", 1);
                        $css->ColTabla("<strong>Sede</strong>", 1);
                        $css->ColTabla("<strong>Tercero</strong>", 1);
                        $css->ColTabla("<strong>Valor</strong>", 1); 
                        $css->ColTabla("<strong>Editar</strong>", 1); 
                        $css->ColTabla("<strong>Anular</strong>", 1);
                    $css->CierraFilaTabla();
                    }
                    
                    $css->FilaTabla(14);
                        $css->ColTabla($DatosTurnos["Fecha"], 1);
                        $css->ColTabla($DatosTurnos["NombreSucursal"], 1);
                        $css->ColTabla($DatosTurnos["NombreTercero"], 1);
                        print("<td>");
                            $css->CrearInputNumber("TxtValor".$idItem, "number", "", $DatosTurnos["Valor"], "Valor", "", "onChange", "EditarValor($idItem)", 150, 30, 0, 0, "", "", 1);
                        print("</td>");
                        print("<td>");    
                            $css->CrearBotonEvento("BtnEditar", "E", 1, "", "", "naranja", "");
                        
                        print("</td>");
                        print("<td>");
                            $css->CrearBotonEvento("BtnEliminar", "X", 1, "onClick", "EliminarItem($idItem)", "rojo", "");
                        print("</td>");                        
                        
                    $css->CierraFilaTabla();
                }
                $css->CerrarTabla();
            }else{
                $css->CrearNotificacionAzul("No hay resultados", 16);
            }
            break;
        case 3://Editar un valor
            $idItemEditar=$obNomina->normalizar($_REQUEST["idItem"]);
            $Valor=$obNomina->normalizar($_REQUEST["Valor"]);
            $obNomina->ActualizaRegistro("nomina_servicios_turnos", "Valor", $Valor, "ID", $idItemEditar);
            
            print("OK");
            break;
        case 4://Elimina un turno
            $idItem=$obNomina->normalizar($_REQUEST["idItem"]);           
            $obNomina->ActualizaRegistro("nomina_servicios_turnos", "Estado", "ANULADO", "ID", $idItem);
            print("OK");
        break;
        
    }
    
}else{
    print("No se recibiron parametros");
}
?>