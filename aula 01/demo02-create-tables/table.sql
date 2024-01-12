use ecommerce_store;


-- Table DDL
create table pessoas(
     id int,
     nome varchar(50)
);

drop table pessoas;

create table usuarios(
    id int primary key auto_increment,
    nome varchar(50) not null
);
rename table usuarios to users;
-- create table if not exists users(...);




-- Column DDL
alter table users
    add column email varchar(50) not null unique;


alter table users
    modify column email varchar(100) not null unique,
    modify column nome varchar(100) not null;


alter table users
    add column teste int;
alter table users
    drop column teste;


alter table users
    add column name varchar(100) not null;
update users
    set name = nome where true;
alter table users
    drop column nome;

# drop table users;

