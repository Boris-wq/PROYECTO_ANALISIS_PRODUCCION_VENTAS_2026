-- =====================================================
-- ANÁLISIS 10 - VALIDACIÓN DE INTEGRIDAD DE DATOS
-- =====================================================
-- Pregunta de negocio:
-- ¿Existen registros de producción que no tengan
-- un empleado o un producto asociado?
--
-- Herramienta: PostgreSQL / SQL
-- =====================================================

SELECT
    pr.id_produccion,
    pr.fecha,
    pr.id_empleado,
    e.nombre AS nombre_empleado,
    pr.id_producto,
    p.nombre_producto,
    pr.cantidad,
    pr.estado
FROM produccion pr
LEFT JOIN empleados e
    ON pr.id_empleado = e.id_empleado
LEFT JOIN productos p
    ON pr.id_producto = p.id_producto
WHERE
    e.id_empleado IS NULL
    OR p.id_producto IS NULL;