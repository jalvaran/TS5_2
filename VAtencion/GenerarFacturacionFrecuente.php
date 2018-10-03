<?php 
$myPage="GenerarFacturacionFrecuente.php";
include_once("../sesiones/php_control.php");
include_once("css_construct.php");

$obCon = new ProcesoVenta($idUser);

print("<html>");
print("<head>");
$css =  new CssIni("Facturacion");

print("</head>");
print("<body>");
    
        
    $css->CabeceraIni("Generar Facturacion Frecuente"); //Inicia la cabecera de la pagina
    $css->CabeceraFin();    
    
    ///////////////Creamos el contenedor
    /////
    /////
     
     
    $css->CrearDiv("principal", "container", "center",1,1);
    ////Menu de historial
    $css->CrearDiv("DivButtons", "", "", 1, 0);
    
        $css->CreaBotonDesplegable("ModalAgregarItems", "Abrir","BtnModalFacturas");
        $css->CrearInputText("idFacturaActiva", "text", "", "", "", "", "", "", 200, 30, 1, 0);     
    $css->CerrarDiv();
    
        $css->CrearDiv("DivAgregarConceptos", "", "center", 1, 1);
    
        $css->CrearTabla();
             
            $css->FilaTabla(16);
                $css->ColTabla("<strong>Servicio</strong>", 1);
                $css->ColTabla("<strong>Cantidad</strong>", 1);
                $css->ColTabla("<strong>Agregar</strong>", 1);
            $css->CierraFilaTabla();
            $css->FilaTabla(16);

                print("<td>");
                    $css->CrearSelect("idServicio", "",400);
                        $css->CrearOptionSelect("", "Buscar Servicio", 0);
                    $css->CerrarSelect();
                print("</td>");
                print("<td>");
                    $css->CrearInputNumber("TxtCantidadServicio", "number", "", 1, "Cantidad", "", "", "", 100, 30, 0, 0, 0, "", "any");
                print("</td>");
                print("<td>");
                    $css->CrearBotonEvento("BtnAgregar", "Agregar", 1, "OnClick", "AgregaServicio()", "verde", "");
                print("</td>");
            $css->CierraFilaTabla();

            $css->FilaTabla(16);
                $css->ColTabla("<strong>Producto</strong>", 1);
                $css->ColTabla("<strong>Cantidad</strong>", 1);
                $css->ColTabla("<strong>Agregar</strong>", 1);
            $css->CierraFilaTabla();
            $css->FilaTabla(16);

                print("<td>");
                    $css->CrearSelect("idProducto", "",400);
                        $css->CrearOptionSelect("", "Buscar Producto", 0);
                    $css->CerrarSelect();
                print("</td>");
                print("<td>");
                    $css->CrearInputNumber("TxtCantidadProducto", "number", "", 1, "Cantidad", "", "", "", 100, 30, 0, 0, 0, "", "any");
                print("</td>");
                print("<td>");
                    $css->CrearBotonEvento("BtnAgregar", "Agregar", 1, "OnClick", "AgregaProducto()", "verde", "");
                print("</td>");
            $css->CierraFilaTabla();
        $css->CerrarTabla();
        $css->CerrarDiv();  
    
       
    ///////////////Se crea el DIV que servirá de contenedor secundario
    /////
    /////
    $css->CrearDiv("Secundario", "", "center",1,1);
     /////////////////Cuadro de dialogo de Clientes create
    
    print('<div class="row">
        <div class="col-md-6" >');
    $css->CrearNotificacionAzul("Facturas frecuentes", 16);
    $css->CrearDiv("DivListFacturas", "", "center", 1, 1);
    $css->CerrarDiv();
    $css->CerrarDiv();
    print('<div class="col-md-6" ">');
        $css->CrearNotificacionVerde("Items Agregados a esta factura", 16);
        $css->CrearDiv("DivItemsFacturas", "", "center", 1, 1);
        $css->CerrarDiv();
    print('          
          <div id="divOpciones">
          </div>
        </div>
      </div>
    </div>');
      
    $css->CrearDiv("DivMensajes", "container", "center", 1, 1);
    $css->CerrarDiv();
    $css->CrearDiv("DivItemsRecetas", "container", "center", 1, 1);
    $css->CerrarDiv();
    $css->CerrarDiv();//Cerramos contenedor Secundario
    $css->CerrarDiv();//Cerramos contenedor Principal
    $css->AgregaJS(); //Agregamos javascripts
    $css->AgregaCssJSSelect2(); //Agregamos CSS y JS de Select2
    $css->AgregaSubir();
    print('<script src="jsPages/FacturacionFrecuente.js"></script>');
    
    print("</body></html>");
    ob_end_flush();
?>