# Cheatsheet de SQL

## Manejar tablas

#### Crear una tabla nueva

```sql
CREATE TABLE t (
     id INTEGER PRIMARY KEY,
     name VARCHAR NOT NULL,
     price INTEGER DEFAULT 0
);

```
#### Eliminar tabla de la base de datos
```sql
DROP TABLE t;
```

#### Añadir columna a la tabla
```sql
ALTER TABLE t ADD column;
```

#### Eliminar columna de la tabla
```sql
ALTER TABLE t DROP column c;
```

#### Añadir constraint(regla de la tabla)
```sql
ALTER TABLE t ADD constraint;
```

#### Eliminar constraint(regla de la tabla)
```sql
ALTER TABLE t DROP constraint;
```

#### Eliminar todos los datos de la tabla
```sql
TRUNCATE TABLE t;
```

## Constraints (restricciones o reglas de la tabla)

#### Poner primary key
```sql
CREATE TABLE t(
    c1 INTEGER, c2 INTEGER, c3 VARCHAR,
    PRIMARY KEY (c1,c2)
);
```

#### Poner foreign key
```sql
CREATE TABLE t1(
    c1 INTEGER PRIMARY KEY,  
    c2 INTEGER,
    FOREIGN KEY (c2) REFERENCES t2(c2)
);
```

#### Hacer valores unicos
```sql
CREATE TABLE t(
    c1 INTEGER, c1 INTEGER,
    UNIQUE(c2,c3)
);
```

#### Comprobar valores c1>=c2 && c1>0
```sql
CREATE TABLE t(
c1 INTEGER, c2 INTEGER,
  CHECK(c1> 0 AND c1 >= c2)
);
```

#### Valor c2 no puede estar vacio
```sql
CREATE TABLE t(
     c1 INT PRIMARY KEY,
     c2 VARCHAR NOT NULL
);
```

## Modificar datos

#### Insertar fila en la tabla
```sql
INSERT INTO t(column_list)
VALUES(value_list);
```

#### Insertar varias filas en la tabla
```sql
INSERT INTO t(column_list)
VALUES (value_list), 
       (value_list), …;
```

#### Insertar fila de t2 a t1
```sql
INSERT INTO t1(column_list)
SELECT column_list
FROM t2;
```

#### Actualizar valor en la columna c1 para todas las filas
```sql
UPDATE t
SET c1 = new_value;
```

#### Actualizar valores en la columna c1,c2 que coincidan con la condición
```sql
UPDATE t
SET c1 = new_value, 
    c2 = new_value
WHERE condition;
```

#### Eliminar todos los datos de una tabla
```sql
DELETE FROM t;
```

#### Eliminar subconjunto de filas en una tabla
```sql
DELETE FROM t
WHERE condition;
```

### Consulta de datos en la tabla

#### Consultar datos en las columnas c1,c2 de una tabla
```sql
SELECT c1, c2 FROM t;
```

#### Consultar todas las filas y columnas de la tabla
```sql
SELECT * FROM t;
```

#### Consultar datos y filtrar por una condición
```sql
SELECT c1, c2 FROM t
WHERE condition;
```

#### Consultar filas distintas de una tabla
```sql
SELECT DISTINCT c1 FROM t
WHERE condition;
```

#### Ordenar el conjunto de resultados en orden ascendente o descendente
```sql
SELECT c1, c2 FROM t
ORDER BY c1 ASC [DESC];
```

#### Agrupar filas usando una función agregada
```sql
SELECT c1, aggregate(c2)
FROM t
GROUP BY c1;
```
```
aggregate = COUNT, SUM, AVG, MAX, MIN
```

#### Filtrar grupos usando la cláusula HAVING
```sql
SELECT c1, aggregate(c2)
FROM t
GROUP BY c1
HAVING condition;

```

## Consulta de datos desde varias tablas

#### Unión interior de t1 y t2 (INNER JOIN)
```sql
SELECT c1, c2 
FROM t1
INNER JOIN t2 ON condition;
```

#### Unión izquierda de t1 y t2 (LEFT JOIN)
```sql
SELECT c1, c2 
FROM t1
LEFT JOIN t2 ON condition;
```

#### Unión derecha de t1 y t2 (RIGHT JOIN)
```sql
SELECT c1, c2 
FROM t1
RIGHT JOIN t2 ON condition;
```

#### Unión externa de t1 y t2 (OUTER JOIN)
```sql
SELECT c1, c2 
FROM t1
FULL OUTER JOIN t2 ON condition;
```

#### Producto cartesiano de t1 y t2 (CROSS)
```sql
SELECT c1, c2 
FROM t1
CROSS JOIN t2;
```

#### Producto cartesiano de t1 y t2
```sql
SELECT c1, c2 
FROM t1, t2;
```

#### Unión de t1 a sí mismo (INNER JOIN) 
```sql
SELECT c1, c2
FROM t1 A
INNER JOIN t1 B ON condition;
```

## Operadores SQL

#### Combinar filas de dos consultas
```sql
SELECT c1, c2 FROM t1
UNION [ALL]
SELECT c1, c2 FROM t2;
```

#### Devolver la intersección de dos consultas
```sql
SELECT c1, c2 FROM t1
INTERSECT
SELECT c1, c2 FROM t2;
```

#### Restar un conjunto de resultados de otro conjunto de resultados
```sql
SELECT c1, c2 FROM t1
MINUS
SELECT c1, c2 FROM t2;
```

#### Consultar filas utilizando la coincidencia de patrones % _
```sql
SELECT c1, c2 FROM t1
WHERE c1 [NOT] LIKE pattern;
```

#### Consultar filas en una lista
```sql
SELECT c1, c2 FROM t
WHERE c1 [NOT] IN value_list;
```

#### Consultar filas entre dos valores
```sql
SELECT c1, c2 FROM t
WHERE  c1 BETWEEN low AND high;
```

#### Compruebe si los valores en una tabla son NULL o no
```sql
SELECT c1, c2 FROM t
WHERE  c1 IS [NOT] NULL;
```
