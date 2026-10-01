-- =====================================================
-- ANÁLISIS 06 - RANKING DE PRODUCTIVIDAD DE EMPLEADOS
-- =====================================================
-- Pregunta de negocio:
-- ¿Cuáles son los 10 empleados con mayor producción
-- durante 2026 y cuál es su cumplimiento promedio?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

SELECT
    e.id_empleado,
    e.nombre,
    e.area,
    COUNT(pr.id_produccion) AS registros_produccion,
    SUM(pr.cantidad) AS unidades_producidas,
    AVG(pr.cumplimiento_pct) AS cumplimiento_promedio
FROM empleados e
INNER JOIN produccion pr
    ON e.id_empleado = pr.id_empleado
WHERE EXTRACT(YEAR FROM pr.fecha) = 2026
GROUP BY
    e.id_empleado,
    e.nombre,
    e.area
ORDER BY unidades_producidas DESC
LIMIT 10;