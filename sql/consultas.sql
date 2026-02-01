
-- =========================================
-- PROYECTO: ANALISIS DE VENTAS
-- AUTOR: Luciano Puquio Corrales
-- =========================================


-- 1. Ventas totales por mes
SELECT 
    MONTH(fecha) AS mes,
    SUM(total) AS ventas_totales
FROM ventas
GROUP BY MONTH(fecha)
ORDER BY mes;


-- 2. Productos más vendidos
SELECT 
    p.nombre_producto,
    SUM(v.cantidad) AS total_vendido
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC;


-- 3. Ventas por categoría
SELECT 
    p.categoria,
    SUM(v.total) AS ventas_totales
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY p.categoria;


-- 4. Clientes con mayor monto de compra
SELECT 
    c.nombre,
    SUM(v.total) AS total_comprado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nombre
ORDER BY total_comprado DESC;


-- 5. Detección de ventas superiores al promedio
SELECT 
    id_venta,
    total,
    fecha
FROM ventas
WHERE total > (
    SELECT AVG(total) FROM ventas
);


-- 6. Ventas por ciudad
SELECT 
    c.ciudad,
    SUM(v.total) AS ventas_totales
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.ciudad;
