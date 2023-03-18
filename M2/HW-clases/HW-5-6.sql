/*
Crear un modelo relacional basado en el modelo de negocios de Henry:

1. Identificar las relaciones.
2. Identifcar primery key´s y foreing key´s.
3. Definir los tipos de datos.

La entidades a modelar junto sus atributos son: 
* Carrea: ID, Nombre.
* Cohorte: ID, Código, Carrera, Fecha de Inicio, Fecha de Finalización, Instructor.
* Instructores: ID, Cédula de identidad, Nombre, Apellido, Fecha de Nacimiento, Fecha de Incorporación.
* Alumnos: ID, Cédula de identidad, Nombre, Apellido, Fecha de Nacimiento, Fecha de Ingreso, Cohorte.
*/

DROP DATABASE IF EXISTS henry; /*Si existe la base de datos "henry" borrala*/
CREATE DATABASE henry;

USE henry;

CREATE TABLE carrera (
	idCarrera INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (50) NOT NULL,
    PRIMARY KEY (idCarrera)
    );

CREATE TABLE instructor (
	idInstructor INT NOT NULL AUTO_INCREMENT,
	cedulaIdentidad VARCHAR(30) NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	apellido VARCHAR(40) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	fechaIncorporacion DATE,
	PRIMARY KEY (idInstructor)
);

CREATE TABLE cohorte(
	idCohorte INT NOT NULL AUTO_INCREMENT,
	codigo VARCHAR (30) NOT NULL,
	idCarrera INT NOT NULL,
	idInstructor INT NOT NULL,
	fechaInicio DATE,
	fechaFinalizacion DATE,
	PRIMARY KEY (idCohorte),
	FOREIGN KEY (idCarrera) REFERENCES carrera(idCarrera),
	FOREIGN KEY (idInstructor) REFERENCES instructor(idInstructor)
);

CREATE TABLE alumno (
	idAlumno INT NOT NULL AUTO_INCREMENT,
    cedulaIdentidad VARCHAR (30) NOT NULL,
    nombre VARCHAR (40) NOT NULL,
    apellido VARCHAR (40) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	fechaIngreso DATE,
    idCohorte INT,
    PRIMARY KEY (idAlumno),
    FOREIGN KEY (idCohorte) REFERENCES cohorte(idCohorte)
);

INSERT INTO carrera (nombre)
VALUES ('Full Stack Developer'),
('Data Science');

SELECT * FROM carrera;

INSERT instructor (cedulaIdentidad, nombre, apellido, fechaNacimiento, fechaIncorporacion) 
VALUES (25456879,'Antonio','Barrios','1981-7-9','2019-11-8');

INSERT instructor (cedulaIdentidad, nombre, apellido, fechaNacimiento, fechaIncorporacion) 
VALUES (28456321,'Lucia','Fernandez','1992-5-25','2019-11-8'),
(27198354,'Leo','Paris','1985-6-20','2021-8-15'),
(36987520,'Agustín','Casagne','1988-8-17','2021-8-15'),
(33456215,'Franco','Caseros','1995-5-1','2021-8-15'),
(30521369,'Dario','Ramirez','1989-7-20','2021-12-1'),
(28856789,'Agustina','Medina','1991-3-8','2021-12-1'),
(33128987,'Jorge','Perez','1988-2-19','2021-12-1');

#Se insertan valores en la tabla cohortes.
INSERT INTO cohorte 
VALUES (1235,'FT-1235',1,1,'2020-2-1','2020-6-30'),
(1236,'FT-1236',1,2,'2020-4-5','2020-8-31'),
(1237,'FT-1237',1,1,'2021-7-5','2021-11-30'),
(1238,'FT-1238',1,2,'2021-9-6','2022-1-31'),
(1239,'FT-1239',1,3,'2022-1-10',null),
(1240,'FT-1240',1,4,'2022-2-7',null),
(1241,'FT-1241',1,5,'2022-3-7',null),
(1242,'DS-1242',2,6,'2022-3-28',null),
(1243,'FT-1243',1,1,'2022-4-4',null),
(1244,'DS-1244',2,8,'2022-5-2',null),
(1245,'FT-1245',1,2,'2022-5-2',null),
(1246,'DS-1246',2,7,'2022-7-4',null);

INSERT INTO cohorte (codigo, idCarrera, idInstructor, fechaInicio, fechaFinalizacion)
VALUES ('FT-1235',1,1,'2020-2-1','2020-6-30');

select * from cohorte;

#Se insertan valores en la tabla alumnos.

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (1,'274352477','Candice','Rojas','2000-12-10','2020-01-21',1235);
  
INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (2,'313262855','Beverly','Gardner','2006-10-03','2019-12-04',1235),
  (3,'335199030','Carlos','Frank','2006-07-11','2019-12-13',1235),
  (4,'171722128','Callum','Velazquez','2005-11-18','2019-12-17',1235),
  (5,'14374907K','Kelly','Strickland','2005-11-26','2019-12-07',1235),
  (6,'49205318K','Drake','Pearson','2009-08-08','2019-12-30',1235),
  (7,'398182472','Aimee','Cline','2009-11-19','2020-01-26',1235),
  (8,'401797157','Julian','Copeland','2001-01-09','2019-12-05',1235),
  (9,'4257391','Cecilia','Roth','2004-12-01','2019-12-17',1235);
  
INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (10,'19507661','Hillary','Holman','2001-04-07','2019-12-14',1235),
  (11,'106717451','Odysseus','Solomon','2009-07-01','2019-12-14',1235),
  (12,'289307281','Jemima','Carlson','2009-08-26','2019-12-09',1235),
  (13,'38156527','Boris','Lamb','2006-04-24','2020-01-13',1235),
  (14,'47873452','Sierra','Cook','2005-05-16','2020-01-25',1235),
  (15,'112197338','Michael','Norton','2007-07-01','2020-01-11',1235),
  (16,'84091987','Whilemina','Howard','2000-12-03','2020-01-07',1235),
  (17,'1114943K','Keegan','Mejia','2001-01-29','2019-12-29',1235),
  (18,'32392091','Dawn','Duke','2006-07-13','2020-01-30',1235),
  (19,'435719201','Lillith','Conley','2004-05-02','2019-12-11',1235),
  (20,'15903996','Marsden','Sparks','2004-04-16','2019-12-25',1235);
  
SELECT * FROM alumno;

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (21,'193744389','Belle','Cervantes','2001-02-03','2020-03-17',1236),
  (22,'43397060','Allegra','Dillon','2008-12-31','2020-02-12',1236),
  (23,'441149581','Reed','Goodwin','2002-02-21','2020-03-28',1236),
  (24,'88968476','Orla','Rocha','2007-07-25','2020-03-04',1236),
  (25,'211443618','Montana','Hunter','2003-08-26','2020-03-27',1236),
  (26,'86882779','Erich','Mcfarland','2000-07-04','2020-03-11',1236),
  (27,'407059433','Montana','Sykes','2006-12-15','2020-03-07',1236),
  (28,'223237649','Joshua','Mccoy','2006-11-19','2020-03-21',1236),
  (29,'292284624','Nicholas','Gibbs','2007-11-28','2020-02-04',1236),
  (30,'295743360','Felix','Avery','2005-03-16','2020-02-23',1236),
  (31,'444744855','Isabella','Edwards','2007-05-30','2020-03-17',1236),
  (32,'64776894','Zephr','Wright','1988-09-15','2020-03-22',1236),
  (33,'372278471','Caldwell','Mckenzie','1984-04-26','2020-03-18',1236),
  (34, '3026648K','Fiona','Gamble','1981-08-17','2020-03-05',1236),
  (35,'381918319','Margaret','Bentley','1981-07-25','2020-02-17',1236),
  (36,'29537372','Xena','Merrill','1985-12-05','2020-02-27',1236),
  (37,'343468598','Simone','Osborn','1988-08-27','2020-03-22',1236),
  (38,'465367539','Sonya','Conley','2009-03-06','2020-03-04',1236),
  (39,'171373085','Gannon','Villarreal','2001-12-25','2020-03-02',1236),
  (40,'3122182K','Elvis','Macdonald','2008-12-19','2020-04-12',1236);

#No es necesario buscar errores en las sentencias que siguen.

SELECT * FROM alumno;

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (41,'492795224','Amir','Marks','1988-09-12','2021-01-04',1237),
  (42,'309139739','Virginia','Ingram','1988-01-20','2021-04-20',1237),
  (43,'162409522','Jelani','Schroeder','1995-03-11','2021-02-14',1237),
  (44,'194626479','Baker','Watson','2005-09-14','2021-03-30',1237),
  (45,'277992078','Gray','Willis','1993-02-08','2021-03-26',1237),
  (46,'345652302','Ivy','Gallagher','1993-03-11','2021-04-24',1237),
  (47,'154259589','Julian','Dillon','2003-09-20','2021-03-26',1237),
  (48,'26836594K','Whilemina','Carr','1997-10-31','2021-03-29',1237),
  (49,'396033852','Sydney','Hicks','2005-10-14','2021-04-01',1237),
  (50,'151675093','Graiden','Aguilar','1994-02-28','2021-02-17',1237),
  (51,'145331579','Mechelle','Cook','2005-01-01','2021-03-09',1237),
  (52,'349894343','Marvin','Chaney','1991-03-07','2021-01-01',1237),
  (53,'472701266','Vladimir','Leonard','2005-03-28','2021-01-17',1237),
  (54,'29213755','Alexander','Rush','1997-09-02','2021-01-12',1237),
  (55,'381629589','Kylynn','Kim','1985-07-16','2021-04-13',1237),
  (56,'48566189','Keaton','Morton','2001-02-12','2021-01-18',1237),
  (57,'402475935','Ian','Stephenson','1981-06-19','2021-03-30',1237),
  (58,'474328023','Cooper','Duncan','1980-09-18','2021-01-07',1237),
  (59,'26753295','Castor','Shepherd','1996-04-07','2021-02-13',1237),
  (60,'139799658','Miriam','Blake','2005-05-07','2021-03-09',1237);

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (61,'16549215','Lewis','Burris','1992-04-23','2021-07-16',1238),
  (62,'135566489','Olivia','Booker','2001-07-01','2021-07-14',1238),
  (63,'79692581','Regan','Boyd','2003-08-08','2021-08-17',1238),
  (64,'49178719','Ross','Nunez','1986-07-16','2021-07-12',1238),
  (65,'474204693','Abbot','Mayer','1988-11-05','2021-07-17',1238),
  (66,'454819918','Conan','Hale','2002-08-12','2021-07-23',1238),
  (67,'504438988','Leila','Spence','1999-04-25','2021-07-03',1238),
  (68,'33294617K','Edward','Weiss','2002-11-04','2021-07-29',1238),
  (69,'118439724','Ashton','Buckner','2000-03-14','2021-07-08',1238),
  (70,'148755809','Chadwick','Mckee','2002-01-09','2021-08-29',1238),
  (71,'388551046','Fitzgerald','Frederick','2009-12-29','2021-08-02',1238),
  (72,'347702986','Keiko','Osborne','1995-02-28','2021-07-17',1238),
  (73,'255906518','Emily','Crawford','2001-02-13','2021-07-27',1238),
  (74,'65744120','Merritt','Potts','2005-02-28','2021-07-07',1238),
  (75,'502528238','Chaney','Nixon','2004-12-13','2021-08-16',1238),
  (76,'157009508','Wesley','Howe','2009-08-31','2021-08-18',1238),
  (77,'17617322K','Anastasia','Carpenter','1993-09-10','2021-08-21',1238),
  (78,'507966950','Hamilton','Owen','1992-06-25','2021-08-09',1238),
  (79,'181028726','Audrey','Perkins','2001-01-10','2021-08-28',1238),
  (80,'164311007','Sawyer','Holmes','2005-11-23','2021-07-08',1238);

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (81,'243901227','Jillian','Santos','2000-01-16','2021-10-03',1239),
  (82,'306333267','Jerry','Mccullough','2008-07-29','2021-11-06',1239),
  (83,'179442116','Nerea','Douglas','2005-11-18','2021-11-23',1239),
  (84,'408178630','Abbot','Moss','2009-12-15','2021-10-24',1239),
  (85,'1991996K','Hedley','Weeks','2002-09-01','2021-11-07',1239),
  (86,'5585288K','Dillon','Rocha','2007-09-02','2021-12-24',1239),
  (87,'268473718','Malachi','Figueroa','2009-07-18','2021-10-15',1239),
  (88,'388007508','Lydia','Valencia','2002-03-27','2021-11-17',1239),
  (89,'203621523','Warren','Pearson','2001-05-25','2021-10-13',1239),
  (90,'234417932','Nicole','Norris','2001-03-26','2021-10-05',1239),
  (91,'351315148','Tiger','Jackson','2006-03-07','2021-11-22',1239),
  (92,'367828072','Fay','Ayala','2007-09-20','2021-12-15',1239),
  (93,'285762502','Dominique','Carr','2005-03-07','2021-09-13',1239),
  (94,'267225184','Justine','Jimenez','2002-01-27','2021-10-17',1239),
  (95,'433045602','Gary','Burt','2008-02-23','2021-09-10',1239),
  (96,'10779642','Evangeline','Hamilton','2001-02-01','2021-11-13',1239),
  (97,'455153174','Jeremy','Clark','2004-08-01','2021-10-28',1239),
  (98,'357121108','Venus','Campbell','2008-03-13','2021-11-29',1239),
  (99,'75106459','Denise','O''brien','2003-07-28','2021-11-25',1239),
  (100,'109594741','Macaulay','Miller','2005-07-05','2021-11-17',1239);

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (101,'465763558','Gloria','Mcclure','1991-07-02','2022-01-29',1240),
  (102,'209243474','Palmer','Dennis','2002-07-18','2022-01-13',1240),
  (103,'38202200','Kasper','Ford','1984-08-28','2021-12-23',1240),
  (104,'265227600','Byron','Bruce','1982-05-25','2021-12-19',1240),
  (105,'185855619','Medge','Stark','1997-06-22','2021-12-13',1240),
  (106,'78311231','Xandra','Burch','2004-07-05','2022-01-11',1240),
  (107,'229594575','Cyrus','Morin','2008-05-13','2021-12-21',1240),
  (108,'141555774','Clinton','Sanders','2003-03-09','2022-01-29',1240),
  (109,'38872397','Ralph','Mayo','1985-11-21','2021-12-02',1240),
  (110,'24538','Lee','Vargas','2001-12-07','2022-01-20',1240),
  (111,'4454864K','Kim','Gardner','1990-08-20','2021-12-13',1240),
  (112,'131829809','Carolyn','Sellers','2008-11-05','2021-12-09',1240),
  (113,'344232601','Kylie','Walters','1990-11-04','2022-01-19',1240),
  (114,'46185611K','Molly','Bridges','1982-08-14','2022-01-07',1240),
  (115,'183508024','Hilary','Boyer','2005-02-12','2022-01-11',1240),
  (116,'332016830','Brianna','Dawson','2007-09-30','2022-01-07',1240),
  (117,'218656412','Cole','Vasquez','2006-05-27','2022-01-24',1240),
  (118,'438773339','Cairo','Walton','2003-09-21','2022-01-06',1240),
  (119,'486036354','Madeson','Reeves','2002-11-09','2022-01-30',1240),
  (120,'137896125','Virginia','Conrad','2006-12-26','2021-12-08',1240);

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (121,'26157392K','Deanna','Wolf','1984-06-06','2022-01-25',1241),
  (122,'57652322','Edan','Ferguson','2002-05-29','2022-02-19',1241),
  (123,'3383903','Levi','Fisher','2002-05-09','2021-12-24',1241),
  (124,'383749255','Jason','Harmon','1990-08-17','2022-02-27',1241),
  (125,'366243968','Kirk','Randall','1988-05-28','2022-02-10',1241),
  (126,'283007197','Evelyn','Reilly','1997-05-08','2021-12-18',1241),
  (127,'152234708','Quinlan','Gordon','202-01-02','2022-01-19',1241),
  (128,'36248505','Drew','Elliott','2009-03-15','2022-02-07',1241),
  (129,'16622524','Joan','Nixon','2005-06-08','2022-01-18',1241),
  (130,'438939423','Francis','Garner','2005-10-27','2022-02-01',1241),
  (131,'41609182K','Griffith','Beck','2008-01-18','2022-01-28',1241),
  (132,'148585490','Kasimir','Peterson','2006-09-18','2021-12-31',1241),
  (133,'398662601','Zoe','Singleton','2008-07-30','2022-01-09',1241),
  (134,'286993443','Acton','Clements','1982-11-22','2022-01-24',1241),
  (135,'137499908','Brenna','Farley','1987-10-14','2022-02-09',1241),
  (136,'45903699','Shelby','Kinney','1998-04-16','2022-01-04',1241),
  (137,'3470290K','Juliet','Snider','2004-10-04','2022-01-28',1241),
  (138,'363891608','Jana','Reilly','2001-08-24','2022-02-10',1241),
  (139,'46150244','Darius','Schmidt','2009-12-19','2022-01-16',1241),
  (140,'24139204','Trevor','Giles','2001-06-21','2021-12-24',1241);

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (141,'468707764','Hedda','Wells','1980-11-30','2022-01-18',1242),
  (142,'357253268','Odessa','Black','1985-04-22','2022-02-02',1242),
  (143,'171379849','Anjolie','Massey','2007-10-24','2022-01-18',1242),
  (144,'461744192','Valentine','Guzman','2006-02-09','2022-01-31',1242),
  (145,'345313052','Constance','Haley','2001-07-03','2022-02-01',1242),
  (146,'10235723','Grace','Crane','2007-11-27','2022-02-22',1242),
  (147,'112593543','Rhoda','Golden','2001-04-27','2022-02-23',1242),
  (148,'369224867','McKenzie','Silva','2008-12-28','2022-02-24',1242),
  (149,'37561135K','Thane','Carey','2005-08-23','2022-01-21',1242),
  (150,'2670216K','Upton','Collins','2009-10-24','2022-02-11',1242),
  (151,'285901006','Ainsley','Delgado','2001-11-08','2022-01-28',1242),
  (152,'106883831','Beau','Hubbard','1995-04-20','2022-01-31',1242),
  (153,'247172483','Zelda','Curtis','2009-10-10','2022-02-21',1242),
  (154,'213189034','Bethany','Hoover','1998-12-24','2022-01-02',1242),
  (155,'368514128','Duncan','Vasquez','1992-09-18','2022-02-25',1242),
  (156,'308557529','Conan','Macias','1986-09-15','2022-02-05',1242),
  (157,'37157163','Hannah','Solis','2005-05-02','2022-02-04',1242),
  (158,'319157859','Azalia','Weiss','2000-09-20','2022-02-25',1242),
  (159,'34304696','Paki','Mccarthy','2000-03-17','2022-01-15',1242),
  (160,'497603528','Rylee','Howard','2005-12-03','2022-01-21',1242);

INSERT INTO alumno (idAlumno,cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte)
VALUES (161,'41944781','Stephanie','Hurst','1986-11-23','2022-02-14',1243),
  (162,'31806976','Nathaniel','Duran','2005-12-02','2022-01-03',1243),
  (163,'9364994K','Shelley','Yang','1984-01-14','2022-01-18',1243),
  (164,'263549317','Donovan','Snow','2008-07-23','2022-02-09',1243),
  (165,'377028562','Regina','Joyce','2002-07-05','2022-02-08',1243),
  (166,'7332238','Hedley','Cameron','2002-06-05','2022-01-12',1243),
  (167,'448157210','Kiayada','Oneil','2009-03-26','2022-02-25',1243),
  (168,'123492919','Aristotle','Adams','2000-09-29','2022-01-18',1243),
  (169,'182865443','Harlan','Barnett','1997-10-19','2022-02-09',1243),
  (170,'389678961','Maya','Dotson','2003-11-28','2022-01-14',1243),
  (171,'152989121','Sean','Hancock','1997-09-21','2022-02-22',1243),
  (172,'507078060','Arthur','Leon','2006-12-01','2022-02-15',1243),
  (173,'72477197','Hakeem','Williams','1988-03-13','2022-01-21',1243),
  (174,'41643293','Nigel','Vincent','2001-10-06','2022-01-31',1243),
  (175,'454734130','Adele','Alston','2005-10-05','2022-01-16',1243),
  (176,'335187784','Mara','Rodgers','2004-03-29','2022-02-13',1243),
  (177,'122874648','Galvin','Jones','2005-11-08','2022-01-06',1243),
  (178,'386395705','Tashya','Clarke','1992-07-02','2022-01-31',1243),
  (179,'402918667','Imani','Mack','2000-07-28','2022-01-29',1243),
  (180,'277347865','William','Long','2009-12-06','2022-02-09',1243);

select * from cohorte;

/* Traer la información de las columnas de tal tabla */
SELECT column_name, data_type, character_maximum_length, is_nullable 
FROM information_schema.columns
WHERE table_name = 'cohorte';


/*Traer la informacion de las tablas*/
SELECT table_name
FROM information_schema.TABLES
WHERE table_schema = 'henry' AND table_type = 'BASE TABLE';

/*Usando el WHERE creamos condiciones. En este caso traemos el id, nombre y apellido de alumnos de la cohorte 1235*/
SELECT idAlumno, nombre, apellido
FROM alumno
WHERE idCohorte = 1235;

/*Ejemplo de suma, promedio, max, min, count pero en este caso no sirve de nada por la tabla cohorte*/
select sum(idCohorte) as Suma from cohorte;
select count(idCohorte) as Suma from cohorte;
select max(idCohorte) as Suma from cohorte;
select min(idCohorte) as Suma from cohorte;
select avg(idCohorte) as Suma from cohorte;

/*Uso de groupby agrupando por cohorte y con la cantidad de alumnos por cohorte*/
select * from alumno;
select count(*) as cantidad, idCohorte
from alumno
group by idCohorte;

/*Having: se utiliza con groupby para filtrar, es parecida al where*/
select count(*) as cantidad, idCohorte
from alumno
group by idCohorte
having idCohorte > 1240; /*Filtro por idCohorte que sea mayor a 1240*/

/*Con el rollup generamos una fila mas que nos brindara en este ejemplo el resultado total*/
select count(*) as cantidad, idCohorte
from alumno
group by idCohorte with rollup; 

/*Investigar with cube --> https://www.youtube.com/watch?v=LNQ10F4M7Yw&list=PLIygiKpYTC_6_CGfKc2RlyHO9J442HI_z&index=44 */

use henry;

/*Con el rollup generamos una fila mas que nos brindara en este ejemplo el resultado total*/
select count(*) as cantidad, grouping(idCohorte) as id
from alumno
group by idCohorte with rollup; 

/*Con el distinct traemos los valores únicos*/
select distinct idCohorte 
from alumno;

/*Traer solo los primeros 5 resultados*/
select * from alumno limit 5;

/*Agregar restricciones
alter table NOMBRE DE LA TABLA
add constraint NOMBRE CONSTRAINT
*/

alter table alumno add check (idCohorte < 3000); #La cohorte siempre menor a 3000

/*HOMEWORK 6*/
/*No se sabe con certeza el lanzamiento de las cohortes N° 1245 y N° 1246, se solicita que las elimine de la tabla.*/
select * from cohorte where idCohorte in (1245, 1246);
delete from cohorte where idCohorte in (1245, 1246);

/*Se ha decidido retrasar el comienzo de la cohorte N°1243, por lo que la nueva fecha de inicio será el 16/05. 
Se le solicita modificar la fecha de inicio de esos alumnos.*/
select * from cohorte where idCohorte = 1243;
update cohorte set fechaInicio = '2020-05-16' where idCohorte = 1243;

/*El alumno N° 165 solicito el cambio de su Apellido por “Ramirez”*/
update alumno set apellido = "Ramirez" where idAlumno = 165;

/*El área de Learning le solicita un listado de alumnos de la Cohorte N°1243 que incluya la fecha de ingreso.*/
select  *
from alumno
where idCohorte = 1243;

/*Como parte de un programa de actualización, el área de People le solicita un listado de los instructores que dictan la carrera de Full Stack Developer.*/
select distinct instructor.idInstructor, instructor.cedulaIdentidad, instructor.nombre, instructor.apellido, instructor.fechaNacimiento, instructor.fechaIncorporacion
from cohorte
join instructor
on instructor.idInstructor = cohorte.idInstructor
where cohorte.idCarrera = 1;

/*Se desea saber que alumnos formaron parte de la cohorte N° 1235. Elabore un listado.*/
select *
from alumno
where idCohorte = 1235;

/*Del listado anterior se desea saber quienes ingresaron en el año 2019.*/
select * 
from alumno
where idCohorte = 1235 and year(fechaIngreso) = 2019;

/*¿Cuantas carreas tiene Henry?*/
use henry;
select count(*) as cantidad from carrera;

/*¿Cuantos alumnos hay en total?*/
select count(*) as cantidadAlumnos from alumno;

/*¿Cuantos alumnos tiene cada cohorte?*/
select count(*) as cantidad, IdCohorte
from alumno 
group by IdCohorte;

/*Confecciona un listado de los alumnos ordenado por los últimos alumnos que ingresaron, con nombre y apellido en un solo campo.*/
select * from alumno;
select concat(nombre, ' ', apellido) as nombreCompleto, fechaIngreso
from alumno
order by fechaIngreso desc;

/*¿Cual es el nombre del primer alumno que ingreso a Henry? ¿En que fecha ingreso?*/
select nombre, apellido, fechaIngreso
from alumno
order by fechaIngreso
limit 1;
use henry;
/*¿Cual es el nombre del ultimo alumno que ingreso a Henry?*/
select nombre, apellido, fechaIngreso
from alumno
order by fechaIngreso desc
limit 1;

/*La función YEAR le permite extraer el año de un campo date, utilice esta función y especifique cuantos alumnos ingresaron a a Henry por año.*/
select year(fechaIngreso) as anio, count(*) as cantidad
from alumno
group by anio
order by anio;

/*¿Cuantos alumnos ingresaron por semana a henry?, indique también el año. WEEKOFYEAR()*/
select weekofyear(fechaIngreso) as semana, count(*) as cantidad, year(fechaIngreso) as anio
from alumno
group by semana, anio
order by anio, semana;

/*¿En que años ingresaron más de 20 alumnos?*/
select year(fechaIngreso) as anio, count(*) as cantidad
from alumno
group by anio
having cantidad > 20;

/*Investigue las funciones TIMESTAMPDIFF() y CURDATE(). ¿Podría utilizarlas para saber cual es la edad de los instructores?. 
¿Como podrías verificar si la función cálcula años completos? Utiliza DATE_ADD().*/
select * from instructor;
select nombre, apellido, timestampdiff(year, fechaNacimiento, curdate()) as edad
from instructor
order by apellido;

/*La edad de cada alumno.*/
select nombre, apellido, timestampdiff(year, fechaNacimiento, curdate()) as edad
from alumno;

/*La edad promedio de los alumnos de henry.*/
select * from alumno;
select avg(timestampdiff(year, fechaNacimiento, curdate())) as promedio
from alumno;

/*La edad promedio de los alumnos de cada cohorte.*/
select avg(timestampdiff(year, fechaNacimiento, curdate())) as promedio, IdCohorte
from alumno
group by IdCohorte;

/*Elabora un listado de los alumnos que superan la edad promedio de Henry.*/
select nombre, apellido, timestampdiff(year, fechaNacimiento, curdate()) as Edad
from alumno
where timestampdiff(year, FechaNacimiento, curdate()) > (select avg(timestampdiff(year, FechaNacimiento, curdate())) from Alumno);

/*Seleccionar sólo los alumnos que se ingresaron después de cierta fecha.*/
select * 
from alumno
where fechaIngreso > '2022-02-01';

/*Ordenar los alumnos por fecha de nacimiento de forma descendente.*/
select * 
from alumno
order by fechaNacimiento desc;

/*Agregar una columna al DataFrame que contenga la edad de cada alumno en años. Encontrar el promedio de edad de los alumnos.*/
alter table alumno add column edad int;
/*Con esto logro autorizar la actualización de la tabla*/
SET SQL_SAFE_UPDATES = 0;
update alumno set edad = datediff(curdate(), fechaNacimiento) / 365;
/*Luego de realizar el cambio vuelva a colocar 1 ya que puede generar grandes perdidas*/
SET SQL_SAFE_UPDATES = 1;
select * from alumno;

select avg(edad) as promedio
from alumno;

/*Encontrar la cantidad de alumnos por cohorte.*/
select count(*) as cantidad, IdCohorte
from alumno
group by IdCohorte;

/*Seleccionar sólo los alumnos cuya cédula de identidad comienza con un cierto prefijo.*/
select *
from alumno
where cedulaIdentidad like "20%";

/*Encontrar la fecha de ingreso más temprana y más tardía de los alumnos.*/
select min(FechaIngreso) as fecha_minima, max(FechaIngreso) as fecha_maxima
from alumno;

/*Seleccionar sólo los alumnos que tengan una edad entre dos valores dados.*/
select *
from alumno
where edad < 20 and edad > 18;

