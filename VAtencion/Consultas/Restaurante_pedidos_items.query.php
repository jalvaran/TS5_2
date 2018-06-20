<?php
include_once("../../modelo/php_conexion.php");
include_once("../css_construct.php");
include_once("../clases/Restaurante.class.php");

session_start();
$idUser=$_SESSION['idUser'];
$css =  new CssIni("",0);

$obRest=new Restaurante($idUser);

if(isset($_REQUEST["idPedido"])){
    $idPedido=$obRest->normalizar($_REQUEST["idPedido"]);
    $TotalPedido=$obRest->SumeColumna("restaurante_pedidos_items", "Total", "idPedido", $idPedido);
    $css->CrearNotificacionVerde("P_$idPedido Total: $".number_format($TotalPedido), 16);
    $DatosPedido=$obRest->DevuelveValores("restaurante_pedidos", "ID", $idPedido);
    $css->CrearTabla();
        $css->FilaTabla(16);
            //$css->ColTabla("Mesa", 1);
            $css->ColTabla("Departamento", 1);
            $css->ColTabla("Cantidad", 1);
            $css->ColTabla("Producto", 1);
            $css->ColTabla("Observaciones", 1);
            $css->ColTabla("Agregar", 1);
        $css->CierraFilaTabla();    
        $css->FilaTabla(16);
            
            print("<td>");
                $css->CrearSelect("idDepartamento", "CargarProductos()", 100);
                    $Datos=$obRest->ConsultarTabla("prod_departamentos", "");
                    $css->CrearOptionSelect("", "Seleccione", 0);
                    while ($DatosDepartamentos=$obRest->FetchArray($Datos)){
                        $css->CrearOptionSelect2($DatosDepartamentos["idDepartamentos"], $DatosDepartamentos["Nombre"], "", 0);
                        
                    }
                $css->CerrarSelect();
            print("</td>");
            print("<td>");
                $css->CrearInputNumber("Cantidad", "number", "", 1, "Cantidad", "", "", "", 60, 30, 0, 0, 0, '', "any");
            print("</td>");
            print("<td>");
                $css->CrearSelect("idProducto", "", 250);
                    
                    $css->CrearOptionSelect("", "Producto", 0);
                    
                $css->CerrarSelect();
            print("</td>");
            
            print("<td>");
                $css->CrearTextArea("Observaciones", "", "", "Observaciones", "", "", "", 100, 60, 0, 0);
            print("</td>");
            
            print("<td>");
                //$Page="Consultas/Restaurante_pedidos.query.php";
                $evento="onClick";
                //$funcion="EnvieObjetoConsulta2(`$Page`,`Observaciones`,`DivPedidos`,`9`);return false;";
                $funcion="AgregarItemPedido($idPedido)";
                $css->CrearBotonEvento("BtnAgregarPedido", "Agregar", 1, $evento, $funcion, "rojo", "");
            print("</td>");
        $css->CierraFilaTabla();
    $css->CerrarTabla();
    
    
    
    $consulta=$obRest->ConsultarTabla("restaurante_pedidos_items", " WHERE idPedido='$idPedido' ORDER BY ID DESC");
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