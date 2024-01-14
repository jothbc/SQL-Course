-- logical and comparison operators in where

-- and operator (higher priority than or)
-- this will return when left operation and right operation are true
select * from products where value = 100 and name = 'teste';

-- or operator (lower priority than and)
-- this will return when left operation or right operation is true
select * from products where value = 100 or name = 'teste';

-- you can combine logical operators
select * from products where value = 100 and name = 'teste' or name = 'teste2';

-- not operator (highter priority than and and or)
select * from products where not value = 100;

-- like operator
-- the % is a wildcard, it means any string of any length
select * from products where name like '%teste%';

-- different operator
select * from products where name <> 'teste';
select * from products where name != 'teste';

-- smaller than operator
select * from products where value < 100;

-- bigger than operator
select * from products where value > 100;

-- smaller or equal than operator
select * from products where value <= 100;

-- bigger or equal than operator
select * from products where value >= 100;

-- between operator
select * from products where value between 100 and 200;

-- in operator
select * from products where value in (100, 200);