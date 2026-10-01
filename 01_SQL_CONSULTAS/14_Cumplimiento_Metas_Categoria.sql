-- =====================================================
-- ANÁLISIS 14 - CUMPLIMIENTO DE METAS POR CATEGORÍA
-- =====================================================
-- Pregunta de negocio:
-- ¿Cuántas unidades se producen, cuáles son las
-- metas totales y cuál es el cumplimiento promedio
-- por categoría durante 2026?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

SELECT
    p.categoria,
    SUM(pr.cantidad) AS unidades_producidas,
    SUM(pr.meta) AS meta_total,
    AVG(pr.cumplimiento_pct) AS cumplimiento_promedio,
    COUNT(pr.id_produccion) AS registros_produccion
FROM productos p
INNER JOIN produccion pr
    ON p.id_producto = pr.id_producto
WHERE EXTRACT(YEAR FROM pr.fecha) = 2026
GROUP BY p.categoria
ORDER BY cumplimiento_promedio DESC;