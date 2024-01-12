-- using table called datatypes
create table if not exists datatypes (
    id             int primary key auto_increment,
    name           varchar(100) not null,
    age            int,
    -- int min -2147483648 max 2147483647 => unsigned => min 0 max 4294967295 ((2147483647 * 2) + 1) (range 2^32)
    year_of_birth  int unsigned,
    month_of_birth smallint(2),
    day_of_birth   tinyint(2),
    height         decimal(5, 2) comment 'height in meters, decimal(5,2) => 5 digits, 2 decimals',
    birth_date     date comment 'YYYY-MM-DD',
    birth_time     time comment 'HH:MM:SS',
    wedding_date   datetime comment 'YYYY-MM-DD HH:MM:SS (data de casamento)',
    -- select current_timestamp
    created_at     timestamp default current_timestamp,
    updated_at     timestamp default current_timestamp on update current_timestamp comment 'only exist on update trigger inline',
    gender         char(1) comment 'M, F, O (Others)',
    martial_status enum ('S', 'M', 'D', 'W') comment 'Single, Married, Divorced, Widower (Solteiro, Casado, Divorciado, Viuvo)',
    rules          set ('administrator', 'moderator', 'user') comment 'administrator, moderator, user'
);


INSERT INTO datatypes (name, age, year_of_birth, month_of_birth, day_of_birth, height, birth_date, birth_time, wedding_date, gender, martial_status, rules)
VALUES
    ('João', 30, 1992, 5, 20, 1.75, '1992-05-20', '08:45:00', '2017-12-10', 'M', 'M', 'administrator,moderator,user'),
    ('Maria', 25, 1996, 8, 22, 1.68, '1996-08-22', '12:15:00', '2019-06-05', 'F', 'S', 'user'),
    ('Carlos', 35, 1987, 2, 10, 1.80, '1987-02-10', '18:30:00', '2012-09-15', 'M', 'D', 'administrator,user');


-- warning to rounded values to int
INSERT INTO datatypes (name, age, year_of_birth, month_of_birth, day_of_birth, height, birth_date, birth_time, wedding_date, gender, martial_status, rules)
VALUES ('João', 30.5, 1992.5, 5.5, 20.5, 1.75, '1992-05-20', '08:45:00', '2017-12-10', 'M', 'M', 'administrator,moderator,user');
