
--1.
select *
from emp natural join dept;

--2.
select empno, ename, dname
from emp, dept
where emp.deptno = dept.deptno;

--3.
select empno, ename, dname
from emp natural join dept;

--4.
select empno, ename, dname
from emp join dept using(deptno);

--5.
select empno, ename, dname
from emp join dept 
on emp.deptno = dept.deptno;

--6.
select ename
from emp, dept
where emp.deptno = dept.deptno
and dept.loc = 'NEW YORK';

--7.
select ename
from emp natural join dept
where loc = 'NEW YORK';

--8.
select ename
from emp join dept using (deptno)
where loc = 'NEW YORK';

--9.
select ename
from emp join dept
on emp.deptno = dept.deptno
where loc = 'NEW YORK';

--10.
select empno, ename
from emp natural join dept
where loc = 'NEW YORK'
order by empno;

--11.
select dname, loc
from emp, dept
where dept.deptno = emp.deptno
and ename = 'ADAMS';

--12.
select dname, loc
from emp join dept using(deptno)
where ename = 'ADAMS';

--13.
select dname, loc
from emp join dept
on dept.deptno = emp.deptno
where ename = 'ADAMS';

--14.
select dname, loc
from emp natural join dept
where ename = 'ADAMS';

--15.
select ename, loc
from emp natural join dept
where sal >= 2000;

--16.
select empno, ename, dname
from emp natural join dept
where sal>=1000 and sal <=2000
order by empno;

--17.
select ename
from emp natural join dept
where job = 'SALESMAN' and loc = 'CHICAGO';

--18.
select empno, ename
from emp, dept
where emp.deptno = dept.deptno
and (loc = 'NEW YORK' or loc = 'DALLAS')
order by empno;

--19.
select empno, ename
from emp natural join dept
where loc = 'NEW YORK' or loc = 'DALLAS'
order by empno;

--20.
select empno, ename, dname, loc
from emp natural join dept
where dname = 'ACCOUNTING' or loc = 'CHICAGO';

--21.
select empno, ename
from emp join dept using (deptno)
where dname = 'ACCOUNTING' or loc = 'CHICAGO';

--22.
select empno, ename, sal, grade
from emp natural join salgrade
where sal <= hisal and sal >= losal
order by grade, empno;

--23.
select a.empno, a.ename, b.empno as mgrno, b.ename as mgrname
from emp a join emp b 
on a.mgr = b.empno;

--24.
select a.empno, a.ename, b.empno as mgrno, b.ename as mgrname
from emp a, emp b
where a.mgr = b.empno;

--25.
select ename, sal
from emp
where sal > (select sal
from emp
where ename = 'BLAKE');

--26.
select a.ename, a.sal
from emp a, emp b
where a.sal > b.sal
and b.ename = 'BLAKE';

--27.
select ename, deptno
from emp 
where deptno = (select deptno
from emp
where ename = 'FORD');

--28.
select ename, empno
from emp
where sal = (select sal
from emp
where ename = 'FORD');

--29.
select * from dept;
select count(*), deptno, dname
from emp natural join dept
group by deptno, dname;

--30.
select *
from emp natural join dept
where sal > (select sal
from emp
where ename = 'SCOTT');

--31.
select *
from emp natural join (select distinct job
from emp
where deptno = 20)
where deptno != 20;
-- 결과 값이 표로 나오면 join을 사용할 수 있다.

select * from emp;

select * from emp
where deptno != 20
and job in(select job
from emp
where deptno = 20);

--32.
select *
from emp
where sal > (select avg(sal)
from emp);

--33. 부서별 평균값들중 가장 높은 값보다 큰 것들을 구하라는 거임
select * from emp
where sal > all (select avg(sal)
from emp
group by deptno);

--34.
select *
from emp natural join dept
where loc = 'CHICAGO';

select *
from emp
where deptno = (select deptno
from dept
where loc = 'CHICAGO');

