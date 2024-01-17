-- universal time stamp
select UTC_TIMESTAMP();

create table people
(
    id         int primary key auto_increment,
    name       varchar(100),
    birthdate  datetime,
    created_at timestamp default utc_timestamp
);

insert into people(name, birthdate) values ('Jonathan', '1996-06-19 06:00:00');


-- CONVERT_TZ(date, from_tz, to_tz)
select CONVERT_TZ(birthdate, '+00:00', '-03:00') from people;

-- https://www.geeksengine.com/article/populate-time-zone-data-for-mysql.html