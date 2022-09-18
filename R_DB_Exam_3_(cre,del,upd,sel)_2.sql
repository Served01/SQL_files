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

--1.
create table t_tbl1
as select * from emp;

truncate table t_tbl1;

desc t_tbl1;

--2.

