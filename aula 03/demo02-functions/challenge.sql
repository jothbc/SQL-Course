create database challenge;
use challenge;

create table users(
    id int primary key auto_increment,
    name varchar(100)
);
insert into users(name) values ('Jonathan Comin Ribeiro');

select name from users;


-- can you select only the first name?
    -- expected output: Jonathan
-- get first name
select substring(name, 1, locate(' ', name) - 1) from users;

-- can you select only the last name?
    -- expected output: Comin Ribeiro
-- get last name
select substring(name, locate(' ', name) + 1) from users;

-- can you select only the middle name?
    -- expected output: Comin
-- get middle name
select substring(
   (
       name
   ),
   (
       locate(' ', name) + 1
   ),
   (
       -- second space
       locate(' ', name, (locate(' ', name) + 1 ))
       -
       -- first space
       (locate(' ', name) + 1)
   )
) as 'middle name' from users;
