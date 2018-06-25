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


--
-- Table structure for table `modelos_agenda`
--

CREATE TABLE `modelos_agenda` (
  `ID` bigint(20) NOT NULL,
  `idModelo` int(11) NOT NULL,
  `ValorPagado` double NOT NULL,
  `ValorModelo` double NOT NULL,
  `ValorCasa` double NOT NULL,
  `Minutos` int(11) NOT NULL,
  `HoraInicial` datetime NOT NULL,
  `HoraATerminar` datetime NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `Estado` varchar(10) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'Abierto',
  `Observaciones` text COLLATE latin1_spanish_ci NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


--
-- Table structure for table `modelos_config_factura`
--

CREATE TABLE `modelos_config_factura` (
  `ID` int(11) NOT NULL,
  `idItemFactura` bigint(20) NOT NULL,
  `TablaItem` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `modelos_config_factura`
--

INSERT INTO `modelos_config_factura` (`ID`, `idItemFactura`, `TablaItem`, `Updated`, `Sync`) VALUES
(1, 35, 'servicios', '2018-05-21 14:37:33', '0000-00-00 00:00:00');

--
-- Table structure for table `modelos_db`
--

CREATE TABLE `modelos_db` (
  `ID` bigint(20) NOT NULL,
  `Nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `NombreArtistico` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Identificacion` bigint(20) NOT NULL,
  `ValorServicio1` double NOT NULL,
  `ValorServicio2` double NOT NULL,
  `ValorServicio3` double NOT NULL,
  `Estado` varchar(1) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'A',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

INSERT INTO `menu_submenus` (`ID`, `Nombre`, `idPestana`, `idCarpeta`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES (165, 'Historial de Agenda', '45', '3', 'modelos_agenda.php', '_SELF', b'1', 'historial.png', '4', '2018-05-15 10:24:10', '2017-10-13 14:16:57');

CREATE TABLE `modelos_cierres` (
  `ID` bigint(20) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `modelos_cierres`
--
ALTER TABLE `modelos_cierres`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `modelos_cierres`
--
ALTER TABLE `modelos_cierres`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;


--
-- Indexes for table `modelos_agenda`
--
ALTER TABLE `modelos_agenda`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `modelos_config_factura`
--
ALTER TABLE `modelos_config_factura`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `modelos_db`
--
ALTER TABLE `modelos_db`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NombreArtistico` (`NombreArtistico`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `modelos_agenda`
--
ALTER TABLE `modelos_agenda`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `modelos_config_factura`
--
ALTER TABLE `modelos_config_factura`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modelos_db`
--
ALTER TABLE `modelos_db`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

ALTER TABLE `factura_compra_items_devoluciones` ADD `idNotaDevolucion` BIGINT NOT NULL AFTER `ID`;

INSERT INTO `menu_submenus` (`ID`, `Nombre`, `idPestana`, `idCarpeta`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES (166, 'Notas de Devolucion', '13', '3', 'RegistraNotaDevolucion.php', '_SELF', b'1', 'devolucion.png', '7', '2017-10-13 14:16:57', '2017-10-13 14:16:57');

INSERT INTO `formatos_calidad` (`ID`, `Nombre`, `Version`, `Codigo`, `Fecha`, `CuerpoFormato`, `NotasPiePagina`, `Updated`, `Sync`) VALUES (31, 'NOTA DE DEVOLUCION', '001', 'F-GC-003', '2016-05-11', '', '', '2017-10-20 10:30:00', '2017-10-20 10:30:00');

INSERT INTO `menu_submenus` (`ID`, `Nombre`, `idPestana`, `idCarpeta`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES (167, 'Totales en Facturacion', '12', '3', 'vista_totales_facturacion.php', '_SELF', b'1', 'totales_facturacion.png', '9', '2017-10-13 14:16:57', '2017-10-11 14:16:57');

ALTER TABLE `egresos_pre` ADD `CruceNota` DOUBLE NOT NULL AFTER `Descuento`;

ALTER TABLE `modelos_db` ADD `Telefono` VARCHAR(45) NOT NULL AFTER `Identificacion`;

INSERT INTO `menu_submenus` (`ID`, `Nombre`, `idPestana`, `idCarpeta`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES (168, 'Historial de Cierres', '45', '3', 'modelos_cierres.php', '_SELF', b'1', 'historial2.png', '5', '2018-05-15 10:24:10', '2017-10-13 14:16:57');

ALTER TABLE `inventarios_conteo_selectivo` CHANGE `Referencia` `Referencia` BIGINT NOT NULL;

INSERT INTO `menu_submenus` (`ID`, `Nombre`, `idPestana`, `idCarpeta`, `Pagina`, `Target`, `Estado`, `Image`, `Orden`, `Updated`, `Sync`) VALUES (169, 'Ventas', '30', '3', 'VentasRestaurante.php', '_SELF', b'1', 'vender.png', '1', '2017-10-13 14:16:57', '2017-10-13 14:16:57');

--
-- Table structure for table `registra_eliminaciones_pedidos_items_restaurant`
--

CREATE TABLE `registra_eliminaciones_pedidos_items_restaurant` (
  `ID` bigint(20) NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `Cantidad` double NOT NULL,
  `Total` double NOT NULL,
  `idPedido` bigint(20) NOT NULL,
  `idUser` int(11) NOT NULL,
  `Observaciones` text COLLATE latin1_spanish_ci NOT NULL,
  `FechaHora` datetime NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registra_eliminaciones_pedidos_items_restaurant`
--
ALTER TABLE `registra_eliminaciones_pedidos_items_restaurant`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idProducto` (`idProducto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registra_eliminaciones_pedidos_items_restaurant`
--
ALTER TABLE `registra_eliminaciones_pedidos_items_restaurant`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

UPDATE `menu_submenus` SET `Estado` = b'0' WHERE `menu_submenus`.`ID` = 83;
UPDATE `menu_submenus` SET `Estado` = b'0' WHERE `menu_submenus`.`ID` = 84;
UPDATE `menu_submenus` SET `Estado` = b'0' WHERE `menu_submenus`.`ID` = 85;

ALTER TABLE `restaurante_pedidos_items` ADD INDEX(`Estado`);

