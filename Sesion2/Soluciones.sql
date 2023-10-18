/*1. Mostrar el listado de títulos y autores de los libros de la base de datos.*/
SELECT L.Titulo, A.Nombre FROM LIBRO L, AUTOR A, ESCRIBE E WHERE L.ISBN=E.ISBN AND A.Codigo=E.Cod_Autor ORDER BY A.Nombre;
/*2. Obtener los títulos de los libros disponibles en las sucursales de la ciudad de Salamanca indicando además el código de la sucursal.*/
SELECT L.Titulo,D.Cod_Suc FROM LIBRO L,DISPONE D, SUCURSAL S WHERE L.ISBN=D.ISBN AND D.Cod_Suc=S.Codigo AND S.provincia='SALAMANCA' ORDER BY D.Cod_Suc;
/*3. Listar los títulos de los libros que están actualmente en préstamo en la sucursal
con código 7.*/
SELECT L.Titulo FROM LIBRO L, PRESTAMO P WHERE L.ISBN=P.ISBN AND P.Cod_Suc=7 AND P.Fecha_Dev IS NULL;
/*4. Repetir el listado anterior añadiendo el nombre del lector que tiene cada libro.*/
SELECT L.Titulo, LC.Codigo ||'_'|| LC.Nombre AS CodNombre FROM LIBRO L, PRESTAMO P, LECTOR LC WHERE L.ISBN=P.ISBN AND P.Cod_Lector=LC.Codigo AND P.Cod_Suc=7 AND P.Fecha_Dev IS NULL;
/*5. Obtener el código de sucursal, título del libro y número de ejemplares asignados para aquellos casos en los que el número de ejemplares sea mayor que 3.*/
SELECT D.Cod_Suc, L.Titulo, D.Num_Ejemplares FROM DISPONE D, LIBRO L WHERE D.ISBN=L.ISBN AND D.Num_Ejemplares>3 ORDER BY D.Cod_Suc,D.Num_Ejemplares;
/*6. Seleccionar los autores anteriores al siglo XIX mostrando para cada uno su nombre, apellidos y nacionalidad.*/
SELECT A.Nombre||' '||A.Apellido AS FullName, N.Nombre AS Nacionalidad FROM AUTOR A, NACIONALIDAD N WHERE A.Cod_Nacion=N.Codigo AND A.Ano_Nac<1900 ORDER BY A.Ano_Nac;
/*7. Obtener un listado de los libros de la editorial COSMOS mostrando el título del libro y el nombre y apellidos de su autor.*/
SELECT L.Titulo, A.Nombre, A.Apellido FROM LIBRO L, AUTOR A, EDITORIAL ED, ESCRIBE E WHERE L.Cod_Editorial=ED.Codigo AND L.ISBN=E.ISBN AND A.Codigo=E.Cod_Autor AND ED.Nombre='COSMOS' ORDER BY 1;
/*8. Obtener un listado de los títulos de los libros que ha leído el socio cuyo primer
apellido es TRIGO ordenado por la fecha en la que realizó el préstamo.*/
SELECT L.Titulo FROM LIBRO L, PRESTAMO P, LECTOR LC WHERE L.ISBN=P.ISBN AND P.Cod_Lector=LC.Codigo AND LC.Ape_1='TRIGO' ORDER BY P.Fecha_Ini;
/*9. Mostrar la localidad de las sucursales en las que ha realizado prestamos CARLOS LOPEZ CUADRADO*/
SELECT S.Poblacion FROM SUCURSAL S, PRESTAMO P, LECTOR LC WHERE S.Codigo=P.Cod_Suc AND P.Cod_Lector=LC.Codigo AND LC.Nombre='CARLOS' AND LC.Ape_1='LOPEZ' AND LC.Ape_2='CUADRADO';
/*10. Listar los nombres de los lectores que han leído libros de MARIO VARGAS LLOSA.*/
SELECT LC.Nombre FROM LECTOR LC, PRESTAMO P, ESCRIBE E, AUTOR A WHERE LC.Codigo=P.Cod_Lector AND P.ISBN=E.ISBN AND E.Cod_Autor=A.Codigo AND A.Nombre='MARIO' AND A.Apellido='VARGAS LLOSA';
/*11. Mostrar los títulos y los nombres de los autores de los libros que han sido prestados en los dos últimos años.*/
SELECT L.Titulo, A.Nombre||' '||A.Apellido AS FullName, P.Fecha_Ini FROM LIBRO L, AUTOR A, ESCRIBE E, PRESTAMO P WHERE L.ISBN=E.ISBN AND E.Cod_Autor=A.Codigo AND L.ISBN=P.ISBN AND to_char(sysdate, 'yyyy')-to_char(P.Fecha_Ini, 'yyyy')<=2 ORDER BY 3;
/*12. Mostrar los nombres completos de los lectores que han pedido prestado algún libro en las sucursales de la provincia de SALAMANCA.*/
SELECT DISTINCT L.Nombre||' '||L.Ape_1||' '||L.Ape_2 AS FullName FROM LECTOR L, PRESTAMO P, SUCURSAL S WHERE P.Cod_Lector=L.Codigo AND P.Cod_Suc=S.Codigo AND S.provincia='SALAMANCA';
/*13. Mostrar el número de ejemplares disponibles del libro titulado A SANGRE FRIA, de TRUMAN CAPOTE, en la sucursal de CORIA (CACERES).*/
SELECT D.Num_Ejemplares,'->',D.Num_Disponibles FROM DISPONE D, LIBRO L, ESCRIBE E, AUTOR A, SUCURSAL S WHERE D.ISBN=L.ISBN AND L.ISBN=E.ISBN AND E.Cod_Autor=A.Codigo  AND D.Cod_Suc=S.Codigo AND L.Titulo='A SANGRE FRIA' AND A.Nombre='TRUMAN' AND A.Apellido='CAPOTE' AND S.provincia='CACERES' AND S.Poblacion='CORIA';/*Da error por demasiados AND???*/

SELECT D.Num_Ejemplares, '->', D.Num_Disponibles 
FROM DISPONE D JOIN LIBRO L ON D.ISBN = L.ISBN JOIN ESCRIBE E ON L.ISBN = E.ISBN JOIN AUTOR A ON E.Cod_Autor = A.Codigo JOIN SUCURSAL S ON D.Cod_Suc = S.Codigo
WHERE L.Titulo = 'A SANGRE FRIA'
AND A.Nombre = 'TRUMAN' 
AND A.Apellido = 'CAPOTE' 
AND S.Provincia = 'CACERES' 
AND S.Poblacion = 'CORIA';
/*14. Obtener el título del libro, el nombre del autor, el nombre de la editorial y la
dirección de las sucursales donde está disponible algún ejemplar del libro con ISBN: 5023300*/
SELECT L.Titulo, A.Nombre||' '||A.Apellido AS FullName, ED.Nombre, S.Direccion||' '||S.Poblacion||' '||S.Provincia AS DireccionSucursal FROM LIBRO L JOIN ESCRIBE E ON L.ISBN=E.ISBN JOIN AUTOR A ON E.Cod_Autor=A.Codigo JOIN DISPONE D ON L.ISBN=D.ISBN JOIN SUCURSAL S ON D.Cod_Suc=S.Codigo JOIN EDITORIAL ED ON L.Cod_Editorial=ED.Codigo WHERE ISBN=5023300 ORDER BY S.Codigo;
SELECT DISTINCT L.Titulo, A.Nombre, A.Apellido, ED.Nombre, S.Direccion FROM LIBRO L, AUTOR A, EDITORIAL ED, SUCURSAL S, ESCRIBE E, DISPONE D WHERE E.Cod_Autor=A.Codigo AND E.ISBN=L.ISBN AND L.Cod_Editorial=ED.Codigo AND D.Cod_Suc=S.Codigo AND D.ISBN=5023300 AND D.Num_Disponibles>0;

/*15. Obtener un listado con título y autor de todos los libros de la editorial CALEIDOSCOPIO.*/
SELECT L.Titulo, A.Nombre ||' '|| A.Apellido AS Autoria FROM LIBRO L, ESCRIBE ES, AUTOR A, EDITORIAL ED WHERE L.ISBN=ES.ISBN AND ES.Cod_Autor=A.Codigo AND L.Cod_Editorial=ED.Codigo AND ED.Nombre='CALEIDOSCOPIO' ORDER BY A.Nombre,A.Apellido;
/*16. Mostrar información sobre los préstamos (título del libro, nombre del autor, dirección de la sucursal y fechas del préstamo) realizados por el lector PEDRO CASADO LAFUENTE.*/
SELECT L.Titulo, A.Nombre,S.Direccion,P.Fecha_Ini ||' '|| P.Fecha_Dev AS FechaPrestamo FROM LIBRO L, AUTOR A, PRESTAMO P, SUCURSAL S, ESCRIBE ES, LECTOR LC WHERE L.ISBN=ES.ISBN AND E.Cod_Autor=A.Codigo AND L.ISBN=P.ISBN AND P.Cod_Suc=S.Codigo AND P.Cod_Lector=LC.Codigo AND LC.Nombre='PEDRO' AND LC.Ape_1='CASADO' AND LC.Ape_2='LAFUENTE' ORDER BY P.Cod_Suc;
/*17. Mostrar todos los préstamos realizados (misma información que en el ejercicio anterior) por los lectores de GUIJUELO.*/
SELECT L.Titulo, A.Nombre,S.Direccion,P.Fecha_Ini ||' '|| P.Fecha_Dev AS FechaPrestamo FROM LIBRO L, AUTOR A, SUCURSAL S, PRESTAMO P, ESCRIBE ES, LECTOR LC WHERE L.ISBN=ES.ISBN AND ES.Cod_Autor=A.Codigo AND L.ISBN=P.ISBN AND P.Cod_Suc=S.Codigo AND P.Cod_Lector=LC.Codigo AND LC.Poblacion='GUIJUELO';
/*18. Mostrar toda la información de los autores (incluir país de origen) que hayan escrito un libro cuyo título contenga todas las vocales ordenadas (*A*E*I*O*U*)*/
SELECT A.Nombre ||' '|| A.Apellido AS FullName, A.Ano_Nac, A.Ano_Fall, N.Nombre FROM AUTOR A, NACIONALIDAD N, ESCRIBE ES, LIBRO L WHERE A.Cod_Nacion=N.Codigo AND A.Codigo=ES.Cod_Autor AND ES.ISBN=L.ISBN AND L.Titulo LIKE '%A%E%I%O%U';
/*19. Mostrar nombre y apellidos de los lectores que han solicitado un préstamo en la sucursal de PONFERRADA en el año 2011.*/
SELECT L.Nombre || ' ' || L.Ape_1 || ' ' || L.Ape_2 AS FullName FROM LECTOR L, PRESTAMO P, SUCURSAL S WHERE L.Codigo=P.Cod_Lector AND P.Cod_Suc=S.Codigo AND S.Poblacion='PONFERRADA' AND to_char(P.Fecha_Ini,'yyyy')='2011';
/*20. Mostrar el nombre de las editoriales donde ha publicado FEDERICO ANDAHAZI.*/
SELECT ED.Nombre FROM EDITORIAL ED, LIBRO L, ESCRIBE E, AUTOR A WHERE ED.Codigo=Cod_Editorial AND L.ISBN=E.ISBN AND E.Cod_Autor=A.Codigo AND A.Nombre='FEDERICO' AND A.Apellido='ANDAHAZI';
