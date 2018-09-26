<?php

/* 
 * Clase donde se realizaran procesos para construir recetas
 * Julian Alvaran
 * Techno Soluciones SAS
 * 2018-09-26
 */
        
class Recetas extends ProcesoVenta{
    
    /**
     * Agregar un item a una receta
     * @param type $idProducto
     * @param type $TablaInsumo
     * @param type $idTablaInsumo
     * @param type $idInsumo
     * @param type $Cantidad
     * @param type $idUser
     * @param type $Vector
     */
    public function AgregarItemReceta($idProducto,$TablaInsumo,$idTablaInsumo,$idInsumo,$Cantidad,$idUser, $Vector) {
        $DatosProducto=$this->ValorActual("productosventa", "Referencia", " idProductosVenta='$idProducto'");
        $ReferenciaProducto=$DatosProducto["Referencia"];
        $DatosInsumo=$this->ValorActual($TablaInsumo, "Referencia", " $idTablaInsumo='$idInsumo'");
        $ReferenciaInsumo=$DatosInsumo["Referencia"];        
        $DatosReceta=$this->ValorActual("recetas_relaciones", "ID,Cantidad", " ReferenciaProducto='$ReferenciaProducto' AND ReferenciaIngrediente='$ReferenciaInsumo'");
        if($DatosReceta["ID"]==''){
            $Datos["ReferenciaProducto"]=$ReferenciaProducto;
            $Datos["ReferenciaIngrediente"]=$ReferenciaInsumo;
            $Datos["TablaIngrediente"]=$TablaInsumo;
            $Datos["Cantidad"]=$Cantidad;
            $Datos["idUser"]=$idUser;
            $sql=$this->getSQLInsert("recetas_relaciones", $Datos);
            $this->Query($sql);
            $this->ActualizaRegistro("productosventa", "Kit", 1, "Referencia", $ReferenciaProducto);
        
        }else{
            $idReceta=$DatosReceta["ID"];
            $NuevaCantidad=$DatosReceta["Cantidad"]+$Cantidad;
            $this->ActualizaRegistro("recetas_relaciones", "Cantidad", $NuevaCantidad, "ID", $idReceta);
            $this->ActualizaRegistro("productosventa", "Kit", 1, "Referencia", $ReferenciaProducto);
        }
        
        
    }
    /**
     * Calcula los costos de un producto que tiene receta
     * @param type $ReferenciaProducto
     */
    public function CalcularCostosProductoReceta($ReferenciaProducto,$Vector) {
        $DatosProducto= $this->ValorActual("productosventa", "Existencias", " Referencia='$ReferenciaProducto'");
        $Existencias=$DatosProducto["Existencias"];
        $sql="SELECT * FROM recetas_relaciones WHERE ReferenciaProducto='$ReferenciaProducto'";
        $Consulta=$this->Query($sql);
        $CostoTotalItems=0;
        while($DatosReceta = $this->FetchAssoc($Consulta)){
            $ReferenciaInsumo=$DatosReceta["ReferenciaIngrediente"];
            $DatosIngrediente=$this->ValorActual($DatosReceta["TablaIngrediente"], "CostoUnitario", " Referencia='$ReferenciaInsumo'");
        
            $CostoTotalItems=$CostoTotalItems+($DatosIngrediente["CostoUnitario"]*$DatosReceta["Cantidad"]);
        }
        $CostoTotalProducto=$Existencias*$CostoTotalItems;
        $this->ActualizaRegistro("productosventa", "CostoUnitario", $CostoTotalItems, "Referencia", $ReferenciaProducto);
        $this->ActualizaRegistro("productosventa", "CostoTotal", $CostoTotalProducto, "Referencia", $ReferenciaProducto);
        
    }
    
    //Fin Clases
}
