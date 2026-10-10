# 04. Hallazgos y Conclusiones

## 1. Introducción

El análisis integral de producción y ventas permitió identificar diferentes comportamientos relacionados con la capacidad productiva, el cumplimiento de metas, el comportamiento comercial y la rentabilidad estimada de los productos.

Los resultados fueron obtenidos a partir de la información almacenada en PostgreSQL y posteriormente analizada mediante consultas SQL, medidas DAX y visualizaciones desarrolladas en Power BI.

El análisis permite observar tanto el comportamiento general del negocio como las diferencias existentes entre las unidades producidas y las unidades vendidas.

---

## 2. Resultados generales del proyecto

De acuerdo con los indicadores construidos en Power BI, el modelo presenta los siguientes resultados generales:

| Indicador | Resultado |
|---|---:|
| Unidades producidas | Aproximadamente 420.000 |
| Unidades vendidas | Aproximadamente 38.000 |
| Meta total de producción | Aproximadamente 426.000 |
| Registros de producción | Aproximadamente 10.000 |
| Cumplimiento promedio | Aproximadamente 106 % |
| Ingresos totales | Aproximadamente $18.000 millones |
| Costo estimado | Aproximadamente $10.000 millones |
| Utilidad estimada | Aproximadamente $8.000 millones |
| Margen estimado | Aproximadamente 46 % |

Los valores corresponden al conjunto de datos utilizado para el proyecto y deben interpretarse dentro del contexto de la información simulada disponible.

---

## 3. Hallazgos relacionados con la producción

Uno de los principales resultados del análisis corresponde al volumen de producción registrado durante el periodo analizado.

La producción acumulada se encuentra alrededor de las **420.000 unidades**, mientras que la meta acumulada se encuentra alrededor de las **426.000 unidades**.

A pesar de existir una diferencia entre ambos valores acumulados, el indicador de cumplimiento promedio se encuentra alrededor del **106 %**.

Esto muestra que el comportamiento de cumplimiento puede variar entre los diferentes registros, empleados, productos y periodos.

Por esta razón, el análisis del cumplimiento promedio complementa la comparación entre la producción total y la meta acumulada.

---

## 4. Producción por categoría

El análisis por categoría permitió identificar diferencias importantes en el volumen de producción.

Las categorías con mayor participación en la producción fueron:

| Categoría | Producción aproximada |
|---|---:|
| Colchones | 146.184 |
| Ropa de cama | 105.705 |
| Camas | 86.556 |
| Sábanas | 40.637 |
| Protectores | 21.610 |
| Almohadas | 19.338 |

La categoría **Colchones** presenta el mayor volumen de producción, seguida por **Ropa de cama** y **Camas**.

Esto indica que estas categorías concentran una parte importante de la capacidad productiva representada en el conjunto de datos.

---

## 5. Comportamiento mensual de la producción

El análisis temporal permitió observar variaciones en el volumen de producción durante los meses disponibles en el conjunto de datos.

La producción mensual se mantiene en un rango aproximado entre **38.000 y 51.000 unidades**, aunque existen diferencias entre los diferentes periodos.

Uno de los periodos con mayor producción corresponde aproximadamente al mes de **marzo**, con un volumen cercano a las 51.000 unidades.

Este comportamiento demuestra la importancia de utilizar una dimensión calendario para analizar la evolución de los indicadores a través del tiempo.

---

## 6. Comparación entre producción y ventas

Uno de los principales hallazgos del proyecto corresponde a la diferencia existente entre las unidades producidas y las unidades vendidas.

El modelo registra aproximadamente:


Producción: 420.000 unidades
Ventas:      38.000 unidades


La diferencia es considerable y representa una brecha importante entre la actividad productiva y el volumen comercializado.
Este resultado puede ser utilizado como indicador para analizar la relación entre producción y demanda.
Sin embargo, es importante aclarar que esta diferencia no permite afirmar por sí sola que exista un inventario acumulado, debido a que el modelo no contiene información suficiente sobre:
- Inventario inicial.
- Inventario final.
- Entradas de inventario.
- Salidas de inventario.
- Devoluciones.
- Pérdidas.
- Ajustes de inventario.
Por lo tanto, la brecha debe interpretarse como una diferencia entre unidades producidas y unidades vendidas dentro del modelo analizado.

7. Brecha por categoría
El análisis de la brecha entre producción y ventas permitió identificar que algunas categorías presentan diferencias considerablemente mayores que otras.
La categoría Colchones presenta la mayor brecha, con aproximadamente:
132.959 unidades

También se observan diferencias importantes en otras categorías:
Categoría	Brecha aproximada
Colchones	132.959
Ropa de cama	96.190
Camas	79.214
Sábanas	37.078
Protectores	19.659
Almohadas	17.389


Estos resultados permiten identificar las categorías que requieren mayor atención al momento de comparar capacidad productiva y comportamiento comercial.

8. Hallazgos relacionados con las ventas
El modelo registra aproximadamente 38.000 unidades vendidas durante el periodo analizado.
El valor total de los ingresos se encuentra alrededor de $18.000 millones.
El análisis de ventas permitió identificar diferencias entre las categorías, productos, tiendas y ciudades.
Esto permite utilizar Power BI no solamente para conocer cuánto se vende, sino también para analizar dónde, cuándo y qué productos generan mayor participación en los ingresos.

9. Ingresos por categoría
El análisis de ingresos permitió identificar que las categorías con mayor generación de ingresos son principalmente:
1. Camas.
2. Colchones.
3. Ropa de cama.
La categoría Camas presenta el mayor nivel de ingresos, con aproximadamente $6.100 millones.
Le siguen:
- Colchones: aproximadamente $5.000 millones.
- Ropa de cama: aproximadamente $4.900 millones.
- Protectores: aproximadamente $1.200 millones.
- Almohadas: aproximadamente $600 millones.
- Sábanas: aproximadamente $400 millones.
Este resultado demuestra que el volumen de producción no necesariamente determina por sí solo la generación de ingresos.
Una categoría puede tener un volumen de producción menor y, dependiendo del precio de venta y del comportamiento de la demanda, generar ingresos importantes.

10. Análisis de rentabilidad estimada
El dashboard presenta una estimación de costos, utilidad y margen basada en los datos disponibles.
Los resultados generales son aproximadamente:
Ingresos:          $18.000 millones
Costo estimado:    $10.000 millones
Utilidad estimada:  $8.000 millones
Margen estimado:          46 %

Estos indicadores permiten realizar una aproximación de la rentabilidad de los productos y categorías.
La utilidad estimada se obtiene mediante la diferencia entre los ingresos y el costo estimado asociado a las unidades vendidas.
El margen estimado permite comparar la rentabilidad relativa de los productos y categorías.

11. Consideración sobre la rentabilidad
La rentabilidad presentada en el proyecto debe entenderse como una estimación analítica y no como un resultado financiero o contable oficial.
El cálculo utiliza la información disponible de:
- Cantidad vendida.
- Precio de venta.
- Costo de producción.
El modelo no contempla todos los costos que podrían intervenir en un estado financiero real, como:
- Gastos administrativos.
- Gastos de distribución.
- Impuestos.
- Nómina.
- Gastos comerciales.
- Gastos financieros.
- Otros costos indirectos.
Por esta razón, los valores de utilidad y margen sirven principalmente para realizar análisis comparativos dentro del conjunto de datos.

12. Productos y desempeño comercial
El análisis de productos permitió construir rankings utilizando diferentes indicadores.
Entre los principales análisis desarrollados se encuentran:
- Productos con mayor volumen de producción.
- Productos con mayor volumen de ventas.
- Productos con mayores ingresos.
- Productos con mayor utilidad estimada.
- Productos con mayor margen estimado.
- Productos cuya producción se encuentra por encima del promedio de su categoría.
- Productos cuya producción presenta diferencias significativas frente a las ventas.
Estos rankings permiten identificar productos relevantes desde diferentes perspectivas y evitan limitar el análisis únicamente al volumen de unidades.

13. Análisis de tiendas y ciudades
El modelo también permitió analizar el comportamiento comercial de las diferentes tiendas y ciudades.
A partir de las ventas registradas fue posible construir rankings de tiendas según los ingresos generados.
Entre las ciudades con mayor participación en los ingresos se encuentran:
- Bogotá.
- Bucaramanga.
- Valledupar.
Este análisis permite identificar diferencias geográficas en el comportamiento comercial y puede utilizarse como punto de partida para analizar oportunidades de crecimiento o estrategias comerciales.

14. Hallazgos principales
A partir de los análisis realizados se identifican los siguientes hallazgos principales:
Hallazgo 1. Alta capacidad productiva
El modelo registra aproximadamente 420.000 unidades producidas, lo que representa un volumen considerable de producción dentro del periodo analizado.
Hallazgo 2. Diferencia significativa entre producción y ventas
Las aproximadamente 420.000 unidades producidas contrastan con las aproximadamente 38.000 unidades vendidas.
Esta diferencia representa uno de los principales puntos de análisis del proyecto.
Hallazgo 3. Colchones concentra la mayor producción
La categoría Colchones representa el mayor volumen de producción, con aproximadamente 146.184 unidades.
Hallazgo 4. Colchones presenta la mayor brecha
La categoría Colchones también presenta la mayor diferencia entre producción y ventas, con aproximadamente 132.959 unidades.
Hallazgo 5. Camas lidera los ingresos
Aunque Colchones presenta el mayor volumen de producción, la categoría Camas presenta el mayor nivel de ingresos, con aproximadamente $6.100 millones.
Esto demuestra que producción e ingresos representan dimensiones diferentes del desempeño empresarial.
Hallazgo 6. Buen nivel de cumplimiento promedio
El cumplimiento promedio de las metas de producción se encuentra alrededor del 106 %, indicando un comportamiento favorable frente a las metas registradas.
Hallazgo 7. Rentabilidad estimada positiva
El modelo presenta aproximadamente $8.000 millones de utilidad estimada, con un margen estimado cercano al 46 %.
Este resultado muestra una relación favorable entre ingresos y costo estimado dentro del modelo.

15. Interpretación empresarial
Los resultados permiten identificar varios aspectos que podrían ser relevantes para la toma de decisiones.
En primer lugar, la diferencia entre producción y ventas puede justificar un análisis más profundo de la demanda, los niveles de inventario y la planificación de la producción.
En segundo lugar, las categorías con mayor producción no necesariamente son las que generan mayores ingresos. El caso de Colchones y Camas demuestra la importancia de analizar simultáneamente volumen, precio e ingresos.
En tercer lugar, el análisis de rentabilidad permite identificar productos y categorías que pueden tener un mejor desempeño económico relativo.
Finalmente, el análisis por tienda y ciudad permite complementar la visión general del negocio con una perspectiva geográfica.

16. Recomendaciones derivadas del análisis
A partir de los resultados obtenidos se plantean las siguientes recomendaciones analíticas:
16.1. Analizar la brecha entre producción y ventas
Se recomienda profundizar en las categorías que presentan mayores diferencias entre unidades producidas y vendidas.
La categoría Colchones debería ser uno de los principales puntos de análisis debido a su elevada brecha.
16.2. Incorporar información de inventarios
Para determinar si la producción no vendida realmente corresponde a inventario, sería necesario incorporar información histórica de inventarios.
Esto permitiría analizar:
- Inventario inicial.
- Inventario final.
- Rotación.
- Entradas.
- Salidas.
- Días de inventario.
16.3. Analizar la demanda
La información de ventas puede utilizarse para identificar patrones de demanda por:
- Producto.
- Categoría.
- Ciudad.
- Tienda.
- Mes.
Este análisis podría ayudar a mejorar la planificación de la producción.
16.4. Priorizar productos rentables
Los productos con mayores niveles de utilidad y margen estimado pueden utilizarse como referencia para futuros análisis comerciales.
16.5. Complementar el análisis financiero
Para obtener una rentabilidad más cercana a un escenario empresarial real, sería necesario incorporar otros costos y gastos que actualmente no forman parte del modelo.

17. Limitaciones del análisis
El proyecto presenta algunas limitaciones que deben tenerse en cuenta al interpretar los resultados.
17.1. Datos simulados
La información utilizada corresponde a un conjunto de datos ficticio o simulado.
Por lo tanto, los resultados no representan el comportamiento real de una empresa.
17.2. Información de inventarios
El modelo no contiene un sistema completo de inventarios.
Por esta razón, la diferencia entre producción y ventas no puede interpretarse directamente como inventario disponible.
17.3. Rentabilidad estimada
Los cálculos de costo, utilidad y margen son estimaciones basadas en los campos disponibles.
No representan estados financieros oficiales.
17.4. Periodo de información
El análisis corresponde al periodo cubierto por los registros disponibles en la base de datos.
La información de producción y ventas no representa necesariamente todo el año calendario si no existen registros para todos los meses.

18. Conclusiones
El proyecto permitió construir un proceso completo de análisis de datos partiendo desde una base de datos estructurada en PostgreSQL hasta un dashboard interactivo desarrollado en Power BI.
El uso de SQL permitió realizar consultas orientadas a diferentes preguntas de negocio, mientras que Power BI permitió transformar los resultados en indicadores, gráficos y filtros interactivos.
Uno de los principales resultados fue identificar una diferencia significativa entre el volumen producido y el volumen vendido. Esta situación representa una oportunidad para profundizar en el análisis de inventarios, demanda y planificación de producción.
También se identificó que Colchones es la categoría con mayor volumen de producción y mayor brecha frente a las ventas, mientras que Camas presenta el mayor nivel de ingresos.
El análisis también permitió estimar indicadores de costo, utilidad y margen, proporcionando una perspectiva adicional sobre el desempeño económico de los productos.
En términos generales, el proyecto demuestra cómo la integración de PostgreSQL, SQL, Power BI y DAX permite convertir datos operativos en información útil para el análisis y la toma de decisiones.

19. Resultado final del proyecto
El resultado final está compuesto por:
- Base de datos estructurada en PostgreSQL.
- Modelo relacional con tablas de producción, ventas, productos, empleados y tiendas.
- Consultas SQL orientadas a preguntas de negocio.
- Validaciones de integridad de datos.
- Modelo de datos en Power BI.
- Tabla calendario.
- Medidas DAX.
- Dashboard ejecutivo.
- Análisis de producción.
- Análisis de ventas.
- Análisis de productos y rentabilidad.
- Documentación técnica y analítica.
El proyecto integra diferentes etapas del proceso de análisis de datos, desde la preparación y consulta de la información hasta la visualización y comunicación de resultados.

20. Cierre
El proyecto Análisis Integral de Producción y Ventas 2026 constituye un ejercicio práctico de análisis de datos orientado a la integración de bases de datos, SQL, modelado de información, DAX y visualización empresarial.
La solución permite demostrar competencias en:
- Manejo de bases de datos.
- Consultas SQL.
- Análisis de datos.
- Modelado relacional.
- Power BI.
- DAX.
- Construcción de indicadores KPI.
- Análisis de producción.
- Análisis comercial.
- Análisis de rentabilidad.
- Interpretación de resultados.
- Documentación de proyectos de datos.
El resultado final proporciona una visión integral del comportamiento de la producción y las ventas y establece una base sólida para futuras ampliaciones del proyecto.