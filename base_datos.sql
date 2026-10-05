-- Crea la base de datos y las tablas que usa la aplicación.
-- Ejecutar en MySQL Workbench o en la consola de MySQL.

CREATE DATABASE IF NOT EXISTS sistema_biomedico;
USE sistema_biomedico;

CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario     INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50)  NOT NULL UNIQUE,
    contrasena     VARCHAR(100) NOT NULL,
    tipo_usuario   VARCHAR(20)  NOT NULL  -- 'imagen' o 'senal'
);

CREATE TABLE IF NOT EXISTS imagenes_medicas (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    tipo_archivo   VARCHAR(20)  NOT NULL,
    nombre_archivo VARCHAR(255) NOT NULL,
    ruta_archivo   VARCHAR(500) NOT NULL,
    id_usuario     INT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS otros_archivos (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    tipo_archivo   VARCHAR(20)  NOT NULL,
    nombre_archivo VARCHAR(255) NOT NULL,
    ruta_archivo   VARCHAR(500) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Usuarios de prueba
INSERT IGNORE INTO usuarios (nombre_usuario, contrasena, tipo_usuario) VALUES
    ('imagenes', '1234', 'imagen'),
    ('senales',  '1234', 'senal');
