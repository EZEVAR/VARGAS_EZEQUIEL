-- 1. Lista el apellido de todos los empleados.
select apellido as APELLIDOS from empleados as e

-- 2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
select apellido as APELLIDOS from empleados as e group by e.apellido

-- 3. Lista todas las columnas de la tabla empleados.
select * from empleados

-- 4. Lista el nombre y apellido de todos los empleados.
select nombre,apellido  from empleados as e

-- 5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
select cuil_cuit as RAZON_SOCIAL from empleados as e

-- 6. Lista el nombre y apellido de los empleados en una única columna.
select concat(nombre," , ",apellido) as NOMBRE_COMPLETO from empleados as e

-- 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
select upper(concat(nombre," , ",apellido)) as NOMBRE_COMPLETO from empleados as e

-- 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select lower(concat(nombre," , ",apellido)) as NOMBRE_COMPLETO from empleados as e

-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
select nombre,presupuesto from departamentos d 

-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamentos d order by nombre asc 

-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamentos d order by nombre desc 

-- 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
select apellido,nombre  from empleados as e order by apellido,nombre asc

-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre,presupuesto from departamentos d order by presupuesto desc  limit 3

-- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre,presupuesto from departamentos d where presupuesto > 0 order by presupuesto  asc  limit 3

-- 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
select nombre,presupuesto from departamentos d where presupuesto >= 150000

-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre,presupuesto from departamentos d where presupuesto >= 100000 and presupuesto <= 200000

-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre,presupuesto from departamentos d where presupuesto < 100000 or presupuesto > 200000

-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre,presupuesto from departamentos d where presupuesto between 100000 and 200000 order by presupuesto asc 

-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre,presupuesto from departamentos d where presupuesto not between 100000 and 200000 order by presupuesto asc

-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select e.nombre,e.apellido,d.nombre  from empleados e join departamentos d where e.idempleado  = d.iddepartamento 

-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.
select d.nombre,e.apellido,e.nombre  from empleados e join departamentos d where e.idempleado  = d.iddepartamento order by d.nombre asc

-- 22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select iddepartamento,d.nombre  from  departamentos d join empleados e  where e.id_departamento=d.iddepartamento group by iddepartamento 

-- 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
select d.nombre NOMBRE_DEPTO from empleados e join departamentos d where e.idempleado  = d.iddepartamento and e.cuil_cuit  like '27-38382980-3'

-- 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
select d.nombre NOMBRE_DEPTO from empleados e join departamentos d where e.idempleado = d.iddepartamento and e.nombre  like 'Pepe%'

-- 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select e.idempleado ID,concat( e.apellido ,' , ', e.nombre)  NOMBRE,e.cuil_cuit  from empleados e join departamentos d where e.id_departamento =d.iddepartamento  and d.nombre like '%I+D%'order by e.apellido asc

-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
select e.idempleado ID,concat( e.apellido ,' , ', e.nombre)  NOMBRE,e.cuil_cuit,d.iddepartamento ,d.nombre 
from empleados e join departamentos d 
where e.id_departamento=d.iddepartamento  and (d.nombre like 'Cont%' or d.nombre like 'Sist%'or d.nombre like 'I+D') order by e.apellido asc

-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
select concat( e.apellido ,' , ', e.nombre)  NOMBRE,d.nombre,d.presupuesto  from empleados e join departamentos d  where e.id_departamento=d.iddepartamento and d.presupuesto not between 100000 and 200000

