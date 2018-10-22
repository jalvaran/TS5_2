<?php

/* 
 * Clase donde se realizaran procesos para construir recetas
 * Julian Alvaran
 * Techno Soluciones SAS
 * 2018-09-26
 */
        
class Nomina extends ProcesoVenta{
    
    /**
     * Agrega turnos a una nomina basica
     * @param type $Fecha
     * @param type $idTercero
     * @param type $idSede
     * @param type $Valor
     * @param type $idUser
     * @param type $Vector
     */
    public function AgregarTurnoNominaBasica($Fecha,$idTercero,$idSede,$Valor,$idUser, $Vector) {
        
        $Datos["Tercero"]=$idTercero;
        $Datos["Fecha"]=$Fecha;
        $Datos["Sucursal"]=$idSede;
        $Datos["Valor"]=$Valor;
        $Datos["idUser"]=$idUser;
        $sql=$this->getSQLInsert("nomina_servicios_turnos", $Datos);
        $this->Query($sql);

        
    }
    
    //Fin Clases
}
