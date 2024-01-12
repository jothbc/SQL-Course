var mysql = require('mysql');
var {faker} = require('@faker-js/faker');


(async () => {
    var ecommerce = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'ecommerce_latin1',
        charset: 'latin1'
    });
    var ecommerce2 = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'ecommerce_utf8mb4',
        charset: 'utf8mb4'
    });

    ecommerce.connect();
    ecommerce2.connect();

    const array = Array.from({length: 10000}, () => undefined);
    for await (const item of array) {
        const nome = `${faker.person.fullName()} 😊`;
        const latin1 = mysql.format(nome, {type: 'latin1'});
        const utf8mb4 = mysql.format(nome, {type: 'utf8mb4'});

        await Promise.all([
            new Promise((resolve, reject) => {
                ecommerce.query('INSERT INTO clientes_latin1 SET nome = ?', [latin1], function (error, results, fields) {
                    if (error) {
                        console.error(error);
                        resolve({})
                    }
                    resolve(results);
                });
            }),
            new Promise((resolve, reject) => {
                ecommerce2.query('INSERT INTO clientes_utf8mb4 SET nome = ?', [utf8mb4], function (error, results, fields) {
                    if (error) {
                        console.error(error);
                        resolve({})
                    }
                    resolve(results);
                });
            })
        ])
    }

    const tableShemaSQL = 'SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ?';

    const infoLatin1 = await new Promise(resolve=>{
        ecommerce.query(tableShemaSQL, ['ecommerce_latin1', 'clientes_latin1'], (error, results, fields) => {
            if (error) throw error
            resolve(results);
        })
    });
    const infoUtf8mb4 = await new Promise(resolve=>{
        ecommerce2.query(tableShemaSQL, ['ecommerce_utf8mb4', 'clientes_utf8mb4'], (error, results, fields) => {
            if (error) throw error
            resolve(results);
        });
    })

    ecommerce.end();
    ecommerce2.end();

    console.log('Tamanho da tabela clientes_latin1:', infoLatin1[0].TABLE_ROWS, 'linhas, ', infoLatin1[0].DATA_LENGTH / 1024, 'KB');
    console.log('Tamanho da tabela clientes_utf8mb4:', infoUtf8mb4[0].TABLE_ROWS, 'linhas, ', infoUtf8mb4[0].DATA_LENGTH / 1024, 'KB');

    const porcentagem = (infoUtf8mb4[0].DATA_LENGTH - infoLatin1[0].DATA_LENGTH) / infoLatin1[0].DATA_LENGTH * 100;
    console.log('Diferença de tamanho:', porcentagem.toFixed(2), '%');
})()