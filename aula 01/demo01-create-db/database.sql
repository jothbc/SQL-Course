SHOW DATABASES;

CREATE DATABASE ecommerce_store;

USE ecommerce_store;

CREATE DATABASE ecommerce_store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- ALTER DATABASE ecommerce_store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

--- ### Para ver o tipo de charset e collation;
SELECT default_character_set_name, default_collation_name
FROM information_schema.SCHEMATA
WHERE schema_name = 'ecommerce_store';

---------------------------------------------------------------------------------------

CREATE DATABASE ecommerce_latin1 CHARACTER SET latin1 COLLATE latin1_swedish_ci;
CREATE DATABASE ecommerce_utf8mb4 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE ecommerce_latin1;
CREATE TABLE clientes_latin1 (
 id INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(1000)
);

USE ecommerce_utf8mb4;
CREATE TABLE clientes_utf8mb4 (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(1000)
);


SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA like 'ecommerce_%' AND TABLE_NAME like 'clientes_%';
