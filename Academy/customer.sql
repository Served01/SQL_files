create database customerdb;

use customerdb;

create table customer(
id varchar(12) primary key,
passwd varchar(12) not null,
name varchar(20),
address varchar(60),
reg_date timestamp
);
commit;
select * from customer;

insert into customer values('wslim','1234', 'wooseong', '서울시 신림동' ,now());
insert into customer values('wslim2','12345', 'wooseong2', '서울시 신림동' ,now());