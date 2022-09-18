	
create table camping_member(
	id varchar2(20) primary key,
	passwd1 varchar2(20) not null,
	name varchar2(30) not null,
	email varchar2(30) not null,
	tele varchar2(20),
	hobby varchar2(30),
	job varchar2(20),
	age varchar2(10),
	info varchar2(3000)
	);
	
commit;

select * from camping_member;

select * from tab;

create table smartboard(
	num number primary key,
	writer varchar2(30) not null,
	email varchar2(40) not null,
	subject varchar2(40) not null,
	password varchar2(15) not null,
	reg_date Date,
	ref number,
	re_step number,
	re_level number,
	readCount number,
	content varchar2(500) not null
);

select * from SMARTBOARD;

create sequence smartboard_num
	start with 1
	increment by 1
	minvalue 1
	maxvalue 1000
	cycle;
	
insert into smartboard values(smartboard_num.nextval,'현대빈','cic313@daum.net','가을아','1234',sysdate,1,1,1,0,'가을이 좋다');
insert into smartboard values(smartboard_num.nextval,'홍길동','cic313@daum.net','겨울아','1234',sysdate,1,1,1,0,'겨울이 좋다');
insert into smartboard values(smartboard_num.nextval,'이길동','cic313@daum.net','여름아','1234',sysdate,1,1,1,0,'여름이 좋다');

commit;

update smartboard set readcount = readcount + 1 where num = 1;
truncate table smartboard;

select max(re_level) from smartboard where ref = 1;




