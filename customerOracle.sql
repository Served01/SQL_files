
select * from customer;

commit;

create table customer(
id varchar(12) not null primary key,
passwd varchar(12) not null,
name varchar(20) not null,
address varchar(60) not null,
reg_date timestamp not null
);

insert into customer values ('abcd', '1234', '임우성', '인천시부평구', sysdate);