-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: almacen
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `folio` varchar(45) NOT NULL,
  `fecha_generacion` date NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `fecha_pactada` date NOT NULL,
  `proveedores_rfc` varchar(20) NOT NULL,
  PRIMARY KEY (`folio`),
  KEY `fk_facturas_proveedores_idx` (`proveedores_rfc`),
  CONSTRAINT `fk_facturas_proveedores` FOREIGN KEY (`proveedores_rfc`) REFERENCES `proveedores` (`rfc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES ('A1','2021-10-31','descripcion general de la factura',632.00,'2021-11-02','2021-09-23','1'),('A2','2021-10-30','descripcion general de la factura',562.00,'2021-09-23','2021-11-02','SPS110308EN2'),('A3','2021-10-31','descripcion general de la factura',820.00,'2021-11-02','2021-09-23','SPS110308EN2');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `listaproductos`
--

DROP TABLE IF EXISTS `listaproductos`;
/*!50001 DROP VIEW IF EXISTS `listaproductos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `listaproductos` (
  `folio` tinyint NOT NULL,
  `fecha_pactada` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `area` tinyint NOT NULL,
  `precio` tinyint NOT NULL,
  `stock` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `nombreproveedor` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `area` varchar(50) NOT NULL,
  `precio` decimal(13,2) NOT NULL,
  `stock` decimal(13,2) NOT NULL,
  `unidad_medida` varchar(50) NOT NULL,
  `facturas_folio` varchar(45) NOT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `fk_productos_facturas1_idx` (`facturas_folio`),
  CONSTRAINT `fk_productos_facturas1` FOREIGN KEY (`facturas_folio`) REFERENCES `facturas` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'JABON PARA MANOS','Limpieza',30.00,200.00,'Pieza','A2'),(2,'TOALLAS SANITAS','LIMPIEZA',51.00,100.00,'PIEZA','A2'),(3,'ROLLO DE PAPEL HIGIENICO','LIMPIEZA',40.00,12.00,'PIEZA','A3'),(4,'TONER HP','Papeleria',1800.00,2.00,'PIEZA','A1');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `rfc` varchar(20) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `appat` varchar(45) NOT NULL,
  `apmat` varchar(45) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `servicio` varchar(250) NOT NULL,
  `fecha_incorporacion` date NOT NULL,
  PRIMARY KEY (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES ('1','modificado','modificado','modificado','modificado','modificado','modificado','modificado','2021-10-31'),('10','razon social','juan','perez','leon','dom conocido','1234567898','limpieza','2021-11-09'),('11','razon social 1','juan','perez','leon','dom conocido','1234567899','limpieza','2021-11-10'),('12','razon social','juan','perez','leon','dom conocido','1234567900','limpieza','2021-11-11'),('13','razon social','juan','perez','leon','dom conocido','1234567901','limpieza','2021-11-12'),('14','razon social','juan','perez','leon','dom conocido','1234567902','limpieza','2021-11-13'),('15','razon social','juan','perez','leon','dom conocido','1234567903','limpieza','2021-11-14'),('16','razon social','juan','perez','leon','dom conocido','1234567904','limpieza','2021-11-15'),('17','razon social','juan','perez','leon','dom conocido','1234567905','limpieza','2021-11-16'),('18','razon social','juan','perez','leon','dom conocido','1234567906','limpieza','2021-11-17'),('19','razon social','juan','perez','leon','dom conocido','1234567907','limpieza','2021-11-18'),('2','razon social','juan','perez','leon','dom conocido','1234567890','limpieza','2021-11-01'),('20','razon social','juan','perez','leon','dom conocido','1234567908','limpieza','2021-11-19'),('21','razon social','juan','perez','leon','dom conocido','1234567909','limpieza','2021-11-20'),('22','razon social','juan','perez','leon','dom conocido','1234567910','limpieza','2021-11-21'),('23','razon social 2','juan','perez','leon','dom conocido','1234567911','limpieza','2021-11-22'),('24','razon social','juan','perez','leon','dom conocido','1234567912','limpieza','2021-11-23'),('25','razon social','juan','perez','leon','dom conocido','1234567913','limpieza','2021-11-24'),('26','razon social','juan','perez','leon','dom conocido','1234567914','limpieza','2021-11-25'),('27','razon social','juan','perez','leon','dom conocido','1234567915','limpieza','2021-11-26'),('28','razon social','juan','perez','leon','dom conocido','1234567916','limpieza','2021-11-27'),('29','razon social','juan','perez','leon','dom conocido','1234567917','limpieza','2021-11-28'),('3','razon social','juan','perez','leon','dom conocido','1234567891','limpieza','2021-11-02'),('30','razon social','juan','perez','leon','dom conocido','1234567918','limpieza','2021-11-29'),('31','razon social','juan','perez','leon','dom conocido','1234567919','limpieza','2021-11-30'),('32','razon social','juan','perez','leon','dom conocido','1234567920','limpieza','2021-12-01'),('33','razon social','juan','perez','leon','dom conocido','1234567921','limpieza','2021-12-02'),('34','razon social','juan','perez','leon','dom conocido','1234567922','limpieza','2021-12-03'),('35','razon social','juan','perez','leon','dom conocido','1234567923','limpieza','2021-12-04'),('36','razon social','juan','perez','leon','dom conocido','1234567924','limpieza','2021-12-05'),('37','razon social','juan','perez','leon','dom conocido','1234567925','limpieza','2021-12-06'),('38','razon social','juan','perez','leon','dom conocido','1234567926','limpieza','2021-12-07'),('39','razon social','juan','perez','leon','dom conocido','1234567927','limpieza','2021-12-08'),('4','razon social','juan','perez','leon','dom conocido','1234567892','limpieza','2021-11-03'),('40','razon social','juan','perez','leon','dom conocido','1234567928','limpieza','2021-12-09'),('41','razon social','juan','perez','leon','dom conocido','1234567929','limpieza','2021-12-10'),('42','razon social','juan','perez','leon','dom conocido','1234567930','limpieza','2021-12-11'),('43','razon social','juan','perez','leon','dom conocido','1234567931','limpieza','2021-12-12'),('44','razon social','juan','perez','leon','dom conocido','1234567932','limpieza','2021-12-13'),('45','razon social','juan','perez','leon','dom conocido','1234567933','limpieza','2021-12-14'),('46','razon social','juan','perez','leon','dom conocido','1234567934','limpieza','2021-12-15'),('47','razon social','juan','perez','leon','dom conocido','1234567935','limpieza','2021-12-16'),('48','razon social','juan','perez','leon','dom conocido','1234567936','limpieza','2021-12-17'),('49','razon social','juan','perez','leon','dom conocido','1234567937','limpieza','2021-12-18'),('5','razon social','juan','perez','leon','dom conocido','1234567893','limpieza','2021-11-04'),('6','razon social','juan','perez','leon','dom conocido','1234567894','limpieza','2021-11-05'),('7','razon social','juan','perez','leon','dom conocido','1234567895','limpieza','2021-11-06'),('8','razon social','juan','perez','leon','dom conocido','1234567896','limpieza','2021-11-07'),('9','razon social','juan','perez','leon','dom conocido','1234567897','limpieza','2021-11-08'),('SPS110308EN2','Surtiendo Productos y Servicios S.A de C.V.','Francisco Juan','Herrera','Moral','Mariano Arista N. 54 Col. Argentina Poniente Mexico. D.F','1547141090','Surtir Productos y Servicios','2021-10-30');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_detalles`
--

DROP TABLE IF EXISTS `req_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cant_pedida` decimal(10,2) NOT NULL,
  `cant_entregada` decimal(10,2) NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `folio` varchar(15) NOT NULL,
  `idproducto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_req_detalles_requisiciones1_idx` (`folio`),
  KEY `fk_req_detalles_productos1_idx` (`idproducto`),
  CONSTRAINT `fk_req_detalles_productos1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_req_detalles_requisiciones1` FOREIGN KEY (`folio`) REFERENCES `requisiciones` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_detalles`
--

LOCK TABLES `req_detalles` WRITE;
/*!40000 ALTER TABLE `req_detalles` DISABLE KEYS */;
INSERT INTO `req_detalles` VALUES (1,1.00,1.00,20.00,'P01281021',1),(2,1.00,1.00,40.00,'P01281021',3),(3,1.00,1.00,60.00,'P01281021',2);
/*!40000 ALTER TABLE `req_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `requisicion`
--

DROP TABLE IF EXISTS `requisicion`;
/*!50001 DROP VIEW IF EXISTS `requisicion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `requisicion` (
  `nombre` tinyint NOT NULL,
  `cant_pedida` tinyint NOT NULL,
  `cant_entregada` tinyint NOT NULL,
  `importe` tinyint NOT NULL,
  `folio` tinyint NOT NULL,
  `area` tinyint NOT NULL,
  `departamento` tinyint NOT NULL,
  `periodo` tinyint NOT NULL,
  `subdireccion` tinyint NOT NULL,
  `rec_materiales` tinyint NOT NULL,
  `solicitante` tinyint NOT NULL,
  `observaciones` tinyint NOT NULL,
  `fecha` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `requisiciones`
--

DROP TABLE IF EXISTS `requisiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisiciones` (
  `folio` varchar(15) NOT NULL,
  `area` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `subdireccion` varchar(100) NOT NULL,
  `rec_materiales` varchar(100) NOT NULL,
  `solicitante` varchar(100) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`folio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisiciones`
--

LOCK TABLES `requisiciones` WRITE;
/*!40000 ALTER TABLE `requisiciones` DISABLE KEYS */;
INSERT INTO `requisiciones` VALUES ('P01281021','SUBDIRECCION ACADEMICA','CIENCIAS BASICAS','SEPTIEMBRE 2021','LIC. JUAN ANTONIO GONZALEZ FUENTES','ING. JOSE PEREZ LEON','ING. ABRAHAM A. VICTORIA FLORES','NINGUNA','2021-09-30'),('P01281022','aca','cb','ago21','Lic adfa','bgadsa','klalksddlka','ningua','2021-10-31');
/*!40000 ALTER TABLE `requisiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `listaproductos`
--

/*!50001 DROP TABLE IF EXISTS `listaproductos`*/;
/*!50001 DROP VIEW IF EXISTS `listaproductos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listaproductos` AS select `facturas`.`folio` AS `folio`,`facturas`.`fecha_pactada` AS `fecha_pactada`,`productos`.`nombre` AS `nombre`,`productos`.`area` AS `area`,`productos`.`precio` AS `precio`,`productos`.`stock` AS `stock`,`facturas`.`total` AS `total`,concat(`proveedores`.`nombre`,' ',`proveedores`.`appat`) AS `nombreproveedor` from ((`facturas` join `productos` on((`facturas`.`folio` = `productos`.`facturas_folio`))) join `proveedores` on(((`facturas`.`proveedores_rfc` = `proveedores`.`rfc`) and (`productos`.`stock` <> 0.0)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `requisicion`
--

/*!50001 DROP TABLE IF EXISTS `requisicion`*/;
/*!50001 DROP VIEW IF EXISTS `requisicion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `requisicion` AS select `productos`.`nombre` AS `nombre`,`req_detalles`.`cant_pedida` AS `cant_pedida`,`req_detalles`.`cant_entregada` AS `cant_entregada`,`req_detalles`.`importe` AS `importe`,`req_detalles`.`folio` AS `folio`,`requisiciones`.`area` AS `area`,`requisiciones`.`departamento` AS `departamento`,`requisiciones`.`periodo` AS `periodo`,`requisiciones`.`subdireccion` AS `subdireccion`,`requisiciones`.`rec_materiales` AS `rec_materiales`,`requisiciones`.`solicitante` AS `solicitante`,`requisiciones`.`observaciones` AS `observaciones`,`requisiciones`.`fecha` AS `fecha` from ((`productos` join `req_detalles` on((`productos`.`idproducto` = `req_detalles`.`idproducto`))) join `requisiciones` on((`req_detalles`.`folio` = `requisiciones`.`folio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-02 10:26:50
