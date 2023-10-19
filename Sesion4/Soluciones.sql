/*1. Hallar el número de lectores que no tienen domicilio en Salamanca capital.*/
SELECT COUNT(*) FROM LECTOR LC WHERE LC.Poblacion!='SALAMANCA';
/*2. Indicar el número total de poblaciones en las que hay lectores*/
SELECT LC.Poblacion, COUNT(*) FROM LECTOR LC GROUP BY LC.Poblacion;
/*3. Calcular la edad máxima, mínima y media de los lectores.*/
SELECT MAX(to_char(sysdate, 'yyyy')-to_char(LC.Fecha_Nac, 'yyyy')) AS EDADMAX, MIN(to_char(sysdate, 'yyyy')-to_char(LC.Fecha_Nac, 'yyyy')) AS EDADMIN, AVG(to_char(sysdate, 'yyyy')-to_char(LC.Fecha_Nac, 'yyyy')) AS EDADAVG FROM LECTOR LC;
/*4. Obtener el tiempo medio de préstamo*/
SELECT AVG(P.Fecha_Dev-P.Fecha_Ini) AS PRESAVG FROM PRESTAMO P WHERE P.Fecha_Dev IS NOT NULL;
/*5. Obtener la media de días de préstamo de los prestamos pendientes de devolución*/
SELECT AVG(sysdate-P.Fecha_Ini) AS PRESPENAVG FROM PRESTAMO P WHERE P.Fecha_Dev IS NULL;
/*6. Obtener el número de obras existentes en la biblioteca.*/
SELECT COUNT(*) FROM LIBRO;
/*7. Encontrar cuántas obras han sido prestadas en alguna ocasión.*/
SELECT COUNT(DISTINCT ISBN) AS ObrasPrestadas FROM PRESTAMO;
SELECT COUNT(DISTINCT PRESTAMO.ISBN) AS ObrasPrestadas FROM LIBRO RIGHT JOIN PRESTAMO ON LIBRO.ISBN=PRESTAMO.ISBN;
/*8. Obtener el número de obras que no han sido prestadas nunca.*/
SELECT COUNT(DISTINCT L.ISBN) AS ObrasNoPrestadas FROM LIBRO L LEFT JOIN PRESTAMO P ON L.ISBN=P.ISBN WHERE P.Codigo IS NULL;
/*9. Obtener el número total de ejemplares que se han adquirido para todas las sucursales.*/
SELECT D.Cod_Suc, L.Titulo, COUNT(D.Num_Disponibles) AS NumDispo FROM LIBRO L JOIN DISPONE D ON L.ISBN=D.ISBN GROUP BY D.Cod_Suc, L.Titulo ORDER BY 1;
/*10. Obtener la media de edad alcanzada por los autores fallecidos.*/
SELECT AVG(Ano_Fall-Ano_Nac) AS EDADMEDIAAUTORES FROM AUTOR WHERE Ano_Fall IS NOT NULL; 
/*11. Obtener la edad del lector más longevo.*/
SELECT MAX(to_char(sysdate,'yyyy')-to_char(Fecha_Nac,'yyyy')) AS EDADMAXLECTOR FROM LECTOR;
/*12. Obtener el total de préstamos realizados por cada sucursal en el año 2007.*/
SELECT P.Cod_Suc, COUNT(P.Codigo) FROM PRESTAMO P WHERE to_char(Fecha_Ini,'yyyy')=2007 GROUP BY P.Cod_Suc;
/*13. Obtener un listado con el código de todos los lectores que realizaron préstamos el año 96.*/
SELECT DISTINCT P.Cod_Lector FROM PRESTAMO P WHERE to_char(P.Fecha_Ini,'yyyy')=1996;
/*14. Obtener el número de autores por nacionalidades de los que se tiene ejemplares en la biblioteca.*/
SELECT N.Nombre, COUNT(DISTINCT A.Codigo) FROM NACIONALIDAD N JOIN AUTOR A ON N.Codigo=A.Cod_Nacion JOIN ESCRIBE ES ON A.Codigo=ES.Cod_Autor JOIN DISPONE D ON ES.ISBN=D.ISBN GROUP BY N.Nombre;
/*15. Hacer un listado con el número de ejemplares en préstamo en cada sucursal.*/
SELECT P.Cod_Suc, COUNT(P.ISBN) FROM PRESTAMO P WHERE P.Fecha_Dev IS NULL GROUP BY P.Cod_Suc ORDER BY 1;
/*16. Obtener los títulos de los libros y el número total de ejemplares en el conjunto de las sucursales.*/
SELECT L.Titulo||' -> '||SUM(D.Num_Disponibles) AS TituloNumero FROM LIBRO L JOIN DISPONE D ON L.ISBN=D.ISBN GROUP BY L.Titulo ORDER BY 1;
/*17. Obtener un listado de sucursales y el número de ejemplares de los que dispone.*/
SELECT Cod_Suc, SUM(Num_Disponibles) FROM DISPONE D GROUP BY 1;
/*18. Indicar para los años 2000 a 2005 el número de lectores que realizaron préstamos cada uno de esos años.*/
SELECT COUNT(DISTINCT Cod_Lector) FROM PRESTAMO WHERE to_char(Fecha_Ini,'yyyy') IN ('2000','2005');
/*19. Obtener los títulos de todos los libros indicando el número total de préstamos de cada uno.*/
SELECT L.Titulo, COUNT(P.Codigo) FROM LIBRO L JOIN PRESTAMO P ON L.ISBN=P.ISBN GROUP BY L.Titulo ORDER BY 1; 
/*20. Obtener los títulos de los libros que hayan tenido más de 5 préstamos, indicando el número total de préstamos de cada libro.*/
SELECT L.Titulo , COUNT(P.Codigo) FROM LIBRO L JOIN PRESTAMO P ON L.ISBN=P.ISBN GROUP BY L.Titulo HAVING COUNT(P.Codigo)>5 ORDER BY 1;
/*21. Obtener los nombres y apellidos de los lectores de la ciudad de Salamanca que tienen en este momento más de un libro en préstamo.*/
SELECT LC.Nombre||' '||LC.Ape_1||' '||LC.Ape_2 AS FullName FROM LECTOR LC JOIN PRESTAMO P ON LC.Codigo=P.Cod_Lector WHERE Poblacion='SALAMANCA' GROUP BY LC.Codigo, LC.Nombre, LC.Ape_1, LC.Ape_2 HAVING COUNT(P.ISBN)>1;
/*22. Obtener, para cada título, el número medio de ejemplares de ese título en todas las sucursales.*/
SELECT L.Titulo, AVG(D.Num_Disponibles) AS PromedioEjemplares FROM LIBRO L JOIN DISPONE D ON L.ISBN = D.ISBN GROUP BY L.Titulo;
/*23. Obtener el libro más recientemente editado*/
SELECT L.Titulo FROM LIBRO L WHERE L.Ano_Edicion=(SELECT MAX(Ano_Edicion) FROM LIBRO);
