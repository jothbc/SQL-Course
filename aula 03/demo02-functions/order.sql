-- ORDER BY command

-- ascending order (default)
select * from users order by name asc;
select * from users order by name;

-- descending order
select * from users order by name desc;

-- multiple columns
select * from users order by email asc, name desc;