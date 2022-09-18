-- Student Join 문제
select * from student;
select * from subject;
select * from enrol;

--1.
select *
from student natural join subject;

--2.
select student.stu_no, stu_name, sub_name, enr_grade
from student, enrol, subject
where student.stu_no = enrol.stu_no
and enrol.sub_no = subject.sub_no;

--3.
select sub_name, stu_no, enr_grade
from enrol natural join subject;

--4.
select sub_name, stu_no, enr_grade
from enrol join subject using(sub_no);

--5.
select stu_name, enr_grade
from student, enrol
where student.stu_no = enrol.stu_no
and enr_grade >= 70;

--6.
select stu_name, enr_grade
from student join enrol using(stu_no)
where enr_grade >=60;

--7.
select stu_name, enr_grade
from student natural join enrol
where enr_grade <= 70;

--8.
select stu_name, sub_name, sub_prof
from student, enrol, subject
where student.stu_no = enrol.stu_no
and enrol.sub_no = subject.sub_no
and stu_name = '김인중';

--9.
select stu_name, sub_name, sub_prof
from student natural join enrol natural join subject
where stu_name = '김인중';

--10.
select stu_name, sub_name, sub_prof
from enrol 
join student using(stu_no)
join subject using(sub_no)
where stu_name = '김인중';

--11.
select sub_prof, sub_name, stu_name
from student natural join enrol natural join subject
where sub_prof = '강종영';

--12.
select sub_name, stu_no, stu_name
from student natural join enrol natural join subject
where sub_name = '컴퓨터개론';

--13.
select sub_name, stu_no, stu_name
from student natural join enrol natural join subject
where sub_name = '시스템분석설계'
or sub_name = '소프트웨어공학'
order by stu_no;

--14.
select stu_grade, stu_dept, stu_no, stu_name, sub_name
from student natural join enrol natural join subject 
where stu_grade = 1
or stu_dept = '컴퓨터정보';

select stu_grade, stu_dept, stu_no, stu_name
from student 
join enrol using(stu_no)
join subject using(sub_no)
where stu_grade = 1
or stu_dept = '컴퓨터정보';

--15.
select sub_name, stu_no, stu_name
from student natural join enrol natural join subject 
where sub_name = '기계공작법'
or sub_name = '기초전자실험';

--16.
select sub_prof, stu_no
from enrol
join student using(stu_no)
join subject using(sub_no)
where sub_prof = '김태영'
or sub_prof = '김유석';

--17.
select stu_name, enr_grade, sub_name
from student natural join enrol natural join subject;

--18.
select stu_name, sub_name
from student natural join enrol natural join subject 
where stu_name = '옥한빛';

--19.
select stu_no, stu_gender, sub_name
from student natural join enrol natural join subject 
where stu_gender = 'F';

--20.
select distinct sub_name
from student natural join enrol natural join subject 
where stu_weight >= 60;

--21.
select stu_no, stu_name, stu_dept
from student natural join enrol natural join subject 
where stu_dept = '컴퓨터정보';

--22.
select count(*)
from student natural join enrol natural join subject 
where enr_grade >= 70;
select * from enrol;
--23.
select stu_name, stu_gender, sub_prof
from student natural join enrol natural join subject 
where stu_gender = 'F'
and sub_prof = '구봉규';

--24.
select stu_no, stu_name, stu_dept, avg(enr_grade)
from student natural join enrol natural join subject 
group by stu_no, stu_name, stu_dept
having stu_dept = '컴퓨터정보'
/*and avg(enr_grade) > (select avg(enr_grade)
from student natural join enrol natural join subject 
where stu_dept = '컴퓨터정보')*/
order by avg (enr_grade) desc;

select avg(enr_grade)
from student natural join enrol natural join subject 
group by stu_dept;

--25.
select stu_no, stu_name, enr_grade
from student natural join enrol natural join subject 
where sub_name = '시스템분석설계'
order by enr_grade desc;

--26.
select stu_no, stu_name, count(sub_name)
from student natural join enrol natural join subject
group by stu_no, stu_name
having count(sub_no) >=2
order by count(sub_name);


--27.
select stu_no, stu_dept, stu_name, count(sub_name)
from student natural join enrol natural join subject
group by stu_no, stu_name, stu_dept
having count(sub_name) = 1
order by stu_dept, stu_no;

--28.
select stu_no, stu_name, sub_name
from student natural join enrol natural join subject
where sub_name = '컴퓨터개론'
or sub_name = '시스템분석설계'
order by stu_no;

commit;

--29.
select stu_no, stu_name, avg(enr_grade) 
from student natural join enrol
group by stu_no, stu_name
having avg(enr_grade) > (select avg(enr_grade)
from student natural join enrol
where stu_name = '김종헌');

--30.
select * from enrol;
select * from student;

select stu_no, stu_name, avg(enr_grade) 
from student natural join enrol
group by stu_no, stu_name
having avg(enr_grade) < (select avg(enr_grade)
from student natural join enrol
where stu_name = '김인중');

--31.
select stu_no, stu_name, sub_name, enr_grade
from student natural join enrol natural join subject
where enr_grade > (select avg(enr_grade)
from enrol);

--32.
select stu_no, stu_name, avg(enr_grade)
from student natural join enrol natural join subject
group by stu_no, stu_name
having avg(enr_grade) > all(select avg(enr_grade)
from student natural join enrol
group by stu_dept);

select avg(enr_grade)
from student natural join enrol
group by stu_dept;

--33.
select stu_dept, max(enr_grade)
from student natural join enrol natural join subject
group by stu_dept
having max(enr_grade) > (select max(enr_grade)
from student natural join enrol
where stu_dept='기계');

select max(enr_grade)
from student natural join enrol
where stu_dept='기계';


--34.
select stu_no, stu_name, stu_dept, avg(enr_grade)
from student natural join enrol
where stu_dept = '컴퓨터정보'
group by stu_no, stu_name, stu_dept
having avg(enr_grade) = (select max(avg(enr_grade))
from student natural join enrol
where stu_dept = '컴퓨터정보'
group by stu_no, stu_name, stu_dept);


