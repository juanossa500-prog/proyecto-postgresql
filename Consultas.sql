-- ============================================
-- PROYECTO BASE DE DATOS
-- CONSULTAS SQL
-- ============================================


-- 7.1
-- 8 departamentos con mayor volumen de ventas

SELECT d.nombre AS departamento,
       SUM(o.cantidad) AS monto_total
FROM operaciones o
JOIN municipios m
ON o.codigo_dane_limpio = m.codigo_dane
JOIN departamentos d
ON m.id_departamento = d.id_departamento
GROUP BY d.nombre
ORDER BY monto_total DESC
LIMIT 8;



-- 7.2
-- 15 municipios con mayor cantidad de productos vendidos

SELECT m.nombre AS municipio,
       SUM(o.cantidad) AS total_productos
FROM operaciones o
JOIN municipios m
ON o.codigo_dane_limpio = m.codigo_dane
WHERE o.codigo_dane_limpio LIKE '05%'
GROUP BY m.nombre
ORDER BY total_productos DESC
LIMIT 15;



-- 7.3
-- 5 departamentos con mayor cantidad del producto MANZALOCA

SELECT d.nombre AS departamento,
       SUM(o.cantidad) AS total_vendido
FROM operaciones o
JOIN productos p
ON o.id_producto = p.id_producto
JOIN municipios m
ON o.codigo_dane_limpio = m.codigo_dane
JOIN departamentos d
ON m.id_departamento = d.id_departamento
WHERE p.nombre ILIKE '%MANZALOCA%'
GROUP BY d.nombre
ORDER BY total_vendido DESC
LIMIT 5;



-- 7.4
-- 5 municipios con menor monto de ventas

SELECT d.nombre AS departamento,
       m.nombre AS municipio,
       SUM(o.cantidad) AS monto_total
FROM operaciones o
JOIN municipios m
ON o.codigo_dane_limpio = m.codigo_dane
JOIN departamentos d
ON m.id_departamento = d.id_departamento
GROUP BY d.nombre, m.nombre
ORDER BY monto_total ASC
LIMIT 5;



-- 7.5
-- Cantidad de gaseosas vendidas por producto y región

SELECT r.nombre AS region,
       p.nombre AS producto,
       SUM(o.cantidad) AS total_vendido
FROM operaciones o
JOIN productos p
ON o.id_producto = p.id_producto
JOIN regiones r
ON o.id_region = r.id_region
GROUP BY r.nombre, p.nombre
ORDER BY total_vendido DESC;



-- 7.6
-- Total de ventas por producto en Antioquia

SELECT p.nombre AS producto,
       SUM(o.cantidad) AS total_ventas
FROM operaciones o
JOIN productos p
ON o.id_producto = p.id_producto
WHERE o.codigo_dane_limpio LIKE '05%'
GROUP BY p.nombre
ORDER BY total_ventas DESC;