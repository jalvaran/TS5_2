UPDATE `menu_submenus` SET `Pagina` = 'SIHO.php' WHERE `menu_submenus`.`ID` = 146;

ALTER TABLE `terceros_cuentas_cobro` ADD `Observaciones` TEXT NOT NULL AFTER `Valor`;

ALTER TABLE `librodiario` CHANGE `Num_Documento_Interno` `Num_Documento_Interno` VARCHAR(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NULL DEFAULT NULL;

UPDATE `subcuentas` SET `PUC` = '240801' WHERE `subcuentas`.`PUC` = 2408;

UPDATE `menu_submenus` SET `Pagina` = 'documento_equivalente_items.php' WHERE `menu_submenus`.`ID` = 161;
