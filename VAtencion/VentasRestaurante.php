<?php 
$myPage="VentasRestaurante.php";
include_once("../sesiones/php_control.php");
include_once("clases/Restaurante.class.php");
include_once("css_construct.php");
$obRest=new Restaurante($idUser);	
print("<html>");
print("<head>");
$css =  new CssIni("Ventas Restaurante");

print("</head>");
print("<body>");
     
    $css->CabeceraIni("Ventas Restaurante"); //Inicia la cabecera de la pagina
    
    //////////Creamos el formulario de busqueda de remisiones
    /////
    /////
    $css->CrearBotonEvento("BtnCerrarTurno", "Cerrar Turno", 1, "onclick", "CerrarTurnoRestaurante()", "rojo", "");
    $css->CabeceraFin(); 
    ///////////////Creamos el contenedor
    /////
    /////
    $css->CrearDiv("DivButtons", "", "", 0, 0);
    $css->CreaBotonDesplegable("DialFacturacion", "Abrir","BtnAbreModalFact");
    $css->CerrarDiv();
    $css->CrearModal("DialFacturacion", "Facturar", "");
    //$css->CrearCuadroDeDialogoAmplio("DialFacturacion", "Facturar");
        $css->CrearDiv("DivFacturacion", "", "center", 1, 1);
        $css->CerrarDiv();
    
    //$css->CerrarCuadroDeDialogoAmplio();
    $css->CerrarModal();
   //$css->DivGrid("DivOpciones", "", "left", 1, 1, 1, 100, 8,1,"transparent");
    $css->CrearDiv("DivOpciones", "container", "center", 1, 1);
        $evento="onClick";
        $Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=AB&CuadroAdd=1&Carry=";
        $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivPedidos`,`99`);TimersPedidos(1);";
        
        $css->CrearBotonEvento("BtnPedidos", "-Pedidos-", 1, $evento, $funcion, "naranja", "");
        print(" ");
        $Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=DO&CuadroAdd=1&Carry=";
        $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivPedidos`,`99`);TimersPedidos(2);";
        
        $css->CrearBotonEvento("BtnDomicilios", "Domicilios", 1, $evento, $funcion, "rojo", "");
        print(" ");
        $Page="Consultas/Restaurante_pedidos.query.php?TipoPedido=LL&CuadroAdd=1&Carry=";
        $funcion="EnvieObjetoConsulta(`$Page`,`BtnPedidos`,`DivPedidos`,`99`);TimersPedidos(3);";
        
        $css->CrearBotonEvento("BtnLlevar", "<-Llevar->", 1, $evento, $funcion, "verde", "");
        
        
        
   $css->CerrarDiv();
   $css->CrearDiv("DivPedidos", "container", "center", 1, 1);
   //$css->DivGrid("DivPedidos", "", "center", 1, 1, 2, 100, 90,1,"transparent");
    
   $css->CerrarDiv();
   //$css->DivGrid("DivItems", "", "center", 1, 1, 2, 100, 30,1,"transparent");
    
   //$css->CerrarDiv();
    
    $css->AgregaJS(); //Agregamos javascripts
    $css->AgregaSubir();
    $css->Footer();
    print('<script src="jsPages/restaurante_ventas.js"></script>');
    
    print("</body></html>");
    ob_end_flush();
?>