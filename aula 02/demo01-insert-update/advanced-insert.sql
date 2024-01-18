insert into user (name, email)
values ('João', 'j@j.com'),
       ('Maria', 'm@m.com'),
       ('Carlos', 'c@c.com'),
       ('Pedro', 'p@p.com');

-- implicit insertion
insert into user values (5,'Enzo', 'e@e.com', now());

-- using set command
insert into user set name = 'Fulano', email = 'fulano@teste.com';

-- using the result of 'select' to serve as the value for 'insert'
insert into logs (log)
    select concat(name, ' - ', email) as log from user;
