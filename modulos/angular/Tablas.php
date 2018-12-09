<?php
/**
 * Pagina base para la plataforma TSS
 * 2018-11-27, Julian Alvaran Techno Soluciones SAS
 * 
 * es recomendable No usar los siguientes ID para ningún objeto:
 * FrmModal, ModalAcciones,DivFormularios,BtnModalGuardar,DivOpcionesTablas,
 * DivControlCampos,DivOpciones1,DivOpciones2,DivOpciones3,DivParametrosTablas
 * TxtTabla, TxtCondicion,TxtOrdenNombreColumna,TxtOrdenTabla,TxtLimit,TxtPage,tabla
 * 
 */
$myPage="Tablas.php";
$myTitulo="Plataforma TS5";
include_once("../../sesiones/php_control_usuarios.php");
include_once("../../constructores/paginas_constructor.php");

$css = new PageConstruct($myTitulo, "", "", "");
$obCon = new conexion($idUser); //Conexion a la base de datos

$css->PageInit($myTitulo);
        
        $css->div("", "", "", "", "", "ng-controller='ControladorTablas'", "");
        
        $css->button("", "", "", "", "", "Cargar Tabla", "", "", "", "","onclick=DibujeOpcionesTablaDB('facturas','DivOpcionesTabla','DivTabla');DibujeTablaDB('facturas','DivTabla');");
            print("Abre");
        $css->Cbutton();
        $css->div("DivOpcionesTabla", "container", "", "", "", "", ""); //aqui se dibujarán las opciones de la tabla
        
        $css->Cdiv();
        
        $css->div("DivTabla", "container", "", "", "", "", ""); //aquí se dibujará la tabla
        
        $css->Cdiv();
        
        $css->Cdiv();

$css->PageFin();
//$css->AgregaAngular();
//print('<script src="jsPages/Tablas.js"></script>');  //script propio de la pagina

$css->Cbody();
$css->Chtml();

?>