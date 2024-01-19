alter table users
    add column supervisor_id int,
    add foreign key (supervisor_id) references users (id);

update users set supervisor_id = 4 where id <> 4;

-- -------------------------------------------------------------

select
    users.name as USER,
    supervisor.name as SUPERVISOR
from users
    left join users as supervisor
        on users.supervisor_id = supervisor.id