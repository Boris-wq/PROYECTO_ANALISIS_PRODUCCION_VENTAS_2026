# 02. Metodología y Arquitectura

## 1. Metodología del proyecto

El proyecto se desarrolló siguiendo un proceso de análisis de datos dividido en diferentes etapas, desde la estructuración de la información hasta la construcción del dashboard en Power BI.

La metodología utilizada fue:

1. Identificación y estructuración de las fuentes de datos.
2. Construcción y revisión de la base de datos en PostgreSQL.
3. Validación de las relaciones entre las tablas.
4. Desarrollo de consultas SQL orientadas a preguntas de negocio.
5. Análisis de producción, ventas, productividad y rentabilidad.
6. Conexión de PostgreSQL con Power BI.
7. Construcción del modelo de datos en Power BI.
8. Creación de medidas DAX para los principales indicadores.
9. Construcción de visualizaciones y dashboards.
10. Interpretación de resultados y generación de hallazgos.
11. Organización y documentación del proyecto para su presentación como portafolio.

El objetivo de esta metodología fue mantener una separación clara entre la etapa de almacenamiento y consulta de datos, la etapa de análisis y modelado y la etapa de visualización e interpretación de resultados.

---

## 2. Arquitectura general

La solución está estructurada utilizando PostgreSQL como sistema de almacenamiento y consulta de datos, SQL como herramienta de análisis y Power BI como herramienta de modelado, cálculo y visualización.

El flujo general del proyecto es:

```text
PostgreSQL
    │
    ├── empleados
    ├── productos
    ├── produccion
    ├── tiendas
    ├── ventas
    └── detalle_venta
          │
          ▼
       SQL
          │
          ├── Análisis de producción
          ├── Análisis de ventas
          ├── Productividad
          ├── Cumplimiento de metas
          ├── Comparación producción vs ventas
          └── Validación de integridad
          │
          ▼
      Power BI
          │
          ├── Modelo de datos
          ├── Medidas DAX
          ├── Indicadores
          ├── Visualizaciones
          └── Dashboard interactivo
          │
          ▼
      Análisis de resultados

Esta arquitectura permite trabajar con los datos desde diferentes niveles: almacenamiento, consulta, análisis, modelado y presentación.

3. Base de datos PostgreSQL
La información utilizada en el proyecto se almacenó en PostgreSQL mediante un conjunto de tablas relacionadas.
Las principales tablas utilizadas fueron:
- empleados
- productos
- produccion
- tiendas
- ventas
- detalle_venta
Cada tabla cumple una función específica dentro del modelo de información.
empleados
Contiene la información relacionada con los empleados de la organización, incluyendo identificación, nombre, cargo, área, jornada, fecha de ingreso, salario y estado.
productos
Contiene la información de los productos, incluyendo categoría, marca, costo de producción, precio de venta, stock mínimo y estado.
produccion
Registra las operaciones de producción realizadas, incluyendo fecha, empleado responsable, producto, operación, cantidad producida, meta establecida, porcentaje de cumplimiento y estado.
tiendas
Contiene la información de las tiendas, incluyendo código, nombre, ciudad, departamento, país, fecha de apertura y estado.
ventas
Contiene la información general de las ventas, incluyendo número de factura, fecha, empleado responsable, tienda, método de pago y estado.
detalle_venta
Contiene el detalle de los productos incluidos en cada venta, incluyendo cantidad, precio unitario, descuento y subtotal.

4. Relaciones entre las tablas
Las relaciones entre las tablas permiten conectar la información de producción, empleados, productos, ventas y tiendas.
Las principales relaciones utilizadas son:
empleados
    │
    ├──────────────► produccion
    │
    └──────────────► ventas

productos
    │
    ├──────────────► produccion
    │
    └──────────────► detalle_venta

tiendas
    │
    └──────────────► ventas

ventas
    │
    └──────────────► detalle_venta

Las relaciones principales son:
- empleados.id_empleado → produccion.id_empleado
- productos.id_producto → produccion.id_producto
- tiendas.id_tienda → ventas.id_tienda
- empleados.id_empleado → ventas.id_empleado
- ventas.id_venta → detalle_venta.id_venta
- productos.id_producto → detalle_venta.id_producto
Estas relaciones permiten analizar la información desde diferentes perspectivas, por ejemplo:
- Producción por empleado.
- Producción por producto.
- Producción por categoría.
- Ventas por tienda.
- Ventas por ciudad.
- Ventas por producto.
- Ventas por categoría.
- Comparación entre unidades producidas y unidades vendidas.

5. Consultas SQL
Como parte del proyecto se desarrollaron 15 análisis mediante SQL.
Las consultas fueron construidas a partir de preguntas de negocio y permitieron analizar diferentes aspectos de la operación.
Los análisis desarrollados fueron:
1. Productos sobre el promedio de producción de su categoría.
2. Productos con comparación entre producción y ventas.
3. Evolución mensual de la producción.
4. Productos más vendidos e ingresos.
5. Ventas e ingresos por categoría.
6. Ranking de productividad de empleados.
7. Ranking de tiendas por ingresos.
8. Productos sobre el promedio de ventas de su categoría.
9. Brecha entre producción y ventas por categoría.
10. Validación de integridad de datos.
11. Cumplimiento de metas por empleado.
12. Evolución mensual de las ventas.
13. Ingreso promedio por unidad.
14. Cumplimiento de metas por categoría.
15. Resumen integral por categoría.
Estas consultas permitieron aplicar diferentes elementos de SQL, entre ellos:
- SELECT
- WHERE
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- Funciones de agregación.
- Subconsultas.
- CTE mediante WITH.
- Comparaciones contra promedios.
- Análisis temporal.
- Integración de información proveniente de diferentes tablas.
Las consultas SQL se conservaron dentro del repositorio como parte de la documentación técnica y como evidencia del proceso de análisis realizado.

6. Conexión entre PostgreSQL y Power BI
Después de realizar los análisis SQL, la información de PostgreSQL fue conectada directamente con Power BI.
Power BI se utilizó para construir un modelo de datos que permitiera analizar la información de manera interactiva.
Las tablas utilizadas en Power BI fueron:
- Calendario
- public empleados
- public productos
- public produccion
- public tiendas
- public ventas
- public detalle_venta
La tabla Calendario se incorporó para facilitar el análisis temporal de la información y permitir la construcción de análisis por año, mes y periodo.

7. Modelo de datos en Power BI
El modelo de Power BI utiliza las relaciones existentes entre las diferentes entidades del negocio.
La estructura permite conectar las dimensiones de empleados, productos, tiendas y calendario con la información transaccional de producción y ventas.
La relación conceptual puede representarse de la siguiente manera:
                         Calendario
                       /           \
                      ▼             ▼
                 Producción       Ventas
                    ▲                │
                    │                ▼
                Empleados       Detalle_Venta
                    ▲                ▲
                    │                │
                    └──── Productos ─┘

                         Tiendas
                            │
                            ▼
                          Ventas

El modelo evita relacionar directamente las tablas de producción y detalle de ventas entre sí.
Esto es importante porque ambas contienen registros a diferentes niveles y una relación directa podría generar duplicación de valores al realizar determinados cálculos.
En su lugar, la comparación entre producción y ventas se realiza mediante medidas y dimensiones comunes, principalmente productos, categorías y tiempo.

8. Tabla calendario
Se creó una tabla calendario para facilitar el análisis temporal.
La tabla contiene campos como:
- Date
- Mes
- Mes_Año
- NumeroMes
El campo NumeroMes permite ordenar correctamente los meses cronológicamente cuando se utiliza Mes_Año en las visualizaciones.
La tabla calendario se relaciona con las fechas de las tablas transaccionales y permite construir análisis como:
- Evolución mensual de la producción.
- Evolución mensual de las ventas.
- Comparación de resultados por periodo.
- Análisis de tendencias durante 2026.
La tabla fue configurada en Power BI como tabla de fechas para utilizar correctamente sus funciones y capacidades de análisis temporal.

9. Medidas DAX
Además de las consultas SQL, se utilizaron medidas DAX dentro de Power BI para construir los principales indicadores del dashboard.
Entre las medidas desarrolladas se encuentran indicadores relacionados con:
- Unidades producidas.
- Unidades vendidas.
- Meta total.
- Registros de producción.
- Cumplimiento promedio.
- Ingresos totales.
- Costo estimado vendido.
- Utilidad estimada.
- Margen estimado.
- Brecha entre producción y ventas.
Las medidas DAX permiten que los indicadores respondan dinámicamente a los filtros y segmentaciones aplicados en el dashboard.
Esto permite analizar la información por diferentes dimensiones sin tener que modificar las consultas SQL originales.

10. Nivel de análisis
El proyecto trabaja con diferentes niveles de granularidad.
Nivel de producción
Permite analizar:
- Producción por fecha.
- Producción por producto.
- Producción por categoría.
- Producción por empleado.
- Cumplimiento de metas.
Nivel de ventas
Permite analizar:
- Unidades vendidas.
- Ingresos.
- Productos vendidos.
- Categorías.
- Tiendas.
- Ciudades.
- Evolución mensual.
Nivel comparativo
Permite analizar:
- Unidades producidas frente a unidades vendidas.
- Brecha entre producción y ventas.
- Categorías con mayor diferencia entre producción y ventas.
Nivel de rentabilidad estimada
Permite analizar:
- Ingresos.
- Costos estimados.
- Utilidad estimada.
- Margen estimado.
- Utilidad por producto.
- Utilidad por categoría.
- Margen estimado por producto.

11. Dashboard en Power BI
El dashboard fue organizado en cuatro páginas principales para facilitar la lectura y navegación de la información.
Resumen ejecutivo
Presenta los principales indicadores generales del negocio y permite obtener una visión rápida del comportamiento de producción y ventas.
Incluye indicadores y visualizaciones relacionadas con:
- Unidades producidas.
- Unidades vendidas.
- Ingresos.
- Costos estimados.
- Utilidad estimada.
- Margen estimado.
- Evolución mensual.
- Producción frente a ventas.
- Brecha por categoría.
- Hallazgos clave.
Producción
Se enfoca en el comportamiento de la producción y el cumplimiento de metas.
Incluye:
- Unidades producidas.
- Meta total.
- Registros de producción.
- Cumplimiento promedio.
- Producción por categoría.
- Cumplimiento promedio por categoría.
- Productos con mayor producción.
- Empleados con mayor producción.
- Producción y cumplimiento por empleado.
Ventas
Se enfoca en el comportamiento comercial.
Incluye:
- Unidades vendidas.
- Ingresos.
- Evolución mensual de las ventas.
- Ingresos por ciudad.
- Ingresos por categoría.
- Productos más vendidos.
- Tiendas con mayores ingresos.
Productos y rentabilidad
Se enfoca en el comportamiento económico estimado de los productos.
Incluye:
- Ingresos.
- Costo estimado.
- Utilidad estimada.
- Margen estimado.
- Productos con mayor utilidad.
- Productos con mayor margen.
- Utilidad estimada por categoría.

12. Principio utilizado para la comparación entre producción y ventas
Uno de los principales aspectos técnicos del proyecto fue evitar la combinación directa de los registros detallados de producción y ventas.
La producción y las ventas contienen múltiples registros asociados a productos y categorías. Si ambas tablas se relacionaran directamente sin realizar una agregación previa, los registros podrían multiplicarse y generar resultados incorrectos.
Por esta razón, en los análisis SQL se trabajó con agregaciones previas al nivel necesario y posteriormente se realizaron las comparaciones.
El mismo principio se mantuvo en el modelo de Power BI mediante las relaciones entre dimensiones y tablas transaccionales.
Esto permitió obtener comparaciones consistentes entre:
- Unidades producidas.
- Unidades vendidas.
- Brecha de producción y ventas.

13. Validación de datos
Antes de realizar los análisis finales se realizaron validaciones para comprobar la consistencia de la información.
Entre las validaciones realizadas se encuentran:
- Comprobación de registros de producción sin empleado asociado.
- Comprobación de registros de producción sin producto asociado.
- Revisión de relaciones entre tablas.
- Validación de los resultados obtenidos mediante SQL.
- Comparación de los indicadores obtenidos en SQL con los resultados mostrados en Power BI.
La consulta de validación de integridad de datos no encontró registros huérfanos en la relación entre producción, empleados y productos.

14. Flujo final de trabajo
El flujo completo utilizado en el proyecto puede resumirse de la siguiente manera:
Datos
  │
  ▼
PostgreSQL
  │
  ▼
Modelo relacional
  │
  ▼
Consultas SQL
  │
  ▼
Análisis de negocio
  │
  ▼
Conexión con Power BI
  │
  ▼
Modelo de datos
  │
  ▼
Medidas DAX
  │
  ▼
Visualizaciones
  │
  ▼
Dashboard interactivo
  │
  ▼
Hallazgos y conclusiones

Esta estructura permite demostrar un flujo completo de trabajo de análisis de datos, desde la gestión de información en una base de datos hasta la presentación de resultados mediante una herramienta de Business Intelligence.

15. Resultado de la metodología
La metodología permitió construir una solución integral en la que cada herramienta cumple una función específica:
- PostgreSQL se utilizó para almacenar y gestionar la información.
- SQL se utilizó para consultar, validar y analizar los datos.
- Power BI se utilizó para modelar, calcular y visualizar los indicadores.
- DAX se utilizó para construir medidas dinámicas.
- Visual Studio Code se utilizó para organizar las consultas SQL y la documentación.
- Git y GitHub se utilizarán para el control de versiones y publicación del proyecto como portafolio.

De esta manera, el proyecto no se limita a la creación de un dashboard, sino que representa un flujo completo de análisis de datos orientado a resolver preguntas de negocio, generar indicadores y facilitar la interpretación de la información.