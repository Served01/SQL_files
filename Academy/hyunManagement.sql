
select * from tab; --table이 존재하는가?

--oracle은 그자체가 db라서 상관없지만 mySQL같은 다른 곳에서는 database를 먼저 만들고 해야한다.
--database 특성상 같은 작업을 반복하게 되면 전부 기록되기 때문에 필요한 경우가 아닌 이상 반복작업 하는것을 피해야 한다.
--즉, 한번 한번을 신중히 해야한다는 것이다.


-- 1번 테이블: student
create table student( 
   stu_no number(8),
   stu_name varchar2(12) not null,
   stu_dept varchar2(20) not null,
   stu_grade number(1) not null,
   stu_class char(3) not null,
   stu_gender char(1) not null,
   stu_height number(5,2), --여기가 not null이 아니므로 null값이 나올 수 있음
   stu_weight number(5,2) not null,
   constraint stu_no primary key(stu_no) --identifier => unique 
   ); --이 얘기는 뭐냐면 이름이 같아도 학번이 다르면 다른 사람이라는 것을 구분할 수 있는 걸 의미
   -- db에는 중복된 테이블이 들어갈 수 없다.
   
   -- 순서를 지켜야 한다.
   insert into student values(20153075, '옥한빛', '기계', 1, 'C', 'M', 177.32, 80.12);
   insert into student values(20153088, '이태연', '기계', 1, 'C', 'F', 162.25, 50.0);
   insert into student values(20143054, '유가인', '기계', 2, 'C', 'F', 154, 47);
   insert into student values(20152088, '조민우', '전기전자', 1, 'C', 'M', 188.00, 90.00);
   insert into student values(20142021, '심수경', '전기전자', 2, 'A', 'F', 168.00, 45.00);
   insert into student values(20132003, '박희철', '전기전자', 3, 'B', 'M', null, 63);
   insert into student values(20151062, '김인중', '컴퓨터정보', 1, 'B', 'M', 166.00, 67);
   insert into student values(20141007, '진현무', '컴퓨터정보', 2, 'A', 'M', 174.00, 64);
   insert into student values(20131001, '김종헌', '컴퓨터정보', 3, 'C', 'M', null, 72);
   insert into student values(20131025, '옥성우', '컴퓨터정보', 3, 'A', 'F', 172.00, 63);
   
   select*from student; --student table의 정보 조회
   
   --update student set stu_name = '이순신' where stu_no = 20153075; 정보를 바꾸는 방법
   --delete from student where stu_no = 20153075; 정보를 삭제하는 방법
   
   drop table student; /*테이블이 삭제된다, 데이터도 같이 삭제됨. 
   drop 명령어는 굉장히 위험한 명령어이다. 정말 필요할때만 쓰여야 한다.
   */
   

  /*1. 데이터 입력 insert
   2. 데이터 조회 select
  select*from student;
   3. 데이터 수정 update
  update student set stu_name = '이순신' where stu_no = 20153075;
   4. 데이터 삭제 delete
  delete from student where stu_no = 20153075;
   5. 프로그램 종료
  */
  
  commit; --커밋 완료
  --이걸 안해서 데이터가 날라갈수도 있고 아닐 수도 있음
  --이 작업은 습관적으로 하는 것이 좋다. 현업에서는 중요하다.
  
  /* 이용 순서
     1. 계정 생성
     2. 계정에 권한 부여
     * java의 data source explorer를 이용하는 이유
     1) 효율이 좋다
     2) 그리고 회사에서는 데이터베이스를 신입에게 맡기는 경우는 없다. 
        즉, dbms를 신입 개발자가 쓰지 않기 때문에 java의 data source explorer를 이용한다.
        그래서 db관리자는 굉장히 비싼 인재이다. 그리고 그만큼 책임감이 무거운 자리다.
        그리고 신입이 아니어도 db관리자를 제외하고는 회사에서 db를 만질 수 없다.
        그러므로 db 내용 관련해서 문제가 있으면 db관리자에게 문의하여 수정을 요청하고 수정이 될 때까지
        개발자는 기다려야만 하는 것이 회사에서의 실상이다. 우리가 이렇게 oracle 이용하고 이런 것은 실제
        회사에서는 db관리자만 하는 것이다. 개발자의 무대는 java이다. 후에 db관리자를 하게 된다면 만질수도 있겠지만 말이다.
     3. oracle에 계정 접속시키기
     4. java와 oracle 연동시키기 위한 환경 설정 하기
     5. 연동하여 프로그램 이용
     
  */
  
  --2022.07.07
--2번 테이블: DEPARTMENTS
create table DEPARTMENTS(
    DEPARTMENT_ID   NUMBER(4,0)         primary key,        --unique + not null
    DEPARTMENT_NAME VARCHAR2(30 BYTE)   not null,
    MANAGER_ID      NUMBER(6,0),
    LOCATION_ID     NUMBER(4,0)
                    --속성 4가지
                    --원본 데이터 항상 보존, 별도로 복사해서 사용
);

select * from DEPARTMENTS;

insert into DEPARTMENTS values(10,'Administration',200,1700);
insert into DEPARTMENTS values(20,'Marketing',201,1800);
insert into DEPARTMENTS values(30,'Purchasing',114,1700);
insert into DEPARTMENTS values(40,'Human Resources',203,2400);
insert into DEPARTMENTS values(50,'Shipping',121,1500);
insert into DEPARTMENTS values(60,'IT',103,1400);
insert into DEPARTMENTS values(70,'Public Relations',204,2700);
insert into DEPARTMENTS values(80,'Sales',145,2500);
insert into DEPARTMENTS values(90,'Executive',100,1700);
insert into DEPARTMENTS values(100,'Finance',108,1700);
insert into DEPARTMENTS values(110,'Accounting',205,1700);
insert into DEPARTMENTS values(120,'Treasury',null,1700);
insert into DEPARTMENTS values(130,'Corporate Tax',null,1700);
insert into DEPARTMENTS values(140,'Control And Credit',null,1700);
insert into DEPARTMENTS values(150,'Shareholder Services',null,1700);
insert into DEPARTMENTS values(160,'Benefits',null,1700);
insert into DEPARTMENTS values(170,'Manufacturing',null,1700);
insert into DEPARTMENTS values(180,'Construction',null,1700);
insert into DEPARTMENTS values(190,'Contracting',null,1700);
insert into DEPARTMENTS values(200,'Operations',null,1700);
insert into DEPARTMENTS values(210,'IT Support',null,1700);
insert into DEPARTMENTS values(220,'NOC',null,1700);
insert into DEPARTMENTS values(230,'IT Helpdesk',null,1700);
insert into DEPARTMENTS values(240,'Government Sales',null,1700);
insert into DEPARTMENTS values(250,'Retail Sales',null,1700);
insert into DEPARTMENTS values(260,'Recruiting',null,1700);
insert into DEPARTMENTS values(270,'Payroll',null,1700);

  --2022.07.25
--3번 테이블: ENROL
   create table enrol( 
   sub_no char(3)
   constraint enr_sub_no_fk references subject(sub_no),
   stu_no number(8)
   constraint enr_stu_no_fk references student(stu_no),
   enr_grade number(3),
   constraint enr_pk primary key(sub_no,stu_no)
   );
   -- constraint할 때 pk할때는 ,를 써야하고  references로 할 때는 ,를 쓰면 안됨
   Insert INTO enrol Values('101', 20131001, 80);
   Insert INTO enrol Values('104', 20131001, 56);
   Insert INTO enrol Values('106', 20132003, 72);
   Insert INTO enrol Values('103', 20152088, 45);
   Insert INTO enrol Values('101', 20131025, 65);
   Insert INTO enrol Values('104', 20131025, 65);
   Insert INTO enrol Values('108', 20151062, 81);
   Insert INTO enrol Values('107', 20143054, 41);
   Insert INTO enrol Values('102', 20153075, 66);
   Insert INTO enrol Values('105', 20153075, 56);
   Insert INTO enrol Values('102', 20153088, 61);
   Insert INTO enrol Values('105', 20153088, 78);
  
  -- enr_grade를 제외한 2개는 전부 외부에서 가져온 거기 때문에 이 table의 pk가 될 수 없다.
  -- 위와 같은 코딩을 pdf 파일의 그림을 보고 머릿속에 그려져야 한다. 그렇게 되도록 연습해야 한다.
  select * from enrol;
  
--4번 테이블: subject
  create table subject( 
  sub_no char(3),
  sub_name varchar2 (30) not null,
  sub_prof varchar2 (12) not null,
  sub_grade number(1) not null,
  sub_dept varchar2(20) not null,
  constraint sub_no_pk primary key(sub_no)
  );
  
 commit;
  
  Insert INTO subject Values('111', '데이터베이스', '이재영', 2, '컴퓨터정보');
  Insert INTO subject Values('110', '자동제어', '정순정', 2, '전기전자');
  Insert INTO subject Values('109', '자동화설계', '박민영', 3, '기계');
  Insert INTO subject Values('101', '컴퓨터개론', '강종영', 3, '컴퓨터정보');
  Insert INTO subject Values('102', '기계공작법', '김태영', 1, '기계');
  Insert INTO subject Values('103', '기초전자실험', '김유석', 1, '전기전자');
  Insert INTO subject Values('104', '시스템분석설계', '강석현', 3, '컴퓨터정보');
  Insert INTO subject Values('105', '기계요소설계', '김명성', 1, '기계');
  Insert INTO subject Values('106', '전자회로실험', '최영민', 3, '전기전자');
  Insert INTO subject Values('107', 'CAD응용실습', '구봉규', 2, '기계');
  Insert INTO subject Values('108', '소프트웨어공학', '권민성', 1, '컴퓨터정보');



--5번 테이블: salgrade
create table SALGRADE(
    GRADE char(2) not null,
    LOSAL number(7) not null,
    HISAL number(7) not null,
    constraint GRADE primary key(GRADE)
);

insert into SALGRADE values(1, 700, 1200);
insert into SALGRADE values(2, 1201, 1400);
insert into SALGRADE values(3, 1401, 2000);
insert into SALGRADE values(4, 2001, 3000);
insert into SALGRADE values(5, 3001, 9999);

select * from SALGRADE;

--6번 테이블: emp
create table EMP(
    EMPNO char(4),
    ENAME varchar2(30) not null,
    JOB varchar2(20) not null,
    MGR char(4),
    HIREDATE date not null,
    SAL number(7) not null,
    COMM number(7),
    DEPTNO char(2) not null,
    constraint EMPNO primary key(EMPNO)
);


insert into EMP values(7839, 'KING', 'PRESIDENT', null, '1981-11-17', 5000, null, 10);
insert into EMP values(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, null, 20);
insert into EMP values(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, null, 30);
insert into EMP values(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, null, 10);
insert into EMP values(7788, 'SCOTT', 'ANALYST', 7566, '1987-07-13', 3000, null, 20);
insert into EMP values(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, null, 20);
insert into EMP values(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
insert into EMP values(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
insert into EMP values(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
insert into EMP values(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
insert into EMP values(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, null, 30);
insert into EMP values(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, null, 10);
insert into EMP values(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, null, 20);
insert into EMP values(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100, null, 20);

select * from EMP;
select*from tab;

--7번 테이블: dept
create table DEPT(
    DEPTNO char(3),
    DNAME varchar2(30) not null,
    LOC varchar2(12) not null,
    constraint DEPTNO primary key(DEPTNO)
);

insert into DEPT values(10, 'ACCOUNTING', 'NEW YORK');
insert into DEPT values(20, 'RESEARCH', 'DALLAS');
insert into DEPT values(30, 'SALES', 'CHICAGO');
insert into DEPT values(40, 'OPERATIONS', 'BOSTON');

select * from DEPT;
select stu_no,stu_name
from student;



--8번 테이블: employees
create table employees(
EMPLOYEE_ID NUMBER(6,0) primary key,
EMPLOYEE_NAME VARCHAR2(20) not null,
EMPLOYEE_EMAIL VARCHAR2(25) not null,
PHONE_NUMBER VARCHAR2(20) not null,
HIRE_DATE DATE not null,
JOB_ID VARCHAR2(10) not null,
SALARY NUMBER(8,2) not null,
COMMISSION NUMBER(6,2) not null,
MANAGER_ID NUMBER(6,0) not null,
DEPARTMENT_ID NUMBER(4,0) not null
);

insert into employees values(100,'StevenKing','StevenKing@StevenKing.com','010.123.4567','03/06/17','ITProg',24000,90,109, 10);
insert into employees values(101,'NeenaKochhar','Neena@NeenaKochhar.com','010.123.4568','05/09/21','Account',17000,100,90,20);
insert into employees values(102,'Lex','LDEHAAN@ldhan.com','010.123.4569','01/01/13','ITDataBase',17000,100,90,30);
insert into employees values(103,'Alexander','Hunold@AHUNOLD.com','010.423.4567','06/01/03','IT_PROG',9000,102,60,40);
insert into employees values(104,'Bruce','Ernst@BERNST.com','010.423.4568','07/05/21','IT_PROG',6000,103,60,50);
insert into employees values(105,'David','Austin@DAUSTIN.com','010.423.4569','05/06/25','IT_PROG',4800,103,60,60);
insert into employees values(106,'Valli','Pataballa@VPATABAL.com','010.423.4560','06/02/05','IT_PROG',4800,103,60,70);
insert into employees values(107,'Diana','Lorentz@DLORENTZ.com','010.423.5567','07/02/07','IT_PROG',4200,103,60,80);
insert into employees values(108,'Nancy','Greenberg@NGREENBE.com','010.124.4569','02/08/17','FI_MGR',12008,101,100,90);
insert into employees values(109,'Daniel','Faviet@DFAVIET.com','010.124.4169','02/08/16','FI_ACCOUNT',9000,108,100,100);

select * from employees;

commit;

--2022.08.03

create table stud 
as select stu_no, stu_name
from student;

select * from stud;
desc stud;

drop table stud;

alter table stud add (stu_weight number(5,2));-- 속성 추가
alter table stud add (stu_keight varchar2(5));
alter table stud modify(stu_keight number(5,2)); --데이터 타입 변경
alter table stud rename column stu_keight to stu_height; --데이터 칼럼명 변경
alter table stud drop (stu_height);

update stud set stu_weight=59.23 where stu_no = 20153088;
update stud set stu_height=123.45 where stu_no = 20153088;

truncate table stud;--구조는 남겨두고 데이터만 모두 삭제

create table emp2
as select *
from emp
where deptno in (20,30);

select * from emp2;
select * from employ;

--rename 이전테이블이름 to 새로운테이블이름
rename emp2 to employ;
--alter table 이전테이블이름 rename to 새로운테이블이름
alter table employ rename to emp2; 

select * from DBA_TABLES;
select * from DBA_INDEXES;
select * from DBA_VIEWS;

select * from ALL_TABLES;
select * from ALL_INDEXES;
select * from ALL_VIEWS;

select * from USER_TABLES;
select * from USER_INDEXES;
select * from USER_VIEWS;

select * from tab;--oracle

-- select * from tables; -mysql
/*
select * from DBA_TABLES;
select * from DBA_INDEXES;
select * from DBA_VIEWS;

create view studA
as select *
from hyun.student;*/
--DBA 권한이 있는 sys가 연결 되어있는 sysManager에서 실행시킬수 있다.


