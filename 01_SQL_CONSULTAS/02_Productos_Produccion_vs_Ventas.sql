-- =====================================================
-- ANÁLISIS 02 - PRODUCCIÓN VS VENTAS POR PRODUCTO
-- =====================================================
-- Pregunta de negocio:
-- ¿Qué productos tienen más unidades producidas
-- que unidades vendidas y cuál es la diferencia?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================



with info_producion as(
select p.id_producto,
p.nombre_producto,
p.categoria,
sum(pr.cantidad) as unidades_producidas
from productos p
inner join produccion pr 
on p.id_producto = pr.id_producto
group by p.id_producto, p.nombre_producto,p.categoria 
),
info_vendida as (
select 
p.id_producto,
p.nombre_producto,
sum(dt.cantidad) as unidades_vendidas
from productos p
inner join detalle_venta dt 
on p.id_producto = dt.id_producto
group by p.id_producto,p.nombre_producto 
) 
select 
ip.nombre_producto,
ip.categoria,
ip.unidades_producidas,
iv.unidades_vendidas,
ip.unidades_producidas - iv.unidades_vendidas as diferencia 
from info_producion ip 
inner join info_vendida iv 
on ip.id_producto = iv.id_producto 
where ip.unidades_producidas > iv.unidades_vendidas 
order by diferencia desc