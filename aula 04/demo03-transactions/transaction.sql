-- transaction command

create table accounts(
    id   int primary key auto_increment,
    bank_name varchar(255) not null,
    balance decimal(10, 2) not null,
    user_id int not null,
    foreign key (user_id) references users (id)
);

-- ----------------------------------------------

START TRANSACTION;
    INSERT INTO accounts (bank_name, balance, user_id)
    VALUES ('Santander', 1000.00, 1);

    SELECT * FROM accounts;
COMMIT;

-- --------------------------------------------------

START TRANSACTION;
    INSERT INTO accounts (bank_name, balance, user_id)
    VALUES ('Nubank', 2000.00, 1);

    SELECT * FROM accounts;
COMMIT;

-- --------------------------------------------------

START TRANSACTION;
    UPDATE accounts SET balance = 1 WHERE 1;
    SELECT * FROM accounts;
ROLLBACK;