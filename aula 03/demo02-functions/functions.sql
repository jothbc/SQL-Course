-- concat command
select concat('a', 'b', 'c');
select concat('a', 'b', 'c') as abc;

select concat('Nome: ', name, ', Email: ', email) as 'Nome e Email' from users;

-- upper command
select upper('abc') as ABC;
select upper(name) as Nome from users;

-- lower command
select lower('ABC') as abc;
select lower(name) as nome from users;

-- length command
select length('abc') as ABC;
select name, length(name) as 'Tamanho do Nome' from users;

-- trim command
select trim('    abc    ') as ABC;
select trim(name) as Nome from users;

-- substring command
-- substring(string, start, length) (in programming generally the index starts at 0, in this case in SQL command the index starts at 1)
select substring('abcdef', 1, 2) as ab;

-- Can you capitalize the word?
select concat(upper(substring(name, 1, 1)), lower(substring(name, 2))) as 'Captalized Name' from users;

-- replace command
select replace('abcb', 'b', 'x') as 'abcb -> axcx';
select replace(name, 'a', 'X') as Nome from users;

-- advanced replace
select regexp_replace('Hello, 123 world!', '\\d+', 'X') as replaced_string;
-- Hello, X world!

-- reverse command
select reverse('abc') as 'cba';
select reverse(name) as Nome from users;

-- locate command
-- locate(substring, original_string, initial_index)
select locate('a', 'banana') as 'position_of_a'; -- 2
select locate('a', 'banana', 2) as 'position_of_a'; -- 4
select locate('a', name) as 'position_of_a' from users;


-- max command
select max(value) from products;
    -- How do I get the entire record?
    select * from products where value = (select max(value) from products);
-- min command
select min(value) from products;

-- avg command
select avg(value) from products;

-- sum command
select sum(value) from products;

-- count command
select count(*) from products;

-- group by command
select category, count(*) from products group by category;

-- having command (only works with group by command)
select category, count(*) as count from products group by category having count > 10;

select category, count(*) as count from products group by category having category like '%j%';
-- the same as (more efficient)
select category, count(*) as count from products where category like '%j%' group by category;




