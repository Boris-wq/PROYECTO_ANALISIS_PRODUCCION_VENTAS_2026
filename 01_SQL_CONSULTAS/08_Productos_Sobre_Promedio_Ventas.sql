-- =====================================================
-- ANÁLISIS 08 - PRODUCTOS SOBRE EL PROMEDIO DE VENTAS
-- =====================================================
-- Pregunta de negocio:
-- ¿Qué productos tienen una cantidad de unidades
-- vendidas superior al promedio de ventas de
-- su categoría durante 2026?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

WITH info_producto AS (
    SELECT
        p.id_producto,
        p.nombre_producto,
        p.categoria,
        SUM(dv.cantidad) AS unidades_vendidas
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
),
info_categoria AS (
    SELECT
        categoria,
        AVG(unidades_vendidas) AS promedio_categoria
    FROM (
        SELECT
            p.id_producto,
            p.categoria,
            SUM(dv.cantidad) AS unidades_vendidas
        FROM productos p
        INNER JOIN detalle_venta dv
            ON p.id_producto = dv.id_producto
        INNER JOIN ventas v
            ON v.id_venta = dv.id_venta
        WHERE EXTRACT(YEAR FROM v.fecha) = 2026
        GROUP BY
            p.id_producto,
            p.categoria
    ) AS ventas_producto
    GROUP BY categoria
)
SELECT
    ip.nombre_producto,
    ip.categoria,
    ip.unidades_vendidas,
    ic.promedio_categoria,
    ip.unidades_vendidas - ic.promedio_categoria AS diferencia
FROM info_producto ip
INNER JOIN info_categoria ic
    ON ip.categoria = ic.categoria
WHERE ip.unidades_vendidas > ic.promedio_categoria
ORDER BY diferencia DESC;