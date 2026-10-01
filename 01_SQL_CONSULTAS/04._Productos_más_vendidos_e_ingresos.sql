-- =====================================================
-- ANÁLISIS 04 - PRODUCTOS MÁS VENDIDOS E INGRESOS
-- =====================================================
-- Pregunta de negocio:
-- ¿Cuáles son los productos con mayor cantidad
-- de unidades vendidas y cuántos ingresos generan
-- durante el año 2026?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

SELECT
    p.nombre_producto,
    p.categoria,
    SUM(dv.cantidad) AS unidades_vendidas,
    SUM(dv.cantidad * dv.precio_unitario) AS ingresos_generados
FROM productos p
INNER JOIN detalle_venta dv
    ON p.id_producto = dv.id_producto
INNER JOIN ventas v
    ON dv.id_venta = v.id_venta
WHERE EXTRACT(YEAR FROM v.fecha) = 2026
GROUP BY
    p.id_producto,
    p.nombre_producto,
    p.categoria
ORDER BY unidades_vendidas DESC;