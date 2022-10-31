DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
ON DELETE CASCADE
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id)
ON DELETE CASCADE,
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
ON DELETE CASCADE
);
 CREATE TABLE `paises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `provincias` (
  ` id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idpais` int NOT NULL,
  PRIMARY KEY (` id`),
  FOREIGN KEY (`idpais`) REFERENCES `paises`(`id`)
  ON DELETE CASCADE
) ;
CREATE TABLE `localidades` (
  `id` int NOT NULL,
  `nombre` varchar(45)  NOT NULL,
  `cp` varchar(45)  NOT NULL,
  `id_provincia` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_provincia`) REFERENCES `paises`(`id`)
  ON DELETE CASCADE
) ; 
ALTER TABLE `empleados` 
CHANGE COLUMN `idemplaedo` `idempleado` INT UNSIGNED NOT NULL AUTO_INCREMENT ;
  -- 2-
ALTER TABLE `empleados`
ADD COLUMN `direccion` VARCHAR(45) NULL, 
ADD COLUMN `id_localidad` INT NOT NULL,
ADD COLUMN `email` VARCHAR(45),
ADD COLUMN `telefono` VARCHAR(20) NULL ,
ADD COLUMN `fecha_ingreso` date NOT NULL,
ADD COLUMN `tms` timestamp NULL ,
ADD INDEX `id_localidad` (`id_localidad`) VISIBLE,
ADD FOREIGN KEY (`id_localidad`) REFERENCES `localidades`(`id`)
ON DELETE CASCADE;
-- 3-
ALTER TABLE `departamentos`
 ADD COLUMN `gasto` DOUBLE ,
 ADD COLUMN `tms` TIMESTAMP ;
 -- 4-
 -- paises
INSERT INTO `paises` (`nombre`) VALUES ('ARGENTINA');
INSERT INTO `paises` (`nombre`) VALUES ('PARAGUAY');
INSERT INTO `paises` (`nombre`) VALUES ('URUGUAY');
INSERT INTO `paises` (`nombre`) VALUES ('BRAZIL');
INSERT INTO `paises` (`nombre`) VALUES ('COLOMBIA');
-- provincia
INSERT INTO `provincias` (`nombre`, `idpais`) VALUES ('BUENOS AIRES', '1');
INSERT INTO `provincias` (`nombre`, `idpais`) VALUES ('MENDOZA', '1');
INSERT INTO `provincias` (`nombre`, `idpais`) VALUES ('CORRIENTES', '1');
INSERT INTO `provincias` (`nombre`, `idpais`) VALUES ('ASUNCION', '2');
INSERT INTO `provincias` (`nombre`, `idpais`) VALUES ('FOZ DO IGUACU', '4');
INSERT INTO `provincias` (`nombre`, `idpais`) VALUES ('MONTEVIDEO', '3');
INSERT INTO `provincias` (`nombre`, `idpais`) VALUES ('BARRANQUILLA', '5');
-- localidad
INSERT INTO `localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('1', 'CTES. CAPITAL', '3400', '3');
INSERT INTO `localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('2', 'AVELLANEDA', '1870', '1');
INSERT INTO `localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('3', 'LA DORMIDA', '5592', '2');
INSERT INTO `localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('4', 'POSITOS', '15500', '5');
INSERT INTO `localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('5', 'ASUNCION DEL PARAGUAY', '1001–1925', '4');
-- deptos
INSERT INTO `departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('VENTAS', '100000', '1', '90000');
INSERT INTO `departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('ADMINISTRACION', '50000', '1', '10000');
INSERT INTO `departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('LOGISTICA', '150000', '1', '20000');
INSERT INTO `departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('MANTENIMIENTO', '10000', '0', '1000');
INSERT INTO `departamentos` (`nombre`, `presupuesto`, `estado`, `gasto`) VALUES ('SEGURIDAD', '15000', '0', '1500');
-- empleados
INSERT INTO `empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `email`, `telefono`, `fecha_ingreso`, `id_localidad`) VALUES ('20-33256897-6', 'LUCAS', 'ARECO', '2', '1', 'QUARANTA', 'LUC@GMAIL.COM', '3764-225689', '2022-12-05', '4');
INSERT INTO `empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `telefono`, `fecha_ingreso`, `id_localidad`) VALUES ('23-29654856-3', 'LORENA', 'BRITEZ', '1', '0', 'MONTEVIDEO 14', '4225897', '2020-12-12', '3');
INSERT INTO `empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `email`, `fecha_ingreso`, `id_localidad`) VALUES ('23-36789526-0', 'SOFIA', 'RIMOLO', '3', '1', 'SOFI@GMAIL.COM', '2022-04-09', '5');
INSERT INTO `empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `telefono`, `fecha_ingreso`, `id_localidad`) VALUES ('20-13809526-6', 'OSCAR', 'CORDOBA', '5', '1', 'SOCRATES 125', '011-24565623', '2012-06-08', '1');
INSERT INTO `empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `email`, `telefono`, `fecha_ingreso`, `id_localidad`) VALUES ('24-45203894-1', 'MARTIN', 'PALERMO', '2', '0', 'ARENALES 1224', 'ELLOCO@GMAIL.COM.AR', '011-15789568', '2020-10-24', '3');
-- 5-
RENAME TABLE `pedidos` TO `movimientos`;
-- 6-
CREATE TABLE `proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `razon_social` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `naturaleza(fisica,juridica)` TINYTEXT NULL,
  `cuit` VARCHAR(20) NULL,
  `id_localidad` INT NOT NULL ,
  `estado` TINYINT(1) NULL,
  `tms` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_localidad`) REFERENCES `localidades`(`id`)
  ON DELETE CASCADE
  );
    CREATE TABLE `marcas` (
`id` int NOT NULL AUTO_INCREMENT,
`nombre` varchar(45) NOT NULL,
`descripcion` varchar(45)  NULL,
`id_proveedor` INT NOT NULL ,
`imagen` varchar(45)  NULL,
`estado` tinyint(1)  NULL,
`tms` timestamp  NULL,
PRIMARY KEY (`id`),
FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores`(`id`)
ON DELETE CASCADE
);
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45)  NULL,
  `id_marca` INT NOT NULL ,
  `stock` varchar(45)  NULL,
  `precio` decimal(9,0) NOT NULL,
  `estado` tinyint(1)  NULL,
  `tms` timestamp  NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_marca`) REFERENCES `marcas`(`id`)
  ON DELETE CASCADE
  );
  CREATE TABLE `cajas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `horainicio` DATETIME NULL,
  `horacierre` DATETIME NULL,
  `estado` TINYINT(1) NULL,
  `tms` TIMESTAMP NULL,
  PRIMARY KEY (`id`)
  );
-- proveedores
INSERT INTO `proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza(fisica,juridica)`, `cuit`, `estado`, `tms`, `id_localidad`) VALUES ('it consulting', 'carlos', 'soto', 'fisica', '20-29125456-3', '1', '2021-10-02', '4');  
INSERT INTO `proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza(fisica,juridica)`, `estado`, `tms`, `id_localidad`) VALUES ('salta s.a.', 'miguel', 'mateos', 'fisica', '0', '2020-02-14 15:25:00', '3');
INSERT INTO `proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza(fisica,juridica)`, `cuit`, `estado`, `tms`, `id_localidad`) VALUES ('burbujas', 'estefania', 'escalante', 'juridica', '20-45875622-1', '1', '2017-01-30', '5');
INSERT INTO `proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza(fisica,juridica)`, `cuit`, `estado`, `tms`, `id_localidad`) VALUES ('liberty s.a.', 'lorena', 'copola', 'fisica', '20-33389564-6', '1', '2015-10-12 12:10:05', '1');
INSERT INTO `proveedores` (`razon_social`, `nombre`, `apellido`, `estado`, `tms`, `id_localidad`) VALUES ('megator', 'carlos', 'baglieto', '0', '2010-01-05', '2');
-- marcas
INSERT INTO `marcas` (`nombre`, `descripcion`, `estado`, `tms`,`id_proveedor`) VALUES ('cocacola', 'cc 2250*6', '1', '2022-10-25 15:30:12','4');
INSERT INTO `marcas` (`nombre`, `descripcion`, `estado`, `tms`, `id_proveedor`) VALUES ('fanta', '1500*6', '0', '2022-09-10', '3');
INSERT INTO `marcas` (`nombre`, `descripcion`, `estado`, `tms`, `id_proveedor`) VALUES ('sprite', '2000 rpet', '1', '2022-09-12', '5');
INSERT INTO `marcas` (`nombre`, `descripcion`, `estado`, `tms`, `id_proveedor`) VALUES ('cepita', 'naranja 1500 pet', '1', '2022-10-16', '2');
INSERT INTO `marcas` (`nombre`, `descripcion`, `tms`, `id_proveedor`) VALUES ('aquarius', 'pomelo2250*6 pet', '2020-10-02', '5');
-- productos
INSERT INTO `productos` (`nombre`, `descripcion`, `stock`, `precio`, `estado`, `id_marca`) VALUES ('cocacola', 'c.c 2250*6', '100', '1500', '1', '1');  
INSERT INTO `productos` (`nombre`, `stock`, `precio`, `estado`, `tms`, `id_marca`) VALUES ('cepita', '500', '1500', '1', '2022-10-24 18:30:00', '5');
INSERT INTO `productos` (`nombre`, `descripcion`, `precio`, `estado`, `id_marca`) VALUES ('fanta', '1500*6', '1800', '0', '4');
INSERT INTO `productos` (`nombre`, `descripcion`, `stock`, `precio`, `estado`, `tms`, `id_marca`) VALUES ('fanta', 'pomelo 1500*6', '15', '1900', '1', '2022-10-23', '4');
INSERT INTO `productos` (`nombre`, `descripcion`, `stock`, `precio`, `estado`, `tms`, `id_marca`) VALUES ('cepita', 'naranja ', '1250', '1380', '3', '2022-10-26', '3');
INSERT INTO `productos` (`nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('kin', 'agua sin gas', '1', '10', '900', '1');
-- cajas
INSERT INTO `cajas` (`horainicio`, `horacierre`, `estado`) VALUES ('2019-10-10 07:30:00', '2019-10-10 19:30:00', '1');
INSERT INTO `cajas` (`horainicio`, `horacierre`, `estado`) VALUES ('2022-09-10 07:30:00', '2022-10-10 07:30:00', '1');
INSERT INTO `cajas` (`horainicio`, `horacierre`, `estado`) VALUES ('2022-08-20 07:30:00', '2022-10-23 19:30:0', '0');
INSERT INTO `cajas` (`horainicio`, `horacierre`, `estado`) VALUES ('2022-10-01 07:30:00', '2022-09-10 20:30:00', '1');
INSERT INTO `cajas` (`horainicio`, `estado`) VALUES ('2020-03-02', '0');
-- 8-
SELECT nombre NOMBRE, presupuesto,gasto,(presupuesto-gasto) DIFERENCIA FROM elsistema.departamentos where estado = 1;
-- 9-
select p.nombre,pr.nombre,l.nombre from paises p,provincias pr  join localidades l on idpais=l.id group by id_provincia;
-- 10-
UPDATE empleados SET telefono='3764-225689', telefono='11-02458575' WHERE idempleado='5';
UPDATE empleados SET fecha_ingreso='2020-10-24', fecha_ingreso='1990-12-30' , id_localidad='2',id_localidad='3' WHERE idempleado='9';
-- 11-
INSERT INTO `vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('daniel', 'lange', '20-23568956-2', '10');
INSERT INTO `vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('mauricio', 'pintos', '20-13268956-1', '10');
INSERT INTO `vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('miguel', 'dos santos', '20-23538956-3', '15');
INSERT INTO `vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('esteban', 'rychmond', '20-36568976-0', '5');
INSERT INTO `vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('daniela', 'petrucci', '20-33599956-0', '20');
-- clientes
INSERT INTO `clientes` (`nombre`, `apellido`, `cuitcuil`, `ciudad`, `categoría`) VALUES ('LUCAS', 'BOGARIN', '20-33568956-0', 'PIRAY', '1');
INSERT INTO `clientes` (`nombre`, `apellido`, `cuitcuil`, `ciudad`, `categoría`) VALUES ('MIGUEL', 'ESTEVEZ', '22-35456852-1', 'BANFIELD', '2');
INSERT INTO `clientes` (`nombre`, `apellido`, `cuitcuil`, `ciudad`, `categoría`) VALUES ('NATALIA', 'CORREA', '26-29312246-3', 'LANUS', '1');
INSERT INTO `clientes` (`nombre`, `apellido`, `ciudad`, `categoría`) VALUES ('JONATAN', 'BRAULIO', 'LAS LOMITAS', '3');
-- 12-
ALTER TABLE `movimientos`
ADD COLUMN `id_producto` INT NOT NULL ,
ADD COLUMN `estado` VARCHAR(20) NOT NULL ,
ADD COLUMN `tms` TIMESTAMP NULL,
ADD COLUMN `tipo_movimiento` VARCHAR(20) NULL,
ADD FOREIGN KEY (`id_producto`) REFERENCES `productos`(`id`)
ON DELETE CASCADE;
-- 13-
-- movimientos
INSERT INTO `movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('10', '2022-10.29', '1', '1', '1', '1', 'pedido');
INSERT INTO `movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('100', '2021-09-21', '2', '3', '4', '2', 'ingreso');
INSERT INTO `movimientos` ( `cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('5', '2019-12-24', '1', '2', '2', '2', 'egreso');
INSERT INTO `movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('500', '2022-10-31', '4', '5', '3', '1', 'ingreso');
INSERT INTO `movimientos` (`cantidad`, `fecha`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('1', '2022-01-20', '3', '1', '2', '2', 'pedido');
-- 14-
UPDATE movimientos SET estado='2', estado='1' WHERE movimientos.id='1';
UPDATE movimientos SET estado='2', estado='0' WHERE movimientos.id='4';

DELETE FROM paises WHERE id='5';
-- 15-
UPDATE productos SET stock='100', stock='90' WHERE id='1';
UPDATE productos SET stock='500', stock='495' WHERE id='2';
UPDATE productos SET stock='495', stock='494' WHERE id='2';
UPDATE productos SET stock='null', stock='500' WHERE id='3';
UPDATE productos SET stock='15', stock='115' WHERE id='4';
-- 16-
  CREATE TABLE `parametros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tms` TIMESTAMP NULL,
  `cosas` JSON NOT NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id`)
  );
insert into parametros (id,cosas) values(1,'[{"idDeLaCosa": "101", "permisos": "PUT, GET"}]');

insert into parametros (id,cosas) values(2,'[{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo": "ventas"}]');

insert into parametros (id,cosas,id_usuario) values(3,'[{"zonaHoraria": "America/Argentina/BuenosAires"}]',1);
insert into parametros (id,cosas,id_usuario) values(4,'[{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}]',1);
insert into parametros (id,cosas,id_usuario) values(5,'[{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901,93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
"31634912,57","egreso": "9757142,66"}}}]',1);
