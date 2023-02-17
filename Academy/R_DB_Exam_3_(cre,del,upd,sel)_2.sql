--1.
drop table student1;
drop table enrol1;
drop table subject1;

create table student1
as select * from student;
select * from student1;
desc student1;
alter table student1 modify stu_weight null;
commit;

create table subject1
as select * from subject;

create table enrol1
as select * from enrol;


--2.
insert into student1 values (20151059, '조병준', '컴퓨터정보', 1, 'B', 'M', 164, 70);

--3.
insert into student1 values (20102038, '남지선', '전기전자', 1, 'C', 'F', null,null);

--4.
insert into student1 values (20103009, '박소신', '기계',
(select stu_grade from student1 where stu_no = 20153075),
(select stu_class from student1 where stu_no = 20153075),
'M', NULL, NULL);

--5.
insert into student1 (stu_no, stu_name, stu_dept, stu_grade, stu_class, stu_gender, stu_height, stu_weight)
select * from student
where stu_grade = 3;

--6.
update student1 set stu_class='B' where stu_no=20153075;

--7.
update student1 set stu_height = stu_height + 2 where stu_no=20153075;

--8.
update student1 set stu_grade = stu_grade + 1;

--9.
update student1 set stu_dept = '컴퓨터정보', stu_no = 20151075
where stu_no=20153075;

--10.
desc enrol1;
update enrol1 a 
set a.enr_grade = a.enr_grade +10
where a.sub_no = 
(select sub_no from subject1
where sub_name = '전자회로실험');

--11.
update enrol1 a
set a.enr_grade = 0
where a.sub_no =
(select sub_no from subject1
where sub_name = '소프트웨어공학');

--12.
delete student1
where stu_no = 20151062;

--13.
desc subject1;
insert into subject1 values(112, '자동화시스템', '고종민', 3, '기계학과');

--14.
select * from subject1;
update subject1
set sub_no = 501
where sub_no = 110;

--15.
delete subject1
where sub_no =101;
--delete는 그냥 써도 되고 뒤에 from을 써도 된다.

commit;
select * from enrol1;
select * from subject1;

--16.
update enrol1
set sub_no = 999
where sub_no in
(select sub_no from enrol1
minus
select sub_no from subject1);
--not in (select sub_no from subject1)이렇게 하는 방식도 있음

--17. enrol 테이블에서 subject1 테이블에서 수강하는 학생중에 과목번호가 없는 경우에 학번을 99999999로 변경
select * from subject1;

update enrol1
set stu_no = 99999999
where sub_no not in
(select sub_no from subject1);


--18.
delete enrol1
where sub_no=999;

--19.
delete enrol1
where stu_no = 99999999;

--20. enrol1 테이블에 없는 과목들을 subject1에서 삭제하시오.
delete from subject1
where sub_no not in (select sub_no from enrol1);

--21.
delete enrol1;

--insa
drop table dept1;
drop table emp1;
drop table salgrade1;

--1.
create table dept1
as select * from dept;
create table emp1
as select * from emp;
create table salgrade1
as select * from salgrade;

select * from dept1;
select * from emp1;
select * from salgrade1;

--2.
insert into emp1 values (7703, 'JOSH', 'SALESMAN', 7566, sysdate, 1400, 0, 20);
desc emp1;

--3.
insert into emp1 values (7401, 'Homer', 'ACCOUNTANT', null, sysdate, 1300, null, 10);

--4.
insert into emp1 values (7323, 'BRANDA', 'SALESMAN', null, sysdate,
(select sal from emp1 where empno = 7499), NULL, 30);

--5.
insert into emp1
select * from emp
where deptno =10;

select * from emp1;

--6.
update emp1
set job='ANALYST'
where empno = 7369;

--7.
update emp1
set sal = 0.9 * sal
where deptno=20;

--8.
update emp1
set sal = sal + 100;

--9.
update emp1
set mgr=7654, deptno=30
where empno = 7902;

--10.
update emp1
set sal = sal - 10
where deptno = 
(select deptno from dept1
where loc = 'DALLAS');

--11.
update emp1
set sal = sal - 20
where sal >= (select losal from salgrade1 where grade = 2)
and sal <= (select hisal from salgrade1 where grade =2);

--12.
delete emp1
where empno = 7499;

--13.
insert into dept1
values(50, 'PLANNING', 'MIAMI');

--14.
update dept1
set deptno=60
where deptno=40;

--15.
delete dept1
where deptno =30;

--16.
update emp1
set deptno = 99
where deptno not in
(select deptno from dept1);

--17.
delete emp1
where deptno = 99;

select * from emp1;
commit;

--18.
update emp1
set sal = sal + 100
where mgr is null;
select * from emp1;

--19.
update emp1
set deptno = 30
where ename in
('JONES', 'JOSH', 'CLARK');

--20.
update emp1
set comm = 0
where comm is null;

--21.
delete emp1;

-- 2022.09.16

--1. 사원 테이블과 같은 구조의 t-tbl1 테이블을 생성하고 테이블의 구조를 출력하라.
create table t_tbll(
    empno number(4)
    constraint pk_t_tbll primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number (4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

select * from t_tbll;
desc t_tbll;
drop table t_tbll;

--2. t-tbl1 테이블에 부서번호가 20인 데이터를 5명 삽입하라.
insert into t_tbll
    select * from emp 
    where deptno = 20;
    
--3. t-tbl1 테이블의 모든 데이터를 검색하라.
select * from t_tbll;

--4. 부서번호가 10인 사원들로 이루어져 있는 테이블(t_emp10)을 생성하라.
create table t_emp10(
    empno number(4)
    constraint pk_t_emp10 primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number (4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

select * from t_emp10;

insert into t_emp10
    select * from emp 
    where deptno = 10;
    
drop table t_emp10;
    
--5. t_emp10 테이블에 3명의 데이터를 삽입하고 검색하라.
insert into t_emp10 values(8100, 'HYUN', 'Program', 7788, to_date('23-06-2022', 'dd-mm-yyyy'), 8000, 3000, 10);
insert into t_emp10 values(8200, 'HYUN2', 'Program2', 7788, to_date('23-06-2022', 'dd-mm-yyyy'), 6000, 2000, 10);
insert into t_emp10 values(8300, 'HYUN3', 'Program3', 7788, to_date('23-06-2022', 'dd-mm-yyyy'), 7000, 2500, 10);

select * from t_emp10;

--6. t_tbl1 테이블에 성별(gender) 열을 삽입하라.(데이터 타입은 char(1)로 한다.)
alter table t_tbll
    add(t_gender char(1));
    
desc t_tbll;

--7. t_tbl1 테이블에 성별열의 구조를 변경(varchar2(10))하고, 확인하라.
alter table t_tbll
    modify(t_gender varchar(10));

--8. t-tbl1 테이블에 성별 열을 삭제하라.
alter table t_tbll drop(t_gender);

--9. t-tbl1 테이블에 모든 데이터를 삭제하고 t-tbl1 테이블에 모든 내용을 검색하라.
truncate table t_tbll;

select * from t_tbll;

--10. t_emp3 테이블을 생성하되, 기존 t_emp10 의 내용을 사용하여 sal에 NOT NULL 제약조건을 부여하라
create table t_emp3(
    empno number(4)
    constraint pk_t_emp3 primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number (4),
    hiredate date,
    sal number(7,2) not null,
    comm number(7,2),
    deptno number(2)
);

desc t_emp3;

--11. 사원(emp)테이블과 구조가 같은 t_temp2 테이블에 deptno에 외래키  제약조건을 사용하여 생성하라.
create table t_temp2 (
    empno number(4)
    constraint pk_t_emp2 primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2) not null,
    comm number(7,2),
    deptno number(2),
    constraint fk_deptno foreign key (deptno) references emp(empno)); 

drop table t_emp2;

--12. t_tbl1 테이블에 대한 제약조건을 검색하라.
 select * from user_constraints
    where table_name = 'T_TBL1';

--13. t_temp2 테이블에 외래키 제약조건을 비활성화 하라.
alter table t_temp2 disable constraints fk_deptno;

--14. t_temp2 테이블에 외래키 제약조건을 다시 활성화 하라.
alter table t_temp2 enable constraints fk_deptno;

--15.t_temp2 테이블에 외래키 제약조건을 삭제하라. 
alter table t_temp2 drop constraints fk_deptno;

--16. t_temp2 테이블을 삭제하라.
drop table t_temp2;

--17. 사원 테이블로부터 20번 부서의 사원들로 이루어져 있는 뷰를 생성하라.(v_emp20)
--sys/system계정에서 (admin)
CREATE VIEW v_emp20
    AS select * 
        from hyun.emp
        where deptno = 20;
  
    select * from v_emp20;

drop view v_emp20;

--18. 사원번호, 사원이름, 부서이름을 가지는 뷰(v_emp_dept)를 생성하라.
CREATE VIEW v_emp_dept
    AS select empno, ename, deptno 
        from hyun.emp;
  
    select * from v_emp_dept;

--19. 부서별 사원 중 가장 최근에 입사한 사원보다 먼저 입사한 사원의 정보를 검색하라.
select deptno, max(hiredate)
    from emp
    group by deptno;
--30	81/12/03
--20	87/07/13
--10	82/01/23

 select deptno, max(hiredate)
    from emp
    where hiredate not in(select max(hiredate)
                             from emp
                             group by deptno)
    group by deptno;
        
--20. 가장 최근에 입사한 5명의 사원번호, 사원이름, 입사일을 검색하라.
select empno, ename, max(hiredate)
    from emp
    order by hiredate desc;
    
--21. 급여와 상여금을 합한 금액으로 상위 7명의 사원번호와 사원이름을 구하라.
select empno, ename, sal + comm
    from emp
    order by 3 desc;
    
select empno, ename, sal + comm
    from (select empno, ename, sal, comm
            from emp
            order by 3 desc)
    where rownum <= 7;
    
--22. 부서별 평균 급여가 가장 큰 부서 2개의 부서이름을 구하라.
select dname, avg(sal)
    from emp, dept
    where emp.deptno = dept.deptno
    group by dname
    order by 2 desc;
    
select dname
    from (select dname, avg(sal)
            from emp, dept
            where emp.deptno = dept.deptno
            group by dname
            order by 2 desc)
    where rownum = 2;
    
23. 사원직무별 급여 표준편차가 큰 상위 2개의 사원직무를 구하라.
select job, stddev(sal)
    from emp
    group by job
    order by 2 desc;

select job 
    from (select job, stddev(sal)
            from emp
           group by job
           order by 2 desc)
    where rownum <= 2;

