-- using table called datatypes
create table if not exists logs_temp(
    id int primary key auto_increment,
    log varchar(500) not null
);
create table if not exists users_temp(
    id int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null,
    created_at timestamp default current_timestamp
);

insert into users_temp (name, email)
values
    ('João', 'j@j.com'),
    ('Maria', 'm@m.com'),
    ('Carlos', 'c@c.com'),
    ('Pedro', 'p@p.com');

insert into logs_temp (log)
    select concat(name, ' - ', email) from users_temp;


insert into users_temp values (5,'Enzo', 'e@e.com', now());

