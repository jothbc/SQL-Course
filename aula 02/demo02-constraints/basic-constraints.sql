-- PRIMARY KEY
create table single_primary_key(
    id int primary key,
    code int,
    name varchar(100)
);
drop table single_primary_key;

-- MULTIPLE PRIMARY KEY
create table multiple_primary_key(
    category int,
    code int,
    name varchar(100),
    primary key (category, code)
);
drop table multiple_primary_key;


-- UNIQUE
CREATE TABLE constraint_unique (
     email VARCHAR(100) UNIQUE,
     nome VARCHAR(50)
);
drop table constraint_unique;

-- NOT NULL
CREATE TABLE constraint_not_null (
     id INT PRIMARY KEY,
     nome VARCHAR(50) NOT NULL
);
drop table constraint_not_null;


