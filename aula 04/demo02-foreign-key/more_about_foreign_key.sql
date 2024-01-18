-- Foreign key

create table log(
    id int primary key auto_increment,
    user_id int,
    created_at timestamp default current_timestamp
);

alter table log
    add foreign key (user_id) references users(id);


-- drop is hard
-- if you dont define the foreign key name, the DBMS (database management system) will create one
-- you can see using
SHOW CREATE TABLE log;

alter table log
    drop foreign key THE_FOREIGN_KEY_NAME;

-- or you can define the foreign key name when you create the foreign key
alter table log
    add foreign key fk_user (user_id) references users(id);

alter table log
    drop foreign key fk_user;