const {fakerPT_BR: faker} = require('@faker-js/faker')
const {writeFile} = require('fs/promises')

;(async () => {

    const users = []
    const addresses = []
    const categories = []
    const products = []
    const orders = []
    const order_items = []

    Array.from({length: 10}).forEach(() => {
        users.push(`INSERT INTO users (name, email, password) VALUES ("${faker.person.fullName()}", "${faker.internet.email()}", "${faker.internet.password()}");`)
    })
    await writeFile('users.sql', users.join('\n'), {encoding: 'utf-8'});

    Array.from({length: 10}).forEach(() => {
        const user_id = faker.number.int({min: 1, max: 10});
        const name = faker.company.name();
        const cep = faker.location.countryCode('numeric');
        const state = faker.location.state({ abbreviated: true });
        const street = faker.location.street();
        const number = faker.number.int({min: 100, max: 9999});
        addresses.push(`
            INSERT INTO addresses (user_id, name, cep, state, city, street, number)
            VALUES (${user_id}, "${name}", "${cep}", "${state}", "${faker.location.city()}", "${street}", "${number}");
        `)
    });
    await writeFile('addresses.sql', addresses.join('\n'), {encoding: 'utf-8'});

    Array.from({length: 10}).forEach(() => {
        categories.push(`INSERT INTO categories (name, description) VALUES ("${faker.commerce.department()}", "${faker.commerce.productDescription()}");`)
    });
    await writeFile('categories.sql', categories.join('\n'), {encoding: 'utf-8'});

    Array.from({length: 200}).forEach(() => {
        const name = faker.commerce.productName();
        const description = faker.commerce.productDescription();
        const value = faker.commerce.price({ min: 10, max: 200, dec: 2, symbol: '' });
        const category_id = faker.number.int({min: 1, max: 10});
        products.push(`
            INSERT INTO products (name, description, value, category_id)
            VALUES ("${name}", "${description}", ${value}, ${category_id});
        `)
    })
    await writeFile('products.sql', products.join('\n'), {encoding: 'utf-8'});

    Array.from({length: 10}).forEach(() => {
        const user_id = faker.number.int({min: 1, max: 10});
        const address_id = `(SELECT id FROM addresses where user_id = ${user_id} ORDER BY RAND() LIMIT 1)`;
        orders.push(`
            INSERT INTO orders (user_id, address_id)
            VALUES (${user_id}, ${address_id});
        `);
    });
    await writeFile('orders.sql', orders.join('\n'), {encoding: 'utf-8'});

    Array.from({length: 200}).forEach(() => {
        const order_id = `(SELECT id FROM orders ORDER BY RAND() LIMIT 1)`;
        const product_id = `(SELECT id FROM products ORDER BY RAND() LIMIT 1)`;
        const quantity = faker.number.int({min: 1, max: 10});
        order_items.push(`
            INSERT INTO order_items (order_id, product_id, quantity)
            VALUES (${order_id}, ${product_id}, ${quantity});
        `);
    });
    await writeFile('order_items.sql', order_items.join('\n'), {encoding: 'utf-8'});
})();