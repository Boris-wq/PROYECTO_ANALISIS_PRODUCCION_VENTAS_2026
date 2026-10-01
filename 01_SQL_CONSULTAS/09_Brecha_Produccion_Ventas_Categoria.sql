-- =====================================================
-- ANÁLISIS 09 - BRECHA DE PRODUCCIÓN Y VENTAS
-- POR CATEGORÍA
-- =====================================================
-- Pregunta de negocio:
-- ¿Cuál es la diferencia entre las unidades
-- producidas y las unidades vendidas por categoría
-- durante 2026?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

WITH info_producida AS (
    SELECT
        p.categoria,
        SUM(pr.cantidad) AS unidades_producidas
    FROM productos p
    INNER JOIN produccion pr
        ON p.id_producto = pr.id_producto
    WHERE EXTRACT(YEAR FROM pr.fecha) = 2026
    GROUP BY p.categoria
),
info_venta AS (
    SELECT
        p.categoria,
        SUM(dv.cantidad) AS unidades_vendidas
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
    iv.unidades_vendidas,
    ip.unidades_producidas - iv.unidades_vendidas AS diferencia
FROM info_producida ip
INNER JOIN info_venta iv
    ON ip.categoria = iv.categoria
ORDER BY diferencia DESC;