CREATE DATABASE VentasDB;
USE VentasDB;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    producto VARCHAR(50),
    categoria VARCHAR(50),
    cantidad INT,
    precio DECIMAL(10,2),
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes VALUES
(1, 'Juan'),
(2, 'Maria'),
(3, 'Carlos'); 

INSERT INTO ventas VALUES
(1,1,'Cafe','Bebidas',10,5,'2026-04-01'),
(2,2,'Pan','Alimentos',20,2,'2026-04-01'),
(3,1,'Jugo','Bebidas',15,4,'2026-04-02'),
(4,3,'Sandwich','Alimentos',8,6,'2026-04-02'),
(5,2,'Cafe','Bebidas',12,5,'2026-04-03'),
(6,1,'Pan','Alimentos',25,2,'2026-04-03');

/*estas consultas se ejecutaron para verfiicar los clientes y las ventas*/
SELECT * FROM clientes;
SELECT * FROM ventas;

/*esta consulta se uso para saber el total de ventas en dinero*/
SELECT SUM(cantidad * precio) AS total_ventas
FROM ventas;

/*esta consulta se ejecuto para saber cual fue el producto mas vendido*/
SELECT producto, SUM(cantidad) AS total
FROM ventas
GROUP BY producto
ORDER BY total DESC;

/*esta  consulta se ejecuto para observar las ventas por cliente*/
SELECT c.nombre, SUM(v.cantidad * v.precio) AS total_gastado
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nombre;

/*esta consulta se uso para filtrar clientes que han hecho un consumo mayor a 100soles*/
SELECT c.nombre, SUM(v.cantidad * v.precio) AS total
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nombre
HAVING SUM(v.cantidad * v.precio) > 100;

