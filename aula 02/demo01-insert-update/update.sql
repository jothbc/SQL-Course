-- update command
update user set name = 'Jonathan' where id = 1;
update user set name = 'Marya', email = 'marya@teste.com' where id = 2;


-- using current value to update yourself
update user set name = concat(name, ' - ', email) where id > 4;