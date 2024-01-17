-- explicit insertion
INSERT INTO datatypes (name, age, year_of_birth, month_of_birth, day_of_birth, height, birth_date, birth_time, wedding_date, gender, martial_status, rules)
VALUES
    ('João', 30, 1992, 5, 20, 1.75, '1992-05-20', '08:45:00', '2017-12-10', 'M', 'M', 'administrator,moderator,user'),
    ('Maria', 25, 1996, 8, 22, 1.68, '1996-08-22', '12:15:00', '2019-06-05', 'F', 'S', 'user'),
    ('Carlos', 35, 1987, 2, 10, 1.80, '1987-02-10', '18:30:00', '2012-09-15', 'M', 'D', 'administrator,user');


-- warning to rounded values to int
INSERT INTO datatypes (name, age, year_of_birth, month_of_birth, day_of_birth, height, birth_date, birth_time, wedding_date, gender, martial_status, rules)
VALUES ('João', 30.5, 1992.5, 5.5, 20.5, 1.75, '1992-05-20', '08:45:00', '2017-12-10', 'M', 'M', 'administrator,moderator,user');
