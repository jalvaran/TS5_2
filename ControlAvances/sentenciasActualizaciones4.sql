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
UPDATE menu_submenus SET Target="_BLANK";

INSERT INTO `menu_carpetas` (`ID`, `Ruta`, `Updated`, `Sync`) VALUES (7, '../modulos/', '2018-01-04 13:29:26', '2017-10-13 14:16:51');
UPDATE `menu` SET `idCarpeta` = '7' WHERE `menu`.`ID` = 1;
UPDATE `menu` SET `Pagina` = 'administrador/Admin.php' WHERE `menu`.`ID` = 1;
UPDATE `menu_submenus` SET `JavaScript` = 'onclick=\"DibujeTabla(\'empresapro\')\";' WHERE `menu_submenus`.`ID` = 1;
UPDATE `menu_submenus` SET `Target` = '_SELF' WHERE `menu_submenus`.`ID` = 1;
UPDATE `menu_submenus` SET `TipoLink` = '1' WHERE `menu_submenus`.`ID` = 1;
UPDATE `menu_submenus` SET `TablaAsociada` = 'empresapro' WHERE `menu_submenus`.`ID` = 1;


CREATE TABLE `configuraciones_nombres_campos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NombreDB` varchar(50) NOT NULL,
  `Visualiza` varchar(50) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `configuracion_campos_asociados` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TablaOrigen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CampoTablaOrigen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `TablaAsociada` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CampoAsociado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `IDCampoAsociado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `configuracion_campos_asociados` (`ID`, `TablaOrigen`, `CampoTablaOrigen`, `TablaAsociada`, `CampoAsociado`, `IDCampoAsociado`) VALUES
(1,	'empresapro',	'Ciudad',	'cod_municipios_dptos',	'Ciudad',	'Ciudad'),
(2,	'empresapro',	'Regimen',	'empresapro_regimenes',	'Regimen',	'Regimen');

CREATE TABLE `configuracion_control_tablas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TablaDB` varchar(50) NOT NULL,
  `Agregar` int(1) NOT NULL,
  `Editar` int(1) NOT NULL,
  `Ver` int(1) NOT NULL,
  `AccionesAdicionales` int(1) NOT NULL,
  `Eliminar` int(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `configuracion_control_tablas` (`ID`, `TablaDB`, `Agregar`, `Editar`, `Ver`, `AccionesAdicionales`, `Eliminar`) VALUES
(1,	'empresapro',	1,	1,	1,	0,	0),
(2,	'formatos_calidad',	1,	1,	1,	0,	0);

CREATE TABLE `configuracion_tablas_acciones_adicionales` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TablaDB` varchar(50) NOT NULL,
  `JavaScript` varchar(100) NOT NULL,
  `CSS_Clase` varchar(20) NOT NULL,
  `Titulo` varchar(20) NOT NULL,
  `Ruta` varchar(100) NOT NULL,
  `ColumnaID` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `empresapro_regimenes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Regimen` varchar(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `empresapro_regimenes` (`ID`, `Regimen`, `Updated`, `Sync`) VALUES
(1,	'COMUN',	'2018-10-08 04:03:47',	'0000-00-00 00:00:00'),
(2,	'SIMPLIFICADO',	'2018-10-08 04:03:47',	'0000-00-00 00:00:00');


