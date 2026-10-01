# Diccionario de Datos
## Proyecto: Análisis Integral de Producción y Ventas 2026

### 1. Descripción

Este documento describe la estructura de la base de datos utilizada en el proyecto *Análisis Integral de Producción y Ventas 2026*. La base de datos fue desarrollada en PostgreSQL y contiene información relacionada con empleados, productos, producción, tiendas y ventas.

Su propósito es organizar la información y facilitar las consultas SQL, el análisis de indicadores y la posterior construcción de un dashboard en Power BI.

### 2. Estructura de la base de datos

La base de datos está compuesta por seis tablas:

- `empleados`: almacena la información de los trabajadores.
- `productos`: contiene los datos de los productos comercializados.
- `produccion`: registra las cantidades producidas y el cumplimiento de las metas.
- `tiendas`: almacena la información de las tiendas.
- `ventas`: registra la información general de las transacciones.
- `detalle_venta`: contiene los productos, cantidades, precios y descuentos de cada venta.

### 3. Diccionario de tablas

#### 3.1. Tabla `empleados`

Almacena la información de los empleados que participan en los procesos de producción y ventas.

| Campo | Tipo de dato | Descripción |
|---|---|---|
| `id_empleado` | SERIAL | Identificador único del empleado (PK). |
| `codigo_empleado` | VARCHAR(15) | Código único asignado al empleado. |
| `nombre` | VARCHAR(100) | Nombre del empleado. |
| `documento` | VARCHAR(30) | Número de documento de identidad. |
| `cargo` | VARCHAR(50) | Cargo que desempeña. |
| `area` | VARCHAR(30) | Área a la que pertenece. |
| `jornada` | VARCHAR(20) | Jornada laboral. |
| `fecha_ingreso` | DATE | Fecha de ingreso a la empresa. |
| `salario` | NUMERIC | Salario del empleado. |
| `estado` | VARCHAR(20) | Estado actual del empleado. |

**Clave primaria:** `id_empleado`.

#### 3.2. Tabla `productos`

Contiene la información de los productos que se fabrican y comercializan.

| Campo | Tipo de dato | Descripción |
|---|---|---|
| `id_producto` | SERIAL | Identificador único del producto (PK). |
| `codigo_producto` | VARCHAR(15) | Código único del producto. |
| `nombre_producto` | VARCHAR(100) | Nombre del producto. |
| `categoria` | VARCHAR(50) | Categoría a la que pertenece. |
| `marca` | VARCHAR(50) | Marca del producto. |
| `costo_produccion` | NUMERIC(12,2) | Costo de producción por unidad. |
| `precio_venta` | NUMERIC(12,2) | Precio de venta de referencia. |
| `stock_minimo` | INTEGER | Cantidad mínima de inventario deseada. |
| `estado` | VARCHAR(20) | Estado del producto. |

**Clave primaria:** `id_producto`.

#### 3.3. Tabla `produccion`

Registra las operaciones de producción realizadas, las cantidades obtenidas y las metas establecidas.

| Campo | Tipo de dato | Descripción |
|---|---|---|
| `id_produccion` | SERIAL | Identificador único del registro (PK). |
| `fecha` | DATE | Fecha de producción. |
| `id_empleado` | INTEGER | Empleado responsable (FK). |
| `id_producto` | INTEGER | Producto fabricado (FK). |
| `operacion` | VARCHAR(50) | Operación realizada. |
| `cantidad` | INTEGER | Unidades producidas. |
| `meta` | INTEGER | Meta de producción establecida. |
| `cumplimiento_pct` | NUMERIC(6,2) | Porcentaje de cumplimiento de la meta. |
| `estado` | VARCHAR(20) | Estado del registro de producción. |

**Clave primaria:** `id_produccion`.

**Claves foráneas:**
- `id_empleado` referencia a `empleados(id_empleado)`.
- `id_producto` referencia a `productos(id_producto)`.

#### 3.4. Tabla `tiendas`

Almacena la información de las tiendas donde se realizan las ventas.

| Campo | Tipo de dato | Descripción |
|---|---|---|
| `id_tienda` | SERIAL | Identificador único de la tienda (PK). |
| `codigo_tienda` | VARCHAR(15) | Código único de la tienda. |
| `nombre_tienda` | VARCHAR(100) | Nombre de la tienda. |
| `ciudad` | VARCHAR(50) | Ciudad donde se encuentra. |
| `departamento` | VARCHAR(50) | Departamento donde se encuentra. |
| `pais` | VARCHAR(50) | País donde se encuentra. |
| `fecha_apertura` | DATE | Fecha de apertura. |
| `estado` | VARCHAR(20) | Estado de la tienda. |

**Clave primaria:** `id_tienda`.

#### 3.5. Tabla `ventas`

Registra la información general de cada transacción de venta, como la fecha, el empleado, la tienda y el método de pago.

| Campo | Tipo de dato | Descripción |
|---|---|---|
| `id_venta` | SERIAL | Identificador único de la venta (PK). |
| `numero_factura` | VARCHAR(20) | Número único de factura. |
| `fecha` | DATE | Fecha de la venta. |
| `id_empleado` | INTEGER | Empleado asociado a la venta (FK). |
| `id_tienda` | INTEGER | Tienda donde se realizó (FK). |
| `metodo_pago` | VARCHAR(30) | Método de pago utilizado. |
| `estado` | VARCHAR(20) | Estado de la venta. |

**Clave primaria:** `id_venta`.

**Claves foráneas:**
- `id_empleado` referencia a `empleados(id_empleado)`.
- `id_tienda` referencia a `tiendas(id_tienda)`.

#### 3.6. Tabla `detalle_venta`

Contiene el detalle de los productos incluidos en cada venta, junto con sus cantidades, precios y descuentos.

| Campo | Tipo de dato | Descripción |
|---|---|---|
| `id_detalle` | SERIAL | Identificador único del detalle (PK). |
| `id_venta` | INTEGER | Venta a la que pertenece (FK). |
| `id_producto` | INTEGER | Producto vendido (FK). |
| `cantidad` | INTEGER | Unidades vendidas. |
| `precio_unitario` | NUMERIC(12,2) | Precio por unidad en la transacción. |
| `descuento` | NUMERIC(12,2) | Descuento registrado. |
| `subtotal` | NUMERIC(12,2) | Subtotal registrado para la línea de venta. |

**Clave primaria:** `id_detalle`.

**Claves foráneas:**
- `id_venta` referencia a `ventas(id_venta)`.
- `id_producto` referencia a `productos(id_producto)`.

### 4. Relaciones entre las tablas

Las relaciones principales de la base de datos son:

- Un empleado puede tener múltiples registros de producción.
- Un producto puede aparecer en múltiples registros de producción.
- Un empleado puede estar asociado a múltiples ventas.
- Una tienda puede registrar múltiples ventas.
- Una venta puede contener varios registros de detalle.
- Un producto puede aparecer en múltiples detalles de venta.

Estas relaciones permiten integrar la información de producción y ventas mediante identificadores comunes, evitando depender de los nombres para relacionar los registros.

### 5. Consideraciones para el análisis

- La tabla `produccion` permite analizar unidades producidas, metas y cumplimiento.
- La tabla `detalle_venta` permite calcular unidades vendidas e ingresos a partir de las líneas de venta.
- La tabla `ventas` aporta datos de fecha, empleado, tienda y método de pago.
- La tabla `productos` permite segmentar los resultados por producto, marca y categoría.
- La tabla `empleados` permite analizar la actividad por trabajador, cargo y área.
- La tabla `tiendas` permite comparar el comportamiento de las ventas por ubicación.

La columna `stock_minimo` representa un nivel mínimo deseado de inventario y no debe interpretarse como el inventario actual.

### 6. Propósito dentro del proyecto

La estructura de esta base de datos sirve como fuente para las 15 consultas SQL desarrolladas en el proyecto y como base para construir un modelo de datos en Power BI. Esto permitirá visualizar indicadores de producción, ventas, productividad, cumplimiento de metas y diferencias entre las unidades producidas y vendidas.

### 7. Tecnología

- Sistema gestor de base de datos: PostgreSQL.
- Lenguaje de consulta: SQL.
- Herramienta de análisis y visualización: Power BI.
- Control de versiones: Git y GitHub.