create database customerdb;

use customerdb;

commit;

select* from customer;

create table customer(
id varchar(12) not null primary key,
passwd varchar(12) not null,
name varchar(20) not null,
address varchar(60) not null,
reg_date timestamp not null
);

insert into customer values ('abc', '1234', '임우성', '인천시 부평구', now());