# 03. Diccionario de Medidas Power BI

## 1. Descripción

Este documento contiene el diccionario de medidas utilizadas en el modelo de Power BI del proyecto **Análisis Integral de Producción y Ventas 2026**.

Las medidas fueron creadas mediante DAX y permiten calcular indicadores de producción, ventas, ingresos, costos, rentabilidad y comparación entre unidades producidas y unidades vendidas.

El uso de medidas permite que los indicadores respondan dinámicamente a los filtros aplicados en el informe, como fechas, categorías, productos, empleados, tiendas y ciudades.

---

## 2. Medidas de Producción

### 2.1. Unidades producidas

**Medida:** `Unidades producidas`

**Tabla principal:** `produccion`

**Campo utilizado:** `cantidad`

**Descripción:**

Calcula la cantidad total de unidades producidas dentro del contexto de filtros seleccionado en Power BI.

**Cálculo conceptual:**

Unidades producidas = SUM(cantidad)

Esta medida se utiliza principalmente en:
- Tarjetas KPI.
- Gráficos de producción mensual.
- Producción por categoría.
- Producción por producto.
- Comparaciones entre producción y ventas.

2.2. Meta Total
Medida: Meta Total
Tabla principal: produccion
Campo utilizado: meta
Descripción:
Calcula la suma de las metas de producción registradas para los diferentes empleados, productos y periodos.
Cálculo conceptual:
Meta Total = SUM(meta)

Esta medida permite comparar la producción realizada frente a la meta establecida.

2.3. Registros Producción
Medida: Registros Produccion
Tabla principal: produccion
Campo utilizado: id_produccion
Descripción:
Cuenta la cantidad de registros de producción existentes dentro del contexto de filtros seleccionado.
Cálculo conceptual:
Registros Produccion = COUNT(id_produccion)

Esta medida permite conocer el volumen de registros analizados y sirve como indicador de control sobre la información de producción.

2.4. Cumplimiento promedio
Medida: Cumplimiento promedio
Tabla principal: produccion
Campo utilizado: cumplimiento_pct
Descripción:
Calcula el promedio del porcentaje de cumplimiento registrado en las operaciones de producción.
Cálculo conceptual:
Cumplimiento promedio = AVERAGE(cumplimiento_pct)

Esta medida permite analizar el nivel promedio de cumplimiento de las metas de producción.
Un valor superior a 100 indica que, en promedio, se produjo una cantidad superior a la meta establecida.

3. Medidas de Ventas

3.1. Unidades Vendidas
Medida: Unidades Vendidas
Tabla principal: detalle_venta
Campo utilizado: cantidad
Descripción:
Calcula la cantidad total de unidades vendidas en las transacciones registradas.
Cálculo conceptual:
Unidades Vendidas = SUM(cantidad)

Esta medida se utiliza para:
- Analizar el comportamiento mensual de las ventas.
- Comparar unidades vendidas por categoría.
- Identificar productos con mayor volumen de ventas.
- Comparar producción frente a ventas.

3.2. Ingresos Totales
Medida: Ingresos Totales
Tabla principal: detalle_venta
Descripción:
Representa el valor total generado por las ventas dentro del contexto seleccionado.
El cálculo considera las unidades vendidas y el precio unitario registrado en cada detalle de venta.
Cálculo conceptual:
Ingresos Totales =
SUM(cantidad × precio_unitario)

Esta medida permite analizar los ingresos:
- Por producto.
- Por categoría.
- Por ciudad.
- Por tienda.
- Por periodo.
- Por vendedor o empleado relacionado con la venta.

4. Medidas de Costos

4.1. Costo Estimado
Medida: Costo Estimado
Tablas relacionadas: detalle_venta y productos
Descripción:
Calcula un costo estimado asociado a las unidades vendidas utilizando el costo de producción registrado para cada producto.
El objetivo de esta medida es permitir una aproximación de la rentabilidad generada por las ventas.
Cálculo conceptual:
Costo Estimado =
SUM(cantidad vendida × costo de producción)

El resultado representa una estimación y no debe interpretarse como un costo contable oficial de la empresa.

5. Medidas de Rentabilidad

5.1. Utilidad Estimada
Medida: Utilidad Estimada
Descripción:
Calcula una utilidad estimada a partir de la diferencia entre los ingresos generados por las ventas y el costo estimado de los productos vendidos.
Cálculo conceptual:
Utilidad Estimada =
Ingresos Totales - Costo Estimado

Esta medida permite identificar las categorías y productos que generan mayor aporte económico estimado.

5.2. Margen Estimado
Medida: Margen Estimado
Descripción:
Calcula el porcentaje de margen estimado obtenido a partir de la relación entre la utilidad estimada y los ingresos totales.
Cálculo conceptual:
Margen Estimado =
Utilidad Estimada / Ingresos Totales

El resultado permite comparar la rentabilidad relativa entre productos y categorías, independientemente de su volumen de ventas.

6. Medidas de Comparación Producción vs. Ventas

6.1. Brecha Producción - Ventas
Medida: Brecha Producción - Ventas
Descripción:
Permite identificar la diferencia entre las unidades producidas y las unidades vendidas.
Cálculo conceptual:
Brecha Producción - Ventas =
Unidades producidas - Unidades vendidas

Un resultado positivo indica que se produjeron más unidades de las que fueron vendidas dentro del periodo o contexto seleccionado.
Esta medida se utiliza para identificar categorías o productos con una diferencia significativa entre producción y ventas.

6.2. Relación Producción vs. Ventas
La comparación entre producción y ventas permite analizar si el volumen producido está acompañado por un nivel equivalente de demanda.
Esta comparación se realiza principalmente mediante:
- Unidades producidas.
- Unidades vendidas.
- Brecha entre producción y ventas.
- Análisis por categoría.
- Análisis por producto.
- Evolución mensual.
Es importante aclarar que una brecha positiva entre producción y ventas no significa automáticamente que exista inventario acumulado, debido a que el modelo no contiene información histórica de inventario inicial, inventario final, entradas, salidas o movimientos de inventario.
Por esta razón, la brecha se interpreta como un indicador de diferencia entre producción y ventas.

7. Medidas utilizadas en los indicadores KPI
Las principales tarjetas KPI del dashboard utilizan las siguientes medidas:
Indicador	Medida utilizada	Propósito
Unidades producidas	Unidades producidas	Medir el volumen total producido
Meta de producción	Meta Total	Medir la meta acumulada
Registros de producción	Registros Produccion	Medir el volumen de registros
Cumplimiento	Cumplimiento promedio	Medir el cumplimiento promedio de las metas
Unidades vendidas	Unidades Vendidas	Medir el volumen comercializado
Ingresos	Ingresos Totales	Medir el valor generado por las ventas
Costo	Costo Estimado	Estimar el costo asociado a las ventas
Utilidad	Utilidad Estimada	Estimar la utilidad generada
Margen	Margen Estimado	Medir la rentabilidad porcentual


8. Comportamiento dinámico de las medidas
Las medidas DAX fueron diseñadas para trabajar de manera dinámica con el modelo de datos de Power BI.
Esto significa que los resultados cambian automáticamente cuando el usuario aplica filtros o segmentadores.
Entre los principales filtros utilizados en el dashboard se encuentran:
- Fecha.
- Mes.
- Categoría.
- Producto.
- Empleado.
- Tienda.
- Ciudad.
- Departamento.
Por ejemplo, si se selecciona una categoría específica, las medidas de producción, ventas, ingresos, costos y utilidad muestran únicamente los resultados correspondientes a esa categoría.
Esto permite realizar análisis generales y también análisis específicos sin necesidad de modificar las consultas SQL originales.

9. Relación entre las medidas y el modelo de datos
Las medidas aprovechan las relaciones establecidas entre las tablas del modelo.
La estructura principal utilizada es:
Calendario
    │
    ├── Producción
    │
    └── Ventas
             │
             └── Detalle_Venta
                       │
                       └── Productos

Empleados
    ├── Producción
    └── Ventas

Tiendas
    └── Ventas

Las relaciones permiten que los filtros aplicados desde las tablas dimensionales se propaguen hacia las tablas de hechos correspondientes.

10. Principios utilizados para la creación de medidas
Las medidas fueron diseñadas teniendo en cuenta los siguientes principios:
10.1. Reutilización
Las medidas pueden utilizarse en diferentes visualizaciones sin necesidad de crear cálculos independientes para cada gráfico.
10.2. Dinamismo
Los resultados responden al contexto de filtros aplicado por el usuario.
10.3. Separación entre datos y cálculos
Los datos base se mantienen en las tablas del modelo, mientras que los indicadores y cálculos se construyen mediante medidas DAX.
10.4. Análisis por diferentes dimensiones
Las medidas pueden analizarse por diferentes dimensiones del modelo, como:
- Tiempo.
- Producto.
- Categoría.
- Empleado.
- Tienda.
- Ciudad.
10.5. Evitar duplicidad en los cálculos
La estructura del modelo evita relacionar directamente producción con detalle de ventas, ya que ambas tablas representan procesos diferentes.
La comparación se realiza mediante medidas y agregaciones que permiten llevar ambos procesos a un nivel comparable.

11. Interpretación de los indicadores
Los principales indicadores deben interpretarse de acuerdo con el contexto del modelo.
Producción
Permite conocer cuánto se fabricó durante el periodo analizado.
Meta
Permite conocer cuánto se esperaba producir.
Cumplimiento
Permite comparar el resultado de producción frente a las metas establecidas.
Ventas
Permite conocer cuántas unidades fueron comercializadas.
Ingresos
Permite conocer el valor generado por las ventas.
Costo estimado
Permite aproximar el costo asociado a las unidades vendidas.
Utilidad estimada
Permite aproximar el resultado económico después de descontar el costo estimado de los ingresos.
Margen estimado
Permite comparar la rentabilidad relativa entre diferentes productos y categorías.
Brecha producción-ventas
Permite identificar diferencias entre el volumen producido y el volumen vendido.

12. Consideración sobre la rentabilidad
Los indicadores de costo, utilidad y margen incluidos en el dashboard corresponden a una estimación basada en los datos disponibles en el modelo.
Estos indicadores no representan estados financieros oficiales ni reemplazan información contable.
La estimación utiliza principalmente:
- Precio de venta.
- Cantidad vendida.
- Costo de producción registrado para cada producto.
No se consideran dentro de este cálculo otros posibles componentes financieros o contables como:
- Gastos administrativos.
- Gastos de distribución.
- Impuestos.
- Nómina.
- Gastos comerciales.
- Gastos financieros.
- Otros costos indirectos.
Por lo tanto, los resultados deben interpretarse como indicadores analíticos de rentabilidad del modelo y no como utilidad contable definitiva.

13. Resultado del uso de las medidas DAX
La implementación de las medidas DAX permitió convertir los datos almacenados en PostgreSQL en indicadores de negocio dinámicos dentro de Power BI.
Esto permitió construir un dashboard capaz de analizar:
- El comportamiento de la producción.
- El cumplimiento de las metas.
- El comportamiento de las ventas.
- La generación de ingresos.
- Los costos estimados.
- La utilidad estimada.
- El margen estimado.
- Las diferencias entre producción y ventas.
De esta manera, las medidas DAX funcionan como una capa de análisis sobre el modelo de datos y permiten transformar los registros operativos en información útil para la toma de decisiones.

14. Resumen de medidas
Grupo	Medida	Resultado principal
Producción	Unidades producidas	Total de unidades fabricadas
Producción	Meta Total	Meta acumulada de producción
Producción	Registros Produccion	Cantidad de registros de producción
Producción	Cumplimiento promedio	Nivel promedio de cumplimiento
Ventas	Unidades Vendidas	Total de unidades comercializadas
Ventas	Ingresos Totales	Ingresos generados por las ventas
Costos	Costo Estimado	Costo estimado de unidades vendidas
Rentabilidad	Utilidad Estimada	Diferencia entre ingresos y costos
Rentabilidad	Margen Estimado	Rentabilidad porcentual estimada
Comparación	Brecha Producción - Ventas	Diferencia entre producción y ventas


15. Conclusión
Las medidas DAX desarrolladas para el proyecto permiten centralizar los principales cálculos analíticos del dashboard de Power BI.
La utilización de medidas facilita la exploración de la información desde diferentes perspectivas y permite que los indicadores respondan a los filtros aplicados por el usuario.
En conjunto, las medidas permiten pasar de datos operativos almacenados en PostgreSQL a indicadores orientados al análisis de producción, ventas y rentabilidad.
Esta estructura facilita la interpretación de los resultados y proporciona una base para futuras ampliaciones del proyecto, como análisis de inventarios, pronósticos de demanda, análisis de tendencias y otros indicadores de desempeño.