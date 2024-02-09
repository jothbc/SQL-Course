-- full join command

select
    users.id,
    users.name,
    addresses.*
from
    users
        left join addresses
                  on users.id = addresses.user_id

union

select
    users.id,
    users.name,
    addresses.*
from
    addresses
        left join users
                  on users.id = addresses.user_id;

-- ----------------------------------------------------------

create table old_products(
    id          int primary key auto_increment,
    name        varchar(255),
    description varchar(255),
    value       decimal(5, 2),
    category_id int,
    foreign key (category_id) references categories (id)
);

insert into old_products (name, description, value)
values ('Nokia 3310', 'Cellphone', 10.00),
       ('Sony Ericsson W200', 'Cellphone', 20.00);

-- ---------------------------------------------------------

select *
from products
         left join categories
                   on products.category_id = categories.id

union

select *
from old_products
         left join categories
                   on old_products.category_id = categories.id;

