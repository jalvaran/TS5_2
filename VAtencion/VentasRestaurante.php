<?php 
$myPage="VentasRestaurante.php";
include_once("../sesiones/php_control.php");
include_once("css_construct.php");
	
print("<html>");
print("<head>");
$css =  new CssIni("Ventas Restaurante");

print("</head>");
print("<body>");
     
    $css->CabeceraIni("Ventas Restaurante"); //Inicia la cabecera de la pagina
    
    //////////Creamos el formulario de busqueda de remisiones
    /////
    /////
    
    $css->CabeceraFin(); 
    ///////////////Creamos el contenedor
    /////
    /////
   $css->DivGrid("DivOpciones", "", "left", 1, 1, 1, 100, 8,1,"transparent");
        $evento="onClick";
        $Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=AB&Carry=";
        $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivPedidos`,`99`);return false;";
        $css->CrearBotonEvento("BtnPedidos", "-Pedidos-", 1, $evento, $funcion, "naranja", "");
        print("<br> <br>");
        $Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=DO&Carry=";
        $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivPedidos`,`99`);return false;";
        $css->CrearBotonEvento("BtnDomicilios", "Domicilios", 1, $evento, $funcion, "rojo", "");
        print("<br><br>");
        $Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=LL&Carry=";
        $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivPedidos`,`99`);return false;";
        $css->CrearBotonEvento("BtnLlevar", "<-Llevar->", 1, $evento, $funcion, "verde", "");
        
   $css->CerrarDiv();
   $css->DivGrid("DivPedidos", "", "center", 1, 1, 2, 100, 60,1,"transparent");
    
   $css->CerrarDiv();
   $css->DivGrid("DivItems", "", "center", 1, 1, 2, 100, 30,1,"transparent");
    
   $css->CerrarDiv();
    $css->CrearDiv("principal", "container", "center",1,1);
    
    
    
    $css->CerrarDiv();//Cerramos contenedor Principal
    $css->AgregaJS(); //Agregamos javascripts
    $css->AgregaSubir();
    $css->Footer();
    print("</body></html>");
    ob_end_flush();
?>