/*1. Obtener toda la información almacenada en la base de datos, relacionada con los
autores, sucursales, lectores, libros y editoriales.*/
SELECT * FROM Autor, Sucursal, Lector, Libro, Editorial;
/*2. Obtener la fecha de nacimiento de cada uno de los lectores ordenados del más joven
al mayor de ellos.*/
SELECT Fecha_Nac FROM Lector ORDER BY Fecha_Nac DESC;
/*3. Obtener el ISBN de los libros que están prestados indicando la sucursal y la fecha en
la que se realizó el préstamo. Ordenar la salida por sucursal y fecha de préstamo.*/
SELECT ISBN, Cod_Suc, Fecha_Ini FROM Prestamo ORDER BY Cod_Suc,Fecha_Ini;
/*4. Obtener el código y nombre de las editoriales. Incluir entre ambos campos el literal NOMBRE.*/
SELECT Codigo, 'NOMBRE: ', Nombre FROM Editorial;
/*5. Obtener primer apellido, segundo apellido y nombre de todos los lectores de la
biblioteca ordenados primer y segundo apellido.*/
SELECT Ape_1, Ape_2, Nombre FROM Lector ORDER BY 1,2;
/*6. Obtener un listado de los libros ordenado de menor a mayor antigüedad.*/
SELECT Titulo, Ano_Edicion FROM Libro ORDER BY Ano_Edicion DESC;
/*7. Obtener las distintas poblaciones en las que están domiciliados los lectores, dando el
nombre de la población y la provincia de cada una de ellas. El listado deberá obtenerse ordenado por nombre de provincia y población. Comparar el resultado que se hubiera obtenido sin utilizar DISTINCT.*/
SELECT Poblacion, Provincia FROM LECTOR ORDER BY 2,1;
SELECT DISTINCT Poblacion, Provincia FROM LECTOR ORDER BY 2,1;
/*8. Obtener el domicilio del lector cuyo segundo apellido sea BENITO.*/
SELECT Direccion, Poblacion, Provincia FROM LECTOR WHERE Ape_2='BENITO';
/*9. Obtener el nombre completo de los autores con nacionalidad española (Busque
previamente el código correspondiente en la tabla nacionalidad).*/
SELECT Nombre, Apellido FROM AUTOR WHERE Cod_Nacion=(SELECT Codigo FROM NACIONALIDAD WHERE Nombre='ESPANA');
/*10. Obtener la dirección postal completa de la sucursal cuyo código es 12*/
SELECT Direccion, Poblacion, Provincia FROM SUCURSAL WHERE Codigo=12;
/*11. De los diferentes libros de los que disponen las sucursales indicar aquellas
sucursales que tienen más de 3 ejemplares de un mismo libro. Indique el código de
la sucursal, el ISBN del libro y el número de ejemplares con el requisito requerido
(3 o más de 3 ejemplares).*/
SELECT D.ISBN, L.Titulo ,D.Cod_Suc, D.Num_Ejemplares FROM DISPONE D, LIBRO L WHERE D.ISBN=L.ISBN AND D.Num_Ejemplares >= 3 ORDER BY D.Cod_Suc,D.Num_Ejemplares;
/*12. Obtener el código de los lectores que han cogido en préstamos el libro de ISBN
5023024 ordenados por sucursal y fecha de préstamo.*/
SELECT P.Cod_lector, LC.Nombre || ' ' || LC.Ape_1 || ' ' || LC.Ape_2 AS FullName, P.Fecha_Ini FROM PRESTAMO P, LECTOR LC WHERE ISBN=5023024 ORDER BY Cod_Suc, Fecha_Ini;
/*13. Obtener el Código de los autores ya fallecidos, la fecha en la que fallecieron y los
años que tenían.*/
SELECT Codigo, Ano_Fall, Ano_Fall-Ano_Nac AS Edad FROM AUTOR WHERE Ano_Fall IS NOT NULL ORDER BY Edad; 
/*14. Obtener nombre y dos apellidos de los lectores que hayan nacido antes de 1980.*/
SELECT Nombre || ' ' || Apellido AS nombreAutor, Ano_Nac FROM AUTOR WHERE Ano_Nac < 1980 ORDER BY Ano_Nac;
/*15. Obtener un listado de los lectores que a lo largo de este año superan los 23 años.*/
SELECT Nombre || ' ' || Ape_1 || ' ' || Ape_2 AS NombreLector, TO_CHAR(sysdate, 'yyyy') - TO_CHAR(Fecha_nac, 'yyyy') AS Edad FROM LECTOR WHERE TO_CHAR(Fecha_nac, 'yyyy') = TO_CHAR(sysdate, 'yyyy') - 23;
/*16. Obtener un listado ordenado alfabéticamente de todos los lectores registrados en la base de datos que tienen domicilio en Zamora.*/
SELECT Nombre || ' ' || Ape_1 || ' ' || Ape_2 AS FullName, Poblacion FROM LECTOR WHERE Provincia='ZAMORA' ORDER BY Poblacion;
/*17. Obtener los libros disponibles en la sucursal con código 5.*/
SELECT L.Titulo FROM LIBRO L, DISPONE D WHERE L.ISBN=D.ISBN AND D.Cod_Suc=5;
/*18. Obtener el código y nombre de los libros con más de 12 años de edición.*/
SELECT ISBN, Titulo FROM LIBRO WHERE to_char(sysdate, 'yyyy') - Ano_Edicion >= 12;
/*19. Obtener los lectores cuyo domicilio habitual está en las provincias de Salamanca o Ávila.*/
SELECT Nombre, Ape_1, Ape_2 FROM LECTOR WHERE Provincia='SALAMANCA' OR Provincia='ÁVILA';
/*20. Obtener los préstamos que no han sido devueltos indicando el código de préstamo, código de lector y fecha de inicio del préstamo. Ordénese la salida por sucursal.*/
SELECT Codigo, Cod_lector, Fecha_Ini FROM PRESTAMO WHERE Fecha_Dev IS NULL ORDER BY Cod_Suc; 
/*21. Obtener el nombre de los autores pertenecientes las nacionalidades española, francesa o británica (Busque previamente los códigos correspondientes en la tabla
nacionalidad).*/
SELECT A.Nombre || ' ' || A.Apellido AS FullName, N.Nombre AS Nacionalidad FROM AUTOR A, NACIONALIDAD N WHERE A.Cod_Nacion=N.Codigo  AND N.Nombre='ESPANA' OR N.Nombre='FRANCIA' OR N.Nombre='REINO UNIDO' ORDER BY N.Nombre,FullName;
/*22. Obtener un listado que incluya el código, nombre y provincia de los lectores que no vivan ni en la provincia de Salamanca ni en la de Zamora.*/
SELECT Codigo, Nombre ||' '|| Ape_1 AS NombreApe1, Provincia FROM LECTOR WHERE Provincia != 'SALAMANCA' AND Provincia != 'ZAMORA' ORDER BY Provincia; 
/*23. Obtener el nombre y apellido de aquellos lectores cuyo primer apellido empiece por M.*/
SELECT Nombre ||' '|| Ape_1 ||' '|| Ape_2 AS FullName FROM LECTOR WHERE Ape_1 LIKE 'M%' ORDER BY Ape_1;
/*24. Obtener el nombre de los lectores cuyo apellido empiece por G e incluya alguna Z.*/
SELECT Nombre,Ape_1 FROM Lector WHERE Ape_1 LIKE 'G%Z%';
/*25. Obtener el nombre y apellidos de aquellos lectores que tengan un primer apellido de 7 letras.*/
SELECT Nombre || ' ' || Ape_1 || ' ' || Ape_2 AS FullName FROM LECTOR WHERE length(Ape_1)=7;
/*26. Seleccionar los lectores que tengan edades comprendidas entre los 26 y los 36 años.
Ordenar de mayor a menor edad.*/
SELECT Nombre || ' ' || Ape_1 || ' ' || Ape_2 AS FullName, to_char(sysdate, 'yyyy')-to_char(Fecha_Nac, 'yyyy') AS Edad FROM LECTOR WHERE to_char(sysdate, 'yyyy')-to_char(Fecha_Nac, 'yyyy') BETWEEN 26 AND 36 ORDER BY Fecha_Nac;
/*27. Seleccionar los autores que no son españoles.*/
SELECT Nombre ||' '|| Apellido AS FullName FROM AUTOR WHERE Cod_Nacion IN (SELECT Codigo FROM NACIONALIDAD WHERE Nombre!='ESPANA');
SELECT A.Nombre || ' ' || A.Apellido AS FullName, N.Nombre FROM AUTOR A JOIN NACIONALIDAD N ON N.Codigo = A.Cod_Nacion WHERE N.Codigo IN (SELECT Codigo FROM NACIONALIDAD WHERE Nombre!='ESPANA');
/*28. Mostrar los nombres, apellidos y edad de los autores vivos que no son españoles y que tienen más de 70 años o menos de 50.*/
SELECT A.Nombre || ' ' || A.Apellido AS FullName, (to_char(sysdate, 'yyyy')-A.Ano_Nac) AS Edad 
FROM AUTOR A JOIN NACIONALIDAD N ON N.Codigo=A.Cod_Nacion 
WHERE (to_char(sysdate, 'yyyy')-A.Ano_Nac) BETWEEN 50 AND 70 
AND N.Codigo IN (SELECT Codigo FROM NACIONALIDAD WHERE Nombre != 'ESPANA');
/*29. Obtener los datos de los préstamos que, o bien son de la sucursal 5 y han sido
devueltos, o bien son de la sucursal 10 y aún están en vigor.*/
SELECT * FROM PRESTAMO WHERE (Cod_Suc=5 AND Fecha_Dev IS NOT NULL) OR (Cod_Suc=10 AND Fecha_Dev IS NULL) ORDER BY Cod_Suc, Codigo;
