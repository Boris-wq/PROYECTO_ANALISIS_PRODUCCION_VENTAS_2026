-- =====================================================
-- ANÁLISIS 05 - VENTAS E INGRESOS POR CATEGORÍA
-- =====================================================
-- Pregunta de negocio:
-- ¿Qué categorías generan más unidades vendidas
-- e ingresos durante el año 2026?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

select 
p.categoria,
sum(dv.cantidad) as unidades_vendidas,
sum(dv.cantidad * dv.precio_unitario) as ingresos_generados
from productos p
inner join detalle_venta dv
on p.id_producto = dv.id_producto
inner join ventas v
on v.id_venta = dv.id_venta
where extract(year from v.fecha) = 2026
group by p.categoria
order by ingresos_generados desc