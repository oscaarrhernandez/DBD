Se desea crear una base de datos que permita almacenar la información correspondiente a los ingresos de pacientes en un centro hospitalario. Del análisis del funcionamiento del centro se han obtenido las siguientes conclusiones: 

- El  centro  dispone  de  varios  servicios  hospitalarios  (Digestivo,  Pediatría, Traumatología,...) cada uno de los cuales tiene un Jefe de Servicio y una serie de habitaciones asignadas en las que se ingresa a los pacientes correspondientes a ese  servicio.  Del  jefe  de  servicio  se  debe  conocer  su  número  de  empleado, nombre y apellidos. 
- El centro se divide en plantas, cada una con un identificador diferente y cada servicio se sitúa en una planta, aunque en la misma planta puede haber ubicados varios servicios. 
- Las  habitaciones  también  tienen  un  identificador  y  pueden  contener  distinto número de camas, cada una de ellas con su propio identificador. Cada habitación está asignada a un servicio hospitalario. Todas las habitaciones asignadas a un servicio estarán en la planta correspondiente a dicho servicio. 
- Cada paciente ingresado tiene asignada una cama que será la misma durante todo el tiempo que esté ingresado, aunque, obviamente, si un paciente sufre varios ingresos puede ocupar distintas camas, una en cada uno de sus ingresos. El sistema debe mantener información histórica, por lo que se deberán poder consultar los datos correspondientes tanto a los ingresos actuales como a los pasados de los pacientes. 
- No es posible que a dos pacientes que ingresen en el mismo día se les asigne una misma cama. 
- Para cada ingreso de paciente se deben almacenar las fechas de ingreso y de alta y el identificador de la cama asignada la paciente.  
- De  cada  paciente  se  debe  conocer  su  número  de  asegurado,  su  nombre  y apellidos y su fecha de nacimiento. 

Realizar las siguientes tareas: 

1. A partir de la información facilitada, elaborar una lista con todos los atributos a considerar indicando su tipo y, en su caso, tamaño. 
1. Identificar todas las dependencias funcionales en las que estén involucrados los atributos considerados. 
1. Considerar el esquema de relación R (U, DF), siendo el conjunto U de todos los atributos y el conjunto DF de todas las dependencias funcionales. ¿Tiene R un nivel de normalización adecuado? 
1. Obtener una descomposición de R que permita alcanzar el más alto grado de normalización sin que se produzcan pérdidas de dependencias funcionales. 
1. Estudiar las relaciones obtenidas en la descomposición anterior y asignar a cada una de ellas un nombre con contenido semántico. 
1. Ejecutar las sentencias SQL necesarias para crear todas las tablas de la base de datos  diseñada  recogiendo  el  mayor  número  de  restricciones  de  integridad posibles. 
7. Introducir en la base de datos creada la siguiente información: 
- El paciente Juan López, con número de asegurado 123123 y nacido el 12 de marzo de 1945 ha ingresado hoy en el la cama 1151, que se encuentra en  la  habitación  115.  Esa  habitación  es  de  la  primera  planta  y  está asignada al servicio de Digestivo, cuyo jefe es el doctor Andrés Martín (número de empleado 7869). 
- El mismo paciente, ya había estado ingresado en dos ocasiones anteriores en  habitaciones  correspondientes  al  mismo  servicio.  Concretamente, estuvo  del  2  al  15  de  febrero  de  este  año  en  la  cama  1122,  de  la habitación 112 y del 21 al 25 de agosto pasado en la cama 1261, de la habitación 126. 
- Desde ayer, está ingresada María Sánchez, con número de asegurado 5691 y nacida el 24 de mayo de 2001, en la cama 2251, habitación 225, segunda planta. Esa habitación corresponde al servicio de pediatría, cuya jefa es la doctora Isabel Ruiz (número de empleado 2342) 
- Por  otra  parte,  la  cama  1151,  fue  ocupada  por  el  paciente  Ceferino Fernández, con número de asegurado 443322 y nacido el 6 de julio de 1957, desde el día 7 hasta el 12 del pasado mes de octubre. 
8. Realizar las siguientes consultas en SQL y comprobar que los resultados son coherentes con la información introducida: 
- Obtener el listado de las habitaciones asignadas al servicio de digestivo. 
- Obtener el número total de ingresos del paciente Juan López. 
- Obtener el número de pacientes que se encuentran ingresados en este momento. 
- Obtener el número de la cama correspondiente al ingreso más antiguo. 
- Obtener un listado de los pacientes actualmente ingresados, indicando para cada uno el nombre del jefe del servicio responsable de su ingreso. 
- Obtener el listado de las camas que en este momento están disponibles. 
9. Intentar  eliminar  la  siguiente  información  referenciada  y  comprobar  que  el sistema no lo permite por violación de condiciones de integridad: 
- Eliminar  la/s  tupla/s  en  las  que  se  indica  que  la  habitación  1122 corresponde al servicio de digestivo. 
- Eliminar la tupla en la que se indica quién es el jefe del servicio de pediatría. 
10. Intentar introducir información incompleta y comprobar que el sistema no lo permite por violación de condiciones de integridad: 
- Introducir  información  correspondiente  a  un  ingreso  sin  indicar  el número de asegurado del paciente. 
- Introducir información correspondiente a un ingreso sin indicar la fecha de ingreso. 
- Introducir  información  correspondiente  a  un  ingreso  sin  indicar  el número de cama asignada al paciente. 
- Indicar que la habitación 321, tercera planta, corresponde al servicio de cardiología. 
11. Comprobar que el sistema no permite introducir la información correspondiente a otro ingreso en el día de hoy en la cama 1151. 
