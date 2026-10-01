-- =====================================================
-- ANÁLISIS 03 - EVOLUCIÓN MENSUAL DE LA PRODUCCIÓN
-- =====================================================
-- Pregunta de negocio:
-- ¿Cómo ha evolucionado la producción mes a mes
-- durante el año 2026 y cuál es el cumplimiento
-- promedio de las metas?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

select 
extract(year from fecha) as año,
extract(month from fecha) as mes,
sum(cantidad) as unidades_producidas,
avg(cumplimiento_pct) as promedio_cumplimiento
from produccion
where extract(year from fecha) = 2026
group by extract(year from fecha) , extract(month from fecha) 
order by mes asc