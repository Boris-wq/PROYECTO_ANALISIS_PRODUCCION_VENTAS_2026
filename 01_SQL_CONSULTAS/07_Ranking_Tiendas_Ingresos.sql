-- =====================================================
-- ANÁLISIS 07 - RANKING DE TIENDAS POR INGRESOS
-- =====================================================
-- Pregunta de negocio:
-- ¿Cuáles son las 10 tiendas que generan mayores
-- ingresos por ventas durante 2026 y cuántas
-- unidades venden?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

SELECT
    t.id_tienda,
    t.nombre_tienda,
    t.ciudad,
    t.departamento,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.cantidad * dv.precio_unitario) AS ingresos
FROM tiendas t
INNER JOIN ventas v
    ON t.id_tienda = v.id_tienda
INNER JOIN detalle_venta dv
    ON v.id_venta = dv.id_venta
WHERE EXTRACT(YEAR FROM v.fecha) = 2026
GROUP BY
    t.id_tienda,
    t.nombre_tienda,
    t.ciudad,
    t.departamento
ORDER BY ingresos DESC
LIMIT 10;