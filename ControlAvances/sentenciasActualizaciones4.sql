DROP TABLE `salud_archivo_conceptos_glosas`, 
`salud_archivo_consultas`, `salud_archivo_consultas_temp`, `salud_archivo_facturacion_mov_generados`, 
`salud_archivo_facturacion_mov_pagados`, `salud_archivo_facturacion_mov_pagados_temp`, 
`salud_archivo_hospitalizaciones`, `salud_archivo_hospitalizaciones_temp`, `salud_archivo_medicamentos`, 
`salud_archivo_medicamentos_temp`, `salud_archivo_nacidos`, `salud_archivo_nacidos_temp`, 
`salud_archivo_otros_servicios`, `salud_archivo_otros_servicios_temp`, `salud_archivo_procedimientos`, 
`salud_archivo_procedimientos_temp`, `salud_archivo_urgencias`, `salud_archivo_usuarios`, 
`salud_archivo_usuarios_temp`, `salud_bancos`, `salud_cie10`, `salud_circular030_2`, 
`salud_circular030_3`, `salud_circular030_4`, `salud_circular030_inicial`, `salud_circular_030_control`, 
`salud_cobros_prejuridicos`, `salud_cobros_prejuridicos_relaciones`, `salud_cups`, `salud_dias_habiles`, 
`salud_eps`, `salud_facturas_radicacion_numero`, `salud_pagos_temporal`, `salud_procesos_gerenciales`, 
`salud_procesos_gerenciales_archivos`, `salud_procesos_gerenciales_conceptos`, `salud_registro_glosas`, 
`salud_rips_diferencias`, `salud_rips_facturas_generadas_temp`, `salud_rips_nopagados`;

DROP VIEW `vista_salud_facturas_diferencias`, `vista_salud_facturas_no_pagas`, `vista_salud_facturas_pagas`,
 `vista_salud_facturas_prejuridicos`, `vista_salud_pagas_no_generadas`, `vista_salud_procesos_gerenciales`, `vista_siho`;

ALTER TABLE `empresapro` ADD `DigitoVerificacion` INT(1) NOT NULL AFTER `NIT`;
ALTER TABLE `empresapro` CHANGE `NIT` `NIT` BIGINT NULL DEFAULT NULL;
ALTER TABLE `empresapro` ADD `MatriculoMercantil` BIGINT NOT NULL AFTER `Regimen`;
ALTER TABLE `empresapro` ADD `Barrio` VARCHAR(70) NOT NULL AFTER `Direccion`;
ALTER TABLE `empresapro` CHANGE `PuntoEquilibrio` `PuntoEquilibrio` BIGINT NULL DEFAULT NULL;

DROP TABLE IF EXISTS `configuraciones_nombres_campos`;
CREATE TABLE `configuraciones_nombres_campos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NombreDB` varchar(50) NOT NULL,
  `Visualiza` varchar(50) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `menu_submenus` ADD `idMenu` INT NOT NULL AFTER `idCarpeta`, ADD `TablaAsociada` VARCHAR(45) NOT NULL AFTER `idMenu`;

ALTER TABLE `menu` ADD `CSS_Clase` VARCHAR(20) NOT NULL AFTER `Image`;

UPDATE `menu` SET `CSS_Clase`='fa fa-share';

ALTER TABLE `menu_submenus` ADD `TipoLink` INT(1) NOT NULL AFTER `TablaAsociada`, ADD `JavaScript` VARCHAR(90) NOT NULL AFTER `TipoLink`;

INSERT INTO `menu_submenus` (`ID`, `Nombre`, `idPestana`, `idCarpeta`, `idMenu`, `TablaAsociada`, `TipoLink`, `JavaScript`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES (183, 'Verificar Orden', '47', '3', '0', '', '0', '', '../modulos/compras/ReciboOrdenCompra.php', '_SELF', b'1', 'verificarOC.jpg', '5', '2018-10-18 09:56:38', '2017-10-13 14:16:57');


