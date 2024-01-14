const {fakerPT_BR: faker} = require('@faker-js/faker');
const {writeFile} = require('node:fs/promises');
const {join} = require('path');

const file = join(__dirname, 'ecommerce.sql');

;(async () => {
    let content = '';
    content += 'drop database if exists ecommerce_store;\n';
    content += 'create database ecommerce_store;\n';
    content += 'use ecommerce_store;\n';
    content += 'create table users(id int primary key auto_increment, email varchar(100) unique, name varchar(100), birthdate date);\n';

    // try insert 200 unique users (email is unique, probably someone already registered)
    Array.from({length: 200}, () => ({
        name: faker.person.fullName(),
        email: faker.internet.email(),
        birthdate: faker.date.birthdate({min: 6, max: 65, mode: 'age'}).toLocaleDateString('pt-BR').split('/').reverse().join('-'),
    })).forEach(person => {
        content += `insert into users(email, name, birthdate) values ('${person.email}', '${person.name}', '${person.birthdate}');\n`
    });

    content += 'create table products(id int primary key auto_increment, name varchar(100), description varchar(500), value decimal(5,2));\n';

    // try insert 200 products
    Array.from({length: 200}, () => ({
        name: faker.commerce.productName(),
        description: faker.commerce.productDescription(),
        value: faker.commerce.price({min: 1, max: 999, symbol: '', decimal_digits: 2}),
    })).forEach(product=>{
        content += `insert into products(name, description, value) values ("${product.name}", "${product.description}", ${product.value});\n`
    })

    try {
        await writeFile(file, content);
    } catch (err) {
        console.log(err);
    }

})()