create table employees(
    EMPLOYEE_ID	NUMBER(6,0) primary key,
    EMPLOYEE_NAME	VARCHAR2(20) not null,
    EMPLOYEE_EMAIL	VARCHAR2(25) not null,
    PHONE_NUMBER	VARCHAR2(20) not null,
    HIRE_DATE	DATE	not null,
    JOB_ID	VARCHAR2(10) not null,
    SALARY	NUMBER(8,2)	not null,
    COMMISSION	NUMBER(6,2)	not null,
    MANAGER_ID	NUMBER(6,0)	not null,
    DEPARTMENT_ID	NUMBER(4,0)	not null
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

--HR 계정의 테이블과 데이터을 복사하여 이용합니다.

select * from jobs;
Create table jobs (
	JOB_ID	VARCHAR2(10) primary key,
	JOB_TITLE	VARCHAR2(35) not null,
	MIN_SALARY	NUMBER(6,0),	
	MAX_SALARY	NUMBER(6,0)	
); 

insert into jobs values('AD_PRES', 'President', 20080, 40000);
insert into jobs values('AD_VP', 'Administration Vice President', 15000, 30000);
insert into jobs values('AD_ASST', 'Administration Assistant',	3000, 6000);
insert into jobs values('FI_MGR', 'Finance Manager', 8200, 16000);
insert into jobs values('FI_ACCOUNT', 'Accountant',	4200, 9000);
insert into jobs values('AC_MGR',	'Accounting Manager', 8200,	16000);
insert into jobs values('AC_ACCOUNT',	'Public Accountant', 4200, 9000);
insert into jobs values('SA_MAN',	'Sales Manager', 10000,	20080);
insert into jobs values('SA_REP',	'Sales Representative',	6000, 12008);
insert into jobs values('PU_MAN',	'Purchasing Manager',	8000, 15000);
insert into jobs values('PU_CLERK',	'Purchasing Clerk',	2500, 5500);
insert into jobs values('ST_MAN',	'Stock Manager', 5500, 8500);
insert into jobs values('ST_CLERK',	'Stock Clerk', 2008, 5000);
insert into jobs values('SH_CLERK',	'Shipping Clerk', 2500,	5500);
insert into jobs values('IT_PROG',	'Programmer', 4000,	10000);
insert into jobs values('MK_MAN',	'Marketing Manager', 9000,	15000);
insert into jobs values('MK_REP',	'Marketing Representative',	4000,	9000);
insert into jobs values('HR_REP',	'Human Resources Representative', 4000,	9000);
insert into jobs values('PR_REP',	'Public Relations Representative', 4500, 10500);

commit;


--1. 직책(Job Title)이 Programmer인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 
---  출력 시 년도를 기준으로 오름차순 정렬하시오. 


--2. 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
--   평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력하시오. 
--   단, 도시에 근무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.

create table locations(
    LOCATION_ID	NUMBER(4,0)	primary key,
    STREET_ADDRESS	VARCHAR2(40),
    POSTAL_CODE	VARCHAR2(12),
    CITY	VARCHAR2(30) not null,
    STATE_PROVINCE	VARCHAR2(25),
    COUNTRY_ID	CHAR(2)
);

insert into locations values(1000, '1297 Via Cola di Rie', '00989', 'Roma', null, 'IT');
insert into locations values(1100, '93091 Calle della Testa', '10934', 'Venice', null, 'IT');
insert into locations values(1200, '2017 Shinjuku-ku',	'1689',	'Tokyo', 'Tokyo Prefecture', 'JP');
insert into locations values(1300, '9450 Kamiya-cho',	'6823',	'Hiroshima', 'null', 'JP');
insert into locations values(1400, '2014 Jabberwocky Rd', '26192', 'Southlake',	'Texas', 'US');
insert into locations values(1500, '2011 Interiors Blvd', '99236', 'South San Francisco',	'California', 'US');
insert into locations values(1600, '2007 Zagora St', '50090', 'South Brunswick',	'New Jersey',	'US');
insert into locations values(1700, '2004 Charade Rd',	'98199',	'Seattle',	'Washington',	'US');
insert into locations values(1800, '147 Spadina Ave',	'M5V 2L7',	'Toronto',	'Ontario',	'CA');
insert into locations values(1900, '6092 Boxwood St',	'YSW 9T2',	'Whitehorse',	'Yukon',	'CA');
insert into locations values(2000, '40-5-12 Laogianggen',	'190518', 'Beijing', 'null', 'CN');
insert into locations values(2100, '1298 Vileparle (E)',	'490231',	'Bombay',	'Maharashtra',	'IN');
insert into locations values(2200, '12-98 Victoria Street', '2901',	'Sydney',	'New South Wales',	'AU');
insert into locations values(2300, '198 Clementi North', '540198',	'Singapore', 'null', 'SG');
insert into locations values(2400, '8204 Arthur St', 'null', 'London', 'null',	'UK');
insert into locations values(2500, 'Magdalen Centre, The Oxford Science Park',	'OX9 9ZB',	'Oxford',	'Oxford',	'UK');
insert into locations values(2600, '9702 Chester Road',	'09629850293',	'Stretford',	'Manchester',	'UK');
insert into locations values(2700, 'Schwanthalerstr. 7031',	'80925',	'Munich',	'Bavaria',	'DE');
insert into locations values(2800, 'Rua Frei Caneca 1360', 	'01307-002',	'Sao Paulo',	'Sao Paulo',	'BR');
insert into locations values(2900, '20 Rue des Corps-Saints',	'1730',	'Geneva',	'Geneve',	'CH');
insert into locations values(3000, 'Murtenstrasse 921',	'3095',	'Bern',	'BE',	'CH');
insert into locations values(3100, 'Pieter Breughelstraat 837',	'3029SK',	'Utrecht',	'Utrecht',	'NL');
insert into locations values(3200, 'Mariano Escobedo 9991',	'11932',	'Mexico City',	'Distrito Federal',	'MX');

select * from locations order by location_id;--21


--3. ‘Programmer’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하시오. 
--   (현재 ‘Programmer’의 직책(job_title)으로 근무하는 사원은 고려 하지 않는다.)      

select e.employee_id as 사번, e.employee_name as 이름
    from  employees e, job_history j
    where e.employee_id = j.employee_id
    and j.job_id = (select job_id
                        from jobs
                        where job_title = 'Programmer');--102	Lex

--4. 자신의 매니저보다 연봉(salary)를 많이 받는 직원들의 이름과 연봉(salary)를 출력하시오. 
--self join
select e1.employee_name as 직원이름, e1.salary as 연봉, e2.salary as 매니저연봉
    from employees e1, employees e2
    where e1.manager_id = e2.employee_id
    and e1.salary > e2.salary;--StevenKing	24000	9000


--5. 2007년에 입사(hire_date)한 직원들의 사번(employee_id), 이름(EMPLOYEE_NAME), 
--   부서명(department_name)을 조회합니다.  
--   이때, 부서에 배치되지 않은 직원의 경우, ‘<Not Assigned>’로 출력하시오. 

select e.employee_id, e.EMPLOYEE_NAME, d.department_name, nvl(d.department_name, 'Not Assigned')
    from employees e, departments d
    where e.department_id = d.department_id
    and to_char(hire_date, 'YYYY') = '2007';


--6. 업무명(job_title)이 ‘Programmer’인 직원 중에서 연봉(salary)이 6,000이상, 12,000 이하인 
--직원들의 이름(EMPLOYEE_NAME)과 연봉(salary)를 출력하시오.

select e.employee_name, e.salary
    from employees e, jobs j
    where e.job_id = j.job_id
    and j.job_title = 'Programmer';--5명, Alexander, Bruce, David, Valli, Diana
    
select e.employee_name, e.salary
    from employees e, jobs j
    where e.job_id = j.job_id
    and j.job_title = 'Programmer'
    and salary between 6000 and 12000;--2명, Alexander, Bruce
    
--7. 부서별로 가장 적은 급여를 받고 있는 직원의 이름, 부서이름, 급여를 출력하시오. 
    select e.employee_name, d.department_name, e.salary
        from employees e, departments d
        where e.department_id = d.department_id
        and e.salary in (select min(salary)
                        from employees e, departments d
                        where e.department_id = d.department_id
                        group by d.department_id);



--8. EMPLOYEES 테이블에서 급여를 많이 받는 순서대로 조회했을 때 결과처럼 6번째부터 10 번째까지 
--5명의 이름과 salary를 조회하시오.
select rownum no, employee_name, salary
    from employees
    order by salary desc;--10명 전부 출력
    
select employee_name, salary,
    (select count(*)+1
    from employees e2
    where e2.salary > e1.salary) ranking
    from employees e1
    where ranking between 6 and 10;--겹치는 등수가 존재해서 오류 발생


--9. 각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다. 연봉 총합이 가장 높은 업무부터 
--업무명(job_title)과 연봉 총합을 조회하시오. 단 연봉총합이 10,000보다 큰 업무만 출력하시오. 

select j.job_title, sum(e.salary)
from jobs j, employees e
where e.job_id = j.job_id
group by j.job_title
having sum(e.salary) >= 10000
order by sum(e.salary) desc;

--SET

select * from a_student;

create table a_student
    as select *
    from student
    where stu_dept in ('기계', '전기전자');
    desc a_student;

select * from b_student;

create table b_student
    as select *
    from student
    where stu_dept in ('컴퓨터정보', '전기전자');
    desc b_student;

select * from a_student
    union
select * from b_student; --중복 데이터 제거 후 출력

select * from a_student
    union all
select * from b_student; --중복 데이터 포함 후 출력

select * from a_student
    intersect
select * from b_student; --중복 데이터만 출력

select * from a_student
    minus
select * from b_student; --중복 데이터를 완전 제거 후 출력

-- alter는 테이블의 속성값 형식 같은 것을 바꾸는 것

-- 단일 튜플(레코드) 삽입
create table a_enrol
as select *
from enrol
where stu_no < 20150000;

desc a_enrol;

select * from a_enrol;

-- 복수 행 삽입
insert into a_enrol
select * from enrol
where stu_no like '2015%';

update a_enrol
    set enr_grade = enr_grade + 10
    where sub_no = (select sub_no
                    from subject
                    where sub_name='시스템분석설계');

select s.sub_no, e.enr_grade
from subject s, enrol e
where s.sub_no = e.sub_no and s.sub_no = '104';

-- 튜플 삭제
delete from a_enrol
where stu_no = 20131001;

select * from a_enrol;

delete from a_enrol;

desc a_enrol;

create table c_student
as select * from student
where stu_dept in ('기계','전기전자','인공지능');

select * from c_student;

create table d_student
as select * from student
where stu_dept in ('컴퓨터정보','전기전자','인공지능');

select * from d_student;
drop table d_student;
delete from d_student;

commit;
rollback;
-- 데이터 삭제 후 commit를 실행한 후 rollback을 실행하면 데이터가 복구되지 않는다.
-- 그러나 데이터 삭제 후 commit을 실행 안하고 rollback을 실행하면 데이터가 복구된다.
-- 그리고 commit을 실행 안한 경우에는 15분 이내에 rollback 해야한다.
-- 실전에서는 delete 혹은 update의 경우에는 바로 commit하는 것을 지양해야한다.

create table cc_student
    (stu_no number,
     stu_name char(10)); --create는 자동 commit이 된다.
-- 그러므로 create 전에 했던 모든 과정들이 commit 되어버리므로 주의해야한다.
-- commit 시점을 잘 알아두어야 한다.
-- 작업이 비정상적으로 종료되면 rollback 된다.
     
select * from cc_student;

alter table cc_student
    add constraints pk_cc_student primary key(stu_no);

-- commit한 순서대로 먼저 db에 입력된다.

-- rowid는 오라클에만 존재함 mysql 같은 다른 것에는 없음

-- DDL(데이터정의어)

create table t_student
    as select * from student
    where stu_dept = '기계';
    
desc t_student;

alter table t_student
add(army char(1));

alter table t_student
modify(army number);

alter table t_student
drop (army);

rename t_student to test_student;

desc test_student;

truncate table test_student;

select * from test_student;

desc test_student;

rollback;

-- 2022.09.16
-- 제약조건 실습

create table t_student(
    stu_no char(9),
    stu_name varchar2(12),
    stu_dept varchar2(20)
        constraint n_stu_dept not null,
    stu_grade number(1),
    stu_class char(1),
    stu_gender char(1),
    stu_height number(5,2),
    stu_weight number(5,2));
    
desc t_student;

create table t1_student(
    stu_no char(9),
    stu_name varchar2(12)
        constraint u_stu_name unique,
    stu_dept varchar2(20)
        constraint m_stu_dept not null,
    stu_grade number(1),
    stu_class char(1),
    stu_gender char(1)
        constraint c_stu_gender check (stu_gender in('M','F')),
    stu_height number(5,2),
    stu_weight number(5,2),
        constraint p_stu_no primary key(stu_no));
        
desc t1_student;

alter table t1_student
modify (stu_no varchar2(9) not null);

create table t5_student(
    sub_no varchar2(3),
    stu_no varchar2(9),
    enr_grade number(3),
        constraint enrol_fk primary key(stu_no, sub_no)
);
desc t5_student;

drop table t5_student;

create table t_enrol(
    sub_no char(3),
    stu_no number(8),
    enr_grade number(3),
        constraint enr_sub_no_fk1 foreign key (sub_no)
            references subject(sub_no),
        constraint enr_stu_no_fk2 foreign key (stu_no)
            references student(stu_no),
        constraint p_enrol primary key(sub_no,stu_no));
        
desc subject1;
desc student1;

select * from user_constraints;
--where table_name = 't_enrol';

select * from user_constraints
where table_name = 'T_ENROL';
-- 대문자로 써야함

commit;

alter table t_enrol
drop constraints p_enrol cascade;

desc t_enrol;