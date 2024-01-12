var {fakerPT_BR: faker} = require('@faker-js/faker');

(async () => {

    console.log(`
    create database multi_key;
    use multi_key;
    create table products_single_key(
        id int auto_increment primary key,
        category varchar(100),
        code varchar(100),
        name varchar(100)
    );
    create table products_multi_key(
        category varchar(100),
        code varchar(100),
        name varchar(100),
        primary key (category, code)
    );
    `)

    const products = Array.from({length: 5000}, () => ({
        category: faker.commerce.department().normalize('NFD').replace(/[\u0300-\u036f]/g, ''),
        code: faker.commerce.isbn({ variant: 13, separator: '' }),
        name: faker.commerce.productName().normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    }));
    for (const product of products) {
        console.log(`insert into products_single_key(category, code, name) values('${product.category}', '${product.code}', '${product.name}');`);
    }
    console.log(`
    insert into products_multi_key (category, code, name)
    select category, code, name
    from products_single_key;
    `)

})()