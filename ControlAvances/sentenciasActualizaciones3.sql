UPDATE `menu_submenus` SET `Pagina` = 'SIHO.php' WHERE `menu_submenus`.`ID` = 146;

ALTER TABLE `terceros_cuentas_cobro` ADD `Observaciones` TEXT NOT NULL AFTER `Valor`;

ALTER TABLE `librodiario` CHANGE `Num_Documento_Interno` `Num_Documento_Interno` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NULL DEFAULT NULL;

UPDATE `subcuentas` SET `PUC` = '240801' WHERE `subcuentas`.`PUC` = 2408;

UPDATE `menu_submenus` SET `Pagina` = 'documento_equivalente_items.php' WHERE `menu_submenus`.`ID` = 161;

INSERT INTO `menu` (`ID`, `Nombre`, `idCarpeta`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES
(30, 'Modelos', 1, 'MnuModelos.php', '_BLANK', 1, 'modelos.png', 18, '2018-03-22 00:11:27', '2017-10-13 14:16:49');

INSERT INTO `menu_pestanas` (`ID`, `Nombre`, `idMenu`, `Orden`, `Estado`, `Updated`, `Sync`) VALUES (45, 'Modelos', '30', '1', b'1', '2018-01-04 12:52:49', '2017-10-13 14:16:55');

INSERT INTO `menu_submenus` (`ID`, `Nombre`, `idPestana`, `idCarpeta`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES (163, 'Base de Datos de Modelos', '45', '3', 'modelos_db.php', '_SELF', b'1', 'modelos.png', '1', '2017-10-13 14:16:57', '2017-10-13 14:16:57');

INSERT INTO `menu_submenus` (`ID`, `Nombre`, `idPestana`, `idCarpeta`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES (164, 'Administrar Tiempos', '45', '3', 'modelos_admin.php', '_SELF', b'1', 'modelos_admin.png', '2', '2017-10-13 14:16:57', '2017-10-13 14:16:57');



