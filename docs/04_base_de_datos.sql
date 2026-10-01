-- =====================================================================
--  Base de datos: Café Aroma (PWA cafetería)
--  Motor: MySQL 8 (Clever Cloud)
--  NOTA: En Clever Cloud la base de datos ya viene creada (nombre tipo
--  "bxxxxxxxxxxxx"). NO ejecutes CREATE DATABASE; conéctate a ella con las
--  credenciales del panel y ejecuta este script directamente.
-- =====================================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS variantes_producto;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS cafeteria_info;

SET FOREIGN_KEY_CHECKS = 1;

-- ---------------------------------------------------------------------
-- 1. CREACIÓN DE TABLAS (DDL)
-- ---------------------------------------------------------------------

CREATE TABLE categorias (
  id_categoria INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre       VARCHAR(60)  NOT NULL,
  descripcion  VARCHAR(200) NULL,
  orden        INT          NOT NULL DEFAULT 0,
  activa       TINYINT(1)   NOT NULL DEFAULT 1,
  PRIMARY KEY (id_categoria),
  UNIQUE KEY uq_categorias_nombre (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE productos (
  id_producto    INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  id_categoria   INT UNSIGNED  NOT NULL,
  nombre         VARCHAR(100)  NOT NULL,
  descripcion    TEXT          NULL,
  precio_base    DECIMAL(10,2) NOT NULL,
  imagen_url     VARCHAR(255)  NULL,
  destacado      TINYINT(1)    NOT NULL DEFAULT 0,
  disponible     TINYINT(1)    NOT NULL DEFAULT 1,
  activo         TINYINT(1)    NOT NULL DEFAULT 1,
  creado_en      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id_producto),
  KEY idx_productos_categoria (id_categoria),
  KEY idx_productos_nombre (nombre),
  CONSTRAINT chk_productos_precio CHECK (precio_base >= 0),
  CONSTRAINT fk_productos_categoria FOREIGN KEY (id_categoria)
    REFERENCES categorias (id_categoria)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE variantes_producto (
  id_variante INT UNSIGNED  NOT NULL AUTO_INCREMENT,
  id_producto INT UNSIGNED  NOT NULL,
  nombre      VARCHAR(40)   NOT NULL,
  precio      DECIMAL(10,2) NOT NULL,
  activa      TINYINT(1)    NOT NULL DEFAULT 1,
  PRIMARY KEY (id_variante),
  KEY idx_variantes_producto (id_producto),
  CONSTRAINT chk_variantes_precio CHECK (precio >= 0),
  CONSTRAINT fk_variantes_producto FOREIGN KEY (id_producto)
    REFERENCES productos (id_producto)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE usuarios (
  id_usuario    INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre        VARCHAR(100) NOT NULL,
  email         VARCHAR(120) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  rol           ENUM('admin','editor') NOT NULL DEFAULT 'admin',
  activo        TINYINT(1)   NOT NULL DEFAULT 1,
  creado_en     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_usuario),
  UNIQUE KEY uq_usuarios_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE cafeteria_info (
  id_info    INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre     VARCHAR(100) NOT NULL,
  slogan     VARCHAR(150) NULL,
  direccion  VARCHAR(200) NULL,
  telefono   VARCHAR(30)  NULL,
  whatsapp   VARCHAR(30)  NULL,
  email      VARCHAR(120) NULL,
  horario    VARCHAR(200) NULL,
  instagram  VARCHAR(100) NULL,
  logo_url   VARCHAR(255) NULL,
  PRIMARY KEY (id_info)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- 2. DATOS DE EJEMPLO (DML)
-- ---------------------------------------------------------------------

INSERT INTO cafeteria_info (nombre, slogan, direccion, telefono, whatsapp, email, horario, instagram, logo_url) VALUES
('Café Aroma', 'El aroma de la montaña en tu taza', 'Calle 10 # 40-20, Medellín', '+57 604 000 0000',
 '+57 300 000 0000', 'hola@cafearoma.co', 'Lun a Sáb 7:00 a.m. - 8:00 p.m. · Dom 8:00 a.m. - 4:00 p.m.',
 '@cafearoma', '/logos/logo_principal.svg');

INSERT INTO categorias (nombre, descripcion, orden) VALUES
('Cafés calientes', 'Espresso y bebidas calientes a base de café', 1),
('Bebidas frías',   'Cafés helados, frappés y refrescos',          2),
('Otras bebidas',   'Chocolate, té e infusiones',                   3),
('Panadería',       'Pan y masas horneadas cada día',               4),
('Postres',         'Tortas y dulces caseros',                      5);

INSERT INTO productos (id_categoria, nombre, descripcion, precio_base, imagen_url, destacado) VALUES
(1, 'Espresso',     'Shot intenso de café de origen colombiano.',                          5000,  '/img/espresso.webp',   0),
(1, 'Americano',    'Espresso alargado con agua caliente.',                                 5500,  '/img/americano.webp',  0),
(1, 'Capuchino',    'Espresso, leche vaporizada y espuma cremosa.',                         8000,  '/img/capuchino.webp',  1),
(1, 'Latte',        'Espresso suave con abundante leche texturizada.',                      8500,  '/img/latte.webp',      1),
(2, 'Cold Brew',    'Café infusionado en frío durante 18 horas.',                           9000,  '/img/coldbrew.webp',   1),
(2, 'Frappé de Café','Café, hielo y crema batida.',                                         12000, '/img/frappe.webp',     0),
(3, 'Chocolate Caliente', 'Chocolate espeso con canela, servido con queso.',                 7500,  '/img/chocolate.webp',  0),
(3, 'Té Chai',      'Té especiado con leche vaporizada.',                                   7000,  '/img/chai.webp',       0),
(4, 'Croissant de Mantequilla', 'Hojaldrado y horneado en el día.',                         6000,  '/img/croissant.webp',  0),
(4, 'Pan de Bono',  'Tradicional pan de queso y almidón de yuca.',                          3500,  '/img/panbono.webp',    0),
(5, 'Torta de Zanahoria', 'Porción con crema de queso.',                                    10000, '/img/zanahoria.webp',  1),
(5, 'Brownie con Helado', 'Brownie tibio con helado de vainilla.',                          11000, '/img/brownie.webp',    0);

-- Variantes de tamaño para algunas bebidas
INSERT INTO variantes_producto (id_producto, nombre, precio) VALUES
(3, 'Pequeño', 8000),  (3, 'Mediano', 9500),  (3, 'Grande', 11000),
(4, 'Pequeño', 8500),  (4, 'Mediano', 10000), (4, 'Grande', 11500),
(5, 'Mediano', 9000),  (5, 'Grande', 11000);

-- Usuario administrador de ejemplo.
-- IMPORTANTE: reemplaza el hash por uno generado con bcrypt, por ejemplo:
--   node -e "console.log(require('bcrypt').hashSync('TuClaveSegura', 10))"
INSERT INTO usuarios (nombre, email, password_hash, rol) VALUES
('Administrador', 'admin@cafearoma.co', 'REEMPLAZAR_CON_HASH_BCRYPT', 'admin');

-- ---------------------------------------------------------------------
-- 3. CONSULTAS PÚBLICAS (usadas por la API de lectura)
--    En Express usa siempre consultas parametrizadas (?).
-- ---------------------------------------------------------------------

-- 3.1 Categorías activas ordenadas
SELECT id_categoria, nombre, descripcion
FROM categorias
WHERE activa = 1
ORDER BY orden, nombre;

-- 3.2 Menú completo (productos activos con su categoría)
SELECT p.id_producto, p.nombre, p.descripcion, p.precio_base, p.imagen_url,
       p.destacado, p.disponible, c.id_categoria, c.nombre AS categoria
FROM productos p
INNER JOIN categorias c ON c.id_categoria = p.id_categoria
WHERE p.activo = 1 AND c.activa = 1
ORDER BY c.orden, p.nombre;

-- 3.3 Productos por categoría (parámetro: id_categoria)
SELECT p.id_producto, p.nombre, p.descripcion, p.precio_base, p.imagen_url, p.disponible
FROM productos p
WHERE p.activo = 1 AND p.id_categoria = ?
ORDER BY p.nombre;

-- 3.4 Búsqueda por nombre (parámetro: '%texto%')
SELECT id_producto, nombre, precio_base, imagen_url, disponible
FROM productos
WHERE activo = 1 AND nombre LIKE ?
ORDER BY nombre;

-- 3.5 Productos destacados
SELECT id_producto, nombre, descripcion, precio_base, imagen_url
FROM productos
WHERE activo = 1 AND destacado = 1 AND disponible = 1
ORDER BY nombre;

-- 3.6 Detalle de un producto (parámetro: id_producto)
SELECT p.*, c.nombre AS categoria
FROM productos p
INNER JOIN categorias c ON c.id_categoria = p.id_categoria
WHERE p.id_producto = ? AND p.activo = 1;

-- 3.7 Variantes de un producto (parámetro: id_producto)
SELECT id_variante, nombre, precio
FROM variantes_producto
WHERE id_producto = ? AND activa = 1
ORDER BY precio;

-- 3.8 Menú con rango de precios por producto (usa variantes si existen)
SELECT p.id_producto, p.nombre,
       COALESCE(MIN(v.precio), p.precio_base) AS precio_desde,
       COALESCE(MAX(v.precio), p.precio_base) AS precio_hasta
FROM productos p
LEFT JOIN variantes_producto v ON v.id_producto = p.id_producto AND v.activa = 1
WHERE p.activo = 1
GROUP BY p.id_producto, p.nombre, p.precio_base
ORDER BY p.nombre;

-- 3.9 Información de la cafetería
SELECT * FROM cafeteria_info LIMIT 1;

-- ---------------------------------------------------------------------
-- 4. CONSULTAS DE ADMINISTRACIÓN
-- ---------------------------------------------------------------------

-- 4.1 Login (parámetro: email). Compara el hash con bcrypt en Node.js.
SELECT id_usuario, nombre, email, password_hash, rol
FROM usuarios
WHERE email = ? AND activo = 1;

-- 4.2 Crear producto
INSERT INTO productos (id_categoria, nombre, descripcion, precio_base, imagen_url, destacado)
VALUES (?, ?, ?, ?, ?, ?);

-- 4.3 Editar producto
UPDATE productos
SET id_categoria = ?, nombre = ?, descripcion = ?, precio_base = ?,
    imagen_url = ?, destacado = ?, disponible = ?
WHERE id_producto = ?;

-- 4.4 Actualizar solo el precio
UPDATE productos SET precio_base = ? WHERE id_producto = ?;

-- 4.5 Marcar como agotado / disponible
UPDATE productos SET disponible = ? WHERE id_producto = ?;

-- 4.6 Desactivar producto (borrado lógico)
UPDATE productos SET activo = 0 WHERE id_producto = ?;

-- 4.7 Crear / editar categoría
INSERT INTO categorias (nombre, descripcion, orden) VALUES (?, ?, ?);
UPDATE categorias SET nombre = ?, descripcion = ?, orden = ?, activa = ? WHERE id_categoria = ?;

-- 4.8 Crear / editar / eliminar variante
INSERT INTO variantes_producto (id_producto, nombre, precio) VALUES (?, ?, ?);
UPDATE variantes_producto SET nombre = ?, precio = ?, activa = ? WHERE id_variante = ?;
DELETE FROM variantes_producto WHERE id_variante = ?;

-- 4.9 Aumento porcentual de precios por categoría (ej. 5 %)
UPDATE productos
SET precio_base = ROUND(precio_base * 1.05, -2)
WHERE id_categoria = ?;

-- 4.10 Actualizar información de la cafetería
UPDATE cafeteria_info
SET nombre = ?, slogan = ?, direccion = ?, telefono = ?, whatsapp = ?,
    email = ?, horario = ?, instagram = ?
WHERE id_info = 1;

-- 4.11 Reporte: cantidad de productos por categoría
SELECT c.nombre AS categoria, COUNT(p.id_producto) AS total_productos
FROM categorias c
LEFT JOIN productos p ON p.id_categoria = c.id_categoria AND p.activo = 1
GROUP BY c.id_categoria, c.nombre
ORDER BY c.orden;

-- 4.12 Vista útil para la API de menú
CREATE OR REPLACE VIEW vw_menu AS
SELECT p.id_producto, p.nombre, p.descripcion, p.precio_base, p.imagen_url,
       p.destacado, p.disponible, c.id_categoria, c.nombre AS categoria, c.orden
FROM productos p
INNER JOIN categorias c ON c.id_categoria = p.id_categoria
WHERE p.activo = 1 AND c.activa = 1;
