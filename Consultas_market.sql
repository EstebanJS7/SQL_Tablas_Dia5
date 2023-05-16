--1. Top clientes con más facturas
select c.nombre, count(f.id) as cantidad_facturas
from cliente c
inner join factura f on c.id = f.cliente_id
group by c.nombre
order by cantidad_facturas DESC

--2. Top clientes que más gastaron
select c.nombre, c.nro_cedula, sum(fd.cantidad * prod.precio) as gastos
from cliente c
inner join factura f on c.id = f.cliente_id
inner join factura_detalle fd on f.id = fd.factura_id
inner join producto prod on fd.producto_id = prod.id
group by c.nombre, c.nro_cedula
order by gastos DESC

--3. Top monedas más utilizadas
select m.nombre, count(*) as cantidad 
from factura f inner join moneda m on f.moneda_id = m.id
group by m.id
order by cantidad DESC

--4. Top proveedor de productos
select p.nombre, count(prod.proveedor_id) as cantidad_proveedores
from producto prod
inner join proveedor p on prod.proveedor_id = p.id
group by prod.proveedor_id, p.nombre
order by cantidad_proveedores desc

--Productos más vendidos
select p.id, p.nombre, sum(fd.cantidad) as cuenta
from factura_detalle fd
inner join producto p on fd.producto_id = p.id
group by p.id, p.nombre
order by cuenta DESC

--Productos menos vendidos
select p.id, p.nombre, sum(fd.cantidad) as cuenta
from factura_detalle fd
inner join producto p on fd.producto_id = p.id
group by p.id, p.nombre
order by cuenta ASC

--5. Consulta que muestre fecha de emisión de factura, nombre y apellido del cliente, nombres de productos de 
-- esa factura, cantidades compradas, nombre de tipo de factura de una factura específica
select f.fecha_emision, c.nombre as nombre_cliente, c.apellido as apellido_cliente, 
prod.nombre as producto, fd.cantidad as cantidad_producto, ft.nombre as tipo_factura
from factura f
inner join cliente c on c.id = f.cliente_id
inner join factura_detalle fd on f.id = fd.factura_id
inner join producto prod on fd.producto_id = prod.id
inner join factura_tipo ft on f.factura_tipo_id = ft.id
where f.id = 8

--6. Montos de facturas ordenadas según totales
select f.id, sum(fd.cantidad*p.precio) as total
from factura f
inner join factura_detalle fd on fd.factura_id = f.id
inner join producto p on p.id = fd.producto_id
group by f.id
order by total desc

--7. Mostrar el iva 10% de los montos totales de facturas 
-- (suponer que todos los productos tienen IVA 10%)
select f.id, sum(fd.cantidad*p.precio)*0.1 as IVA
from factura f
inner join factura_detalle fd on fd.factura_id = f.id
inner join producto p on p.id = fd.producto_id
group by f.id
order by IVA desc


