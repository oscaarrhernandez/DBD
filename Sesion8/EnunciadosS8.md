Se desea crear una base de datos que permita dar soporte a una empresa de transporte que quiere disponer de información sobre la situación en que se encuentran cada uno de los envíos que se le han encomendado. El funcionamiento del servicio es el siguiente: 

- Un cliente contrata un envío con la empresa para transportar un paquete desde una ciudad de origen hasta una dirección de destino. A cada envío se le asigna un número único que servirá para identificarlo a la hora de obtener información sobre su estado. Además, para cada envío se recogen los nombres y apellidos del remitente y destinatario, el importe y si ya está pagado o no. Del paquete se conoce además su peso. 
- La empresa cuenta con una flota de vehículos de distintos modelos y capacidad. Naturalmente,  cada  vehículo  está  identificado  por  su  matrícula.  Se  desea almacenar también los datos de  los conductores contratados. Esos datos son DNI, nombre, apellidos, salario y antigüedad en la empresa. 
- Diariamente se planifican y realizan una serie de trayectos para transportar los paquetes. Se considera que un trayecto es un viaje realizado por un vehículo y un conductor en una fecha desde una ciudad de origen hasta una ciudad de destino y transportando los paquetes correspondientes a una serie de envíos. Interesa recoger las horas de salida y llegada de cada trayecto. Los trayectos que todavía se están realizando se almacenarán con valor nulo en la hora de llegada.  
- En  un  trayecto  se  pueden  transportar  paquetes  correspondientes  a  distintos envíos. Un envío puede estar implicado en varios trayectos. Por ejemplo, un paquete que tiene como origen la facultad de Ciencias de la Universidad de Salamanca  y  como  destino  el  Rectorado  de  la  Universidad  Politécnica  de Valencia, puede estar incluido en un primer trayecto de Salamanca a Madrid (posiblemente junto a paquetes de otros envíos) y posteriormente viajar en otro trayecto (incluso con un conductor y vehículo distinto) de Madrid a Valencia. 
- En cualquier momento se podrá consultar la situación de un paquete. 

Realizar las siguientes tareas: 

1. A partir de la información facilitada, realizar el modelo conceptual mediante un diagrama Entidad/Relación que refleje tantas especificaciones del universo de discurso como sea posible. Para ello, si se desea, se puede utilizar cualquier programa de diseño gráfico o algún editor específico de este tipo de diagramas, como el disponible on-line en [http://www.gliffy.com/ ](http://www.gliffy.com/)o el incluido en Studio Case,  aplicación  de  escritorio  para  Windows  realizada  como proyecto  fin  de carrera por una alumna de ITIS, que se puede descargar desde: 

[http://zarza.usal.es/~fgarcia/docencia/isoftware/case/StudioCASEv1.htm ](http://zarza.usal.es/%7Efgarcia/docencia/isoftware/case/StudioCASEv1.htm)

2. A partir del modelo conceptual anterior, obtener el diseño lógico relacional. 
2. Obtener las dependencias funcionales de cada una de las relaciones. Estudiar el grado  de  normalización  de  cada  relación  y,  si  fuese  necesario,  realizar  las descomposiciones oportunas. 
4. Ejecutar las sentencias SQL necesarias para crear todas las tablas de la base de datos  diseñada  recogiendo  el  mayor  número  de  restricciones  de  integridad posibles. 
4. Introducir  en  la  base  de  datos  creada  la  siguiente  información,  que  podrá completarse con datos arbitrarios para los no proporcionados: 
- Pedro  Pérez  ha  contratado  el  envío  de  un  paquete  de  2  kg  desde Salamanca  hasta  el  número  11  de  la  calle  Larios  de  Málaga.  El destinatario será Juan López. La empresa le asigna el número de envío 120 y le cobra 9 euros por el transporte. 
- Alicia Martín contrata el envío a Carlos Gómez de un paquete de 4 kg desde Salamanca hasta el número 21 de la calle Salmerón de Almería. Paga 15 euros por el envío y la empresa le asigna el número de envío 234. 
- Andrés Fuentes es un empleado de la empresa  que ayer por la mañana transportó ambos paquetes desde Salamanca hasta Sevilla en el coche con matrícula 1234-ABC. 
- Faustino Fernández es otro empleado que ayer por la tarde realizó el trayecto entre Sevilla y Málaga, en el coche con matrícula 4321-XYZ llevando también ambos paquetes. 
- Dolores Frutos, es también empleada de la empresa y está mañana a las 8:00 ha salido de Málaga en dirección a Almería, llevando el paquete de Alicia  Martín  en  el  coche  4321-XYZ.  Todavía  no  ha  llegado  a  su 

destino. 

6. Realizar las siguientes consultas en SQL y comprobar que los resultados son coherentes con la información introducida: 
- Obtener el listado de vehículos de la empresa. 
- Obtener el número total de trayectos realizados  por el envío de Alicia Martín. 
- Obtener los datos de los trayectos que no han concluido. 
- Obtener un listado con todos envíos contratados y el número de trayectos realizados por cada uno. 
- Obtener un listado que presente la matrícula, conductor, fecha y horas de todos  los  trayectos  indicando  el  total  del  peso  de  los  paquetes transportados en cada uno de ellos. 
- Obtener el listado de los conductores contratados por la empresa y el número de trayectos que ha realizado cada uno de ellos. 
7. Intentar  eliminar  la  siguiente  información  referenciada  y  comprobar  que  el sistema no lo permite por violación de condiciones de integridad: 
- Eliminar la tupla que contiene los datos del modelo del vehículo con matrícula 1234-ABC. 
- Eliminar la tupla con los datos del empleado Faustino Fernández. 
8. Intentar introducir información incompleta y comprobar que el sistema no lo permite por violación de condiciones de integridad: 
- Introducir  información  correspondiente  a  un  trayecto  sin  indicar  la matrícula del vehículo implicado. 
- Introducir  información  correspondiente  a  un  envío  sin  indicar  la dirección de entrega. 
- Introducir información correspondiente a un envío sin indicar el peso del paquete. 
- Introducir  información  correspondiente  a  un  trayecto  indicando  un número  de  matrícula  del  que  no  se  conocen  los  datos  de  modelo  y capacidad. 
9. ¿Qué habría que hacer si se desea evitar que se pueda introducir información correspondiente a dos trayectos distintos, en la misma fecha y hora y con el mismo vehículo? Tomar las medidas oportunas y comprobar que tienen efecto. 
9. ¿Qué habría que hacer si se desea evitar que se pueda introducir información correspondiente a dos trayectos distintos, en la misma fecha y hora y con el mismo conductor? Tomar las medidas oportunas y comprobar que tienen efecto. 
