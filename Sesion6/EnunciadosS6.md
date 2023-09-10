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

	• El número de horas que un empleado trabaja en cada proyecto será siempre un valor no nulo comprendido entre 10 y 40. Por defecto se asignará el valor 10.

2. Comprobar la estructura de las tablas creadas usando el comando desc de
sqlplus
3. Insertar los siguientes datos correspondientes a un empleado: Agustin Perez
Marcos, con DNI 1231234 y salario 21000. Realizar la inserción sin
proporcionar valor para el atributo FechaAlta. Comprobar que se ha insertado
correctamente la tupla con el valor adecuado en FechaAlta.
4. Insertar la siguiente información correspondiente a un proyecto: Código=21234,
Nombre=’PUENTE’. Comprobar la información insertada.
5. Insertar una tupla en TRABAJA_EN Indicando que el empleado Agustin Perez
Trabaja 15 horas semanales en el proyecto PUENTE.
6. Insertar una tupla en TRABAJA_EN indicando que el empleado con DNI
3214321 trabaja 10 horas en el proyecto PUENTE. ¿Qué ocurre?
7. Modificar la estructura de la tabla EMPLEADO para que contenga una nueva
columna que permita almacenar la titulación de cada empleado.
8. Modificar la tabla empleado para eliminar la restricción que no permite que dos
empleados se llamen igual.
9. Eliminar la tabla EMPLEADO. ¿Qué ocurre?
10.  Eliminar todas las tablas creadas en el orden adecuado.
