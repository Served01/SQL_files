select * from dept;
select * from emp;
select * from salgrade;

--1.
desc emp;

--2.
desc dept;

--3.
desc salgrade;

--4.
select empno, ename, job from emp;

--5.
select deptno, dname from dept;

--6.
select dname, loc from dept;

--7.
select sal, comm from emp;

--8.
select distinct hiredate from emp;

--9.
select distinct mgr from emp;

--10.
select distinct deptno from emp;

--11.
select sum(sal*6) from emp;

--12.
select sum(comm*6) from emp;

--13.
select ename as Name, sal as Salary from emp;

--14.
select empno as 사원번호, ename as 사원이름, hiredate as 입사일, deptno as 부서번호
from emp;

--15.
select *
from dept;

select deptno as 부서번호, dname as 부서이름, loc as 지역
from dept;

--16.
select concat(job, ename)
from emp;

--17.
select to_char(hiredate,'yy-mm-dd') || '에 입사한 ' || ename || '입니다.'
from emp;

--18.
select ename
from emp
where deptno = 10;

--19.
select empno, ename
from emp
where sal >= 2000;

--20.
select empno, ename
from emp
where job = 'CLERK';
-- 시스템적 이름들은 대소문자 구분 안하지만, 특정 데이터 값을 비교할 때는 대소문자 구분한다.
select *
from emp;

--21.
select ename
from emp
where hiredate = '1980-12-17';

--22.
select deptno, loc
from dept
where deptno != 30;

--23.
select *
from salgrade;

select hisal, losal
from salgrade
where grade = 5;

--24.
select *
from emp
where ename = 'WARD';

--25.
select ename
from emp
where deptno = 10 AND job = 'MANAGER';

--26.
select empno, ename
from emp
where sal >= 2000 and deptno = 30;

--27.
select empno, ename
from emp
where job = 'CLERK' and hiredate >= '1981-01-01';

--28.
select ename
from emp
where deptno != 20 and job = 'MANAGER';

--29.
select dname
from dept
where loc != 'BOSTON';

--30.
select ename
from emp
where job = 'SALESMAN' and sal >= 1500;

--31.
select empno, ename, sal
from emp
where sal >= 1000 and sal <= 2500;

--32.
select empno, ename, deptno
from emp
where empno like '75%';

--33.
select ename, sal
from emp
where deptno = 10 or deptno = 30;

--34.
select ename
from emp
where mgr like '76%';

--35.
select ename, sal, comm
from emp
where empno like '79%';

--36.
select empno, ename, deptno
from emp
where hiredate >= '1981-02-01' and hiredate <= '1981-02-28';

--37.
select empno, ename
from emp
where ename like '%A%';

--38.
select empno, ename
from emp
where mgr is null;
select *
from emp;

--39.
select empno, ename, mgr
from emp
where mgr is not null;

--40.
select ename
from emp
where empno = 7902 or empno = 7781;

--41.
select empno, ename
from emp
where mgr = 7698 or mgr = 7839;

select empno, ename
from emp
where mgr in(7698,7839);

select * from emp;

--42.
select empno, ename, deptno
from emp
where job = 'MANAGER' OR JOB = 'SALESMAN';

--43.
select empno, ename
from emp
order by empno;

--44.
select deptno, empno, ename
from emp
order by deptno, ename;

--45.
select empno, deptno, sal
from emp
order by deptno, sal desc;

--46.
select *
from emp
order by job, sal;

--47.
select lower(ename)
from emp;

--48.
select lower(ename), lower(job)
from emp;

--49.
select upper(ename)
from emp;

--50.
select upper(ename), upper(job)
from emp;

--51.
select initcap(ename)
from emp;

--52.
select initcap(job) || '과 ' || initcap(ename) || '입니다.'
from emp;

--53.
select concat(ename, job)
from emp;

--54.
select ename, substr(ename,1,2)
from emp;

--55.
select empno, ename, job, substr(job,2,3)
from emp;

--56.
select ename, length(ename)
from emp;

--57.
select ename, length(job)
from emp;

--58.
select ename, instr(ename, 'A')
from emp;

--59.
select job, instr(job,'A')
from emp;

--60.
select rpad(ename, 15, '&')
from emp;

--61.
select lpad(job, 20, '%')
from emp;

--62.
select empno, ename, round(sal, -2)
from emp;

--63.
select empno, ename, trunc(sal, -2)
from emp;

--64.
select empno, mod(sal,100)
from emp;

--65.
select empno, ename, hiredate, hiredate+100
from emp;

--66.
select empno, ename, hiredate, sysdate-hiredate
from emp;

--67.
select hiredate, add_months(hiredate, 3)
from emp;

--68.
select hiredate, next_day(hiredate, 7)
from emp;

--69.
select hiredate, last_day(hiredate)
from emp;

--70.
select hiredate, round(hiredate, 'year')
from emp;

--71.
select hiredate, trunc(hiredate, 'year')
from emp;

--72.
select * from emp;
select empno, ename, nvl(to_char(mgr),'상급자 없음')
from emp;

--73.
select empno, ename, sal+nvl(comm,0)
from emp;

--74.
select empno, ename, (sal+nvl(comm,0))*12
from emp;

--75.
select empno, ename, nvl(mgr, 'CEO')
from emp;

--76.
select empno, ename, comm
from emp
where comm = (select max(comm) from emp);

--77.
select empno, ename, comm
from emp
where comm = (select min(comm) from emp);

--78.
select max(ename), min(ename)
from emp;

--79.
select max(hiredate), min(hiredate)
from emp;

--80.
select max(empno), min(empno)
from emp;

--81.
select count (mgr)
from emp;

--82.
select count (distinct ename)
from emp;

--83.
select count (*)
from emp;

--84.
select count(*)
from dept;

--85.
select count(distinct comm)
from emp;

--86.
select dname, count(*)
from emp natural join dept
group by dname;

--87
select mgr, count (*)
from emp
group by mgr;

--88.
select dname, floor(avg(sal))
from emp natural join dept
group by dname;

--89.
select d.dname, floor(stddev(e.sal))
from emp e,dept d 
group by dname;

select * from emp;

--90.
select dname, job, sum(sal)
from emp natural join dept
group by dname, job;

--91.
select dname, job, avg(sal)
from emp natural join dept
group by dname, job;

--92.
select dname, job, max(hiredate), min(hiredate)
from emp natural join dept
group by dname, job;

--93.
select dname, count(*)
from emp natural join dept
group by dname
order by count(*) desc;

--94.
select dname, floor(avg(sal))
from emp natural join dept
group by dname
order by avg(sal) desc;

--95.
select dname, job, floor(sum(sal))
from emp natural join dept
group by dname, job
order by avg(sal) desc;

--96.
select dname, job, floor(avg(sal))
from emp natural join dept
group by dname, job
order by avg(sal) desc;

--97. 모든 사원들에게 급여의 20%를 보너스로 지불하기로 했다. 이름, 급여, 보너스 금액을 출력하라.
select ename, sal, nvl2(comm, sal*0.2+comm, sal*0.2)
from emp;

--98. 급여가 2000이상인 모든 사원은 급여의 15%를 경조비로 내기로 하였다. 이름, 급여, 경조비를 출력하라.
select ename, sal, (sal*0.15)
from emp
where sal>=2000;

--99. 부서번호가 20인 부서의 시간당 임금을 계산하여 출력하라. 단, 이달의 근무일수가 12일이고, 1일 근무시간은 5시간이다.
--이름, 시간당 임금(소수이하 절삭)을 출력하라.
select ename, trunc((sal/12)/5)
from emp
where deptno = 20;

--100. 입사일이 81/04/02보다 늦고, 82/12/09보다 빠른 모든 정보를 출력하라.
select *
from emp
where hiredate > '81/04/02'
and hiredate < '82/12/09';

--101. 급여가 1600보다 크고 3000보다 작은 사원의 이름, 직업(업무), 급여를 출력하라.
select ename, job, sal
from emp
where sal>1600 and sal<3000;

--102. 직업이 MANAGER와 SALESMAN인 사원의 모든 정보를 출력하라.
select *
from emp
where job = 'MANAGER' or job = 'SALESMAN';

--103. 부서번호가 20, 30번을 제외한 모든 사원의 모든 정보를 출력하라.
select *
from emp
where deptno != 20
and deptno <> 30;

--104. 입사일이 81년도인 사원의 모든 정보를 출력하라.
select *
from emp
where hiredate >= '81/01/01'
and hiredate <= '81/12/31';
-- where substr(hirdate, 1, 2) = '81'

--105. 커미션의 합이 2000이상인 부서의 총급여와 총커미션을 구하라.
select deptno, sum(sal), sum(comm)
from emp
group by deptno
having sum(comm)>= 2000;

--106. 입사일별 평균 급여를 구하라.
select to_char( hiredate, 'DD'), avg(sal)
from emp
group by TO_CHAR(hiredate, 'DD')
order by TO_CHAR(hiredate, 'DD');

--107. 직급이 ANALYST인 사원의 이름, 부서명을 구하라.
-- natural join을 이용할 수 있다.
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno
and e.job = 'ANALYST'
order by d.dname;

--108. 이름에 'M'자가 들어간 사원들의 이름, 부서명, 급여를 구하라.
select ename, dname, sal
from emp natural join dept
where ename like '%M%';

--109. DALLAS에 위치한 부서에 속한 사원의 총사원수, 평균급여, 전체급여, 최고급여, 최저급여를 구하라.
select dname, count(*), avg(sal), sum(sal), max(sal), min(sal)
from emp natural join dept
where loc = 'DALLAS'
group by dname;

--110. MANAGER인 사원들의 월급의 평균보다 월급이 적은 사람들의 이름과 월급을 출력하라.
select avg(sal)
from emp
where job = 'MANAGER';

select ename, sal
from emp
where sal<(select avg(sal)
from emp
where job = 'MANAGER');

--111. SCOTT의 급여에서 1000을 뺀 급여보다 적게 받는 사원의 이름, 급여를 출력하라.
select (sal-1000)
from emp
where ename = 'SCOTT';

select ename, sal
from emp
where sal < (select (sal-1000)
from emp
where ename = 'SCOTT');

--112. EMP 테이블에서 이름이 5글자인 사원 중 급여가 가장 높은 사원의 이름, 급여, 부서명을 출력하라.
select ename, sal, dname
from emp e, dept d
where e.deptno = d.deptno
and sal = (select max(sal)
from emp
where length(ename) = 5)
and length(ename) = 5;

