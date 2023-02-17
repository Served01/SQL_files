create table membership(
id varchar2(15),
password varchar2(10),
name varchar2(15),
age number,
gender varchar2(6),
email varchar2(30),
primary key(id));

select * from membership;

insert into membership values ('hyun', '1234', '홍길동',
54, '남성', 'cic313@daum.net');
insert into membership values ('adminhyun', '1346', '임우성',
30, '남성', 'cic313@daum.net');
insert into membership values ('admin', '12345', '임우성',
30, '남성', 'cic313@daum.net');
