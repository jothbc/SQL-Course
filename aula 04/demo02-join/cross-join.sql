-- cross join
create table skills(
    id   int primary key auto_increment,
    name varchar(255)
);
insert into skills (name)
values ('Javascript'),
       ('HTML'),
       ('CSS3'),
       ('SQL');

-- ----------------------------------------

select
    users.name as name,
    skills.name as skill
from
    users
    cross join skills