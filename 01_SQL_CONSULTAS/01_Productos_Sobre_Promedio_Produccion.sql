-- =====================================================
-- ANÁLISIS 01 - PRODUCTOS SOBRE EL PROMEDIO DE PRODUCCIÓN
-- =====================================================
-- Pregunta de negocio:
-- ¿Qué productos tienen una producción total superior
-- al promedio de producción de su categoría?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

with info_producto as(
select 
p.nombre_producto,
p.categoria,
sum(pr.cantidad) as total_producido
from productos p
inner join produccion pr
on p.id_producto = pr.id_producto
group by nombre_producto,categoria
),
info_producida as(
select
v.categoria,
avg(cantidad_total) as promedio_producido_categoria
from(
select
p.nombre_producto,
p.categoria,
sum(pr.cantidad) as cantidad_total
from productos p
inner join produccion pr
on p.id_producto = pr.id_producto
group by p.nombre_producto,p.categoria
) as v
group by  v.categoria
)
select 
ip.nombre_producto,
ip.categoria,
ip.total_producido,
ipr.promedio_producido_categoria
from info_producto ip
inner join info_producida ipr
on ip.categoria = ipr.categoria
where ip.total_producido > ipr.promedio_producido_categoria
order by ip.total_producido desc