drop database if exists ecommerce;
create database ecommerce;
use ecommerce;

create table users (
    id int primary key auto_increment,
    name varchar(255) not null,
    email varchar(255) not null unique,
    password varchar(255) not null
);

create table addresses (
    id int primary key auto_increment,
    user_id int,
    name varchar(255) not null,
    cep varchar(255) not null,
    state varchar(255) not null,
    city varchar(255) not null,
    street varchar(255) not null,
    number varchar(255) not null,
    foreign key (user_id) references users(id)
);

create table categories (
    id int primary key auto_increment,
    name varchar(255) not null,
    description varchar(255)
);


create table products (
    id int primary key auto_increment,
    name varchar(255) not null,
    description varchar(255),
    value decimal(5,2) not null,
    category_id int,
    foreign key (category_id) references categories(id)
);


create table orders (
    id int primary key auto_increment,
    user_id int,
    address_id int,
    foreign key (user_id) references users(id),
    foreign key (address_id) references addresses(id)
);


create table order_items (
    id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int not null,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);