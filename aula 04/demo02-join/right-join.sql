-- right join command
select
    *
from
    users
    right join addresses
        on users.id = addresses.user_id;

-- most common use left join
select
    *
from
    addresses
    left join users
        on users.id = addresses.user_id