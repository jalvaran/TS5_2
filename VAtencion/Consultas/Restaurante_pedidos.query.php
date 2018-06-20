<?php
include_once("../../modelo/php_conexion.php");
include_once("../css_construct.php");
include_once("../clases/Restaurante.class.php");

session_start();
$idUser=$_SESSION['idUser'];
$css =  new CssIni("",0);

$obRest=new Restaurante($idUser);
//Se crea un domicilio
if(isset($_REQUEST["CrearDomicilio"])){
    $Telefono=$obRest->normalizar($_REQUEST["Telefono"]);
    $Nombre=$obRest->normalizar($_REQUEST["Nombre"]);
    $Direccion=$obRest->normalizar($_REQUEST["Direccion"]);
    $Observaciones=$obRest->normalizar($_REQUEST["Observaciones"]);
    $fecha=date("Y-m-d");
    $hora=date("H:i:s");
    
    $obRest->CreeDomicilio($fecha, $hora, 1, $Nombre,$Direccion, $Telefono, $Observaciones,$idUser, "");
}


if(isset($_REQUEST["TipoPedido"])){
    //Tipo pedido AB= pedidos abiertos, DO=Domicilios abieros, LL=para llevar Abiertos
    $TipoPedido=$obRest->normalizar($_REQUEST["TipoPedido"]);
    $css->CrearTabla();
        
    if($TipoPedido=="AB" and isset($_REQUEST["CuadroAdd"])){
        $Titulo="Pedidos";
        $css->CrearNotificacionNaranja($Titulo, 16);
        $css->FilaTabla(16);
            $css->ColTabla("Mesa", 1);
            $css->ColTabla("Departamento", 1);
            $css->ColTabla("Cantidad", 1);
            $css->ColTabla("Producto", 1);
            $css->ColTabla("Observaciones", 1);
            $css->ColTabla("Agregar", 1);
        $css->CierraFilaTabla();    
        $css->FilaTabla(16);
            print("<td>");
                $css->CrearSelect("idMesa", "", 100);
                    $Datos=$obRest->ConsultarTabla("restaurante_mesas", "");
                    $css->CrearOptionSelect("", "Seleccione", 0);
                    while ($DatosMesas=$obRest->FetchArray($Datos)){
                        $css->CrearOptionSelect($DatosMesas["ID"], $DatosMesas["Nombre"], 0);
                        
                    }
                $css->CerrarSelect();
            print("</td>");
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
                $funcion="AgregarItemPedido()";
                $css->CrearBotonEvento("BtnAgregarPedido", "Agregar", 1, $evento, $funcion, "rojo", "");
            print("</td>");
        $css->CierraFilaTabla();    
    }
    if($TipoPedido=="DO" and isset($_REQUEST["CuadroAdd"])){
        $Titulo="Domicilios";
        $css->CrearNotificacionRoja($Titulo, 16);
        $css->FilaTabla(16);
            print("<td>");
                $TxtFuncion="AutocompleteDatos()";
                $css->CrearInputText("Telefono", "text", "", "", "Telefono", "", "onKeyUp", $TxtFuncion, 110, 50, 0, 1);
            print("</td>");
            print("<td>");
                $TxtFuncion="";
                $css->CrearInputText("Nombre", "text", "", "", "Nombre", "", "onKeyUp", $TxtFuncion, 250, 50, 0, 1);
            print("</td>");
            print("<td>");
                $TxtFuncion="";
                $css->CrearInputText("Direccion", "text", "", "", "Direccion", "", "onKeyUp", $TxtFuncion, 200, 50, 0, 1);
            print("</td>");
            print("<td>");
                $css->CrearTextArea("Observaciones", "", "", "Observaciones", "", "", "", 180, 50, 0, 0);
            print("</td>");
        $css->CierraFilaTabla();
        $css->FilaTabla(16);
            print("<td colspan=4 style='text-align:center'>");
                $Page="Consultas/Restaurante_pedidos.query.php";
                $evento="onClick";
                $funcion="EnvieObjetoConsulta2(`$Page`,`Telefono`,`DivPedidos`,`8`);return false;";
                $css->CrearBotonEvento("BtnCrear", "Crear", 1, $evento, $funcion, "rojo", "");
            print("</td>");
        $css->CierraFilaTabla();
    }
    if($TipoPedido=="LL"){
        $Titulo="Para Llevar";
        $css->CrearNotificacionVerde($Titulo, 16);
    }
    
        
    $css->CerrarTabla();
}

    $css->CrearDiv("DivPedDom", "", "center", 1, 1);


$consulta=$obRest->ConsultarTabla("restaurante_pedidos", " WHERE Estado='$TipoPedido' ORDER BY ID ASC LIMIT 100");
if($obRest->NumRows($consulta)){
    $css->CrearTabla();
    if($TipoPedido=="DO"){
        $css->FilaTabla(16);
            $css->ColTabla("<strong>ID</strong>", 1);
            $css->ColTabla("<strong>Fecha y Hora</strong>", 1);
            $css->ColTabla("<strong>Cliente</strong>", 1);
            $css->ColTabla("<strong>Direccion</strong>", 1);
            $css->ColTabla("<strong>Telefono</strong>", 1);
            $css->ColTabla("<strong>Observaciones</strong>", 1);
            $css->ColTabla("<strong>Opciones</strong>", 1);
        $css->CierraFilaTabla();
        while($DatosPedidos=$obRest->FetchArray($consulta)){
            $css->FilaTabla(14);
            $css->ColTabla($DatosPedidos["ID"], 1);
            $css->ColTabla($DatosPedidos["Fecha"]." ".$DatosPedidos["Hora"], 1);
            $css->ColTabla($DatosPedidos["NombreCliente"], 1);
            $css->ColTabla($DatosPedidos["DireccionEnvio"], 1);
            $css->ColTabla($DatosPedidos["TelefonoConfirmacion"], 1);
            $css->ColTabla($DatosPedidos["Observaciones"], 1);
            print("<td>");
                $Page="Consultas/Restaurante_pedidos_items.query.php?idPedido=".$DatosPedidos["ID"]."&carry=";
                $evento="onClick";
                $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivPedidos`,`99`);return false;";
                $css->CrearBotonEvento("BtnVer", "+", 1, $evento, $funcion, "naranja", "");
            print("</td>");
        $css->CierraFilaTabla();
        }
    }
    
    if($TipoPedido=="AB"){
        $css->FilaTabla(16);
            $css->ColTabla("<strong>ID</strong>", 1);
            $css->ColTabla("<strong>Fecha y Hora</strong>", 1);
            $css->ColTabla("<strong>Mesa</strong>", 1);
            $css->ColTabla("<strong>Usuario</strong>", 1);
            $css->ColTabla("<strong>Opciones</strong>", 1);
        $css->CierraFilaTabla();
        while($DatosPedidos=$obRest->FetchArray($consulta)){
            $css->FilaTabla(14);
            $css->ColTabla($DatosPedidos["ID"], 1);
            $css->ColTabla($DatosPedidos["Fecha"]." ".$DatosPedidos["Hora"], 1);
            $css->ColTabla($DatosPedidos["idMesa"], 1);
            $css->ColTabla($DatosPedidos["idUsuario"], 1);
            
            print("<td>");
                $Page="Consultas/Restaurante_pedidos_items.query.php?idPedido=".$DatosPedidos["ID"]."&carry=";
                $evento="onClick";
                $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivPedidos`,`99`);return false;";
                $css->CrearBotonEvento("BtnVer", "+", 1, $evento, $funcion, "naranja", "");
            print("</td>");
        $css->CierraFilaTabla();
        }
    }
    $css->CerrarTabla();
}

    $css->CerrarDiv();

?>