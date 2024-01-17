CREATE DATABASE ecommerce_latin1 CHARACTER SET latin1 COLLATE latin1_swedish_ci;
CREATE DATABASE ecommerce_utf8mb4 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE ecommerce_latin1;
CREATE TABLE clientes
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(1000)
);

USE ecommerce_utf8mb4;
CREATE TABLE clientes
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(1000)
);