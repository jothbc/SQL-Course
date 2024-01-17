const {faker} = require('@faker-js/faker');
const {writeFile} = require('node:fs/promises');
const {join} = require('path');

const dir = join(__dirname, 'latin1_utf8mb4.sql');


(async () => {
    var content = '';


    const array = Array.from({length: 10000}, () => undefined);
    for await (const item of array) {
        const nome = `${faker.person.fullName()} 😊`;
        content += `INSERT INTO ecommerce_latin1.clientes SET nome = "${nome}";\n`;
        content += `INSERT INTO ecommerce_utf8mb4.clientes SET nome = "${nome}";\n`;
    }

    content+=`
SELECT
    concat(((SELECT DATA_LENGTH FROM information_schema.tables WHERE table_schema = 'ecommerce_latin1' AND table_name = 'clientes') / 1024), ' KB') AS latin1_size,
    concat(((SELECT DATA_LENGTH FROM information_schema.tables WHERE table_schema = 'ecommerce_utf8mb4' AND table_name = 'clientes') / 1024), ' KB') AS utf8mb4_size;
    `;

    writeFile(dir, content, {encoding: 'utf8'});
})()