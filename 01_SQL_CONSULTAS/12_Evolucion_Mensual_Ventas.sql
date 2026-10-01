-- =====================================================
-- ANÁLISIS 12 - EVOLUCIÓN MENSUAL DE LAS VENTAS
-- =====================================================
-- Pregunta de negocio:
-- ¿Cómo evolucionan mensualmente las unidades
-- vendidas y los ingresos generados durante 2026?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

SELECT
    EXTRACT(YEAR FROM v.fecha) AS anio,
    EXTRACT(MONTH FROM v.fecha) AS mes,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.cantidad * dv.precio_unitario) AS ingresos
FROM ventas v
INNER JOIN detalle_venta dv
    ON v.id_venta = dv.id_venta
WHERE EXTRACT(YEAR FROM v.fecha) = 2026
GROUP BY
    EXTRACT(YEAR FROM v.fecha),
    EXTRACT(MONTH FROM v.fecha)
ORDER BY
    anio,
    mes;