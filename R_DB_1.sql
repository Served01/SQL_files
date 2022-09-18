
--테이블 구조 확인
desc student;
desc subject;
desc enrol;

-- 수강 테이블의 점수 속성만 보기(모든 속성 확인시 *)
select enr_grade from enrol;
select * from employees;

--중복 데이터 제거
select distinct stu_dept
from student;

select distinct stu_grade, stu_class
from student;

select stu_no, sub_no, enr_grade, enr_grade + 10, enr_grade - 10
from enrol;

--결과열에 별칭(Alias) 부여
select stu_no as ID, stu_name as NAME
from student;

--연결 연산자
select stu_dept || stu_name as 학과성명
from student;

select stu_dept || ' ' || stu_name as 학과성명
from student;

--where절
--주로 비교 연산자 사용
--=, <, >, <=, >=, <> 6가지
--'<>'는 '!=', '^='로 사용 가능

select stu_name, stu_dept, stu_grade, stu_class
from student
where stu_dept = '컴퓨터정보';

--키 188 이상 학생 이름 학년 출력
select stu_name || ' ' || stu_grade || '학년'
from student
where stu_height >= 188;

--체중 60 이하 학생 이름 학년 반 출력
select stu_name || ' ' || stu_grade || '학년 ' || stu_class
from student
where stu_weight <= 60;

--논리 연산자 and or not 등 조합 가능
select stu_name, stu_dept, stu_grade, stu_class
from student
where stu_dept = '컴퓨터정보'
and stu_grade = 2;

select stu_name, stu_dept, stu_grade, stu_class
from student
where stu_dept = '기계'
and stu_grade = 2;

select stu_name, stu_dept, stu_grade, stu_class
from student
where stu_dept = '전기전자'
and stu_grade = 2;

select stu_name, stu_dept, stu_grade, stu_class
from student
where stu_dept = '전기전자'
or stu_grade = 2;


select stu_name, stu_dept, stu_grade, stu_class
from student
where stu_dept = '전기전자'
and not stu_grade = 2;


select stu_name, stu_dept, stu_grade, stu_class
from student
where stu_dept = '전기전자'
or stu_grade != 2;


--범위 조건
--where에 between and으로 검색 가능
select *
from student
where stu_weight between 60 and 70;

select *
from student
where stu_no between 20140001 and 20149999;

select stu_no, stu_name, stu_dept
from student
where stu_name like '김%';

select stu_no, stu_name, stu_dept
from student
where stu_name like '_수%';

select *
from student
where stu_no like '2014%';

--null 처리
--null값 존재 가능하며 처리에 문제 발생 가능성 존재
select stu_no, stu_name, stu_height
from student;

select stu_no, stu_name, stu_height / 30.45
from student;

--null값 존재 여부 확인
select stu_no, stu_name, stu_height
from student
where stu_height is null;

select stu_no, stu_name, stu_height
from student
where stu_height is not null;

--in 연산자(= or)
--다중 조건중 하나만 만족시 사용
select stu_no, stu_name, stu_dept
from student
where stu_dept in ('컴퓨터정보', '기계');

select stu_no, stu_name, stu_dept
from student
where stu_dept = '컴퓨터정보'
or stu_dept = '기계';


--정렬 sort 데이터를 어떤 기준에 의해 나열
--기준 key 기본키 primary key, 보조키 secondary keys
--나열 방법 오름차순 ascending 생략 가능, 내림차순 descending
-- order by stu_no

select stu_no, stu_name
from student
order by stu_no; -- ascending sort

select stu_no, stu_name
from student
order by stu_no desc; -- descending sort


--별칭 붙은 열을 기준으로 정렬
select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by target;


--열의 순서 번호로 정렬
select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by 4;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_weight - 5;

--다중 기준
select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_dept, target;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_dept desc, target desc;

select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_dept, target desc;

--select에 포함되지 않은 열로 정렬
select stu_no, stu_name, stu_dept, stu_weight - 5 as target
from student
order by stu_height;


select EMPLOYEE_ID, EMPLOYEE_NAME, JOB_ID, SALARY,
case JOB_ID when 'FI_MGR' then SALARY * 1.1
when 'Account' then SALARY * 1.15
when 'IT-PROG' then SALARY * 1.2
when 'ITDateBase' then SALARY * 1.3
else SALARY
end as 급여인상
from employees;


--함수
--하나 이상의 인수를 받아 처리한 결과 값을 변수로 활용하여 반환하는 프로그램 모듈
--단일 행 함수는 함수가 정의된 SQL 문장 실행시 각 행에 대해 수행됨 각 행별로 하나의 결과 값 반환
--그룹 함수는 데이터를 그룹화, 각 그룹에 대한 결과 반환, group by 사용
--단일 행 함수 - 인수 데이터 타입에 따라 숫자함수, 문자함수, 날짜함수, 형변환함수, 일반함수
--함수 활용에서 함수는 인수의 수 및 각 인수의 역할이 중요
--숫자 함수 - 숫자 인수 사용하는 함수

--round 반올림(숫자, 자리수)
--dual -> object 연산을 위한 가상 테이블
select round(345.678), round(345.678, 0),
round(345.678, 1), round(345.678, 2), round(345.678, 3),
round(655.678, 1), round(655.678, 2), round(655.678, 3),
round(345.678, -1), round(345.678, -2), round(345.678, -3),
round(655.678, -1), round(655.678, -2), round(655.678, -3)
from dual;

--trunc 버림(숫자, 자리수)
select trunc(345.678), trunc(345.678, 0),
trunc(345.678, -1), trunc(355.678, 2), trunc(355.678, 3), trunc(355.678, 4)
from dual;

--mod 나눈 나머지
select mod(100, 3) from dual;

--abs 절대값
select abs(-50) from dual;

--floor 소수점 버림
select floor(123.4567) from dual;


select distinct stu_gender
from student;

select stu_no, stu_name, stu_weight, stu_weight + 10
from student;


--문자 함수
--문자를 인자로 하는 함수

--문자함수: 인수(인자)를 문자로 하는 함수
select upper('korea') from dual; --Korea, 대문자로 변환

select lower(stu_gender) from student; --소문자로 변환
select lower(stu_class) from student;

select*from employees;
select lower(EMPLOYEE_NAME) from employees;
select upper(EMPLOYEE_NAME) from employees;
select lower(JOB_ID) from employees;
select upper(JOB_ID) from employees;
select lower(DEPARTMENT_NAME) from DEPARTMENTS;

select*from emp;
select lower(ename) from emp;
select upper(ename) from emp;
select lower(job) from emp;
select upper(job) from emp;

select initcap(EMPLOYEE_NAME) from employees; --첫글자를 대문자로 변환
select initcap(ename) from emp;
select initcap(job) from emp;

-- oracle에서 쓰이게 되는 대부분의 명령어는 select이다. select는 데이터를 가져온다는 의미에 가깝다.

select concat(EMPLOYEE_NAME, job_id) from employees; --문자끼리 연결하는 연산
select concat(ename, job) from emp;

select EMPLOYEE_NAME, substr(EMPLOYEE_NAME, 3, 7) from employees; --3번째 문자부터 7개라는 뜻 (부분 추출)
select substr(ename, 3, 7) from emp;

select EMPLOYEE_NAME, length(EMPLOYEE_NAME) from employees; -- 문자열의 길이

select EMPLOYEE_NAME, instr(EMPLOYEE_NAME,'ex') from employees;--' '안의 문자열의 위치
select EMPLOYEE_NAME, instr(EMPLOYEE_NAME,'ng') from employees;
select ename, instr(ename, 'ALL') from emp;
select ename, instr(ename, 'LA') from emp;

select lpad(EMPLOYEE_NAME, 15, '%') from employees;--왼쪽부터 빈공간을 %로 채우기
select lpad(ename, 15, '$') from employees;

select rpad(EMPLOYEE_NAME, 15, '&') from employees;--오른쪽부터 빈공간을 %로 채우기
select rpad(ename, 15, '@') from employees;

--날짜함수

select sysdate from dual;

select sysdate + 1 from dual;
select sysdate - 1 from dual;

select months_between(sysdate, hire_date) from employees;
select*from employees;

select months_between(sysdate, hiredate) from emp;
select*from emp;

--기준: 달력 일요일: 1 - 토요일: 7, 5: 목요일
select hire_date, next_day(hire_date,5) from employees; --hire_date 기준으로 다음 목요일
select hiredate, next_day(hiredate, 5) from emp;

select sysdate, next_day(sysdate, 4) from dual;

select hire_date, add_months(hire_date, 13) from employees; --개월수 증가
select hiredate, add_months(hiredate, 13) from emp; --개월수 증가

select add_months(sysdate+1, 7) from dual;

select last_day(sysdate) from dual; --현재 날짜의 해당하는 달의 마지막 날이 언제인가요?
select last_day(sysdate + 180) from dual;--6개월을 더한 날의 해당하는 달의 마지막 날은 언제인가요?

select hire_date, last_day(hire_date) from employees;
select last_day(hiredate) from emp;

--기준: year(6개월 미만이면 round [X]: 2022.06.30까지) 즉, 6월 29일이면 1월 1일로 나옴.
select hire_date, round(hire_date, 'year') from employees;
select hiredate, round(hiredate, 'year') from emp;

--기준: month에서 16일부터 round합니다.
select hire_date, round(hire_date, 'month') from employees;
select hiredate, round(hiredate, 'month') from emp;

--기준: 달력 일요일:1 - 토요일:7
--일, 월, 화는 그 주의 일요일 날짜로 수요일부터 그 다음 주의 일요일 날짜로 처리된다.
select hire_date, round(hire_date, 'day') from employees;
select hiredate, round(hiredate, 'day') from emp;

select sysdate-3, round(sysdate-3, 'day') from dual;

select round(sysdate, 'MON') from dual;

--날짜도 숫자와 같이 반올림을 할 수 있다.
--예시에서 보듯이 두 번째 인수를 MON으로 하였을 경우 달을 기준으로 반올림하여 결과를 보여준다.
--두 번째 인수를 조절하면 년, 월, 일 등을 기준으로 반올림할 수 있다.


--TO_CHAR 함수 (char 형식으로 바꾼다가 기본 개념이긴함.)
--TO_CHAR 함수는 주로 출력에 형식을 지정하기 위해 사용되며, 날짜형, 숫자형 모든 데이터에 사용한다.
--문자 데이터로 변환해 줍니다.

select empno, ename, to_char(hiredate, 'yyyy-mm-dd') as 입사년월
from emp;

select employee_id, employee_name, to_char(hire_date, 'yyyy-mm-dd')as 입사년월
from employees;

select*from employees;

--TO_NUMBER 함수
--TO_NUMBER 함수는 숫자 형태의 문자 데이터를 숫자 데이터로 변환할 때 사용한다.

select to_char(to_number(1234.5678), '9999.999')
from dual;

select to_char(to_number(1234.5678), '9999.99999')
from dual;

select to_char(to_number(1234.5678), '999.999')
from dual;

--TO_DATE 함수
--TO_DATE 함수는 날짜 형태의 문자를 날짜 데이터로 변환할 때 사용한다.

select EMPLOYEE_ID, EMPLOYEE_NAME
from employees
where hire_date = to_date('02/08/16','yy-mm-dd'); --이거 할때는 원본 값을 어떤 형태로 넣었는지를 참고해야한다. 테이블상에 보이는 값이 아니라 말이다.

select empno, ename
from emp
where hiredate = to_date('1987/07/13','yyyy-mm-dd');

--일반 함수
--NVL 함수: 인수 1이 null이면, 인수2를 넣고 아니면 인수1을 반환함
select nvl(stu_height, 0)
from student;

--NVL2 함수: 인수 1이 null이 아니면 인수 2를 null이면 인수 3을 반환함
select ename, sal, comm, nvl2(comm, sal+comm, sal)
from emp;

--NULLIF 함수: 인수 1과 인수 2의 값을 비교하여 그 값을 비교하여 그 값이 같으면 NULL을 아니면 인수1의 값을 반환함
select nvl(nullif('A','A'),'gggggg')
from dual;

select nvl(nullif('A','B'),'gggggg')
from dual;

--COALESCE 함수
--인수 1의 값이 NULL값이 아니면 인수 1의 값을, NULL값이면 인수 2의 값을 검사하여 NULL 값이 아니면 인수 2의 값을 반환하고,
--아니면 인수 3의 값을 검사하여 값을 반환함

select coalesce (null, null, 10, 100, null)
from dual;

select coalesce (null, 45678, 10, 100, null)
from dual;

select coalesce (null, null, null, 100, null)
from dual;

select coalesce (null, null, null, null, 12345)
from dual;

--CASE 함수 조건에 따른 처리
/*
select column-names
case when condition-1 then statement-1,
when condition-2 then statement-2,
      *********************
when condition-n then statement-n,
else statement
end
from table-name;
*/

--그룹함수
--여러 행에 대한 연산 즉, 평균, 개수 등의 결과값을 반환하는 함수
--select문에서 group by절을 사용함
--min, max 함수

select max(enr_grade), min(enr_grade)
from enrol;

select min(stu_weight), max(stu_weight)
from student
where stu_dept = '기계';

select min(stu_weight), max(stu_weight)
from student
where stu_dept = '전기전자';

select min(stu_weight), max(stu_weight)
from student
where stu_dept = '컴퓨터정보';

select min(stu_weight), max(stu_weight)
from student
where stu_dept = '인공지능';

--COUNT 함수
select count(*), count(stu_height)
from student;

select count(stu_dept), count(distinct stu_dept)
from student;

--SUM과 AVG 함수
select sum(stu_weight), to_char(avg(stu_weight), '9999.99')
from student
where stu_dept = '컴퓨터정보';

select sum(stu_weight), to_char(avg(stu_weight), '9999.99')
from student
where stu_dept = '기계';

select sum(stu_weight), to_char(avg(stu_weight), '9999.99')
from student
where stu_dept = '전기전자';

select count(*) as 학생, sum(stu_height) as 신장합,
count(stu_height) as 해당학생수, avg(stu_height) as 평균신장
from student;

select count(*) as 직원수, sum(sal) as 연봉합계,
count(mgr) as 직장상사수, avg(comm) as 보너스평균
from emp;

select count(*) as 직원수, sum(salary) as 연봉합계,
count(manager_id) as 직장상사수, avg(commission) as 보너스평균
from employees;

--단일행을 이용한 GROUP BY절
select stu_dept, avg(stu_weight)
from student
group by stu_dept; --학과를 기준으로 평균을 출력

select stu_dept, sum(stu_weight)
from student
group by stu_dept;

select stu_dept, count(*)
from student
where stu_weight >=50
group by stu_dept;

select stu_dept, count(*)
from student
where stu_weight <50
group by stu_dept;

--다중열 GROUP BY절
--각과 각학년에 존재하는 학생수는?
select stu_dept, stu_grade, count(*)
from student
group by stu_dept, stu_grade;

select stu_dept, stu_grade, count(*)
from student
group by stu_dept, stu_grade
order by stu_dept, stu_grade; --오름차순 정렬하여 출력

--HAVING절 사용
--그룹함수를 적용한 결과에 다시 조건을 부여할 때는 HAVING절을 사용한다.
select stu_grade, avg(stu_height)
from student
where stu_dept = '기계'
group by stu_grade;

select stu_grade, avg(stu_height)
from student
where stu_dept = '기계'
group by stu_grade
having avg(stu_height)>=160;

select stu_dept, max(stu_height)
from student
group by stu_dept;

--1. 10번 부서 월급의 평균, 최고, 최저, 인원수를 구하여 출력하라.

select avg(sal), max(sal), min(sal), count(*)
from emp
where deptno = 10
group by ename;

select*from emp;

--2. 각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
select deptno, avg(sal), max(sal), min(sal), count(*)
from emp
group by deptno;
commit;
--3. 입사일을 "2022년 5월 14일"의 형식으로 이름, 입사일을 출력하라.
select ename, to_char(hiredate, 'yyyy"년" mm"월" dd"일"')
from emp;
--4. 입사일부터 지금까지의 날짜수를 출력하라.
--출력양식은 부서번호, 이름, 입사일, 현재일, 근무일수(소수점 이하 절삭), 근무년수, 근무월수, 근무주수를 출력하라

select deptno, ename, hiredate, sysdate, floor(sysdate - hiredate) as 근무일수, floor((sysdate - hiredate)/365) as 근무년수, floor((sysdate - hiredate)/365*12) as 근무월수, floor((sysdate - hiredate)/365*52) as 근무주수
from emp;

commit;

--커미션이 null이 아닌 사원 출력
select *
from emp
where comm is not null and comm != 0;

--모든 사원의 실 수령액 계산
--급여 많은 순으로 이름 급여 실 수령액(급여 10% 세금)출력
select ename, sal, sal/10*9
from emp
order by sal desc;

select ename, sal, comm, nvl2(comm, sal+comm, sal), floor(nvl2(comm, sal+comm, sal)/10*9)
from emp
order by nvl2(comm, sal+comm, sal) desc;

--입사일로부터 6개월 지난 후의 입사일, 날짜, 급여 출력
select hiredate , add_months(hiredate, 6), add_months(sysdate, 6), sal
from emp;

--이름 글자수 6자 이상인 사원의 이름을 앞 3자리만 따서 소문자로 이름만 출력
select lower(lpad(ename,3,'%'))
from emp
where length(ename) >= 6 ;

select lower(substr(ename,1,3))
from emp
where length(ename) >= 6;
select * from emp;

--동일 업무 사원 수가 4명 이상인 업무와 인원수 출력
select job, count(*)
from emp
group by job
having count(job) >= 4;

--각 부서별 평균 전체 최고 최저 월급 구하고 평균 월급 순서 출력
select deptno, avg(sal), sum(sal), max(sal), min(sal)
from emp
group by deptno
order by avg(sal) desc;

--이름 allen 사원 부서명 부서위치 출력
select d.dname, e.job, d.loc
from emp e, dept d
where e.ename = 'ALLEN' and d.deptno = e.deptno;

--natural join
select ename, dname, loc
from emp natural join dept
where ename = 'ALLEN';

--회사 내 최소 최대 급여 차이 출력
select max(sal) - min(sal)
from emp;

--job과 그 job에 속한 사원수 출력
select job, count(*)
from emp
group by job;

--이름에 'M'자 들어간 사원의 이름 부서명 급여 출력
select e.ename, d.dname, e.sal
from emp e, dept d
where ename like '%M%' and d.deptno = e.deptno;

select ename, dname, sal
from emp natural join dept
where ename like '%M%';

--SCOTT 급여에서 1000 뺀 급여보다 적게 받는 사원 이름 급여 출력
--subquery
select ename, sal
from emp
where sal <= (select sal - 1000
            from emp
            where ename = 'SCOTT') ; 

--job이 manager 인 사원중 최소 급여 받는 사원보다 급여가 적은 사원 이름 급여 출력
select ename, sal
from emp
where sal <= (select min(sal)
            from emp
            where job = 'MANAGER');

--ward가 속한 부서의 평균 급여보다 급여가 많은 사원 이름 급여 출력
select ename, sal
from emp
where sal >= (select avg(sal)
            from emp
            where deptno = (select deptno from emp where ename = 'WARD'));
          --↑ward 부서 평균 급여를 찾는 조건
    select avg(sal)
    from emp
    where ename = 'WARD'
    group by deptno;

select * from dept;
select * from emp;
commit;