SERVICIO
id = int *PRIMARY KEY*
nombre = String
jefe = empleado.id

EMPLEADO 
id = int *PRIMARY KEY*
nombre = String
apellidos = String

PLANTA
id = int *PRIMARY KEY*
id_servicio = servicio.id

HABITACION
id = int *PRIMARY KEY*
num_camas = int
id_cama = int *PRIMARY KEY* ??
id_servicio = servicio.id

PACIENTE
id = int *PRIMARY KEY*
nombre = String
apellidos = String
fecha_nacimiento = date

INGRESO
id_paciente = paciente.id
fecha_ingreso = date
fecha_alta = date
id_cama = habitacion.id_cama

Dependencias:

U=(servicio,idEmpleadoJefe,nombreJefe,apellidoJefe,planta,habitacion,cama,numasegurado,fechaingreso,fechaalta,fechaNacimiento,nombrePaciente,apellidoPaciente)
DF={servicio->idEmpleadoJefe, idEmpleadoJefe->nombreJefe, idEmpleadoJefe->apellidoJefe, servicio->planta,habitacion->servicio,cama->habitacion, numasegurado->,}
