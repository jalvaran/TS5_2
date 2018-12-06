<?php
/* 
 * Clase que realiza los procesos de facturacion electronica
 * Julian Alvaran
 * Techno Soluciones SAS
 */

class Factura_Electronica extends ProcesoVenta{
    public function ConstruyaLayoutEmitirFactura($idFactura) {
        $DocumentoFE="FACTURA";
        $TipoDocumentoFE="INVOIC";
        $UserWebService="programacion@facturatech.co";
        $PassWebService="Fact.Col.2018.a";
        $NitEmisor="901143311";
        $DVEmisor="01";
        $NitAdquiriente="94481747";
        $UBLVersion="UBL 2.0";
        $VersionFormatoDocumento="DIAN 1.0";
        $PrefijoFactura="PRUE";
        $NumeroFactura="980000503";
        $FacturaCompleta=$PrefijoFactura.$NumeroFactura;
        $FechaFactura="2018-11-30";
        $HoraFactura="09:19:19";
        $TipoFactura=1;//1 Factura 9 Nota Credito
        $MonedaFactura="COP";
        $FechaVencimiento="2018-12-30";
        $EmisorTipoPersona=3; //1 Juridica 2 Persona Natural
        $EmisorTipoDocumento=31; //Tabla tipos_documentos
        $EmisorNumTipoRegimen=2; //0 Simplificado 2 Comun 
        $EmisorRazonSocial="Ftech Colombia SAS";
        $EmisorDireccion="AvPoblado Cra 43 A 19 17";
        $EmisorDepartamento="ANTIOQUIA";
        $EmisorCiudad="MEDELLIN";
        $EmisorBarrio="MEDELLIN";
        $EmisorCodigoPais="CO";
        $EmisorPais="Colombia";
        
        $TAC="      (TAC)

                        TAC_1:O-42;

                    (/TAC)

                    (TAC)

                        TAC_1:O-42;

                    (/TAC)
                            ";
        $EmisorMatriculaMercantil="1234567";
        
        //Datos Adquiriente
        $AdqTipoPersona=2; //1 Juridica 2 Persona Natural
        $AdqNit="94481747";
        $AdqTipoDocumento=13;
        $adqNumTipoRegimen=0;


        $AdqRazonSocial="JULIAN ANDRES ALVARAN VALENCIA";
        $AdqNombres="JULIAN ANDRES";
        $adqApellidos="ALVARAN VALENCIA";

        $AdqDireccion="CALLE 19A 18-26";
        $AdqDepartamento="VALLE DEL CAUCA";
        $AdqBarrio="GUADALAJARA DE BUGA";
        $AdqCiudad="GUADALAJARA DE BUGA";
        $AdqCodigoPais="CO";
        $AdqCodigoComercio=0; //0 si se desconoce
        $AdqInfoTributariaAduana="O-99";  // O-99 si se desconoce
        $AdqContactoTipo=1; // 1 Persona de contacto, 2 de Entrega,3 de contabilidad, 4 de compras, 5 procesamiento del pedido
        $AdqContactoNombre="JULIAN ALVARAN";
        $AdqContactoTelefono="3177740609";
        $AdqContactoMail="jalvaran@gmail.com";
        
        //Totales de la factura
        
        $FacturaSubtotal=1000.00;
        $FacturaMonedaSubtotal="COP";
        $FacturaBaseImpuestos=1000.00;
        $FacturaMonedaBaseImpuestos="COP";
        $FacturaTotalSinImpuestosRetenidos=1190.00;
        $FacturaMonedaTotalSinImpuestosRetenidos="COP";
        $FacturaTotal=1190.00;
        $FacturaMonedaTotal="COP";
        $FacturaTotalDescuentos=0;
        $FacturaMonedaDescuentos="COP";
        $FacturaTotalCargos=0;
        $FacturaMonedaCargos="COP";
        
        //Impuestos
        
        $ImpuestosTipo="false";//false para IVA o ImpoConsumo
        $ImpuestosTotal=190.00;
        $ImpuestosMoneda="COP";
        $ImpuestosClase="01"; //01 IVA, 02 Impoconsumo, 03 ICA, 
        $ImpuestosBase=1000.00;
        $ImpuestosMonedaBase="COP";
        $ImpuestosTotalItemImpuesto=190.00;
        $ImpuestosPorcentaje="19.00";
        
        //Tasa de Cambio
        
        $TasaDeCambioModena="COP";
        $FactorTasaCambio=1;
        
        //Descuentos
        
        $DescuentoTipo="false"; //false descuento, true cargo
        $PorcentajeDescuento=0.0;
        $ValorDescuento=0.0;
        $ModedaDescuento="COP";
        $CodigoDescuento=19;
        $IndicadorSecuenciaCalculo=1;
        
        //Datos Resolucion
        
        $NumeroResolucion="9000000123973223";
        $FechaInicioResolucion="2018-01-11";
        $FechaFinResolucion="2028-01-11";
        $PrefijoResolucion="PRUE";
        $RangoInicialResolucion=980000000;
        $RangoFinalResolucion=985000000;
        
        //Total impuestos
        
        $TotalesImpuestos=190.00;
        $ImpuestosMoneda="COP";
        $TotalFactura=1000.00;
        $MonedaTotal="COP";
        
        //Notas legales
        
        $NotasLegales="IVA REGIMEN COMUN ACTIVIDAD ECONOMICA CIIU 8020";

        //Referencias, se refiere a los documentos enviados por el proveedor ejemplo cotizaciones, ordenes de compra, etc

        $ReferenciaTipo="IV";//IV factura,NC Nota Credito, ND Nota debito
        $NumReferencia="0000200216";
        $FechaDocumentoReferencia="2017-09-26";
        
        //Codigo de la plantailla, informacion para carvajal
        
        $CodigoPlantilla="CGEN01";
        
        
        $CodigoMonedaCambio="COP";
        $TotalImporteBrutoMonedaCambio=1000.00;

        //Items
        
        $ItemConsecutivo=1; //Consecutivo del item
        $TipoItem='false'; //true si el item es gratis, false si se cobra}
        $ItemCantidad=1.0;
        $UnidadMedida="ST"; //Ver tabla 12
        $TotalItem=1000.00;
        $MonedaItem="COP";
        $PrecioUnitarioItem=1000.00;
        $MonedaItem="COP";
        $ReferenciaItem="REF001";
        $NombreItem="Soporte Tecnico";
        $UnidadMedidaEmpaque="CR";
        $TotlItemConCargos=1000.00;
        
        //Descuentos items
        
        $ItemDescuentoTipo="false"; //false descuento,true cargo
        $TotalDescuentoItem=0.00;
        $MonedaDescuentoItem="COP";
        
        $param["LayOut"] = "[$NitEmisor]
            [$NitEmisor-$DVEmisor]
            [NO]
            [$DocumentoFE]
            [$UserWebService]
            [$PassWebService]
            (ENC)

                    ENC_1:$TipoDocumentoFE;

                    ENC_2:$NitEmisor;  

                    ENC_3:$NitAdquiriente;  

                    ENC_4:$UBLVersion;

                    ENC_5:$VersionFormatoDocumento;

                    ENC_6:$FacturaCompleta; 

                    ENC_7:$FechaFactura;

                    ENC_8:$HoraFactura;

                    ENC_9:$TipoFactura;

                    ENC_10:$MonedaFactura;

                    ENC_16:$FechaVencimiento;
            (/ENC)

            (EMI)

                    EMI_1:$EmisorTipoPersona;

                    EMI_2:$NitEmisor; 

                    EMI_3:$EmisorTipoDocumento;

                    EMI_4:$EmisorNumTipoRegimen;

                    EMI_6:$EmisorRazonSocial;

                    EMI_10:$EmisorDireccion;

                    EMI_11:$EmisorDepartamento;

                    EMI_12:$EmisorBarrio;

                    EMI_13:$EmisorCiudad;

                    EMI_15:$EmisorCodigoPais;

                    EMI_19:$EmisorDepartamento;

                    EMI_20:$EmisorCiudad;

                    EMI_21:$EmisorPais;

                    $TAC

                    (ICC)

                            ICC_1:$EmisorMatriculaMercantil;

                    (/ICC)

            (/EMI)

            (ADQ)

                    ADQ_1:$AdqTipoPersona;

                    ADQ_2:$AdqNit;

                    ADQ_3:$AdqTipoDocumento;

                    ADQ_4:$adqNumTipoRegimen;

                    ADQ_6:$AdqRazonSocial;

                    ADQ_8:$AdqNombres;

                    ADQ_9:$adqApellidos;

                    ADQ_10:$AdqDireccion;

                    ADQ_11:$AdqDepartamento;

                    ADQ_12:$AdqBarrio;

                    ADQ_13:$AdqCiudad;

                    ADQ_15:$AdqCodigoPais;

                    ADQ_17:$AdqCodigoComercio;

                    (TCR)

                            TCR_1:$AdqInfoTributariaAduana;

                    (/TCR)

                    (ICR/)
                    (CDA)
                            CDA_1:$AdqContactoTipo;
                            CDA_2:$AdqContactoNombre;
                            CDA_3:$AdqContactoTelefono;
                            CDA_4:$AdqContactoMail;
                    (/CDA)
            (/ADQ)

            (TOT)

                    TOT_1:$FacturaSubtotal;

                    TOT_2:$FacturaMonedaSubtotal;

                    TOT_3:$FacturaBaseImpuestos;

                    TOT_4:$FacturaMonedaBaseImpuestos;

                    TOT_5:$FacturaTotalSinImpuestosRetenidos;

                    TOT_6:$FacturaMonedaTotalSinImpuestosRetenidos;

                    TOT_7:$FacturaTotal;

                    TOT_8:$FacturaMonedaTotal;
                        
                    TOT_9:$FacturaTotalDescuentos;
                    
                    TOT_10:$FacturaMonedaDescuentos;
                    
                    TOT_11:$FacturaTotalCargos;

                    TOT_12:$FacturaMonedaCargos;

            (/TOT)

            (TIM)

                    TIM_1:$ImpuestosTipo;

                    TIM_2:$ImpuestosTotal;

                    TIM_3:$ImpuestosMoneda;

                    (IMP)

                            IMP_1:$ImpuestosClase;

                            IMP_2:$ImpuestosBase;

                            IMP_3:$ImpuestosMonedaBase;

                            IMP_4:$ImpuestosTotalItemImpuesto;

                            IMP_5:$ImpuestosMoneda;

                            IMP_6:$ImpuestosPorcentaje;

                    (/IMP)



            (/TIM)

            (TDC)

                    TDC_1:$TasaDeCambioModena;

                    TDC_2:$TasaDeCambioModena;

                    TDC_3:$FactorTasaCambio;

            (/TDC)

            (DSC)

                    DSC_1:$DescuentoTipo;

                    DSC_2:$PorcentajeDescuento;

                    DSC_3:$ValorDescuento;

                    DSC_4:$ModedaDescuento;
                    
                    DSC_5:$CodigoDescuento;

                    DSC_8:$ModedaDescuento;

                    DSC_9:$IndicadorSecuenciaCalculo;

            (/DSC)

            (DRF)

                    DRF_1:$NumeroResolucion;

                    DRF_2:$FechaInicioResolucion;

                    DRF_3:$FechaFinResolucion;

                    DRF_4:$PrefijoResolucion;

                    DRF_5:$RangoInicialResolucion;

                    DRF_6:$RangoFinalResolucion;      

            (/DRF)

            (ITD)

                    ITD_1:$TotalesImpuestos;

                    ITD_2:$ImpuestosMoneda;

                    ITD_5:$TotalFactura;

                    ITD_6:$MonedaTotal;

            (/ITD)

            (NOT)

                    NOT_1: $NotasLegales;

            (/NOT)

            (REF)

                    REF_1:$ReferenciaTipo;

                    REF_2:$NumReferencia;

                    REF_3:$FechaDocumentoReferencia;

            (/REF)

            (CTS)

                    CTS_1:$CodigoPlantilla;

            (/CTS)
            
            (ITE)

                   ITE_1:$ItemConsecutivo;

                   ITE_2:$TipoItem;

                   ITE_3:$ItemCantidad;

                   ITE_4:$UnidadMedida;

                   ITE_5:$TotalItem;

                   ITE_6:$MonedaItem;

                   ITE_7:$PrecioUnitarioItem;

                   ITE_8:$MonedaItem;

                   ITE_11:$ReferenciaItem;

                   ITE_12:$NombreItem;

                   ITE_14:$UnidadMedidaEmpaque;

                   ITE_19:$TotlItemConCargos;

                   ITE_20:$MonedaItem;

                   ITE_21:$TotalItem;

                   ITE_22:$MonedaItem;


                   (IDE)

                       IDE_1:$ItemDescuentoTipo;

                       IDE_2:$TotalDescuentoItem;

                       IDE_3:$MonedaDescuentoItem;

                       IDE_8:$MonedaDescuentoItem;

                   (/IDE)

                   (/ITE)

            [/FACTURA]";
        return($param);
    }
}