/*
Cross 조인
Equi 조인
NON-Equi 조인
Self 조인
Outer 조인
*/

--Cross 조인
--크로스 조인(cross join)은 관계시스템의 관계 대수 8가지 연산 중 카티션 프로덕트(Cartesian Product)를 구현함
--2개 이상의 테이블을 조건 없이 실행되는 조인 연산

select student.*, enrol.*
from student cross join enrol;

select count(*) from student;--10
select count(*) from enrol;--12

--Equi 조인
--2개 이상의 테이블에 관련 있는 공통 열의 값을 이용하여 논리적으로 결합하는 연산이 수행되는 조언
select student. stu_no, stu_name, stu_dept, enr_grade
from student, enrol
where student.stu_no = enrol.stu_no;

select * from student;
select * from enrol;

--natural join
select stu_no, stu_name, stu_dept, enr_grade
from student natural join enrol;
--두 테이블에 같은 열의 이름이 존재하면 적용한다.

--해결방법1: join ~ using
select stu_no, stu_name, stu_dept, enr_grade
from student join enrol using(stu_no);

--해결방법2: join ~ on
select student.stu_no, stu_name, stu_dept, enr_grade
from student join enrol on student.stu_no = enrol.stu_no;
drop table ccc;
create table CCC(
stu_no number(9),
stu_name varchar2(12),
stu_gender char(1),
stu_hakjum char(1),
stu_kg number(3));

insert into CCC values(20153075,'옥한빛','M','A',78);
insert into CCC values(20153088,'이태연','F','B',68);
insert into CCC values(20143054,'유가인','F','C',58);
insert into CCC values(20152088,'조민우','M','A',88);
insert into CCC values(20142021,'심수경','F','B',68);
insert into CCC values(20132003,'박희철','M','B',68);
insert into CCC values(20151062,'김인중','M','C',58);
insert into CCC values(20141007,'진현무','M','A',88);
insert into CCC values(20131001,'김종헌','M','B',68);
insert into CCC values(20131025,'옥성우','F','B',68);

select * from CCC;
select * from student;
select count(*) from ccc;

commit;

select stu_no, stu_name, stu_dept, stu_kg
from student natural join CCC;
--natural join의 경우에는 겹치는 column이 많게 되면 결과값이 다 나오지 않는다.
--그러므로 이럴 경우에는 join~on을 써야한다.

select stu_no, stu_name, stu_gender, stu_dept, stu_kg
from student join ccc using(stu_no, stu_name, stu_gender);
--pk를 잡아주면 stu_no을 한개만 넣어도 된다.

select student.stu_no, student.stu_name, student.stu_gender, stu_dept, stu_kg
from student join ccc 
on student.stu_no = ccc.stu_no;

--101번 과목을 수강하는 학생들의 학번과 이름 검색
select stu_no, stu_name
from student natural join enrol
where sub_no = 101;

select s.stu_no, s.stu_name, e.sub_no, s2.sub_name
from student s, enrol e, subject s2
where s.stu_no = e.stu_no
and e.sub_no = s2.sub_no
and (e.sub_no=101
or e.sub_no=104)
order by 1;

-- 테이블 조인
-- '컴퓨터개론' 과목을 수강하는 학생들의 학번, 이름, 과목이름 검색
select student.stu_no, stu_name, sub_name
from student, enrol, subject
where student.stu_no = enrol.stu_no
and enrol.sub_no = subject.sub_no
and (enrol.sub_no = 101 or enrol.sub_no = 104);

--Non-Equi(equi는 = 얘기하는거임) 조인
--where 절에서 사용하는 '='이 아닌 연산자를 사용
--기본 키와 외래 키 관계가 아닌 열 값들의 의미 있는 관계 조인

select empno, ename, sal, grade
from emp, salgrade
where sal between losal and hisal;

--SELF 조인: 같은 테이블 간의 조인, 테이블의 별칭을 사용함
-- 다음은 자신의 상급자를 구하는 질의문
select a.empno, a.ename, b.empno, b.ename
from emp a, emp b
where a.mgr = b.empno;

--Outer 조인: 조인 조건을 만족하지 않는 행들도 질의 결과에 포함함
-- 수강(enrol) 테이블을 기준으로 과목이름 검색
-- equi join
select e.*, sub_name
from enrol e, subject s
where e.sub_no = s.sub_no
order by s.sub_no;

select e.sub_no, e.stu_no, e.enr_grade, sub_name
from enrol e, subject s
where e.sub_no = s.sub_no
order by 1;

select e.*, sub_name
from enrol e, subject s
where e.sub_no = s.sub_no
order by e.sub_no;

select a.*, sub_name
from enrol a right outer join subject b
on a.sub_no = b.sub_no
order by 1;

--self 조인과 outer 조인의 결합
select a.empno, a.ename, b.empno, b.ename
from emp a left outer join emp b on a.mgr = b.empno;

select b.empno, b.ename, a.empno, a.ename
from emp b right outer join emp a on a.mgr = b.empno;

--full outer join
select a.empno, a.ename, b.empno, b.ename
from emp a full outer join emp b on a.mgr = b.empno;
