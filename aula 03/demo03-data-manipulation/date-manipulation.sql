-- date type manipulation
-- get only year
select year(birthdate), birthdate, name from users;
-- get only month
select month(birthdate) from users;
-- get only day
select day(birthdate) from users;
-- get only hour
select hour(birthdate) from users;
-- get only minute
select minute(birthdate) from users;
-- get only second
select second(birthdate) from users;

-- ---------------------- ADD -------------------------------- --
-- add a day
select date_add(birthdate, interval 1 day) from users;
-- add a month
select date_add(birthdate, interval 1 month) from users;
-- add a year
select date_add(birthdate, interval 1 year) from users;

-- add 2 years, 2 months and 2 days
select date_add(date_add(date_add(birthdate, interval 2 year), interval 2 month), interval 2 day) from users;

-- ------------------------  SUB ------------------------------ --
-- subtract a day
select date_sub(birthdate, interval 1 day) from users;
-- subtract a month
select date_sub(birthdate, interval 1 month) from users;
-- subtract a year
select date_sub(birthdate, interval 1 year) from users;

-- format date
select date_format(birthdate, '%d/%m/%Y') from users;

-- %d = day of month as a numeric value (01 to 31)
-- %m = month as a numeric value (01 to 12)
-- %Y = year as a numeric value ( 4 digits )
-- %y = year as a numeric value ( 2 digits )

-- %H = hour (00 to 23)
-- %i = minute (00 to 59)
-- %s = second (00 to 59)

select date_format(birthdate, '%d/%m/%Y %H:%i:%s') as `DD/MM/YYYY HH:MM:SS` from users;

-- datediff
-- datediff will return the difference in days between two dates (date1 - date2)
select datediff(curdate(), birthdate) from users; -- will return a positive number
select datediff(birthdate, curdate()) from users; -- will return a negative number


-- using between (lesson 3)
select * from users where birthdate between '1990-01-01' and '2000-01-01';