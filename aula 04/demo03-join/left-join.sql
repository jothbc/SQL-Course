-- left join sql

-- get all address by user
select
    users.id,
    users.name,
    addresses.*
from
    users
    left join addresses
        on users.id = addresses.user_id;


-- count how many addresses each user has
select
    users.id,
    users.name,
    count(addresses.id) as address_count
from
    users
    left join addresses
        on users.id = addresses.user_id
group by
    users.id;