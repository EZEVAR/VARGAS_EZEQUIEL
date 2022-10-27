-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedidos p order by fecha desc ;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedidos p order by cantidad desc limit 5;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select c.id from clientes c join pedidos p  where id_cliente=c.id group by c.id;

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya cantidad total sea superior a $500.
select * from pedidos p where cantidad > 500 and fecha between '2022-01-01' and '2022-12-31';

-- 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
select concat_ws(' ',nombre,apellido) from vendedores where comisión between '0.05' and '0.11';

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
select max(comisión)  from vendedores v ;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
select id,nombre,apellido  from clientes where cuitcuil is not null order by apellido asc ;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
select nombre NOMBRE_CLIENTE from clientes c  where nombre like 'A%n' or nombre  like 'P%'order by nombre asc;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente.
select nombre NOMBRE_CLIENTE from clientes c  where nombre not like 'A%' order by nombre asc;

-- 10.Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en cuenta que se deberán eliminar los nombres repetidos.
select upper(nombre) NOMBRE_VENDEDOR from vendedores v  where nombre  like '%el'  or nombre like '%o';

-- 11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
select c.id,concat_ws(' ,',c.apellido,c.nombre) from clientes c join pedidos p  where id_cliente=c.id group by c.id order by c.apellido  asc;

-- 12.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
select * from pedidos p join clientes c where id_cliente=c.id  order by c.apellido asc;

-- 13.Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe mostrar los datos de los vendedores ordenados alfabéticamente.
select * from pedidos p join vendedores v  where id_vendedor=v.id  order by v.apellido asc;

-- 14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los vendedores asociados a cada pedido.
select c.id,concat_ws(' ,',c.apellido,c.nombre) CLIENTE,p.id,p.cantidad,v.id,concat_ws(' ,',v.apellido,v.nombre)  VENDEDOR from clientes c join pedidos p,vendedores v  where id_cliente=c.id and id_vendedor=v.id  group by p.id order by c.apellido  asc;

-- 15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo monto esté entre $300 y $1000.
select concat_ws(' ,',c.apellido,c.nombre) CLIENTE from pedidos p join clientes c  where id_cliente=c.id and cantidad between '300' and '1000' and fecha between '2022-01-01' and '2022-12-31';

-- 16.Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido realizado por María Santana.
select upper(concat_ws(' ,',v.apellido,v.nombre)) VENDEDOR from vendedores v join clientes c,pedidos p where c.id=6 and c.id=p.id_vendedor group by id_vendedor;

-- 17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez.
select upper(concat_ws(' ,',c.apellido,c.nombre)) CLIENTE from pedidos p  join clientes c where id_cliente=c.id and id_vendedor=1 group by c.nombre ;

-- 18.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
select  c.id,upper(concat_ws(' ,',c.apellido,c.nombre)) CLIENTE,p.id VENTA,p.cantidad,p.fecha from pedidos p  right join clientes c on p.id_cliente=c.id order by c.apellido asc;

-- 19.Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han realizado. Este listado también debe incluir los vendedores que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
select  v.id,upper(concat_ws(' ,',v.apellido,v.nombre)) VENDEDOR,p.id VENTA,p.cantidad,p.fecha from pedidos p  right join vendedores v  on p.id_vendedor =v.id order by v.apellido asc;

-- 20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT c.id,upper(concat_ws(' ,',c.apellido,c.nombre)) CLIENTE FROM clientes C left join pedidos P ON C.id = P.id_cliente where c.id=p.id_cliente is null ORDER BY C.apellido ASC;

-- 21.Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
SELECT v.id,upper(concat_ws(' ,',v.apellido,v.nombre)) VENDEDOR FROM vendedores v   left join pedidos p ON v.id = p.id_vendedor where v.id=p.id_vendedor  is null;

-- 22.Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.
select c.id ,upper(concat_ws(' ,',c.apellido,c.nombre)) NOMBRE from clientes C left join pedidos P ON C.id = P.id_cliente where p.id_cliente is null 
union 
select distinct  v.id ,upper(concat_ws(' ,',v.apellido,v.nombre)) FROM vendedores v left join pedidos p ON v.id = p.id_vendedor  where p.id_vendedor is null ;

-- 23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(cantidad) TOTAL_VENTAS from pedidos ;

-- 24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(cantidad) MONTO_PROMEDIO from pedidos p; 


-- 25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
select count(distinct id_vendedor) TOTAL_VENDEDORES from pedidos p ;

-- 26.Calcula el número total de clientes que aparecen en la tabla cliente.
select count(id) TOTAL_CLIENTES from clientes c ;

-- 27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(cantidad) MAYOR_CANTIDAD from pedidos p ;

-- 28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(cantidad) MENOR_CANTIDAD from pedidos p ;

-- 29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select distinct ciudad,max(categoría) from clientes c group by ciudad;

-- 30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellido, la fecha y el valor de la cantidad.
select id_cliente,upper(concat_ws(' ,',c.apellido,c.nombre)) CLIENTE,fecha, max(p.cantidad) CANT_MAXIMA from pedidos p 
inner join clientes c  ON c.id=p.id_cliente
group by p.id_cliente, p.fecha order by fecha ;

-- 31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, 
-- teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000 .
select id_cliente,upper(concat_ws(' ,',c.apellido,c.nombre)) CLIENTE,fecha, max(p.cantidad) CANT_MAXIMA from pedidos p 
join clientes c  ON c.id=p.id_cliente where cantidad>'2000'group by p.id_cliente, p.fecha order by fecha ;

-- 32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
select id_vendedor,upper(concat_ws(' ,',v.apellido,v.nombre)) VENDEDOR,fecha, max(p.cantidad) CANT_MAXIMA from pedidos p 
join vendedores v  ON v.id=p.id_vendedor  where fecha='2021-08-17'group by p.id_vendedor , p.fecha order by fecha ;


-- 33.Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de
-- pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir
-- clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el
-- listado indicando que el número de pedidos realizados es 0.
select C.id,upper(concat_ws(' ,',c.apellido,c.nombre)) CLIENTE,count(id_cliente) TOTAL_PEDIDOS from pedidos p right join clientes c
on p.id_cliente=c.id group by c.id;

-- 34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de pedidos que ha realizado cada uno de clientes durante el año 2020.
select C.id,upper(concat_ws(' ,',c.apellido,c.nombre)) CLIENTE,count(id_cliente) TOTAL_PEDIDOS,max(cantidad)  from pedidos p right join clientes c 
on p.id_cliente=c.id where fecha like'2020%' group by c.id;

-- 35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select distinct year(p.fecha) FECHA,max(cantidad) CANT_MAXIMA from pedidos p group by year(p.fecha) order by p.fecha;

-- 36.Devuelve el número total de pedidos que se han realizado cada año.
select distinct year(p.fecha) FECHA,count(p.id) CANT_PEDIDOS from pedidos p group by year(p.fecha) order by p.fecha;

-- 37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
Select count(*) from pedidos p  where id_cliente  = (Select id from clientes c  where nombre = 'Adela'and apellido = 'Salas');

-- 38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáe. (Sin utilizar INNER JOIN)
Select count(*) from pedidos p  where id_vendedor = (Select id from vendedores v  where nombre = 'Daniel'and apellido = 'Sáez');

-- 39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
select c.id,upper(concat_ws(' ,',c.apellido,c.nombre)) CLIENTE from clientes c
where c.id = (select id_cliente from pedidos p  where cantidad = (select max(cantidad) from pedidos where year(fecha) = 2020));

-- 40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
select fecha, min(p.cantidad) CANT_MIN from pedidos p join clientes c  ON c.id=p.id_cliente where nombre = 'Pepe'and apellido = 'Ruiz';

-- 41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
Select * from clientes c  where c.id not in (select id_cliente from pedidos);

-- 42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
Select * from vendedores v  where v.id not in (select id_vendedor from pedidos);

-- 43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
Select * from clientes c  where not exists (select id_cliente from pedidos p  where c.id =p.id_cliente);

-- 44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select * from vendedores v  where not exists (select id_vendedor from pedidos p  where v.id = p.id_vendedor);