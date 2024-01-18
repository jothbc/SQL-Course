update addresses set user_id = null where id = 5;

-- get inner join by address and user
select
    *
from
    users
    join addresses
        on users.id = addresses.user_id;

-- get products on orders by user
select
    *
from
    users
    join orders
        on users.id = orders.user_id
    join order_items
        on order_items.id = orders.id
    join products
        on products.id = order_items.product_id
where users.id = 1