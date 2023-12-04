/*1. Realizar al menos 5 de los ejercicios de la sesión 2, haciendo uso de la claúsula JOIN en el FROM.*/

/*7. Obtener un listado de los libros de la editorial COSMOS mostrando el título del libro y el nombre y apellidos de su autor.*/
SELECT L.Titulo, A.Nombre || ' ' || A.Apellido AS FullName FROM LIBRO L JOIN ESCRIBE ES ON L.ISBN=ES.ISBN JOIN AUTOR A ON ES.Cod_Autor=A.Codigo JOIN EDITORIAL ED ON L.Cod_Editorial=ED.Codigo WHERE ED.Nombre='COSMOS';
/*9. Mostrar la localidad de las sucursales en las que ha realizado prestamos CARLOS LOPEZ CUADRADO*/
SELECT S.Poblacion FROM SUCURSAL S JOIN PRESTAMO P ON S.Codigo=P.Cod_Suc JOIN LECTOR L ON P.Cod_Lector=L.Codigo WHERE L.Nombre='CARLOS' AND L.Ape_1='LOPEZ' AND L.Ape_2='CUADRADO';
/*11. Mostrar los títulos y los nombres de los autores de los libros que han sido prestados en los dos últimos años.*/
SELECT L.Titulo, A.Nombre || ' ' || A.Apellido AS FullName FROM LIBRO L JOIN ESCRIBE ES ON L.ISBN=ES.ISBN JOIN AUTOR A ON ES.Cod_Autor=A.Codigo JOIN PRESTAMO P ON L.ISBN=P.ISBN WHERE to_char(sysdate, 'yyyy') - to_char(P.Fecha_Ini, 'yyyy')<=2;
/*14. Obtener el título del libro, el nombre del autor, el nombre de la editorial y la
dirección de las sucursales donde está disponible algún ejemplar del libro con ISBN: 5023300*/
SELECT L.Titulo, A.Nombre||' '||A.Apellido AS FullName, ED.Nombre, S.Direccion||' '||S.Poblacion||' '||S.Provincia AS DireccionSucursal FROM LIBRO L JOIN ESCRIBE E ON L.ISBN=E.ISBN JOIN AUTOR A ON E.Cod_Autor=A.Codigo JOIN DISPONE D ON L.ISBN=D.ISBN JOIN SUCURSAL S ON D.Cod_Suc=S.Codigo JOIN EDITORIAL ED ON L.Cod_Editorial=ED.Codigo WHERE ISBN=5023300 ORDER BY S.Codigo;

/*13. Mostrar el número de ejemplares disponibles del libro titulado A SANGRE FRIA, de TRUMAN CAPOTE, en la sucursal de CORIA (CACERES).*/
SELECT D.Num_Ejemplares, '->', D.Num_Disponibles 
FROM DISPONE D JOIN LIBRO L ON D.ISBN = L.ISBN JOIN ESCRIBE E ON L.ISBN = E.ISBN JOIN AUTOR A ON E.Cod_Autor = A.Codigo JOIN SUCURSAL S ON D.Cod_Suc = S.Codigo
WHERE L.Titulo = 'A SANGRE FRIA'
AND A.Nombre = 'TRUMAN' 
AND A.Apellido = 'CAPOTE' 
AND S.Provincia = 'CACERES' 
AND S.Poblacion = 'CORIA';

/*20. Mostrar el nombre de las editoriales donde ha publicado FEDERICO ANDAHAZI.*/
SELECT ED.Nombre FROM EDITORIAL ED JOIN LIBRO L ON ED.Cod_Editorial=L.Cod_Editorial JOIN ESCRIBE ES ON L.ISBN=ES.ISBN JOIN AUTOR A ON ES.Cod_Autor=A.Codigo WHERE A.Nombre='FEDERICO' AND A.Apellido='ANDAHAZI';


/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/*2. Obtener un listado de los títulos de los libros asignados a la sucursal número 3, indicando para cada uno de ellos los códigos de los lectores que lo han tenido en préstamo. El listado deberá incluir los títulos que no han sido prestados y se presentará ordenado por título.*/
SELECT L.Titulo, P.Codigo FROM LIBRO L JOIN DISPONE D ON L.ISBN=D.ISBN JOIN SUCURSAL S ON D.Cod_Suc=S.Codigo JOIN PRESTAMO P ON D.ISBN=P.ISBN JOIN LECTOR LC ON P.Cod_Lector=LC.Codigo WHERE S.Codigo=3 ORDER BY 1;
/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/

/*3. Listar los títulos de los libros que no están asignados a sucursales de la ciudad de SALAMANCA.*/
SELECT L.Titulo FROM LIBRO L LEFT JOIN DISPONE D ON L.ISBN=D.ISBN LEFT JOIN SUCURSAL S ON D.Cod_Suc=S.Codigo WHERE S.Poblacion!='SALAMANCA' OR S.Poblacion IS NULL; 
/*4. Obtener los nombres de los lectores que han retirado préstamos en la sucursal 5 o en la 3.*/
SELECT LC.Nombre|| ' ' ||LC.Ape_1|| ' ' ||LC.Ape_2 AS FullName FROM LECTOR LC JOIN PRESTAMO P ON LC.Codigo=P.Cod_Lector WHERE P.Cod_Suc=5 OR P.Cod_Suc=3;
/*5. Obtener los nombres de los lectores que han retirado préstamos tanto en la sucursal 5 como en la 3.*/
SELECT LC.Nombre|| ' ' ||LC.Ape_1|| ' ' ||LC.Ape_2 AS FullName FROM LECTOR LC JOIN PRESTAMO P ON LC.Codigo=P.Cod_Lector WHERE P.Cod_Suc IN (5,3) GROUP BY LC.Codigo,LC.Nombre,LC.Ape_1,LC.Ape_2 HAVING COUNT (DISTINCT P.Cod_Suc)=2;
/*6. Obtener un listado de todos los lectores de la provincia de ZAMORA indicando los libros que actualmente tienen en préstamo (pendiente de devolución). El listado deberá incluir el nombre del lector, el título del libro prestado y la fecha de inicio del préstamo. Se listarán igualmente aquellos lectores de la provincia indicada que no tengan actualmente ningún préstamo activo.*/
SELECT LC.Nombre|| ' ' ||LC.Ape_1|| ' ' ||LC.Ape_2 AS FullName, L.Titulo, COALESCE(P.Fecha_Ini, 'No prestado') FROM LECTOR LC JOIN PRESTAMO P ON LC.Codigo=P.Cod_Lector JOIN LIBRO L ON P.ISBN=L.ISBN WHERE LC.Provincia='ZAMORA' 
/*7. Obtener un listado de los nombres de pila de los lectores que coinciden con nombres de algún escritor.*/

/*8. Obtener un listado de los títulos de libros de autores de nacionalidad italiana o francesa.*/


SELECT LC.Nombre || ' ' || LC.Ape_1 || ' ' || LC.Ape_2 AS NombreLector, L.Titulo AS TituloLibro, P.Fecha_Inicio FROM LECTOR LC LEFT JOIN PRESTAMO P ON LC.Codigo = P.Cod_Lector AND P.Fecha_Dev IS NULL LEFT JOIN LIBRO L ON P.ISBN = L.ISBN LEFT JOIN SUCURSAL S ON LC.Cod_Suc = S.Codigo WHERE (S.Provincia = 'ZAMORA' OR S.Provincia IS NULL) ORDER BY LC.Nombre, LC.Ape_1, LC.Ape_2;
