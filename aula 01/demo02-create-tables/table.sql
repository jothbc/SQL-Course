use ecommerce_store;


-- Table DDL
-- create table
create table pessoas(
     id int,
     nome varchar(50)
);

-- drop table
drop table pessoas;

-- what are a primary key, auto increment and not null commands
create table usuarios(
    id int primary key auto_increment,
    nome varchar(50) not null
);
-- rename table
rename table usuarios to users;

-- if command
create table if not exists users(
    id int primary key auto_increment,
    nome varchar(50) not null
);

-- --------------------------------------------------------------------------------


-- Column DDL
-- add column
alter table users
    add column email varchar(50) not null unique;

-- modify column
alter table users
    modify column email varchar(100) not null unique,
    modify column nome varchar(100) not null;

-- drop column
alter table users
    add column teste int;
alter table users
    drop column teste;


-- rename column (not possible)
-- wrong column name for example ( the current column name is 'nome' and we want to rename it to 'name' )
-- create the correct column name
alter table users
    add column name varchar(100) not null;
-- make both columns hava the same values
update users
    set name = nome where true;
-- remove old column
alter table users
    drop column nome;