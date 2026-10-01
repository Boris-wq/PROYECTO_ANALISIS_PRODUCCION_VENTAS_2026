-- =====================================================
-- ANÁLISIS 11 - CUMPLIMIENTO DE METAS POR EMPLEADO
-- =====================================================
-- Pregunta de negocio:
-- ¿Qué empleados alcanzan o superan un cumplimiento
-- promedio del 100 % de sus metas durante 2026,
-- considerando sus registros y producción total?
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
HAVING AVG(pr.cumplimiento_pct) >= 100
ORDER BY cumplimiento_promedio DESC;