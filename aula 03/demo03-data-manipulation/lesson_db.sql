create database date_manipulation;
use date_manipulation;

create table users(
    id int primary key auto_increment,
    name varchar(100),
    due_date date,
    lunch_time time,
    birthdate datetime,
    created_at timestamp default current_timestamp
);

insert into users(name, due_date, lunch_time, birthdate) values
('Jonathan', '2022-01-01', '12:00:00', '1996-06-19 03:00:00'), -- 27 years old
('Maria', '2023-10-25', '13:00:00', '2000-03-03 09:03:00'), -- 23 years old
('Jose', '2019-06-03', '14:00:00', '1985-08-23 16:56:34'), -- 39 years old
('Joao', '2022-08-27', '12:30:00', '2001-03-09 12:30:00'), -- 22 years old
('Pedro', '2022-03-06', '11:00:00', '2008-09-27 22:12:00'); -- 16 years old

