-- =====================================================
-- ANÁLISIS 13 - INGRESO PROMEDIO POR UNIDAD
-- =====================================================
-- Pregunta de negocio:
-- ¿Cuál es el ingreso promedio por unidad vendida
-- para cada producto durante 2026?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

SELECT
    p.id_producto,
    p.nombre_producto,
    p.categoria,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.cantidad * dv.precio_unitario) AS ingresos,
    SUM(dv.cantidad * dv.precio_unitario)
        / NULLIF(SUM(dv.cantidad), 0) AS ingreso_promedio_unidad
FROM productos p
INNER JOIN detalle_venta dv
    ON p.id_producto = dv.id_producto
INNER JOIN ventas v
    ON v.id_venta = dv.id_venta
WHERE EXTRACT(YEAR FROM v.fecha) = 2026
GROUP BY
    p.id_producto,
    p.nombre_producto,
    p.categoria
ORDER BY ingresos DESC;