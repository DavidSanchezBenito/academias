-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: cursos2
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academias`
--

DROP TABLE IF EXISTS `academias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `academias` (
  `id_academias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `pagina_web` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_academias`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academias`
--

LOCK TABLES `academias` WRITE;
/*!40000 ALTER TABLE `academias` DISABLE KEYS */;
INSERT INTO `academias` VALUES (1,'Vipper','https://www.vippersistemas.com/','c/sinesio delgado, 28330, madrid','vipper@vipper.es','914641020'),(2,'azpe','http://azpe.es/','c/clase, 5, 28019, madrid','azpe@azpe.es','91239243'),(3,'didactia','https://grupodidactia.com/','c/orion, 13, 28020, madrid','didactica@didactia.es','656660111'),(4,'Porretas','https://www.pepitoPorretas.com/','c/santa cruz tenerife, 1, bajo a, madrid','porretasacademy@usal.es','912345467'),(5,'San Cristobal','https://www.pepitoCristo.com/','c/serrano 41, 28001, madrid','cristo_education@sancristo@usal.es','9393938'),(6,'Source','https://www.pepitoSource.com/','c/atocha, 38, 28010, madrid',NULL,NULL),(7,'Oblivion','https://www.pepitoOblivion.com/','c/pinzon, 38, 5º a, 28047, madrid',NULL,NULL),(8,'Dyfut','https://www.pepitoDyfut.com/','c/Taburete Cojo, 5º , puerta c, 28028, madrid',NULL,NULL),(9,'Select','https://www.pepitoSelect.com/','c/Torres Arias,puerta G, palomar 1, 28044, madrid',NULL,NULL);
/*!40000 ALTER TABLE `academias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academias_alumnos`
--

DROP TABLE IF EXISTS `academias_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `academias_alumnos` (
  `id_academias` int(11) NOT NULL,
  `id_alumnos` int(11) NOT NULL,
  PRIMARY KEY (`id_academias`,`id_alumnos`),
  KEY `fk_alumnos_academias_idx` (`id_alumnos`),
  CONSTRAINT `fk_academias_alumnos` FOREIGN KEY (`id_academias`) REFERENCES `academias` (`id_academias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_alumnos_academias` FOREIGN KEY (`id_alumnos`) REFERENCES `alumnos` (`id_alumnos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academias_alumnos`
--

LOCK TABLES `academias_alumnos` WRITE;
/*!40000 ALTER TABLE `academias_alumnos` DISABLE KEYS */;
INSERT INTO `academias_alumnos` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7);
/*!40000 ALTER TABLE `academias_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academias_cursos`
--

DROP TABLE IF EXISTS `academias_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `academias_cursos` (
  `id_academias` int(11) NOT NULL,
  `id_cursos` varchar(11) NOT NULL,
  PRIMARY KEY (`id_academias`,`id_cursos`),
  KEY `fk_cursos_academia_id_idx` (`id_cursos`),
  CONSTRAINT `fk_academias_cursos_id` FOREIGN KEY (`id_academias`) REFERENCES `academias` (`id_academias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cursos_academia_id` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`id_cursos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academias_cursos`
--

LOCK TABLES `academias_cursos` WRITE;
/*!40000 ALTER TABLE `academias_cursos` DISABLE KEYS */;
INSERT INTO `academias_cursos` VALUES (1,'23'),(1,'IFCD0112'),(2,'IFCD0112'),(1,'ifcdjava+');
/*!40000 ALTER TABLE `academias_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academias_profesores`
--

DROP TABLE IF EXISTS `academias_profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `academias_profesores` (
  `id_academias` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL,
  PRIMARY KEY (`id_academias`,`id_profesor`),
  KEY `fk_profesores_academias_idx` (`id_profesor`),
  CONSTRAINT `fk_academias_profesores` FOREIGN KEY (`id_academias`) REFERENCES `academias` (`id_academias`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_profesores_academias` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academias_profesores`
--

LOCK TABLES `academias_profesores` WRITE;
/*!40000 ALTER TABLE `academias_profesores` DISABLE KEYS */;
INSERT INTO `academias_profesores` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `academias_profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumnos` (
  `id_alumnos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `id_curso_estudiando` varchar(11) DEFAULT NULL,
  `id_curso_estudiado` varchar(45) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_alumnos`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='tabla para registrar los alumnos. Solo se permite realizar un curso';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'david ','sanchez BENITO',NULL,NULL,'d@d.es',NULL,'hijo del jefe'),(2,'beatriz ','rico sancristobal',NULL,NULL,'f@f.es',NULL,NULL),(3,'Macario','salido del pozo',NULL,NULL,'m@m.es',NULL,NULL),(4,'Susana','Cazabelas Rodriguez',NULL,NULL,'susi@mixmail.es',NULL,NULL),(5,'Marco Antonio','Luca de Tena',NULL,NULL,'marko_polo@mixmail.es',NULL,NULL),(6,'Claudia','Schiffler',NULL,NULL,'klaudia_top@model.es',NULL,NULL),(7,'Bruce','Willis',NULL,NULL,'brucewillis@gmail.com',NULL,NULL),(8,'TOM','Crucero',NULL,NULL,'tonycruising@chueca.es',NULL,NULL),(15,'david ','casar',NULL,NULL,'p@p.es','9393939398',NULL),(16,'David Luca de Tena','Sanchez Benito',NULL,NULL,'a@a.es','123',NULL),(28,'Antonio','Garcia Moreno',NULL,NULL,'tomasboys@hotmail.es','8484848487',NULL),(33,'p17  ','p17 p17 ','null ','null ','ramon@telefine.es','12929292 ','pediente de llamar a academia para decidir si se apunta.'),(35,'35modf','modifc','ifcd3000','ifcd2000','35@35.es','32093939','prueba mod');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos_profesores`
--

DROP TABLE IF EXISTS `alumnos_profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumnos_profesores` (
  `id_alumnos` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL,
  PRIMARY KEY (`id_alumnos`,`id_profesor`),
  KEY `fk_profesores_alumnos_idx` (`id_profesor`),
  CONSTRAINT `fk_alumnos_profesores` FOREIGN KEY (`id_alumnos`) REFERENCES `alumnos` (`id_alumnos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profesores_alumnos` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos_profesores`
--

LOCK TABLES `alumnos_profesores` WRITE;
/*!40000 ALTER TABLE `alumnos_profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos_profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cursos` (
  `id_cursos` varchar(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `practicas` varchar(2) NOT NULL DEFAULT 'SI',
  `precio` double DEFAULT NULL,
  `duracion_horas` int(3) DEFAULT '100',
  PRIMARY KEY (`id_cursos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='COLUMNA PRACTICAS: indica si el curso admite practicas. Valor por defecto SI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES ('10','Chino para chinados','si',1300.5,720),('11','Combate al coronavirus con el Wasapp','SI',1500,100),('12','Curso de NINI intensivo','SI',500,100),('13','Masterchef usando precongelados','no',600,100),('14','Masterchef en tortilla francesa y pizza de microhondas.','no',700,230),('23','Java esencial  para iniciarse a programacion','no',210,120),('5','El aburrimiento y sus ventajas','SI',1500,100),('6','Profesor de Kung Fu a domicilio','SI',550,100),('7','Aprende Java como un experto en 2 horas','SI',550,100),('8','Domador de pulgas','SI',850,100),('ifcd0111','programacion en lenguajes estructurados y BBDD','si',0,700),('IFCD0112','PROGRAMACIÓN CON LENGUAJES ORIENTADOS A OBJETOS Y BASES DE DATOS RELACIONALES ','si',0,710),('IFCD2000','creacion pag web','no',6000,350),('ifcd2021','creacion de paginas web','no',210,35),('ifcd31','Master en CyberBullying avanzado','SI',850,300),('ifcdjava+','convierte en desarrollador java profesional ','si',230,500);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profesores` (
  `id_profesor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `titulacion` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `diligencia` varchar(45) DEFAULT NULL,
  `id_curso` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  KEY `fk_profesores_cursos_id_idx` (`id_curso`),
  CONSTRAINT `fk_profesores_cursos_id` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_cursos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='creo q sobra el id_curso pues hay tabla intermedia: profesores_alumnos_cursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Don Ramon','Perez Gomez','Licenciado en informatica','eldelbaston89@hotmail.com','6512345643','ifcd0111',NULL),(2,'Don Jose','Ramos Sobrino','Grado en pedagogía','donpepe53@mixmail.es','921384848','ifcd0111',NULL),(3,'Carol','Berkely','Graduado escolar','karol_jevy@gmail.es','912934929','IFCD0112',NULL),(4,'Pedro ','Sanchez','ESO','pedrito_coletas@podemos.es','630123456','IFCD0112',NULL),(7,'rodolfo','langostino cocido','Grado en Latin','rodolfo@a.es','39393984874','ifcd0001',NULL);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores_alumnos_cursos`
--

DROP TABLE IF EXISTS `profesores_alumnos_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profesores_alumnos_cursos` (
  `id_profesor` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_curso` varchar(11) NOT NULL,
  `fecha_inicio_curso` date DEFAULT NULL,
  `fecha_fin_curso` date DEFAULT NULL,
  PRIMARY KEY (`id_profesor`,`id_curso`,`id_alumno`),
  KEY `fk_alumno_profesor_id_idx` (`id_alumno`),
  KEY `fk_cursos_academias_id_idx` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores_alumnos_cursos`
--

LOCK TABLES `profesores_alumnos_cursos` WRITE;
/*!40000 ALTER TABLE `profesores_alumnos_cursos` DISABLE KEYS */;
INSERT INTO `profesores_alumnos_cursos` VALUES (1,1,'IFCD0111','2021-03-01','2021-10-15'),(2,2,'IFCD0111','2021-04-01','2121-11-15'),(3,3,'IFCD0112','2021-02-01','2021-07-15'),(4,4,'IFCD0112','2121-02-15','2121-07-30');
/*!40000 ALTER TABLE `profesores_alumnos_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cursos2'
--

--
-- Dumping routines for database 'cursos2'
--
/*!50003 DROP PROCEDURE IF EXISTS `borrarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarAlumno`(pid_id int)
BEGIN
/*este PA elimina alumnos segun el id q introducimos*/
delete from alumnos where id_alumnos = pid_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrarCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarCurso`(pid_id_curso varchar(11))
BEGIN
delete from cursos where id_cursos = pid_id_curso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrar_profe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_profe`(pid_id int)
BEGIN
/*este PA elimina alumnos segun el id q introducimos*/
delete from profesores where id_profesor = pid_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarAlumnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarAlumnos`(
pid_nombre varchar(100), 
pid_apellidos varchar(100), 
pid_curso_estudiando varchar(11),
pid_curso_estudiado varchar(45),
pid_email varchar(30), 
pid_telefono varchar(10),
pid_observaciones text
 )
BEGIN
insert into alumnos (nombre, apellidos,id_curso_estudiando,
id_curso_estudiado, email, telefono,observaciones) 
values (pid_nombre, pid_apellidos, pid_curso_estudiando,
pid_curso_estudiado,
pid_email, pid_telefono,
pid_observaciones);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCurso`(
pid_id_curso varchar(11),
pid_nombre varchar(100), 
pid_practicas varchar(12), 
pid_precio double, 
pid_duracion_horas int(3))
BEGIN
insert into cursos (id_cursos,nombre, practicas, precio, duracion_horas) 
values (pid_id_curso, pid_nombre, pid_practicas, pid_precio, pid_duracion_horas);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_profe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_profe`(pid_nombre varchar(45), pid_apellidos varchar(100), pid_titulacion varchar(45), pid_email varchar(100), pid_telefono varchar(45), pid_diligencia varchar(45) )
BEGIN
insert into profesores (nombre, apellidos,titulacion, email, telefono, diligencia) values (pid_nombre, pid_apellidos,pid_titulacion, pid_email, pid_telefono, pid_diligencia);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarAlumno`(
pid_id int, 
pid_nombre varchar(100), 
pid_apellidos varchar(100),
pid_curso_estudiando varchar(11),
pid_curso_estudiado varchar (45),
pid_email varchar(30),
pid_telefono varchar(10),
pid_observaciones text
)
BEGIN

update alumnos
set 
nombre = pid_nombre, 
apellidos = pid_apellidos,
id_curso_estudiando = pid_curso_estudiando,
id_curso_estudiado = pid_curso_estudiado,
email = pid_email, 
telefono = pid_telefono,
observaciones = pid_observaciones
where id_alumnos = pid_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificarCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarCurso`(

pid_id_cursos_actual varchar(11),
pid_id_cursos_nuevo varchar(11),
 pid_nombre varchar(100), 
pid_practicas varchar(2), pid_precio double, pid_duracion int)
BEGIN
/*si quiero modificar el nombre del curso este PA no me valdría */

update cursos
set id_cursos = pid_id_cursos_nuevo, nombre = pid_nombre, practicas = pid_practicas, precio = pid_precio,
duracion_horas = pid_duracion
where id_cursos = pid_id_cursos_actual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_profe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_profe`(pid_id_prof int, pid_nombre varchar(45),
pid_apellidos varchar(100), pid_titulacion varchar(45), pid_email varchar(100),
pid_telefono varchar(45), pid_diligencia varchar(45)
)
BEGIN
update profesores
set nombre = pid_nombre , apellidos = pid_apellidos,
titulacion = pid_titulacion, email =pid_email , telefono =pid_telefono,
diligencia = pid_diligencia  

where id_profesor = pid_id_prof;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerAcademias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerAcademias`()
BEGIN  
/*
"(pid_academia int)"
el procedimiento almacenado, recibe el id academia q introduce el user
obtenemos los cursos de esa academia
*/
select a.id_academias, a.nombre, pagina_web, direccion
from academias a;
/*inner join cursos c
on a.id_academias = c.id_academia
where id_academias = pid_academia;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obteneralumnos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obteneralumnos`()
BEGIN
/*(pid_curso int)
hago un select con todos los campos
*/

select id_alumnos, nombre, apellidos, id_curso_estudiando,
id_curso_estudiado, email, telefono, observaciones
from alumnos;
/*where id_alumnos = pid_curso;*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenercursos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenercursos`()
BEGIN  
/*recibe el id del curso que el usuario ha seleccionado en el index 
(pid_curso varchar(11))
*/
select c.id_cursos, c.nombre, c.practicas, c.precio, c.duracion_horas
from cursos c;

/*where id_cursos = pid_curso; */

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerprofesores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerprofesores`()
BEGIN
select id_profesor, nombre, apellidos, titulacion, email, telefono, diligencia
 from profesores;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-18  0:26:49
