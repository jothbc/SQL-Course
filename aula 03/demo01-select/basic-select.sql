-- basic select
select * from users;

-- basic select with where
select * from users where id = 1;

-- especific select column
select name from users;

select name, email from users;

-- especific select column and where
select name, email from users where id = 1;

-- applying alias on column name
select name as Nome, email as Email from users;

-- using limit
select * from users limit 10;

-- using offset (limit + offset)
select * from users limit 10 offset 10;

