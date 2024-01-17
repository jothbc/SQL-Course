var {fakerPT_BR: faker} = require('@faker-js/faker');
const {writeFile} = require('fs/promises');

(async () => {
    let sql=`
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
    `;

    const products = Array.from({length: 5000}, () => ({
        category: faker.commerce.department(),
        code: faker.commerce.isbn({variant: 13, separator: ''}),
        name: faker.commerce.productName()
    }));
    for (const product of products) {
        sql+=`insert into products_single_key(category, code, name) values ('${product.category}', '${product.code}', '${product.name}');\n`;
    }

    sql+=`
    insert into products_multi_key (category, code, name)
    select category, code, name
    from products_single_key;
    `;

    sql+=`
    -- -----------------------------------------------------------------------------
    alter table products_single_key add index index_code (code), add index index_category (category);
    `;

    writeFile('./multi_key.sql', sql, {encoding: 'utf8'});
})()