/*1. Listar el nombre y apellidos de todos los lectores de la provincia de Cáceres que tienen una fecha de nacimiento anterior a la de:*/
/*a. alguno de los lectores de la provincia de Zamora.*/
SELECT LC.Nombre, LC.Ape_1, LC.Ape_2 FROM LECTOR LC WHERE LC.Provincia='CACERES' AND TO_CHAR(LC.Fecha_Nac, 'yyyymmdd') < ANY (SELECT TO_CHAR(LC2.Fecha_Nac, 'yyyymmdd') FROM LECTOR LC2 WHERE LC2.Provincia='ZAMORA');
/*b. cualquiera de los lectores de la provincia de Zamora.*/
SELECT LC.Nombre, LC.Ape_1, LC.Ape_2 FROM LECTOR LC WHERE LC.Provincia='CACERES' AND TO_CHAR(LC.Fecha_Nac, 'yyyymmdd') < ALL (SELECT TO_CHAR(LC2.Fecha_Nac, 'yyyymmdd') FROM LECTOR LC2 WHERE LC2.Provincia='ZAMORA');
/*2. Lectores que hayan nacido en una fecha posterior a la de todos los autores.*/
SELECT LC.Codigo FROM LECTOR LC WHERE TO_CHAR(LC2.Fecha_Nac, 'yyyy') > ALL (SELECT TO_CHAR(A.Ano_Nac,'yyyy') FROM AUTOR A);
/*3. Autores de la nacionalidad de ISABEL ALLENDE y que hayan nacido en el mismo año que CARMEN POSADAS.*/
SELECT A.Nombre||' '||A.Apellido AS FullName FROM AUTOR A WHERE A.Cod_nac=(SELECT A1.Cod_nac FROM AUTOR A1 WHERE A1.Nombre='ISABEL' AND A1.Apellido='ALLENDE') AND A.Ano_Nac=(SELECT A2.Ano_Nac FROM AUTOR A2 WHERE A2.Nombre='CARMEN' AND A2.Apellido='POSADAS');
/*4. Autores que hayan nacido en una fecha posterior a alguno de los lectores.*/
SELECT A.Nombre||' '||A.Apellido AS FullName FROM AUTOR A WHERE TO_CHAR(A.Ano_Nac, 'yyyy') > ANY (SELECT TO_CHAR(LC.Fecha_Nac, 'yyyy') FROM LECTOR LC);
/*5. Datos de la sucursal/sucursales que tiene el mayor número de préstamos.*/
SELECT * FROM SUCURSAL WHERE CODIGO IN (SELECT P.Cod_Suc FROM PRESTAMO P GROUP BY P.Cod_Suc HAVING COUNT(P.Codigo) = (SELECT MAX(COUNT(CODIGO)) FROM PRESTAMO GROUP BY Cod_Lector));
/*6. Datos del/los lector/s que realizó durante el año pasado el mayor número de préstamos.*/
SELECT * FROM LECTOR WHERE CODIGO IN (SELECT P.Cod_Lector FROM PRESTAMO P WHERE TO_CHAR(P.Fecha_Prestamo, 'yyyy') = '2017' GROUP BY P.Cod_Lector HAVING COUNT(P.Codigo) = (SELECT MAX(COUNT(CODIGO)) FROM PRESTAMO P WHERE TO_CHAR(P.Fecha_Prestamo, 'yyyy') = '2017' GROUP BY P.Cod_Lector));
/*7. Obtener el listado del autor/es con más libros, indicando el número.*/
SELECT A.Nombre||' '||A.Apellido AS FullName, COUNT(E.ISBN) AS NumLibros FROM AUTOR A, ESCRIBE E WHERE A.Codigo=E.Cod_Autor GROUP BY A.Nombre, A.Apellido HAVING COUNT(E.ISBN) = (SELECT MAX(COUNT(E2.ISBN)) FROM ESCRIBE E2 GROUP BY E2.Cod_Autor);
/*8. Datos del lector de más edad de la red de bibliotecas.*/
SELECT * FROM LECTOR WHERE TO_CHAR(Fecha_Nac,'yyyymmdd') = (SELECT MIN(TO_CHAR(Fecha_Nac,'yyyymmdd')) FROM LECTOR);
/*9. Datos de los lectores de más edad de cada provincia.*/
SELECT * FROM LECTOR WHERE TO_CHAR(Fecha_Nac,'yyyymmdd') IN (SELECT MIN(TO_CHAR(Fecha_Nac,'yyyymmdd')) FROM LECTOR GROUP BY Provincia);
/*10. Verifique si existe algún libro que no haya sido nunca cogido en préstamo en alguna sucursal. Si existe proporcione título del libro y la sucursal/es a la que pertenece.*/
SELECT L.Titulo, S.Codigo FROM LIBRO L, DISPONE D, SUCURSAL S WHERE L.ISBN = D.ISBN AND D.Cod_Suc = S.Codigo AND L.ISBN NOT IN (SELECT ISBN FROM PRESTAMO);
/*12. Nombre de los autores más antiguos de su nacionalidad, indicando el autor y la nacionalidad.*/
SELECT A.Nombre, N.Nombre AS Nacionalidad FROM AUTOR A JOIN NACIONALIDAD N ON A.Cod_Nacion = N.Codigo WHERE TO_CHAR(A.Fecha_Nac, 'yyyymmdd') = (SELECT MIN(TO_CHAR(A2.Fecha_Nac, 'yyyymmdd')) FROM AUTOR A2 WHERE A2.Cod_Nacion = A.Cod_Nacion)
/*13. Presentar un listado de sucursales indicando el libro que más ejemplares tiene.*/
SELECT S.Codigo, L.Titulo FROM SUCURSAL S, LIBRO L, DISPONE D WHERE S.Codigo = D.Cod_Suc AND L.ISBN = D.ISBN AND D.Num_Disponibles = (SELECT MAX(D2.Num_Disponibles) FROM DISPONE D2 WHERE D2.Cod_Suc = S.Codigo);
/*14. Presentar un listado de todos los lectores que no hayan realizado préstamos.*/
SELECT L.Nombre, L.Ape_1, L.Ape_2 FROM LECTOR L WHERE L.Codigo NOT IN (SELECT P.Cod_Lector FROM PRESTAMO P);
/*15. Obtener las localidades en las que viven lectores y no existan sucursales.*/
SELECT DISTINCT L.Poblacion FROM LECTOR L WHERE L.Poblacion NOT IN (SELECT S.Localidad FROM SUCURSAL S);
/*16. Nombre de los lectores que han obtenido préstamos en todas las sucursales.*/
SELECT L.Nombre, L.Ape_1, L.Ape_2 FROM LECTOR L WHERE L.Codigo IN (SELECT P.Cod_Lector FROM PRESTAMO P GROUP BY P.Cod_Lector HAVING COUNT(P.Codigo) = (SELECT COUNT(S.Codigo) FROM SUCURSAL S));
/*17. Nombre de los lectores que han obtenido préstamos en todas las sucursales de su provincia de residencia.*/
SELECT L.Nombre, L.Ape_1, L.Ape_2 FROM LECTOR L WHERE L.Provincia IN (SELECT S.Provincia FROM SUCURSAL S) AND L.Codigo IN (SELECT P.Cod_Lector FROM PRESTAMO P GROUP BY P.Cod_Lector HAVING COUNT(P.Codigo) = (SELECT COUNT(S.Codigo) FROM SUCURSAL S WHERE S.Provincia = L.Provincia));
/*18. Listar los ISBN de los libros disponibles en la sucursal 5 en un nº superior al del libro con ISBN 5024392.*/
SELECT ISBN FROM DISPONE WHERE Cod_Suc = 5 AND Num_Ejemplares > (SELECT Num_Ejemplares FROM DISPONE WHERE ISBN = 5024392 AND Cod_Suc = 5);
/*19. Presentar un listado de los lectores que tienen más préstamos en cada sucursal indicando el número de préstamos realizados ordenado por sucursal y listado alfabético de apellidos y nombre de dichos lectores.*/
SELECT L.Nombre, L.Ape_1, L.Ape_2, P.Cod_Suc, COUNT(P.Codigo) FROM LECTOR L, PRESTAMO P WHERE L.Codigo = P.Cod_Lector GROUP BY L.Nombre, L.Ape_1, L.Ape_2, P.Cod_Suc HAVING COUNT(P.Codigo) = (SELECT MAX(COUNT(P2.Codigo)) FROM PRESTAMO P2 GROUP BY P2.Cod_Lector);
