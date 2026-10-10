# Análisis Integral de Producción y Ventas 2026

## 1. Descripción del proyecto

Este proyecto presenta un análisis integral de información de producción y ventas correspondiente al año 2026, utilizando PostgreSQL, SQL y Power BI.

El objetivo principal es transformar datos operativos en información útil para el análisis y la toma de decisiones, evaluando aspectos relacionados con producción, ventas, productividad, cumplimiento de metas, comportamiento por categorías, desempeño de empleados, tiendas, ingresos y rentabilidad estimada.

El proyecto fue desarrollado utilizando una base de datos simulada con información relacionada con empleados, productos, producción, tiendas, ventas y detalle de ventas.

La solución parte desde el análisis y validación de los datos mediante consultas SQL y continúa con la construcción de un modelo de datos y un dashboard interactivo en Power BI.

---

## 2. Objetivo general

Analizar la información de producción y ventas del año 2026 para identificar tendencias, indicadores de desempeño, diferencias entre producción y ventas y oportunidades de análisis que permitan comprender el comportamiento operativo y comercial de la organización.

---

## 3. Objetivos específicos

- Analizar el comportamiento de la producción durante 2026.
- Evaluar el cumplimiento de las metas de producción.
- Identificar los productos con mayor y menor nivel de producción.
- Analizar la productividad de los empleados.
- Identificar categorías con mayores niveles de producción.
- Analizar la evolución mensual de las ventas.
- Identificar los productos más vendidos.
- Analizar los ingresos generados por categoría, ciudad y tienda.
- Comparar las unidades producidas frente a las unidades vendidas.
- Identificar las categorías con mayor brecha entre producción y ventas.
- Analizar indicadores de utilidad y margen estimado.
- Validar la integridad de las relaciones entre las principales tablas de la base de datos.
- Construir un dashboard interactivo que facilite la interpretación de los resultados.

---

## 4. Alcance

El análisis comprende información correspondiente al año 2026 y se concentra principalmente en dos procesos:

### Producción

Se analizan:

- Unidades producidas.
- Metas de producción.
- Cumplimiento de metas.
- Producción por categoría.
- Producción por producto.
- Producción por empleado.
- Evolución mensual de la producción.
- Productividad de empleados.

### Ventas

Se analizan:

- Unidades vendidas.
- Ingresos.
- Ventas por categoría.
- Ventas por producto.
- Ventas por ciudad.
- Ventas por tienda.
- Evolución mensual de las ventas.
- Productos más vendidos.

### Comparación y rentabilidad

También se analiza:

- Producción frente a ventas.
- Brecha entre unidades producidas y vendidas.
- Ingresos estimados.
- Costo estimado vendido.
- Utilidad estimada.
- Margen estimado.

---

## 5. Fuente de datos

Los datos utilizados en el proyecto corresponden a una base de datos simulada creada para fines de aprendizaje, análisis y construcción de portafolio.

La base de datos está estructurada en las siguientes tablas:

- `empleados`
- `productos`
- `produccion`
- `tiendas`
- `ventas`
- `detalle_venta`

Adicionalmente, en Power BI se utiliza una tabla de calendario denominada `Calendario` para facilitar el análisis temporal.

Los datos no representan información real de una empresa.

---

## 6. Herramientas utilizadas

### PostgreSQL

Utilizado como sistema de gestión de base de datos para almacenar y consultar la información.

### SQL

Utilizado para realizar consultas, agregaciones, comparaciones, análisis temporales, validaciones de integridad y análisis de producción y ventas.

### Power BI

Utilizado para construir el modelo de datos, crear medidas, desarrollar visualizaciones y construir el dashboard interactivo.

### DAX

Utilizado para crear medidas y cálculos orientados a indicadores de producción, ventas y rentabilidad.

### Visual Studio Code

Utilizado para organizar y desarrollar las consultas SQL y la documentación del proyecto.

### Git y GitHub

Utilizados para el control de versiones y publicación del proyecto como parte del portafolio profesional.

---

## 7. Estructura general del proyecto

El proyecto se encuentra organizado de la siguiente manera:

```text
PROYECTO_ANALISIS_PRODUCCION_VENTAS_2026
│
├── 01_SQL_CONSULTAS
│   ├── 01_Productos_Sobre_Promedio_Produccion.sql
│   ├── 02_Productos_Produccion_vs_Ventas.sql
│   ├── 03_Evolucion_mensual_de_la_produccion.sql
│   ├── 04_Productos_más_vendidos_e_ingresos.sql
│   ├── 05_Ventas_e_ingresos_por_categoria.sql
│   ├── 06_Ranking_de_productividad_de_empleados.sql
│   ├── 07_Ranking_Tiendas_Ingresos.sql
│   ├── 08_Productos_Sobre_Promedio_Ventas.sql
│   ├── 09_Brecha_Produccion_Ventas_Categoria.sql
│   ├── 10_Validacion_Integridad_Datos.sql
│   ├── 11_Cumplimiento_Metas_Empleado.sql
│   ├── 12_Evolucion_Mensual_Ventas.sql
│   ├── 13_Ingreso_Promedio_Por_Unidad.sql
│   ├── 14_Cumplimiento_Metas_Categoria.sql
│   └── 15_Resumen_Integral_Categoria.sql
│
├── 02_BASE_DATOS
│   └── Diccionario_de_Datos.md
│
├── 03_POWER_BI
│   └── Analisis_Produccion_Ventas_2026.pbix
│
├── 04_DOCUMENTACION
│   ├── 01_Descripcion_del_Proyecto.md
│   ├── 02_Metodologia_y_Arquitectura.md
│   ├── 03_Diccionario_de_Medidas_Power_BI.md
│   └── 04_Hallazgos_y_Conclusiones.md
│
└── 05_PORTAFOLIO
    └── README.md


## 8. Principales preguntas de negocio
El proyecto busca responder preguntas como:
- ¿Cuántas unidades se produjeron durante 2026?
- ¿Cuál fue el nivel promedio de cumplimiento de las metas?
- ¿Qué categorías concentraron la mayor producción?
- ¿Qué productos presentaron mayores niveles de producción?
- ¿Qué empleados registraron mayor productividad?
- ¿Cómo evolucionó la producción durante el año?
- ¿Cuántas unidades fueron vendidas?
- ¿Qué categorías generaron mayores ingresos?
- ¿Qué productos fueron los más vendidos?
- ¿Qué tiendas generaron mayores ingresos?
- ¿Cómo evolucionaron las ventas durante el año?
- ¿Cuál es la diferencia entre las unidades producidas y vendidas?
- ¿Qué categorías presentan las mayores brechas?
- ¿Cuál es la utilidad estimada?
- ¿Cuál es el margen estimado?
- ¿Qué productos presentan mayores niveles de utilidad y margen?

## 9. Resultado del proyecto
El resultado final del proyecto es una solución de análisis que integra:
1. Una base de datos estructurada en PostgreSQL.
2. Un conjunto de 15 análisis desarrollados mediante SQL.
3. Un modelo de datos construido en Power BI.
4. Medidas DAX para los principales indicadores.
5. Un dashboard interactivo dividido en diferentes perspectivas de análisis.
6. Documentación técnica y funcional.
7. Hallazgos y conclusiones derivados de los datos.

El proyecto busca demostrar la capacidad de llevar un proceso de análisis desde los datos almacenados en una base de datos hasta una solución visual orientada a la interpretación de información y apoyo a la toma de decisiones.