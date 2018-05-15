-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `abonos_libro`;
CREATE TABLE `abonos_libro` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Cantidad` float NOT NULL,
  `idLibroDiario` bigint(20) NOT NULL,
  `idComprobanteContable` bigint(20) NOT NULL,
  `TipoAbono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `activos`;
CREATE TABLE `activos` (
  `idActivos` int(16) NOT NULL AUTO_INCREMENT,
  `Referencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `NombreAct` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Marca` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Serie` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ValorEstimado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Bodega` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idActivos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `act_movimientos`;
CREATE TABLE `act_movimientos` (
  `idAct_Movimientos` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Movimiento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Origen` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Destino` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Entrega` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Recibe` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `MotivoMovimiento` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `Observaciones` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `NumOrden` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `BodegaDestino` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idActivo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idAct_Movimientos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `act_ordenes`;
CREATE TABLE `act_ordenes` (
  `idAct_Ordenes` int(16) NOT NULL AUTO_INCREMENT,
  `NumOrden` int(16) NOT NULL,
  `idAct_Movimiento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Entrega` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Recibe` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Usuarios_idUsuarios` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Origen` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Destino` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Cerrada` int(1) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idAct_Ordenes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `act_pre_movimientos`;
CREATE TABLE `act_pre_movimientos` (
  `idAct_Movimientos` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Movimiento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Origen` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Destino` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Entrega` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Recibe` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `MotivoMovimiento` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `Observaciones` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `NumOrden` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `BodegaDestino` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idActivo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idAct_Movimientos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `act_pre_ordenes`;
CREATE TABLE `act_pre_ordenes` (
  `idAct_Ordenes` int(16) NOT NULL DEFAULT '0',
  `NumOrden` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idAct_Movimiento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Entrega` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Recibe` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Usuarios_idUsuarios` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `alertas`;
CREATE TABLE `alertas` (
  `idAlertas` int(45) NOT NULL AUTO_INCREMENT,
  `AlertaTipo` varchar(45) NOT NULL,
  `Mensaje` varchar(500) NOT NULL,
  `Cartera_idCartera` varchar(45) NOT NULL,
  `PagosProgram_idPagosProgram` varchar(45) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idAlertas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `autorizaciones_generales`;
CREATE TABLE `autorizaciones_generales` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Proceso` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Clave` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `bodega`;
CREATE TABLE `bodega` (
  `idBodega` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ciudad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idServidor` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idBodega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Base` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaPUCEfectivo` bigint(20) NOT NULL,
  `CuentaPUCCheques` bigint(20) NOT NULL,
  `CuentaPUCOtros` bigint(20) NOT NULL,
  `CuentaPUCIVAEgresos` bigint(20) NOT NULL,
  `idTerceroIntereses` bigint(20) NOT NULL COMMENT 'Nit del Tercero al que se va a ir la cuent x parar de intereses',
  `CentroCostos` int(11) NOT NULL,
  `idResolucionDian` int(11) NOT NULL,
  `idBascula` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cajas_aperturas_cierres`;
CREATE TABLE `cajas_aperturas_cierres` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Movimiento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Usuario` int(11) NOT NULL,
  `idCaja` int(11) NOT NULL,
  `Efectivo` double NOT NULL,
  `Devueltas` double NOT NULL,
  `TotalAbonos` double NOT NULL,
  `AbonosCreditos` double NOT NULL,
  `AbonosSisteCredito` double NOT NULL,
  `TotalEgresos` double NOT NULL,
  `TotalEfectivo` double NOT NULL,
  `TotalVentas` double NOT NULL,
  `TotalVentasContado` double NOT NULL,
  `TotalVentasCredito` double NOT NULL,
  `TotalVentasSisteCredito` double NOT NULL,
  `TotalRetiroSeparados` double NOT NULL,
  `TotalDevoluciones` double NOT NULL,
  `TotalTarjetas` double NOT NULL,
  `TotalCheques` double NOT NULL,
  `TotalOtros` double NOT NULL,
  `TotalEntrega` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cartera`;
CREATE TABLE `cartera` (
  `idCartera` int(11) NOT NULL AUTO_INCREMENT,
  `Facturas_idFacturas` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `FechaIngreso` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Fecha en la que ingresa a Cartera',
  `FechaVencimiento` date NOT NULL DEFAULT '0000-00-00',
  `DiasCartera` int(11) DEFAULT NULL,
  `idCliente` varchar(45) NOT NULL DEFAULT '0',
  `RazonSocial` varchar(100) DEFAULT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Contacto` varchar(45) NOT NULL,
  `TelContacto` varchar(45) NOT NULL,
  `TotalFactura` double NOT NULL,
  `TotalAbonos` double NOT NULL,
  `Saldo` double NOT NULL DEFAULT '0',
  `Observaciones` text,
  `TipoCartera` varchar(45) NOT NULL DEFAULT 'Interna',
  `idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCartera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `centrocosto`;
CREATE TABLE `centrocosto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `EmpresaPro` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cierres_contables`;
CREATE TABLE `cierres_contables` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ciuu`;
CREATE TABLE `ciuu` (
  `Codigo` int(11) NOT NULL,
  `Descripcion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `clasecuenta`;
CREATE TABLE `clasecuenta` (
  `PUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Clase` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`PUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `idClientes` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Documento` int(11) NOT NULL,
  `Num_Identificacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DV` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `Lugar_Expedicion_Documento` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `Primer_Apellido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Segundo_Apellido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Primer_Nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Otros_Nombres` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `RazonSocial` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cod_Dpto` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Cod_Mcipio` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Pais_Domicilio` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ciudad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Contacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `TelContacto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CIUU` int(11) NOT NULL,
  `Cupo` double NOT NULL,
  `Soporte` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `cod_departamentos`;
CREATE TABLE `cod_departamentos` (
  `Cod_dpto` int(11) NOT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Cod_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `cod_documentos`;
CREATE TABLE `cod_documentos` (
  `Codigo` int(11) NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `Codigo` (`Codigo`),
  KEY `Codigo_2` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `cod_municipios_dptos`;
CREATE TABLE `cod_municipios_dptos` (
  `ID` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Cod_mcipio` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Cod_Dpto` int(11) NOT NULL,
  `Departamento` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `cod_paises`;
CREATE TABLE `cod_paises` (
  `Codigo` int(11) NOT NULL,
  `Pais` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `colaboradores`;
CREATE TABLE `colaboradores` (
  `idColaboradores` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(90) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Identificacion` bigint(20) DEFAULT NULL,
  `Telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ciudad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Contacto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumContacto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cargo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SalarioBasico` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Activo` varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'SI',
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idColaboradores`),
  UNIQUE KEY `Identificacion` (`Identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `colaboradores_ventas`;
CREATE TABLE `colaboradores_ventas` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `idFactura` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Total` float NOT NULL,
  `idColaborador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `col_registrohoras`;
CREATE TABLE `col_registrohoras` (
  `IdColRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `IdColaborador` int(11) NOT NULL,
  `RegistroFecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `RegistroHora` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `EntradaSalida` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`IdColRegistro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `comisiones`;
CREATE TABLE `comisiones` (
  `idComisiones` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Porcentaje` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idComisiones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `comisionesporventas`;
CREATE TABLE `comisionesporventas` (
  `idComisionesPorVentas` int(11) NOT NULL AUTO_INCREMENT,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci DEFAULT '5105',
  `NombreCuenta` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoVenta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Colaboradores_idColaboradores` int(11) NOT NULL,
  `Ventas_NumVenta` int(11) NOT NULL,
  `Paga` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idComisionesPorVentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `idCompras` int(11) NOT NULL AUTO_INCREMENT,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci DEFAULT '62',
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumFactura` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Subtotal` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IVA` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Retenciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Total` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoPago` varchar(45) COLLATE utf8_spanish_ci DEFAULT 'Contado',
  `Pagada` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Proveedores_idProveedores` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCompras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `compras_activas`;
CREATE TABLE `compras_activas` (
  `idComprasActivas` int(11) NOT NULL AUTO_INCREMENT,
  `idProveedor` int(11) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Factura` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `FormaPago` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `NombrePro` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `FechaProg` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CuentaOrigen` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Tipo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `TotalCompra` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `DocumentoGenerado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `NumComprobante` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idComprasActivas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `compras_precompra`;
CREATE TABLE `compras_precompra` (
  `idPreCompra` int(11) NOT NULL AUTO_INCREMENT,
  `idProductosVenta` int(11) NOT NULL,
  `Referencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ValorUnitario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Subtotal` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `IVA` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Total` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idComprasActivas` int(11) NOT NULL,
  `PrecioVentaPre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idPreCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `comprobantes_contabilidad`;
CREATE TABLE `comprobantes_contabilidad` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Estado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `comprobantes_contabilidad_items`;
CREATE TABLE `comprobantes_contabilidad_items` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `idComprobante` int(16) NOT NULL,
  `Fecha` date NOT NULL,
  `CentroCostos` int(11) NOT NULL,
  `Tercero` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CuentaPUC` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `NombreCuenta` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Debito` int(16) NOT NULL,
  `Credito` int(16) NOT NULL,
  `Concepto` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `NumDocSoporte` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Soporte` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `idLibroDiario` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `comprobantes_egreso_items`;
CREATE TABLE `comprobantes_egreso_items` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idComprobante` bigint(20) NOT NULL,
  `Fecha` date NOT NULL,
  `CentroCostos` int(11) NOT NULL,
  `Tercero` int(11) NOT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NombreCuenta` text COLLATE utf8_spanish2_ci NOT NULL,
  `Debito` int(16) NOT NULL,
  `Credito` int(16) NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `NumDocSoporte` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Soporte` text COLLATE utf8_spanish2_ci NOT NULL,
  `idLibroDiario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `OrigenMovimiento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idOrigen` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `comprobantes_ingreso`;
CREATE TABLE `comprobantes_ingreso` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `Tercero` int(11) NOT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Tipo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `comprobantes_ingreso_anulaciones`;
CREATE TABLE `comprobantes_ingreso_anulaciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `idComprobanteIngreso` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Monto` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `comprobantes_ingreso_items`;
CREATE TABLE `comprobantes_ingreso_items` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idComprobante` int(16) NOT NULL,
  `Fecha` date NOT NULL,
  `CentroCostos` int(11) NOT NULL,
  `Tercero` bigint(20) NOT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NombreCuenta` text COLLATE utf8_spanish2_ci NOT NULL,
  `Debito` int(16) NOT NULL,
  `Credito` int(16) NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `NumDocSoporte` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Soporte` text COLLATE utf8_spanish2_ci NOT NULL,
  `idLibroDiario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `OrigenMovimiento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idOrigen` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `comprobantes_pre`;
CREATE TABLE `comprobantes_pre` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `idComprobanteContabilidad` int(16) NOT NULL,
  `Estado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `concejales`;
CREATE TABLE `concejales` (
  `ID` bigint(20) NOT NULL,
  `Nombre` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Cargo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Terminacion` date NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `concejales_intervenciones`;
CREATE TABLE `concejales_intervenciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idConcejal` bigint(20) NOT NULL,
  `idSesionConcejo` bigint(20) NOT NULL,
  `Fecha` date NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  `Expresado` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `concejo_sesiones`;
CREATE TABLE `concejo_sesiones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Sesion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `concejo_tipo_sesiones`;
CREATE TABLE `concejo_tipo_sesiones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `conceptos`;
CREATE TABLE `conceptos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FechaHoraCreacion` datetime NOT NULL,
  `Nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Genera` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Completo` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Activo` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `TerceroCuentaCobro` enum('SI','NO') COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'NO',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `conceptos_montos`;
CREATE TABLE `conceptos_montos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idConcepto` int(11) NOT NULL,
  `NombreMonto` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Depende` bigint(20) NOT NULL,
  `Operacion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ValorDependencia` bigint(20) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `conceptos_movimientos`;
CREATE TABLE `conceptos_movimientos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idConcepto` int(11) NOT NULL,
  `idMonto` int(11) NOT NULL,
  `CuentaPUC` bigint(20) NOT NULL,
  `NombreCuentaPUC` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoMovimiento` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `configuracion_general`;
CREATE TABLE `configuracion_general` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `Valor` text COLLATE latin1_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `config_codigo_barras`;
CREATE TABLE `config_codigo_barras` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TituloEtiqueta` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `DistaciaEtiqueta1` int(11) NOT NULL,
  `DistaciaEtiqueta2` int(11) NOT NULL,
  `DistaciaEtiqueta3` int(11) NOT NULL,
  `AlturaLinea1` int(11) NOT NULL,
  `AlturaLinea2` int(11) NOT NULL,
  `AlturaLinea3` int(11) NOT NULL,
  `AlturaLinea4` int(11) NOT NULL,
  `AlturaLinea5` int(11) NOT NULL,
  `AlturaCodigoBarras` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `config_puertos`;
CREATE TABLE `config_puertos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Puerto` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Utilizacion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Habilitado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `config_tiketes_promocion`;
CREATE TABLE `config_tiketes_promocion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NombreTiket` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Tope` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Multiple` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Activo` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `costos`;
CREATE TABLE `costos` (
  `idCostos` int(20) NOT NULL AUTO_INCREMENT,
  `NombreCosto` varchar(45) NOT NULL,
  `ValorCosto` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCostos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cotizacionesv5`;
CREATE TABLE `cotizacionesv5` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `NumSolicitud` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NumOrden` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Seguimiento` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cotizaciones_anexos`;
CREATE TABLE `cotizaciones_anexos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FechaCreacion` datetime NOT NULL,
  `Titulo` text COLLATE utf8_spanish2_ci NOT NULL,
  `NumCotizacion` bigint(20) NOT NULL,
  `Anexo` text COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cot_itemscotizaciones`;
CREATE TABLE `cot_itemscotizaciones` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL DEFAULT '0',
  `NumCotizacion` int(16) NOT NULL,
  `Descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `Referencia` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `TablaOrigen` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ValorUnitario` double NOT NULL,
  `Cantidad` double NOT NULL,
  `Multiplicador` int(11) NOT NULL,
  `Subtotal` double NOT NULL,
  `IVA` double NOT NULL,
  `Total` double NOT NULL,
  `Descuento` double NOT NULL,
  `ValorDescuento` double NOT NULL,
  `PrecioCosto` double NOT NULL,
  `SubtotalCosto` double NOT NULL,
  `TipoItem` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Devuelto` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `CuentaPUC` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `NumCotizacion` (`NumCotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `crono_controles`;
CREATE TABLE `crono_controles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `idSesionConcejo` bigint(20) NOT NULL,
  `idConcejal` bigint(20) NOT NULL,
  `Estado` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Inicio` time NOT NULL,
  `Fin` time NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE `cuentas` (
  `idPUC` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Valor` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `GupoCuentas_PUC` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idPUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cuentasfrecuentes`;
CREATE TABLE `cuentasfrecuentes` (
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `ClaseCuenta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `UsoFuturo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CuentaPUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `cuentasxpagar`;
CREATE TABLE `cuentasxpagar` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `DocumentoReferencia` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `FechaProgramada` date NOT NULL,
  `Subtotal` double NOT NULL,
  `IVA` double NOT NULL,
  `Retenciones` double NOT NULL,
  `Total` double NOT NULL,
  `Abonos` double NOT NULL,
  `Saldo` double NOT NULL,
  `idProveedor` bigint(20) NOT NULL,
  `RazonSocial` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Ciudad` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaBancaria` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `A_Nombre_De` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoCuenta` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `EntidadBancaria` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Dias` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `Soporte` text COLLATE utf8_spanish2_ci NOT NULL,
  `idCentroCostos` int(11) NOT NULL,
  `Origen` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `DocumentoCruce` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaPUC` varchar(20) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '220505',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cuentasxpagar_abonos`;
CREATE TABLE `cuentasxpagar_abonos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idCuentaXPagar` text COLLATE utf8_spanish2_ci NOT NULL,
  `Monto` double NOT NULL,
  `idUsuarios` bigint(20) NOT NULL,
  `idComprobanteEgreso` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `cuentas_frecuentes`;
CREATE TABLE `cuentas_frecuentes` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Tercero` bigint(20) NOT NULL,
  `idCotizacion` bigint(20) NOT NULL,
  `DiaCobro` int(11) NOT NULL,
  `UltimoPago` date NOT NULL,
  `TotalCuotas` int(11) NOT NULL,
  `CuotasPagas` int(11) NOT NULL,
  `CuotasFaltantes` int(11) NOT NULL,
  `Estado` enum('A','I') COLLATE latin1_spanish_ci NOT NULL COMMENT '''A'' Activo, ''I'' Inactivo',
  `MesPago` enum('S','N') COLLATE latin1_spanish_ci NOT NULL COMMENT 'La mensualidad Actual está paga S, N No está paga',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `devolucionesventas`;
CREATE TABLE `devolucionesventas` (
  `idComprasDevoluciones` int(11) NOT NULL AUTO_INCREMENT,
  `NumVenta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EfectivoDevuelto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ProductosVenta_idProductosVenta` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idComprasDevoluciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `documentos_generados`;
CREATE TABLE `documentos_generados` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Abreviatura` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `Libro` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Abreviatura` (`Abreviatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `documento_equivalente`;
CREATE TABLE `documento_equivalente` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Tercero` bigint(20) NOT NULL,
  `Estado` enum('AB','CE') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'AB' COMMENT 'AB abierto,CE Cerrado',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `documento_equivalente_items`;
CREATE TABLE `documento_equivalente_items` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `Cantidad` double NOT NULL,
  `ValorUnitario` double NOT NULL,
  `Total` double NOT NULL,
  `idDocumento` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `egresos`;
CREATE TABLE `egresos` (
  `idEgresos` int(45) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) NOT NULL,
  `PagoProg` varchar(10) NOT NULL,
  `FechaPagoPro` varchar(20) NOT NULL,
  `FechaPago` varchar(20) NOT NULL,
  `Concepto` varchar(300) NOT NULL,
  `TipoEgreso` varchar(45) NOT NULL,
  `ServicioPago` varchar(45) NOT NULL,
  `Beneficiario` varchar(45) NOT NULL,
  `NIT` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `Subtotal` varchar(45) NOT NULL,
  `IVA` varchar(45) NOT NULL,
  `Valor` varchar(45) NOT NULL,
  `Retenciones` varchar(45) NOT NULL,
  `NumFactura` varchar(45) NOT NULL,
  `idProveedor` varchar(45) NOT NULL,
  `Cuenta` varchar(45) NOT NULL,
  `Soporte` text NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `CerradoDiario` varchar(3) NOT NULL,
  `FechaCierreDiario` varchar(45) NOT NULL,
  `HoraCierreDiario` varchar(45) NOT NULL,
  `UsuarioCierreDiario` varchar(45) NOT NULL,
  `CentroCostos` int(11) NOT NULL,
  `EmpresaPro` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idEgresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `egresos_activos`;
CREATE TABLE `egresos_activos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Cuentas_idCuentas` int(11) NOT NULL,
  `Visible` int(1) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `egresos_anulaciones`;
CREATE TABLE `egresos_anulaciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `idComprobanteEgreso` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `egresos_items`;
CREATE TABLE `egresos_items` (
  `ID` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaDestino` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Tercero` int(11) NOT NULL,
  `Debito` int(11) NOT NULL,
  `Credito` int(11) NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `CentroCosto` int(11) NOT NULL,
  `TipoPago` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaProgramada` date NOT NULL,
  `NumeroComprobante` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Soporte` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `egresos_pre`;
CREATE TABLE `egresos_pre` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCuentaXPagar` bigint(20) NOT NULL,
  `Abono` double NOT NULL,
  `Descuento` double NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `egresos_tipo`;
CREATE TABLE `egresos_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Cuentas_idCuentas` int(11) NOT NULL,
  `Visible` int(1) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `empresapro`;
CREATE TABLE `empresapro` (
  `idEmpresaPro` int(11) NOT NULL AUTO_INCREMENT,
  `RazonSocial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NIT` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ciudad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ResolucionDian` text COLLATE utf8_spanish_ci NOT NULL,
  `Regimen` enum('SIMPLIFICADO','COMUN') COLLATE utf8_spanish_ci DEFAULT 'SIMPLIFICADO',
  `Email` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `WEB` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ObservacionesLegales` text COLLATE utf8_spanish_ci NOT NULL,
  `PuntoEquilibrio` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DatosBancarios` text COLLATE utf8_spanish_ci NOT NULL,
  `RutaImagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'LogosEmpresas/logotipo1.png',
  `FacturaSinInventario` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `CXPAutomaticas` varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'SI',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idEmpresaPro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `empresapro_resoluciones_facturacion`;
CREATE TABLE `empresapro_resoluciones_facturacion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NombreInterno` text COLLATE utf8_spanish2_ci NOT NULL,
  `NumResolucion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NumSolicitud` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Tipo` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `Factura` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Prefijo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Desde` int(16) NOT NULL,
  `Hasta` int(16) NOT NULL,
  `FechaVencimiento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idEmpresaPro` int(11) NOT NULL,
  `Estado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'OC: Ocupada',
  `Completada` varchar(2) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'NO',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `empresa_pro_sucursales`;
CREATE TABLE `empresa_pro_sucursales` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Ciudad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `idEmpresaPro` int(11) NOT NULL,
  `Visible` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Actual` varchar(1) COLLATE utf8_spanish2_ci NOT NULL,
  `idServidor` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `estadosfinancieros_mayor_temporal`;
CREATE TABLE `estadosfinancieros_mayor_temporal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FechaCorte` date NOT NULL,
  `Clase` int(11) NOT NULL,
  `CuentaPUC` bigint(20) NOT NULL,
  `NombreCuenta` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `SaldoAnterior` double NOT NULL,
  `Neto` double NOT NULL,
  `SaldoFinal` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime DEFAULT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `idFacturas` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `idResolucion` int(11) NOT NULL,
  `TipoFactura` varchar(10) NOT NULL,
  `Prefijo` varchar(45) NOT NULL,
  `NumeroFactura` int(16) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` varchar(20) NOT NULL,
  `OCompra` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `OSalida` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `FormaPago` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Subtotal` double NOT NULL,
  `IVA` double NOT NULL,
  `Descuentos` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Total` double NOT NULL,
  `SaldoFact` double NOT NULL,
  `Cotizaciones_idCotizaciones` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `EmpresaPro_idEmpresaPro` int(11) NOT NULL,
  `CentroCosto` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `TotalCostos` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `CerradoDiario` bigint(20) NOT NULL,
  `FechaCierreDiario` date NOT NULL,
  `HoraCierreDiario` time NOT NULL,
  `ObservacionesFact` text NOT NULL,
  `Efectivo` double NOT NULL,
  `Devuelve` double NOT NULL,
  `Cheques` double NOT NULL,
  `Otros` double NOT NULL,
  `Tarjetas` double NOT NULL,
  `idTarjetas` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idFacturas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER ;;

CREATE TRIGGER `InsertFacturaOri` AFTER INSERT ON `facturas` FOR EACH ROW
BEGIN

INSERT INTO ori_facturas SELECT * FROM facturas WHERE idFacturas=New.idFacturas;


END;;

CREATE TRIGGER `Actualiza_OriFacturas` AFTER UPDATE ON `facturas` FOR EACH ROW
BEGIN

REPLACE INTO ori_facturas SELECT * FROM facturas WHERE idFacturas=New.idFacturas;


END;;

DELIMITER ;

DROP TABLE IF EXISTS `facturas_abonos`;
CREATE TABLE `facturas_abonos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `TipoPagoAbono` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Valor` double NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Facturas_idFacturas` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `FormaPago` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idComprobanteIngreso` int(11) NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `facturas_anticipos`;
CREATE TABLE `facturas_anticipos` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `CentroCosto` int(11) NOT NULL,
  `CuentaIngreso` int(11) NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `facturas_autoretenciones`;
CREATE TABLE `facturas_autoretenciones` (
  `idFacturasAutoretenciones` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NombreAutoRetencion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Porcentaje` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Monto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Paga` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaPago` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Soportes_idSoportes` int(11) DEFAULT NULL,
  `Facturas_idFacturas` int(11) DEFAULT NULL,
  `idImpRet` int(11) DEFAULT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idFacturasAutoretenciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `facturas_formapago`;
CREATE TABLE `facturas_formapago` (
  `idFacturas_FormaPago` int(16) NOT NULL AUTO_INCREMENT,
  `Total` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Paga` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Devuelve` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `FormaPago` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Facturas_idFacturas` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idFacturas_FormaPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `facturas_intereses_sistecredito`;
CREATE TABLE `facturas_intereses_sistecredito` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idFactura` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Valor` double NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `facturas_items`;
CREATE TABLE `facturas_items` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FechaFactura` date NOT NULL,
  `idFactura` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `TablaItems` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Tabla donde se encuentra el producto o servicio',
  `Referencia` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Referencia del producto o servicio',
  `Nombre` text CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Departamento` int(11) NOT NULL,
  `SubGrupo1` int(11) NOT NULL,
  `SubGrupo2` int(11) NOT NULL,
  `SubGrupo3` int(11) NOT NULL,
  `SubGrupo4` int(11) NOT NULL,
  `SubGrupo5` int(11) NOT NULL,
  `ValorUnitarioItem` double NOT NULL,
  `Cantidad` double NOT NULL,
  `Dias` double NOT NULL,
  `SubtotalItem` double NOT NULL,
  `IVAItem` double NOT NULL,
  `ValorOtrosImpuestos` double NOT NULL,
  `TotalItem` double NOT NULL COMMENT 'Total del valor del Item',
  `PorcentajeIVA` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'que porcentaje de IVA se le aplico',
  `idOtrosImpuestos` int(11) NOT NULL,
  `idPorcentajeIVA` int(11) NOT NULL,
  `PrecioCostoUnitario` double NOT NULL,
  `SubtotalCosto` double NOT NULL COMMENT 'Costo total del item',
  `TipoItem` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Define si se realiza ajustes a inventarios',
  `CuentaPUC` int(11) NOT NULL COMMENT 'Cuenta donde se llevara el asiento contable ',
  `GeneradoDesde` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Tabla que agrega el item',
  `NumeroIdentificador` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Identificar del que agrega el item',
  `idUsuarios` int(11) NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `idFactura` (`idFactura`),
  KEY `idCierre` (`idCierre`),
  KEY `FechaFactura` (`FechaFactura`),
  KEY `Referencia` (`Referencia`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DELIMITER ;;

CREATE TRIGGER `InsertFacturasItems` AFTER INSERT ON `facturas_items` FOR EACH ROW
BEGIN

INSERT INTO ori_facturas_items SELECT * FROM facturas_items WHERE ID=New.ID;

END;;

DELIMITER ;

DROP TABLE IF EXISTS `facturas_kardex`;
CREATE TABLE `facturas_kardex` (
  `idFacturas` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `CuentaDestino` bigint(20) NOT NULL,
  `Kardex` varchar(2) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'NO',
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idFacturas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `facturas_pre`;
CREATE TABLE `facturas_pre` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FechaFactura` date NOT NULL,
  `idFactura` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `TablaItems` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Tabla donde se encuentra el producto o servicio',
  `Referencia` varchar(200) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Referencia del producto o servicio',
  `Nombre` text COLLATE utf8_spanish2_ci NOT NULL,
  `Departamento` int(11) NOT NULL,
  `SubGrupo1` int(11) NOT NULL,
  `SubGrupo2` int(11) NOT NULL,
  `SubGrupo3` int(11) NOT NULL,
  `SubGrupo4` int(11) NOT NULL,
  `SubGrupo5` int(11) NOT NULL,
  `ValorUnitarioItem` double NOT NULL,
  `Cantidad` double NOT NULL,
  `Dias` double NOT NULL,
  `SubtotalItem` double NOT NULL,
  `IVAItem` double NOT NULL,
  `TotalItem` double NOT NULL,
  `PorcentajeIVA` double NOT NULL,
  `PrecioCostoUnitario` double NOT NULL,
  `SubtotalCosto` double NOT NULL,
  `TipoItem` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Define si se realiza ajustes a inventarios',
  `CuentaPUC` int(11) NOT NULL COMMENT 'Cuenta donde se llevara el asiento contable ',
  `GeneradoDesde` varchar(100) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Tabla que agrega el item',
  `NumeroIdentificador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Identificar del que agrega el item',
  `idUsuarios` int(11) NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `facturas_reten_aplicadas`;
CREATE TABLE `facturas_reten_aplicadas` (
  `idFacturasRetAplicadas` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NombreRetencion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Porcentaje` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Monto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cruzada` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaCruce` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Soportes_idSoportes` int(11) DEFAULT NULL,
  `Facturas_idFacturas` int(11) DEFAULT NULL,
  `idImpRet` int(11) DEFAULT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idFacturasRetAplicadas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DELIMITER ;;

CREATE TRIGGER `ActualizaSaldoFact` AFTER INSERT ON `facturas_reten_aplicadas` FOR EACH ROW
BEGIN

SELECT SaldoFact into @SaldoAnt FROM facturas WHERE idFacturas=NEW.Facturas_idFacturas;

SET @Saldo=@SaldoAnt-NEW.Monto;

UPDATE facturas SET SaldoFact=@Saldo WHERE idFacturas=NEW.Facturas_idFacturas;


END;;

CREATE TRIGGER `ActualizaSaldoFactUpdate` AFTER UPDATE ON `facturas_reten_aplicadas` FOR EACH ROW
BEGIN

SELECT SaldoFact into @SaldoAnt FROM facturas WHERE idFacturas=NEW.Facturas_idFacturas;

SET @Saldo=@SaldoAnt+(OLD.Monto-NEW.Monto);

UPDATE facturas SET SaldoFact=@Saldo WHERE idFacturas=NEW.Facturas_idFacturas;


END;;

CREATE TRIGGER `ActualizaSaldoFactDel` BEFORE DELETE ON `facturas_reten_aplicadas` FOR EACH ROW
BEGIN

SELECT SaldoFact into @SaldoAnt FROM facturas WHERE idFacturas=OLD.Facturas_idFacturas;

SET @Saldo=@SaldoAnt+OLD.Monto;

UPDATE facturas SET SaldoFact=@Saldo WHERE idFacturas=OLD.Facturas_idFacturas;


END;;

DELIMITER ;

DROP TABLE IF EXISTS `facturas_tipo_pago`;
CREATE TABLE `facturas_tipo_pago` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TipoPago` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Leyenda` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `factura_compra`;
CREATE TABLE `factura_compra` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Tercero` bigint(20) NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `NumeroFactura` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoCompra` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Soporte` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idCentroCostos` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `factura_compra_anulaciones`;
CREATE TABLE `factura_compra_anulaciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `idCompra` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `factura_compra_descuentos`;
CREATE TABLE `factura_compra_descuentos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCompra` bigint(20) NOT NULL,
  `CuentaPUCDescuento` bigint(20) NOT NULL,
  `NombreCuentaDescuento` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `ValorDescuento` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `factura_compra_items`;
CREATE TABLE `factura_compra_items` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idFacturaCompra` bigint(20) NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `Cantidad` double NOT NULL,
  `CostoUnitarioCompra` double NOT NULL,
  `SubtotalCompra` double NOT NULL,
  `ImpuestoCompra` double NOT NULL,
  `TotalCompra` double NOT NULL,
  `Tipo_Impuesto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `ProcentajeDescuento` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `ValorDescuento` double NOT NULL,
  `SubtotalDescuento` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `idFacturaCompra` (`idFacturaCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `factura_compra_items_devoluciones`;
CREATE TABLE `factura_compra_items_devoluciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idFacturaCompra` bigint(20) NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `Cantidad` double NOT NULL,
  `CostoUnitarioCompra` double NOT NULL,
  `SubtotalCompra` double NOT NULL,
  `ImpuestoCompra` double NOT NULL,
  `TotalCompra` double NOT NULL,
  `Tipo_Impuesto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `factura_compra_retenciones`;
CREATE TABLE `factura_compra_retenciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCompra` bigint(20) NOT NULL,
  `CuentaPUC` bigint(20) NOT NULL,
  `NombreCuenta` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `ValorRetencion` double NOT NULL,
  `PorcentajeRetenido` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `factura_compra_servicios`;
CREATE TABLE `factura_compra_servicios` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idFacturaCompra` bigint(20) NOT NULL,
  `CuentaPUC_Servicio` bigint(20) NOT NULL,
  `Nombre_Cuenta` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Concepto_Servicio` text COLLATE utf8_spanish2_ci NOT NULL,
  `Subtotal_Servicio` double NOT NULL,
  `Impuesto_Servicio` double NOT NULL,
  `Total_Servicio` double NOT NULL,
  `Tipo_Impuesto` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `fechas_descuentos`;
CREATE TABLE `fechas_descuentos` (
  `idFechaDescuentos` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Motivo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Departamento` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `Sub1` int(11) NOT NULL,
  `Sub2` int(11) NOT NULL,
  `Porcentaje` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idFechaDescuentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `formatos_calidad`;
CREATE TABLE `formatos_calidad` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` text COLLATE utf8_spanish2_ci NOT NULL,
  `Version` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Codigo` text COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` date NOT NULL,
  `CuerpoFormato` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `NotasPiePagina` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `gupocuentas`;
CREATE TABLE `gupocuentas` (
  `PUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ClaseCuenta_PUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`PUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `impret`;
CREATE TABLE `impret` (
  `idImpRet` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tipo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CuentaRetFavor` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CuentaRetRealizadas` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Aplicable_A` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idImpRet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE `ingresos` (
  `idIngresos` int(200) NOT NULL AUTO_INCREMENT,
  `Observaciones` varchar(500) NOT NULL,
  `Total` int(10) NOT NULL,
  `Fecha` varchar(10) NOT NULL,
  `Facturas_idFacturas` int(45) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `CerradoDiario` varchar(5) NOT NULL,
  `FechaCierreDiario` varchar(25) NOT NULL,
  `HoraCierreDiario` varchar(25) NOT NULL,
  `UsuarioCierreDiario` varchar(45) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idIngresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ingresosvarios`;
CREATE TABLE `ingresosvarios` (
  `idIngresosVarios` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idIngresosVarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `inventarios_conteo_selectivo`;
CREATE TABLE `inventarios_conteo_selectivo` (
  `Referencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `inventarios_diferencias`;
CREATE TABLE `inventarios_diferencias` (
  `idProductosVenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodigoBarras` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `ExistenciaAnterior` double NOT NULL,
  `ExistenciaActual` double NOT NULL,
  `Diferencia` double DEFAULT NULL,
  `PrecioVenta` double DEFAULT NULL,
  `CostoUnitario` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `CostoTotal` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `IVA` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Departamento` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sub1` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Sub2` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Sub3` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Sub4` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Sub5` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `inventarios_temporal`;
CREATE TABLE `inventarios_temporal` (
  `idProductosVenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Existencias` double DEFAULT '0',
  `PrecioVenta` double DEFAULT NULL,
  `PrecioMayorista` double NOT NULL,
  `CostoUnitario` double DEFAULT NULL,
  `CostoTotal` double DEFAULT NULL,
  `CostoUnitarioPromedio` double NOT NULL,
  `CostoTotalPromedio` double NOT NULL,
  `IVA` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Bodega_idBodega` int(11) NOT NULL DEFAULT '1',
  `Departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sub1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub3` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub4` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub5` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Kit` int(11) NOT NULL,
  `RutaImagen` text COLLATE utf8_spanish_ci NOT NULL,
  `Especial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '4135',
  `ValorComision1` int(11) NOT NULL,
  `ValorComision2` int(11) NOT NULL,
  `ValorComision3` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `kardexmercancias`;
CREATE TABLE `kardexmercancias` (
  `idKardexMercancias` bigint(20) NOT NULL AUTO_INCREMENT,
  `idBodega` int(11) NOT NULL DEFAULT '1',
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Movimiento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Detalle` varchar(400) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idDocumento` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ValorUnitario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ValorTotal` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CostoUnitarioPromedio` double NOT NULL,
  `CostoTotalPromedio` double NOT NULL,
  `ProductosVenta_idProductosVenta` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idKardexMercancias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `kardexmercancias_temporal`;
CREATE TABLE `kardexmercancias_temporal` (
  `idKardexMercancias` bigint(20) NOT NULL AUTO_INCREMENT,
  `idBodega` int(11) NOT NULL DEFAULT '1',
  `Fecha` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Movimiento` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Detalle` varchar(400) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `idDocumento` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `ValorUnitario` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `ValorTotal` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `CostoPromedioUnitario` double NOT NULL,
  `CostoPromedioTotal` double NOT NULL,
  `ProductosVenta_idProductosVenta` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idKardexMercancias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `kardex_alquiler`;
CREATE TABLE `kardex_alquiler` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Movimiento` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Cantidad` double NOT NULL,
  `Equipo` text COLLATE latin1_spanish_ci NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `RazonSocial` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `Detalle` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `NumDocumento` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `ValorUnitario` double NOT NULL,
  `ValorTotal` double NOT NULL,
  `idUser` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `idProducto` (`idProducto`),
  KEY `idProducto_2` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `kits`;
CREATE TABLE `kits` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `kits_relaciones`;
CREATE TABLE `kits_relaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TablaProducto` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `ReferenciaProducto` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `IDKit` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `librodiario`;
CREATE TABLE `librodiario` (
  `idLibroDiario` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Tipo_Documento_Intero` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Num_Documento_Interno` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Num_Documento_Externo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Tipo_Documento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tercero_Identificacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tercero_DV` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Primer_Apellido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Segundo_Apellido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Primer_Nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Otros_Nombres` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Razon_Social` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Cod_Dpto` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Cod_Mcipio` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Tercero_Pais_Domicilio` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Concepto` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NombreCuenta` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Detalle` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Debito` double DEFAULT NULL,
  `Credito` double DEFAULT NULL,
  `Neto` double DEFAULT NULL,
  `Mayor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Esp` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idCentroCosto` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `Estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idLibroDiario`),
  KEY `Tipo_Documento_Intero` (`Tipo_Documento_Intero`),
  KEY `Tercero_Identificacion` (`Tercero_Identificacion`),
  KEY `Num_Documento_Interno` (`Num_Documento_Interno`),
  KEY `CuentaPUC` (`CuentaPUC`),
  KEY `Fecha` (`Fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `libromayorbalances`;
CREATE TABLE `libromayorbalances` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FechaInicial` date NOT NULL,
  `FechaFinal` date NOT NULL,
  `CuentaPUC` bigint(20) DEFAULT NULL,
  `NombreCuenta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SaldoAnterior` double NOT NULL,
  `Debito` double DEFAULT NULL,
  `Credito` double DEFAULT NULL,
  `NuevoSaldo` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `maquinas`;
CREATE TABLE `maquinas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `FechaInicio` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `idCarpeta` int(11) NOT NULL,
  `Pagina` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `Target` varchar(10) COLLATE latin1_spanish_ci NOT NULL DEFAULT '_SELF',
  `Estado` int(1) NOT NULL DEFAULT '1',
  `Image` text COLLATE latin1_spanish_ci NOT NULL,
  `Orden` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `menu_carpetas`;
CREATE TABLE `menu_carpetas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ruta` varchar(90) COLLATE latin1_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `menu_pestanas`;
CREATE TABLE `menu_pestanas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idMenu` int(11) NOT NULL,
  `Orden` int(11) NOT NULL,
  `Estado` bit(1) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `menu_submenus`;
CREATE TABLE `menu_submenus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `idPestana` int(11) NOT NULL,
  `idCarpeta` int(11) NOT NULL,
  `Pagina` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Target` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `Estado` bit(1) NOT NULL,
  `Image` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `Orden` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `notascontables`;
CREATE TABLE `notascontables` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `FechaProgramada` date NOT NULL,
  `Detalle` text COLLATE utf8_spanish2_ci NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `Subtotal` double NOT NULL,
  `IVA` double NOT NULL,
  `Total` double NOT NULL,
  `Soporte` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `NumFactura` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `CentroCostos` int(11) NOT NULL,
  `EmpresaPro` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `notascontables_anulaciones`;
CREATE TABLE `notascontables_anulaciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `idNota` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `notascredito`;
CREATE TABLE `notascredito` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idFactura` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ordenesdecompra`;
CREATE TABLE `ordenesdecompra` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Tercero` int(11) NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `PlazoEntrega` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NoCotizacion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Condiciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Solicitante` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Cargo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `UsuarioCreador` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ordenesdecompra_items`;
CREATE TABLE `ordenesdecompra_items` (
  `ID` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NumOrden` int(11) NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `Referencia` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ValorUnitario` float NOT NULL,
  `Subtotal` float NOT NULL,
  `IVA` float NOT NULL,
  `Total` float NOT NULL,
  `TablaOrigen` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ordenesdetrabajo`;
CREATE TABLE `ordenesdetrabajo` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `FechaOT` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `idCliente` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `DireccionServicio` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `NombreSolicitante` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Ciudad` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoOrden` int(11) NOT NULL,
  `idUsuarioCreador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Hora` time NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ordenesdetrabajo_items`;
CREATE TABLE `ordenesdetrabajo_items` (
  `ID` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idOT` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Actividad` text COLLATE utf8_spanish2_ci NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `TiempoEstimadoHoras` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idColaborador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ordenesdetrabajo_tipo`;
CREATE TABLE `ordenesdetrabajo_tipo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ori_facturas`;
CREATE TABLE `ori_facturas` (
  `idFacturas` varchar(45) CHARACTER SET utf8 NOT NULL,
  `idResolucion` int(11) NOT NULL,
  `TipoFactura` varchar(10) CHARACTER SET utf8 NOT NULL,
  `Prefijo` varchar(45) CHARACTER SET utf8 NOT NULL,
  `NumeroFactura` int(16) NOT NULL,
  `Fecha` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Hora` varchar(20) CHARACTER SET utf8 NOT NULL,
  `OCompra` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `OSalida` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `FormaPago` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Subtotal` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `IVA` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Descuentos` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Total` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `SaldoFact` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Cotizaciones_idCotizaciones` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `EmpresaPro_idEmpresaPro` int(11) NOT NULL,
  `CentroCosto` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `TotalCostos` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `CerradoDiario` bigint(20) NOT NULL,
  `FechaCierreDiario` date NOT NULL,
  `HoraCierreDiario` time NOT NULL,
  `ObservacionesFact` text CHARACTER SET utf8 NOT NULL,
  `Efectivo` double NOT NULL,
  `Devuelve` double NOT NULL,
  `Cheques` double NOT NULL,
  `Otros` double NOT NULL,
  `Tarjetas` double NOT NULL,
  `idTarjetas` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idFacturas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ori_facturas_items`;
CREATE TABLE `ori_facturas_items` (
  `ID` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `FechaFactura` date NOT NULL,
  `idFactura` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `TablaItems` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Tabla donde se encuentra el producto o servicio',
  `Referencia` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Referencia del producto o servicio',
  `Nombre` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Departamento` int(11) NOT NULL,
  `SubGrupo1` int(11) NOT NULL,
  `SubGrupo2` int(11) NOT NULL,
  `SubGrupo3` int(11) NOT NULL,
  `SubGrupo4` int(11) NOT NULL,
  `SubGrupo5` int(11) NOT NULL,
  `ValorUnitarioItem` int(11) NOT NULL,
  `Cantidad` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `Dias` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `SubtotalItem` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `IVAItem` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `ValorOtrosImpuestos` double NOT NULL,
  `TotalItem` double NOT NULL COMMENT 'Total del valor del Item',
  `PorcentajeIVA` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'que porcentaje de IVA se le aplico',
  `idOtrosImpuestos` int(11) NOT NULL,
  `idPorcentajeIVA` int(11) NOT NULL,
  `PrecioCostoUnitario` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `SubtotalCosto` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Costo total del item',
  `TipoItem` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Define si se realiza ajustes a inventarios',
  `CuentaPUC` int(11) NOT NULL COMMENT 'Cuenta donde se llevara el asiento contable ',
  `GeneradoDesde` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Tabla que agrega el item',
  `NumeroIdentificador` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Identificar del que agrega el item',
  `idUsuarios` int(11) NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `idFactura` (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `paginas`;
CREATE TABLE `paginas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoPagina` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Visible` tinyint(1) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `paginas_bloques`;
CREATE TABLE `paginas_bloques` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TipoUsuario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Pagina` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Habilitado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'SI',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `parametros_contables`;
CREATE TABLE `parametros_contables` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaPUC` bigint(20) NOT NULL,
  `NombreCuenta` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `parametros_generales`;
CREATE TABLE `parametros_generales` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KardexCotizacion` bit(1) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `plataforma_tablas`;
CREATE TABLE `plataforma_tablas` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `porcentajes_iva`;
CREATE TABLE `porcentajes_iva` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Factor` varchar(10) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'M',
  `CuentaPUC` bigint(20) NOT NULL,
  `CuentaPUCIVAGenerado` bigint(20) NOT NULL,
  `NombreCuenta` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Habilitado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `precotizacion`;
CREATE TABLE `precotizacion` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NumSolicitud` varchar(45) NOT NULL,
  `Cantidad` double NOT NULL,
  `Multiplicador` int(11) NOT NULL DEFAULT '1',
  `Referencia` varchar(45) NOT NULL,
  `ValorUnitario` double NOT NULL,
  `SubTotal` double NOT NULL,
  `Descripcion` text NOT NULL,
  `IVA` double NOT NULL,
  `Descuento` double NOT NULL,
  `ValorDescuento` double NOT NULL,
  `PrecioCosto` double NOT NULL,
  `SubtotalCosto` double NOT NULL,
  `Total` double NOT NULL,
  `TipoItem` varchar(10) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `CuentaPUC` varchar(45) NOT NULL,
  `Tabla` varchar(45) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `preventa`;
CREATE TABLE `preventa` (
  `idPrecotizacion` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Cantidad` double NOT NULL,
  `VestasActivas_idVestasActivas` int(11) NOT NULL,
  `idFacturas` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ProductosVenta_idProductosVenta` bigint(20) NOT NULL,
  `TablaItem` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ValorUnitario` double NOT NULL,
  `Subtotal` double NOT NULL,
  `ValorAcordado` double NOT NULL,
  `CostoUnitario` double NOT NULL,
  `PrecioMayorista` double NOT NULL,
  `Descuento` double NOT NULL,
  `Impuestos` double NOT NULL,
  `PorcentajeIVA` double NOT NULL,
  `TotalVenta` double NOT NULL,
  `TipoItem` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idSistema` int(11) NOT NULL,
  `Autorizado` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idPrecotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `produccion_actividades`;
CREATE TABLE `produccion_actividades` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idOrdenTrabajo` bigint(20) NOT NULL,
  `Fecha_Planeada_Inicio` date NOT NULL,
  `Fecha_Planeada_Fin` date NOT NULL,
  `Hora_Planeada_Inicio` time NOT NULL,
  `Hora_Planeada_Fin` time NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  `Hora_Inicio` time NOT NULL,
  `Hora_Fin` time NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `idMaquina` int(11) NOT NULL,
  `idColaborador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Tiempo_Operacion` float NOT NULL,
  `Pausas_Operativas` float NOT NULL,
  `Pausas_No_Operativas` float NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `produccion_horas_cronograma`;
CREATE TABLE `produccion_horas_cronograma` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Hora` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `produccion_ordenes_trabajo`;
CREATE TABLE `produccion_ordenes_trabajo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Compromiso_Entrega` date NOT NULL,
  `FechaTerminacion` date NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `TotalHorasPlaneadas` float NOT NULL,
  `TotalHorasEmpleadas` float NOT NULL,
  `Pausas_Operativas` float NOT NULL,
  `Pausas_No_Operativas` float NOT NULL,
  `Tiempo_Operacion` float NOT NULL,
  `ValorSugerido` bigint(20) NOT NULL,
  `ValorMateriales` bigint(20) NOT NULL,
  `ValorCotizado` bigint(20) NOT NULL,
  `ValorFacturado` bigint(20) NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idCliente` int(11) NOT NULL,
  `Facturado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `NumFactura` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `produccion_pausas_predefinidas`;
CREATE TABLE `produccion_pausas_predefinidas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Suma` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `produccion_registro_tiempos`;
CREATE TABLE `produccion_registro_tiempos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idActividad` bigint(20) NOT NULL,
  `FechaHora` datetime NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Suma` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `productosalquiler`;
CREATE TABLE `productosalquiler` (
  `idProductosVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Referencia` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Existencias` int(11) NOT NULL,
  `EnAlquiler` int(11) NOT NULL,
  `EnBodega` int(11) NOT NULL,
  `PrecioVenta` double NOT NULL,
  `PrecioMayorista` double NOT NULL,
  `CostoUnitario` double NOT NULL,
  `IVA` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Departamento` int(11) NOT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ImagenRuta` text COLLATE utf8_spanish2_ci NOT NULL,
  `PesoUnitario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `PesoTotal` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `CostoUnitarioActivo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Sub1` int(11) NOT NULL,
  `Sub2` int(11) NOT NULL,
  `Sub3` int(11) NOT NULL,
  `Sub4` int(11) NOT NULL,
  `Sub5` int(11) NOT NULL,
  `Kit` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `productosventa`;
CREATE TABLE `productosventa` (
  `idProductosVenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Existencias` double DEFAULT '0',
  `PrecioVenta` double DEFAULT NULL,
  `PrecioMayorista` double NOT NULL,
  `CostoUnitario` double DEFAULT NULL,
  `CostoTotal` double DEFAULT NULL,
  `CostoUnitarioPromedio` double NOT NULL,
  `CostoTotalPromedio` double NOT NULL,
  `IVA` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Bodega_idBodega` int(11) NOT NULL DEFAULT '1',
  `Departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sub1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub3` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub4` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub5` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Kit` int(11) NOT NULL,
  `RutaImagen` text COLLATE utf8_spanish_ci NOT NULL,
  `Especial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '4135',
  `ValorComision1` int(11) NOT NULL,
  `ValorComision2` int(11) NOT NULL,
  `ValorComision3` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DELIMITER ;;

CREATE TRIGGER `insKardex` AFTER INSERT ON `productosventa` FOR EACH ROW
BEGIN

SET @fecha=CURDATE();
    INSERT INTO kardexmercancias (`Fecha`, `Movimiento`, `Detalle`, `Cantidad`,`ValorUnitario`, `ValorTotal`, `ProductosVenta_idProductosVenta`) VALUES (@fecha,'ENTRADA','INICIO',NEW.Existencias,NEW.CostoUnitario,NEW.CostoTotal,NEW.idProductosVenta);
    
    INSERT INTO kardexmercancias (`Fecha`, `Movimiento`, `Detalle`, `Cantidad`,`ValorUnitario`, `ValorTotal`, `ProductosVenta_idProductosVenta`) VALUES (@fecha,'SALDOS','INICIO',NEW.Existencias,NEW.CostoUnitario,NEW.CostoTotal,NEW.idProductosVenta);

SET @Dep=LPAD(NEW.Departamento,2,'0');

SET @Sub1=LPAD(NEW.Sub1,2,'0');

SET @id=LPAD(NEW.idProductosVenta,7,'0');
    
    
SET @Codigo=CONCAT(@Dep,@Sub1,@id);

INSERT INTO prod_codbarras (`CodigoBarras`,`ProductosVenta_idProductosVenta`) VALUES (@Codigo,NEW.idProductosVenta);

END;;

DELIMITER ;

DROP TABLE IF EXISTS `productosventa_bodega_1`;
CREATE TABLE `productosventa_bodega_1` (
  `idProductosVenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Existencias` double DEFAULT '0',
  `PrecioVenta` double DEFAULT NULL,
  `PrecioMayorista` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CostoUnitario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CostoTotal` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IVA` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Bodega_idBodega` int(11) NOT NULL DEFAULT '1',
  `Departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sub1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub3` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub4` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub5` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Kit` int(11) NOT NULL,
  `RutaImagen` text COLLATE utf8_spanish_ci NOT NULL,
  `Especial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '4135',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `productosventa_bodega_2`;
CREATE TABLE `productosventa_bodega_2` (
  `idProductosVenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Existencias` double DEFAULT '0',
  `PrecioVenta` double DEFAULT NULL,
  `PrecioMayorista` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CostoUnitario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CostoTotal` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IVA` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Bodega_idBodega` int(11) NOT NULL DEFAULT '1',
  `Departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sub1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub3` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub4` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub5` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Kit` int(11) NOT NULL,
  `RutaImagen` text COLLATE utf8_spanish_ci NOT NULL,
  `Especial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '4135',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `productosventa_bodega_3`;
CREATE TABLE `productosventa_bodega_3` (
  `idProductosVenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Existencias` double DEFAULT '0',
  `PrecioVenta` double DEFAULT NULL,
  `PrecioMayorista` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CostoUnitario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CostoTotal` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IVA` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Bodega_idBodega` int(11) NOT NULL DEFAULT '1',
  `Departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sub1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub3` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub4` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub5` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Kit` int(11) NOT NULL,
  `RutaImagen` text COLLATE utf8_spanish_ci NOT NULL,
  `Especial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '4135',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `productosventa_bodega_4`;
CREATE TABLE `productosventa_bodega_4` (
  `idProductosVenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Existencias` double DEFAULT '0',
  `PrecioVenta` double DEFAULT NULL,
  `PrecioMayorista` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CostoUnitario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CostoTotal` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IVA` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Bodega_idBodega` int(11) NOT NULL DEFAULT '1',
  `Departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sub1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub3` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub4` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub5` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Kit` int(11) NOT NULL,
  `RutaImagen` text COLLATE utf8_spanish_ci NOT NULL,
  `Especial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '4135',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `productosventa_bodega_5`;
CREATE TABLE `productosventa_bodega_5` (
  `idProductosVenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Existencias` double DEFAULT '0',
  `PrecioVenta` double DEFAULT NULL,
  `PrecioMayorista` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CostoUnitario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CostoTotal` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IVA` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Bodega_idBodega` int(11) NOT NULL DEFAULT '1',
  `Departamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Sub1` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub2` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub3` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub4` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub5` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Kit` int(11) NOT NULL,
  `RutaImagen` text COLLATE utf8_spanish_ci NOT NULL,
  `Especial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL DEFAULT '4135',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `productos_impuestos_adicionales`;
CREATE TABLE `productos_impuestos_adicionales` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NombreImpuesto` text COLLATE latin1_spanish_ci NOT NULL,
  `idProducto` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `ValorImpuesto` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `CuentaPUC` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `NombreCuenta` text COLLATE latin1_spanish_ci NOT NULL,
  `Incluido` enum('SI','NO') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'NO',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `productos_lista_precios`;
CREATE TABLE `productos_lista_precios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Descripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `idUser` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `productos_precios_adicionales`;
CREATE TABLE `productos_precios_adicionales` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProducto` bigint(20) NOT NULL,
  `idListaPrecios` int(11) NOT NULL,
  `PrecioVenta` double NOT NULL,
  `TablaVenta` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idUser` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='tabla para agregar precios a los productos';


DROP TABLE IF EXISTS `prod_bajas_altas`;
CREATE TABLE `prod_bajas_altas` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Movimiento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Departamento` int(11) NOT NULL,
  `Referencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` double NOT NULL,
  `CostoTotal` double NOT NULL,
  `Observaciones` text COLLATE utf8_spanish_ci NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_bodega`;
CREATE TABLE `prod_bodega` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `idProductoAlquiler` int(11) NOT NULL,
  `Bodega_idCliente` int(11) NOT NULL,
  `CantidadProd` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `prod_codbarras`;
CREATE TABLE `prod_codbarras` (
  `idCodBarras` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductosVenta_idProductosVenta` bigint(20) NOT NULL,
  `CodigoBarras` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `TablaOrigen` varchar(90) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'productosventa',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCodBarras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_codbarras_bodega_1`;
CREATE TABLE `prod_codbarras_bodega_1` (
  `idCodBarras` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductosVenta_idProductosVenta` bigint(20) NOT NULL,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCodBarras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_codbarras_bodega_2`;
CREATE TABLE `prod_codbarras_bodega_2` (
  `idCodBarras` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductosVenta_idProductosVenta` bigint(20) NOT NULL,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCodBarras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_codbarras_bodega_3`;
CREATE TABLE `prod_codbarras_bodega_3` (
  `idCodBarras` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductosVenta_idProductosVenta` bigint(20) NOT NULL,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCodBarras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_codbarras_bodega_4`;
CREATE TABLE `prod_codbarras_bodega_4` (
  `idCodBarras` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductosVenta_idProductosVenta` bigint(20) NOT NULL,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCodBarras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_codbarras_bodega_5`;
CREATE TABLE `prod_codbarras_bodega_5` (
  `idCodBarras` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductosVenta_idProductosVenta` bigint(20) NOT NULL,
  `CodigoBarras` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idCodBarras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_comisiones`;
CREATE TABLE `prod_comisiones` (
  `idProd_Comisiones` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Comision` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `P_V` int(2) NOT NULL COMMENT '1 Valor 0 Porcentaje',
  `ValorComision1` double NOT NULL,
  `ValorComision2` double NOT NULL,
  `ValorComision3` double NOT NULL,
  `Porcentaje_Comision` double NOT NULL,
  `Dep_Comision` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProd_Comisiones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_departamentos`;
CREATE TABLE `prod_departamentos` (
  `idDepartamentos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TablaOrigen` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `TipoItem` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `ManejaExistencias` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idDepartamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_kits`;
CREATE TABLE `prod_kits` (
  `idKits` int(11) NOT NULL AUTO_INCREMENT,
  `TablaProducto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `ReferenciaProducto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idKits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_sinc`;
CREATE TABLE `prod_sinc` (
  `Referencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Departamento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `PrecioVenta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `PrecioMayorista` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DELIMITER ;;

CREATE TRIGGER `Productos_Sinc` AFTER INSERT ON `prod_sinc` FOR EACH ROW
BEGIN

UPDATE productosventa SET PrecioVenta=NEW.PrecioVenta WHERE Referencia=NEW.Referencia AND Departamento=NEW.Departamento;

UPDATE productosventa SET PrecioMayorista=NEW.PrecioMayorista WHERE Referencia=NEW.Referencia AND Departamento=NEW.Departamento;

END;;

DELIMITER ;

DROP TABLE IF EXISTS `prod_sub1`;
CREATE TABLE `prod_sub1` (
  `idSub1` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSub1` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idDepartamento` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idSub1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_sub2`;
CREATE TABLE `prod_sub2` (
  `idSub2` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSub2` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idSub1` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idSub2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_sub3`;
CREATE TABLE `prod_sub3` (
  `idSub3` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSub3` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idSub2` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idSub3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_sub4`;
CREATE TABLE `prod_sub4` (
  `idSub4` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSub4` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idSub3` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idSub4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_sub5`;
CREATE TABLE `prod_sub5` (
  `idSub5` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSub5` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idSub4` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idSub5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `prod_sub6`;
CREATE TABLE `prod_sub6` (
  `idSub6` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSub6` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idSub5` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idSub6`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `idProveedores` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Documento` int(11) NOT NULL,
  `Num_Identificacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DV` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `Lugar_Expedicion_Documento` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `Primer_Apellido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Segundo_Apellido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Primer_Nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Otros_Nombres` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `RazonSocial` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cod_Dpto` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Cod_Mcipio` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Pais_Domicilio` varchar(10) COLLATE utf8_spanish_ci NOT NULL DEFAULT '169',
  `Telefono` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Ciudad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Contacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `TelContacto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `CuentaBancaria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `A_Nombre_De` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `TipoCuenta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `EntidadBancaria` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `CIUU` int(11) NOT NULL,
  `Cupo` double NOT NULL,
  `Soporte` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `publicidad_encabezado_cartel`;
CREATE TABLE `publicidad_encabezado_cartel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` text COLLATE latin1_spanish_ci NOT NULL,
  `ColorTitulo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `Desde` int(11) NOT NULL,
  `Hasta` int(11) NOT NULL,
  `Mes` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `Anio` int(11) NOT NULL,
  `ColorRazonSocial` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `ColorPrecios` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `ColorBordes` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `publicidad_paginas`;
CREATE TABLE `publicidad_paginas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` bigint(20) NOT NULL,
  `Observaciones` text COLLATE latin1_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `registra_apertura_documentos`;
CREATE TABLE `registra_apertura_documentos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Documento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NumDocumento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ConceptoApertura` text COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `registra_ediciones`;
CREATE TABLE `registra_ediciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Tabla` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Campo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `ValorAnterior` text COLLATE utf8_spanish2_ci NOT NULL,
  `ValorNuevo` text COLLATE utf8_spanish2_ci NOT NULL,
  `ConsultaRealizada` text COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `registra_eliminaciones`;
CREATE TABLE `registra_eliminaciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Campo` text COLLATE latin1_spanish_ci NOT NULL,
  `Valor` text COLLATE latin1_spanish_ci NOT NULL,
  `Causal` text COLLATE latin1_spanish_ci NOT NULL,
  `TablaOrigen` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `idTabla` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idItemEliminado` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `TablaOrigen` (`TablaOrigen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `registro_autorizaciones_pos`;
CREATE TABLE `registro_autorizaciones_pos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `TablaItem` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `ValorUnitario` double NOT NULL,
  `ValorAcordado` double NOT NULL,
  `Cantidad` double NOT NULL,
  `PorcentajeIVA` double NOT NULL,
  `Total` double NOT NULL,
  `idFactura` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `registro_basculas`;
CREATE TABLE `registro_basculas` (
  `Gramos` double NOT NULL,
  `idBascula` int(11) NOT NULL,
  `Leido` bit(1) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `idBascula` (`idBascula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `relacioncompras`;
CREATE TABLE `relacioncompras` (
  `idRelacionCompras` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Documento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `NumDocumento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ValorUnitarioAntesIVA` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `TotalAntesIVA` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ProductosVenta_idProductosVenta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idRelacionCompras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DELIMITER ;;

CREATE TRIGGER `KardexCompras` AFTER INSERT ON `relacioncompras` FOR EACH ROW
BEGIN


SELECT Existencias into @Cantidad FROM productosventa WHERE idProductosVenta=NEW.ProductosVenta_idProductosVenta;


SET @Saldo=@Cantidad+NEW.Cantidad;

SET @PrecioPromedio=NEW.TotalAntesIVA;
          
SET @TotalSaldo=NEW.ValorUnitarioAntesIVA*@Saldo;

    
 INSERT INTO kardexmercancias (`Fecha`, `Movimiento`, `Detalle`,`idDocumento`, `Cantidad`,`ValorUnitario`, `ValorTotal`, `ProductosVenta_idProductosVenta`) VALUES (NEW.Fecha,'ENTRADA',NEW.Documento,NEW.NumDocumento,NEW.Cantidad,NEW.ValorUnitarioAntesIVA,NEW.TotalAntesIVA,NEW.ProductosVenta_idProductosVenta);
    

INSERT INTO kardexmercancias (`Fecha`, `Movimiento`, `Detalle`,`idDocumento`, `Cantidad`,`ValorUnitario`, `ValorTotal`, `ProductosVenta_idProductosVenta`) VALUES (NEW.Fecha,'SALDOS',NEW.Documento,NEW.NumDocumento,@Saldo,NEW.ValorUnitarioAntesIVA,@TotalSaldo,NEW.ProductosVenta_idProductosVenta);

SELECT Existencias into @Saldoext FROM productosventa WHERE idProductosVenta = NEW.ProductosVenta_idProductosVenta;

SET @Saldoext=@Saldoext+NEW.Cantidad;

UPDATE productosventa SET `Existencias`= @Saldoext WHERE idProductosVenta = NEW.ProductosVenta_idProductosVenta;

UPDATE productosventa SET `CostoUnitario`= NEW.ValorUnitarioAntesIVA WHERE idProductosVenta = NEW.ProductosVenta_idProductosVenta;

UPDATE productosventa SET `CostoTotal`= @TotalSaldo WHERE idProductosVenta = NEW.ProductosVenta_idProductosVenta;


END;;

DELIMITER ;

DROP TABLE IF EXISTS `remisiones`;
CREATE TABLE `remisiones` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `Cotizaciones_idCotizaciones` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Obra` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Retira` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `FechaDespacho` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `HoraDespacho` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ObservacionesRemision` text COLLATE utf8_spanish_ci NOT NULL,
  `Anticipo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Dias` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Estado` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `CentroCosto` int(11) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `rem_devoluciones`;
CREATE TABLE `rem_devoluciones` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `idRemision` int(16) NOT NULL,
  `idItemCotizacion` int(16) NOT NULL,
  `Cantidad` int(16) NOT NULL,
  `ValorUnitario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Subtotal` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Dias` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Total` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NumDevolucion` int(16) NOT NULL,
  `FechaDevolucion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `HoraDevolucion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `rem_devoluciones_totalizadas`;
CREATE TABLE `rem_devoluciones_totalizadas` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `FechaDevolucion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `HoraDevolucion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idRemision` int(16) NOT NULL,
  `TotalDevolucion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ObservacionesDevolucion` text COLLATE utf8_spanish2_ci NOT NULL,
  `Usuarios_idUsuarios` int(16) NOT NULL,
  `Clientes_idClientes` int(16) NOT NULL,
  `Facturas_idFacturas` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `rem_pre_devoluciones`;
CREATE TABLE `rem_pre_devoluciones` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `idRemision` int(16) NOT NULL,
  `idItemCotizacion` int(16) NOT NULL,
  `Cantidad` int(16) NOT NULL,
  `ValorUnitario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Subtotal` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Dias` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Total` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `rem_relaciones`;
CREATE TABLE `rem_relaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FechaEntrega` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `CantidadEntregada` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Multiplicador` int(11) NOT NULL,
  `idItemCotizacion` int(11) NOT NULL,
  `idRemision` int(11) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `repuestas_forma_pago`;
CREATE TABLE `repuestas_forma_pago` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DiasCartera` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Etiqueta` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `requerimientos_proyectos`;
CREATE TABLE `requerimientos_proyectos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `idCliente` int(11) NOT NULL,
  `Estado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `HorasDesarrollo` double NOT NULL,
  `CostoEstimado` double NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `reservas_espacios`;
CREATE TABLE `reservas_espacios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `HoraInicial` int(11) NOT NULL,
  `HoraFinal` int(11) NOT NULL,
  `TarifaNormal` double NOT NULL,
  `TarifaMinima` double NOT NULL,
  `TarifaNormal2` double NOT NULL,
  `idProductoRelacionado` bigint(20) NOT NULL COMMENT 'Indica el producto que esta relacionado al momento de realizar una factura',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `reservas_eventos`;
CREATE TABLE `reservas_eventos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `idEspacio` int(11) NOT NULL,
  `NombreEvento` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `Telefono` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Observaciones` text COLLATE latin1_spanish_ci NOT NULL,
  `Tarifa` double NOT NULL,
  `Estado` enum('RE','FA','AN') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'RE' COMMENT 'FA:Facturado,RE:Reservado,AN:Anulado',
  `idFactura` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `FechaInicio` (`FechaInicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `respuestas_condicional`;
CREATE TABLE `respuestas_condicional` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Valor` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `respuestas_tipo_item`;
CREATE TABLE `respuestas_tipo_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Valor` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `restaurante_cierres`;
CREATE TABLE `restaurante_cierres` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `restaurante_mesas`;
CREATE TABLE `restaurante_mesas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Capacidad` int(11) NOT NULL,
  `Estado` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `restaurante_pedidos`;
CREATE TABLE `restaurante_pedidos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `Estado` varchar(4) COLLATE utf8_spanish2_ci NOT NULL COMMENT '''AB'' Abierto,''FAPE'' pedido facturado, ''FADO'' domicilio facturado, ''DEPE'' pedido descartado, ''DEDO'' domicilios descartados',
  `Tipo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `NombreCliente` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `DireccionEnvio` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `TelefonoConfirmacion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `restaurante_pedidos_items`;
CREATE TABLE `restaurante_pedidos_items` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idPedido` bigint(20) NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `NombreProducto` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `ValorUnitario` double NOT NULL,
  `Subtotal` double NOT NULL,
  `IVA` double NOT NULL,
  `Total` double NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `ProcentajeIVA` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Departamento` int(11) NOT NULL,
  `Sub1` int(11) NOT NULL,
  `Sub2` int(11) NOT NULL,
  `Sub3` int(11) NOT NULL,
  `Sub4` int(11) NOT NULL,
  `Sub5` int(11) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `idPedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `salud_archivo_usuarios_temp`;
CREATE TABLE `salud_archivo_usuarios_temp` (
  `id_usuarios_salud` varchar(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `tipo_ident_usuario` enum('CC','CE','PA','RC','TI','AS','MS') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Tipo de identificación del usuario " Ver Alineamientos tecnicos para ips ver pag 14"',
  `num_ident_usuario` bigint(16) NOT NULL COMMENT 'Número de identificación del usuario del sistema " Ver Alineamientos tecnicos para ips ver pag 16"',
  `cod_ident_adm_pb` varchar(6) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Código entidad administradora de planes de beneficio (EPS) " Ver Alineamientos tecnicos para ips ver pag 16"',
  `tipo_usuario` enum('1','2','3','4','5','6','7','8') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Tipo de usuario " Ver Alineamientos tecnicos para ips ver pag 16"',
  `primer_ape_usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Primer apellido del usuario " Ver Alineamientos tecnicos para ips ver pag 17"',
  `segundo_ape_usuario` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Segundo apellido del usuario " Ver Alineamientos tecnicos para ips ver pag 17"',
  `primer_nom_usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Primer nombre del usuario " Ver Alineamientos tecnicos para ips ver pag 17"',
  `segundo_nom_usuario` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Segundo nombre del usuario " Ver Alineamientos tecnicos para ips ver pag 17"',
  `edad` int(3) NOT NULL COMMENT 'Edad " Ver Alineamientos tecnicos para ips ver pag 17 "',
  `unidad_medida_edad` enum('1','2','3') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Unidad de medida de la edad " Ver Alineamientos tecnicos para ips ver pag 17"',
  `sexo` enum('M','F') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Sexo del usuario " Ver Alineamientos tecnicos para ips ver pag 18"',
  `cod_depa_residencial` int(2) NOT NULL COMMENT 'Código del departamento de residencia habitual " Ver Alineamientos tecnicos para ips ver pag 18"',
  `cod_muni_residencial` int(3) NOT NULL COMMENT 'Código del municipio de residencia habitual " Ver Alineamientos tecnicos para ips ver pag 18"',
  `zona_residencial` enum('U','R') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Zona de residencia habitual " Ver Alineamientos tecnicos para ips ver pag 18"',
  `nom_cargue` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del archivo con el que se carga',
  `fecha_cargue` datetime NOT NULL COMMENT 'Fecha en que se carga',
  `idUser` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id_usuarios_salud` (`id_usuarios_salud`),
  KEY `num_ident_usuario` (`num_ident_usuario`),
  KEY `primer_ape_usuario` (`primer_ape_usuario`),
  KEY `segundo_ape_usuario` (`segundo_ape_usuario`),
  KEY `primer_nom_usuario` (`primer_nom_usuario`),
  KEY `segundo_nom_usuario` (`segundo_nom_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT COMMENT='Archivo de usuarios US';


DROP TABLE IF EXISTS `separados`;
CREATE TABLE `separados` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idCliente` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `Saldo` int(11) NOT NULL,
  `Estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuarios` int(11) NOT NULL,
  `idSucursal` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `separados_abonos`;
CREATE TABLE `separados_abonos` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idSeparado` bigint(20) unsigned NOT NULL,
  `Valor` double NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idUsuarios` int(11) NOT NULL,
  `idComprobanteIngreso` bigint(20) NOT NULL,
  `idCierre` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `separados_items`;
CREATE TABLE `separados_items` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `idSeparado` bigint(20) NOT NULL,
  `TablaItems` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Referencia` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` text COLLATE utf8_spanish2_ci NOT NULL,
  `Departamento` int(11) NOT NULL,
  `SubGrupo1` int(11) NOT NULL,
  `SubGrupo2` int(11) NOT NULL,
  `SubGrupo3` int(11) NOT NULL,
  `SubGrupo4` int(11) NOT NULL,
  `SubGrupo5` int(11) NOT NULL,
  `ValorUnitarioItem` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `SubtotalItem` int(11) NOT NULL,
  `IVAItem` int(11) NOT NULL,
  `TotalItem` int(11) NOT NULL,
  `PorcentajeIVA` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `PrecioCostoUnitario` int(11) NOT NULL,
  `SubtotalCosto` int(11) NOT NULL,
  `TipoItem` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaPUC` int(11) NOT NULL,
  `GeneradoDesde` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NumeroIdentificador` int(11) NOT NULL,
  `Multiplicador` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `idProductosVenta` int(16) NOT NULL AUTO_INCREMENT,
  `Referencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `PrecioVenta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `PrecioMayorista` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CostoUnitario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `IVA` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Departamento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ImagenRuta` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Sub1` int(11) NOT NULL,
  `Sub2` int(11) NOT NULL,
  `Sub3` int(11) NOT NULL,
  `Sub4` int(11) NOT NULL,
  `Sub5` int(11) NOT NULL,
  `Kit` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idProductosVenta`),
  UNIQUE KEY `Referencia` (`Referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `servidores`;
CREATE TABLE `servidores` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `DataBase` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `sistemas`;
CREATE TABLE `sistemas` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nombre` text COLLATE utf8_spanish2_ci NOT NULL,
  `RutaImagen` text COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `sistemas_relaciones`;
CREATE TABLE `sistemas_relaciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TablaOrigen` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `Referencia` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` double NOT NULL,
  `ValorUnitario` double NOT NULL,
  `idSistema` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `subcuentas`;
CREATE TABLE `subcuentas` (
  `PUC` int(11) NOT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cuentas_idPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`PUC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `subcuentas_equivalencias_niif`;
CREATE TABLE `subcuentas_equivalencias_niif` (
  `CuentaNIIF` int(11) NOT NULL,
  `NombreCuentaNIIF` int(11) NOT NULL,
  `Equivale_A` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CuentaNIIF`),
  UNIQUE KEY `Equivale_A` (`Equivale_A`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `tablas_campos_control`;
CREATE TABLE `tablas_campos_control` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NombreTabla` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Campo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Visible` int(1) NOT NULL,
  `Editable` int(1) NOT NULL,
  `Habilitado` int(1) NOT NULL,
  `TipoUser` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `idUser` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


DROP TABLE IF EXISTS `tablas_ventas`;
CREATE TABLE `tablas_ventas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NombreTabla` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idTabla` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `TipoVenta` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `IVAIncluido` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaPUCDefecto` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `tarjetas_forma_pago`;
CREATE TABLE `tarjetas_forma_pago` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `PorcentajeComision` float NOT NULL,
  `CuentaPUC` bigint(20) NOT NULL,
  `NombreCuenta` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `terceros_cuentas_cobro`;
CREATE TABLE `terceros_cuentas_cobro` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Tercero` bigint(20) NOT NULL,
  `idConceptoContable` int(11) NOT NULL COMMENT 'relacion que mostrara el concepto y movimientos contables a realizar viene de la tabla conceptos',
  `Valor` double NOT NULL,
  `Observaciones` text COLLATE latin1_spanish_ci NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Tabla para realizar cuentas de cobro por parte de terceros';


DROP TABLE IF EXISTS `tiposretenciones`;
CREATE TABLE `tiposretenciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaPasivo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NombreCuentaPasivo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaActivo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NombreCuentaActivo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_abonos`;
CREATE TABLE `titulos_abonos` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idVenta` bigint(20) NOT NULL,
  `Monto` double NOT NULL,
  `idColaborador` bigint(20) NOT NULL,
  `NombreColaborador` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `idComprobanteIngreso` bigint(20) NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_asignaciones`;
CREATE TABLE `titulos_asignaciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Promocion` int(11) NOT NULL,
  `Desde` int(11) NOT NULL,
  `Hasta` int(11) NOT NULL,
  `idColaborador` bigint(20) NOT NULL,
  `NombreColaborador` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_comisiones`;
CREATE TABLE `titulos_comisiones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `idVenta` bigint(20) NOT NULL,
  `Monto` double NOT NULL,
  `idColaborador` bigint(20) NOT NULL,
  `NombreColaborador` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `idEgreso` bigint(20) NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_cuentasxcobrar`;
CREATE TABLE `titulos_cuentasxcobrar` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FechaIngreso` date NOT NULL,
  `Origen` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idDocumento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idTercero` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `RazonSocial` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Ciudad` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Valor` double NOT NULL,
  `TotalAbonos` double NOT NULL,
  `Saldo` double NOT NULL,
  `CicloPagos` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `UltimoPago` date NOT NULL,
  `idColaborador` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NombreColaborador` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Promocion` int(11) NOT NULL,
  `Mayor` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_devoluciones`;
CREATE TABLE `titulos_devoluciones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `idVenta` bigint(20) NOT NULL,
  `Promocion` int(11) NOT NULL,
  `Mayor` bigint(20) NOT NULL,
  `Concepto` text COLLATE utf8_spanish2_ci NOT NULL,
  `idColaborador` bigint(20) NOT NULL,
  `NombreColaborador` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_listados_promocion_1`;
CREATE TABLE `titulos_listados_promocion_1` (
  `Mayor1` int(11) NOT NULL,
  `Mayor2` int(11) NOT NULL,
  `Adicional` int(11) NOT NULL,
  `idColaborador` int(11) NOT NULL,
  `NombreColaborador` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaEntregaColaborador` date NOT NULL,
  `idActa` bigint(20) NOT NULL,
  `TotalPagoComisiones` bigint(20) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `NombreCliente` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaVenta` date NOT NULL,
  `TotalAbonos` bigint(20) NOT NULL,
  `Saldo` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Mayor1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_listados_promocion_6`;
CREATE TABLE `titulos_listados_promocion_6` (
  `Mayor1` int(11) NOT NULL,
  `Mayor2` int(11) NOT NULL,
  `Adicional` int(11) NOT NULL,
  `idColaborador` int(11) NOT NULL,
  `NombreColaborador` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaEntregaColaborador` date NOT NULL,
  `TotalPagoComisiones` bigint(20) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `NombreCliente` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaVenta` date NOT NULL,
  `TotalAbonos` bigint(20) NOT NULL,
  `Saldo` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Mayor1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_listados_promocion_7`;
CREATE TABLE `titulos_listados_promocion_7` (
  `Mayor1` int(11) NOT NULL,
  `Mayor2` int(11) NOT NULL,
  `Adicional` int(11) NOT NULL,
  `idColaborador` int(11) NOT NULL,
  `NombreColaborador` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaEntregaColaborador` date NOT NULL,
  `idActa` bigint(20) NOT NULL,
  `TotalPagoComisiones` bigint(20) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `NombreCliente` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaVenta` date NOT NULL,
  `TotalAbonos` bigint(20) NOT NULL,
  `Saldo` bigint(20) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Mayor1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_promociones`;
CREATE TABLE `titulos_promociones` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `MayorInicial` int(11) NOT NULL,
  `MayorFinal` int(11) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `Valor` bigint(20) NOT NULL,
  `ComisionAPagar` bigint(20) NOT NULL,
  `Loteria` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NumeroGanador` int(11) NOT NULL,
  `Activo` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `CuentaPUC` bigint(20) NOT NULL DEFAULT '413570',
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_traslados`;
CREATE TABLE `titulos_traslados` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Promocion` int(11) NOT NULL,
  `Mayor1` int(11) NOT NULL,
  `idColaboradorAnterior` bigint(20) NOT NULL,
  `NombreColaboradorAnterior` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `idColaboradorAsignado` bigint(20) NOT NULL,
  `NombreColaboradorAsignado` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `Observaciones` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `titulos_ventas`;
CREATE TABLE `titulos_ventas` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Promocion` int(11) NOT NULL,
  `Mayor1` int(11) NOT NULL,
  `Mayor2` int(11) NOT NULL,
  `Adicional` int(11) NOT NULL,
  `Valor` bigint(20) NOT NULL,
  `TotalAbonos` bigint(20) NOT NULL,
  `Saldo` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `NombreCliente` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `idColaborador` bigint(20) NOT NULL,
  `NombreColaborador` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `ComisionAPagar` bigint(20) NOT NULL,
  `SaldoComision` double NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `traslados_estados`;
CREATE TABLE `traslados_estados` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `traslados_items`;
CREATE TABLE `traslados_items` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `idTraslado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Destino` int(11) NOT NULL,
  `CodigoBarras` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Referencia` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre` text COLLATE utf8_spanish2_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioVenta` double NOT NULL,
  `PrecioMayorista` double NOT NULL,
  `CostoUnitario` double NOT NULL,
  `IVA` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Departamento` int(11) NOT NULL,
  `Sub1` int(11) NOT NULL,
  `Sub2` int(11) NOT NULL,
  `Sub3` int(11) NOT NULL,
  `Sub4` int(11) NOT NULL,
  `Sub5` int(11) NOT NULL,
  `CuentaPUC` int(11) NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `ServerSincronizado` datetime NOT NULL,
  `DestinoSincronizado` datetime NOT NULL,
  `CodigoBarras1` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `CodigoBarras2` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `CodigoBarras3` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `CodigoBarras4` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `traslados_mercancia`;
CREATE TABLE `traslados_mercancia` (
  `ID` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Origen` int(11) NOT NULL,
  `ConsecutivoInterno` bigint(20) NOT NULL,
  `Destino` int(11) NOT NULL,
  `Descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `idBodega` int(11) NOT NULL,
  `Estado` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Abre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Cierra` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `ServerSincronizado` datetime NOT NULL,
  `DestinoSincronizado` datetime NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Apellido` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Identificacion` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Login` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Password` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoUser` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Role` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `usuarios_ip`;
CREATE TABLE `usuarios_ip` (
  `Direccion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `usuarios_keys`;
CREATE TABLE `usuarios_keys` (
  `KeyUsuario` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`KeyUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `usuarios_tipo`;
CREATE TABLE `usuarios_tipo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `idVentas` int(11) NOT NULL AUTO_INCREMENT,
  `NumVenta` int(16) DEFAULT NULL,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Productos_idProductos` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Producto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Referencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ValorCostoUnitario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ValorVentaUnitario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Impuestos` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Descuentos` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TotalCosto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TotalVenta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoVenta` varchar(45) COLLATE utf8_spanish_ci DEFAULT 'Contado' COMMENT 'Credito o contado',
  `Cotizaciones_idCotizaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Especial` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Clientes_idClientes` int(11) NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `CerradoDiario` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCierreDiario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `HoraCierreDiario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `UsuarioCierreDiario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `HoraVenta` time NOT NULL,
  `NoReclamacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idVentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DELIMITER ;;

CREATE TRIGGER `UpdateProductos` AFTER INSERT ON `ventas` FOR EACH ROW
BEGIN


SELECT Existencias into @Cantidad FROM productosventa WHERE idProductosVenta=NEW.Productos_idProductos;

SET @PrecioPromedio=NEW.ValorCostoUnitario;

SET @Saldo=@Cantidad-NEW.Cantidad;

SET @TotalSaldo=@Saldo*@PrecioPromedio;
SET @TotalMov=NEW.Cantidad*@PrecioPromedio;
    
 INSERT INTO kardexmercancias (`Fecha`, `Movimiento`, `Detalle`,`idDocumento`, `Cantidad`,`ValorUnitario`, `ValorTotal`, `ProductosVenta_idProductosVenta`) VALUES (NEW.Fecha,'SALIDA','VENTA',NEW.NumVenta,NEW.Cantidad,@PrecioPromedio,@TotalMov,NEW.Productos_idProductos);
    

INSERT INTO kardexmercancias (`Fecha`, `Movimiento`, `Detalle`,`idDocumento`, `Cantidad`,`ValorUnitario`, `ValorTotal`, `ProductosVenta_idProductosVenta`) VALUES (NEW.Fecha,'SALDOS','VENTA',NEW.NumVenta,@Saldo,@PrecioPromedio,@TotalSaldo,NEW.Productos_idProductos);

UPDATE productosventa SET `Existencias`= @Saldo WHERE idProductosVenta = NEW.Productos_idProductos;

UPDATE productosventa SET `CostoTotal`= @TotalSaldo WHERE idProductosVenta = NEW.Productos_idProductos;

SET @SubTotal=NEW.TotalVenta-NEW.Impuestos;

IF (NEW.Especial = "NO" ) THEN

INSERT INTO cotizaciones (`NumCotizacion`, `Fecha`, `Descripcion`,`Referencia`, `ValorUnitario`,`Cantidad`, `Subtotal`, `IVA`, `Total`, `ValorDescuento`,`Clientes_idClientes`, `SubtotalCosto`,`Usuarios_idUsuarios`, `TipoItem`, `PrecioCosto`) VALUES (NEW.Cotizaciones_idCotizaciones,NEW.Fecha,NEW.Producto,NEW.Referencia,NEW.ValorVentaUnitario,NEW.Cantidad,@SubTotal,NEW.Impuestos, NEW.TotalVenta,NEW.Descuentos,NEW.Clientes_idClientes,NEW.TotalCosto,NEW.Usuarios_idUsuarios,'PR',@PrecioPromedio);

END IF;

END;;

DELIMITER ;

DROP TABLE IF EXISTS `ventas_devoluciones`;
CREATE TABLE `ventas_devoluciones` (
  `idDevoluciones` int(16) NOT NULL AUTO_INCREMENT,
  `Facturas_idFacturas` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `FechaDevolucion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Referencia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ValorUnitario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Subtotal` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `IVA` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Total` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `SubtotalCosto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Clientes_idClientes` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Usuarios_idUsuarios` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Observaciones` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `CerradoDiario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCierreDiario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `HoraCierreDiario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `UsuarioCierreDiario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idDevoluciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `ventas_nota_credito`;
CREATE TABLE `ventas_nota_credito` (
  `idNotasCredito` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CuentaPUC` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `NombreCuenta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `DBCR` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Valor` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Facturas_idFacturas` int(11) NOT NULL,
  `Concepto` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idNotasCredito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `ventas_separados`;
CREATE TABLE `ventas_separados` (
  `idVentas_Separados` int(11) NOT NULL AUTO_INCREMENT,
  `Facturas_idFacturas` int(11) NOT NULL,
  `Retirado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `FechaRetiro` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `UsuariosEntrega` int(11) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idVentas_Separados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP TABLE IF EXISTS `vestasactivas`;
CREATE TABLE `vestasactivas` (
  `idVestasActivas` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Usuario_idUsuario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Clientes_idClientes` int(11) NOT NULL DEFAULT '0',
  `SaldoFavor` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idVestasActivas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DROP VIEW IF EXISTS `vista_abonos`;
CREATE TABLE `vista_abonos` (`Tabla` varchar(16), `TipoAbono` varchar(45), `Fecha` date, `Valor` double, `idUsuario` int(11), `idCierre` bigint(20));


DROP TABLE IF EXISTS `vista_abonos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_abonos` AS select 'abonos_factura' AS `Tabla`,`fa`.`FormaPago` AS `TipoAbono`,`fa`.`Fecha` AS `Fecha`,`fa`.`Valor` AS `Valor`,`fa`.`Usuarios_idUsuarios` AS `idUsuario`,`fa`.`idCierre` AS `idCierre` from `facturas_abonos` `fa` union select 'abonos_separados' AS `Tabla`,'Separados' AS `TipoAbono`,`fa`.`Fecha` AS `Fecha`,`fa`.`Valor` AS `Valor`,`fa`.`idUsuarios` AS `idUsuario`,`fa`.`idCierre` AS `idCierre` from `separados_abonos` `fa`;

-- 2018-05-15 14:17:30
