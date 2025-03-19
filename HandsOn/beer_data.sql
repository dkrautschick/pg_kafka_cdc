CREATE TABLE beer (
    name varchar(255) primary key
);
ALTER TABLE beer replica identity FULL;


insert into beer values ( 'Chimay' );
insert into beer values ( 'Delirium Tremens' );
insert into beer values ( 'Leffe' );
insert into beer values ( 'Straffe Hendrik' );
insert into beer values ( 'St. Bernadus Abt 12' );

update beer set name = 'Leffe bruin' where name = 'Leffe';
update beer set name = 'Leffe royal' where name = 'Leffe bruin';
update beer set name = 'Chimay Rouge' where name = 'Chimay';

delete from beer;
