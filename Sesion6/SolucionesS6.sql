/*
1. Crear las siguientes tablas correspondientes a una base de datos con información sobre los empleados y proyectos de una empresa:
   
	EMPLEADO (DNI, Nombre, Apellidos, FechaAlta, Salario)
	
	PROYECTO (Codigo, Nombre, Presupuesto, FechaInicio, FechaFin)
	
	TRABAJA_EN (DNI, Cod_Proy, Horas)

	Teniendo en cuenta las siguientes restricciones:

	• Los atributos DNI y Codigo de proyecto son de tipo entero.

	• Los atributos que aparecen subrayados son las claves primarias de cada relación.

	• Ningún atributo de la tabla EMPLEADO podrá tener un valor nulo.

	• No se permitirá que dos empleados coincidan en nombre y apellidos.

	• Por defecto, la fecha de alta de un empleado se tomará como la fecha en la que se inserte la tupla correspondiente al empleado.

	• El salario será siempre una cantidad entera entre 14400 y 45000. Por defecto se asignará un valor de 20000 si no se proporciona uno específico en el momento de dar el alta.

	• Los atributos Presupuesto, FechaIncio y FechaFin de la tablaPROYECTO podrán tener un valor nulo. El resto de los atributos de esa tabla serán siempre no nulos.

	• No se permite que dos proyectos tengan el mismo nombre.

	• Por defecto, el atributo FechaInicio tomará el valor correspondiente a la fecha en la que se inserte la tupla en la tabla PROYECTO.

	• El número de horas que un empleado trabaja en cada proyecto será siempre un valor no nulo comprendido entre 10 y 40. Por defecto se asignará el valor 10.*/
CREATE TABLE empleado
(
	dni INTEGER NOT NULL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellidos VARCHAR(70) NOT NULL,
	fechaAlta DATE NOT NULL DEFAULT sysdate,
	salario DECIMAL(7,2) DEFAULT 20000 NOT NULL CHECK(salario >= 14000 AND salario <= 45000),
	CONSTRAINT EMP_UNIQ UNIQUE (nombre, apellidos)
);

CREATE TABLE proyecto
(
	codigo INTEGER NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	presupuesto DECIMAL(7,2),
	fechaInicio DATE DEFAULT sysdate,
	fechaFIN DATE,
	CONSTRAINT NOMPROY_UNIQ UNIQUE (nombre)
);

CREATE TABLE trabaja_en
(
	dni INTEGER NOT NULL PRIMARY KEY REFERENCES empleado(dni),
	cod_proy INTEGER NOT NULL PRIMARY KEY REFERENCES proyecto(codigo),
	horas INTEGER NOT NULL DEFAULT 10 CHECK(horas >= 10 AND horas <= 40),
);
/*
3. Insertar los siguientes datos correspondientes a un empleado: Agustin Perez
Marcos, con DNI 1231234 y salario 21000. Realizar la inserción sin
proporcionar valor para el atributo FechaAlta. Comprobar que se ha insertado
correctamente la tupla con el valor adecuado en FechaAlta.*/
INSERT INTO empleado(dni,nombre,apellidos,salario)
	VALUES(1231234,'Agustin','Perez Marcos',21000);
/*
4. Insertar la siguiente información correspondiente a un proyecto: Código=21234,
Nombre=’PUENTE’. Comprobar la información insertada.*/
INSERT INTO proyecto(codigo,nombre)
	VALUES(21234,'PUENTE');
/*
5. Insertar una tupla en TRABAJA_EN Indicando que el empleado Agustin Perez
Trabaja 15 horas semanales en el proyecto PUENTE.*/
SELECT dni FROM empleado WHERE nombre = 'Agustin' AND apellidos = 'Perez Marcos';
INSERT INTO trabaja_en(dni,cod_proy,horas)
	VALUES(1231234,21234,15); 
/*
6. Insertar una tupla en TRABAJA_EN indicando que el empleado con DNI
3214321 trabaja 10 horas en el proyecto PUENTE. ¿Qué ocurre?*/
INSERT INTO trabaja_en VALUES(3214321,21234,10);
/*Lo que ocurre es que se obtiene un error debido a que el DNI 3214321 no existe en la tabla EMPELADO*/
/*
7. Modificar la estructura de la tabla EMPLEADO para que contenga una nueva
columna que permita almacenar la titulación de cada empleado.*/
ALTER TABLE empleado ADD titulación VARCHAR(50);
/*
8. Modificar la tabla empleado para eliminar la restricción que no permite que dos
empleados se llamen igual.*/
ALTER TABLE empleado DROP CONSTRAINT EMP_UNIQ;
/*
9. Eliminar la tabla EMPLEADO. ¿Qué ocurre?*/
DROP TABLE empleado;
/*
10.  Eliminar todas las tablas creadas en el orden adecuado.*/
DROP TABLE trabaja_en;
DROP TABLE empleado;
DROP TABLE proyecto;
