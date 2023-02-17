create database hyundb;

use hyundb;

create table member(
id varchar(12) primary key,
passwd varchar(12) not null,
name varchar(20),
reg_date timestamp
);
commit;
select * from member;

insert into member values('vange100', '1234', 'hyundaebin',sysdate());
insert into member values('vange1050', '12345', 'hyundaebin',sysdate());
insert into member values('vange1089', '1235', 'hyundaebin2',now());
