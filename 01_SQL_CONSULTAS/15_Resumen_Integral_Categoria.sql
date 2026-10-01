-- =====================================================
-- ANÁLISIS 15 - RESUMEN INTEGRAL POR CATEGORÍA
-- =====================================================
-- Pregunta de negocio:
-- ¿Cuál es el comportamiento de cada categoría
-- al comparar unidades producidas, metas,
-- cumplimiento, unidades vendidas, ingresos
-- y diferencia entre producción y ventas
-- durante 2026?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

WITH info_produccion AS (
    SELECT
        p.categoria,
        SUM(pr.cantidad) AS unidades_producidas,
        SUM(pr.meta) AS meta_total,
        AVG(pr.cumplimiento_pct) AS cumplimiento_promedio
    FROM productos p
    INNER JOIN produccion pr
        ON p.id_producto = pr.id_producto
    WHERE EXTRACT(YEAR FROM pr.fecha) = 2026
    GROUP BY p.categoria
),
info_ventas AS (
    SELECT
        p.categoria,
        SUM(dv.cantidad) AS unidades_vendidas,
        SUM(dv.cantidad * dv.precio_unitario) AS ingresos
    FROM productos p
    INNER JOIN detalle_venta dv
        ON p.id_producto = dv.id_producto
    INNER JOIN ventas v
        ON v.id_venta = dv.id_venta
    WHERE EXTRACT(YEAR FROM v.fecha) = 2026
    GROUP BY p.categoria
)
SELECT
    ip.categoria,
    ip.unidades_producidas,
    ip.meta_total,
    ip.cumplimiento_promedio,
    iv.unidades_vendidas,
    iv.ingresos,
    ip.unidades_producidas - iv.unidades_vendidas AS diferencia
FROM info_produccion ip
INNER JOIN info_ventas iv
    ON ip.categoria = iv.categoria
ORDER BY diferencia DESC;