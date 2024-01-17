create database if not exists lesson_2;
use lesson_2;
create table if not exists datatypes
(
    id             int primary key auto_increment,
    name           varchar(100) not null,
    age            int,
    year_of_birth  int unsigned,
    month_of_birth smallint(2),
    day_of_birth   tinyint(2),
    height         decimal(5, 2) comment 'height in meters, decimal(5,2) => 5 digits, 2 decimals',
    birth_date     date comment 'YYYY-MM-DD',
    birth_time     time comment 'HH:MM:SS',
    wedding_date   datetime comment 'YYYY-MM-DD HH:MM:SS (data de casamento)',
    created_at     timestamp default current_timestamp,
    updated_at     timestamp default current_timestamp on update current_timestamp comment 'only exist on update trigger inline',
    gender         char(1) comment 'M, F, O (Others)',
    martial_status enum ('S', 'M', 'D', 'W') comment 'Single, Married, Divorced, Widower (Solteiro, Casado, Divorciado, Viuvo)',
    rules          set ('administrator', 'moderator', 'user') comment 'administrator, moderator, user'
);


create table if not exists logs
(
    id  int primary key auto_increment,
    log varchar(500) not null
);
create table if not exists user
(
    id         int primary key auto_increment,
    name       varchar(100) not null,
    email      varchar(100),
    created_at timestamp default current_timestamp
);

