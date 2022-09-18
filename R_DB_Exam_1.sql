--2022.07.29

--1. 
desc student;

--2.
desc subject;
desc enrol;

--3.
select*from student;

--4. 
select*from enrol;

--5.
select stu_no, stu_name from student;

--6. 
select sub_no, sub_name from subject;

--7. 
select stu_no, stu_name, stu_gender from student;

--8.
select * from student;

--9.
select * from subject;
select sub_name, sub_prof from subject;

--10.
select stu_no, stu_name, stu_grade, stu_class from student;

--11.
select * from enrol;
select sub_no, stu_no, enr_grade from enrol;

--12. 
select stu_weight, stu_height, stu_no, stu_name from student;

--13. 
select distinct stu_dept from student;

--14.
select distinct stu_gender from student;

--15.
select distinct stu_grade from student;

--16. 
select distinct stu_dept, stu_grade from student;

--17.
select distinct stu_dept, stu_class from student;

--18. 
select stu_weight +5 from student;

--19.
select stu_weight -5 from student;

--20.
select stu_no as 학번, stu_name as 이름 from student;

--21.
select * from enrol;
select sub_no as 과목코드, stu_no as 학번, enr_grade as 점수 from enrol;

--22.
select sub_name as 과목이름, sub_prof as 교수명 from subject;

--23.
select stu_dept || stu_name from student;

--24.
select stu_dept || '과 ' || stu_name || '입니다.' from student;

--25.
select * from student where stu_dept = '컴퓨터정보';

--26.
select * from student where stu_height >= 170;

--27.
select * from student where stu_weight >= 65;

--28.
select stu_no, stu_name from student where stu_dept = '전기전자';

--29.
select * from student where stu_gender = 'F';

--30.
select * from student where stu_dept != '전기전자';

--31.
select stu_no from enrol where enr_grade >= 80;

--32.
select * from student where stu_name = '김인중';

--33.
select * from student where stu_dept = '기계' and stu_grade =2;

--34.
select * from student where stu_gender = 'F' and stu_weight <= 60;

--35.
select stu_dept from student where stu_dept != '기계';

--36.
select stu_name from student where stu_dept = '컴퓨터정보' and stu_grade = 2 and stu_class = 'A';

--37.
select * from student where stu_grade != 2;

--38.
select stu_no, stu_name from student where stu_name like '김%';

--39.
select * from student;
select stu_name from student where stu_name like '옥%' or stu_name like '_옥' or stu_name like '_옥%';

--40.
select * from student where stu_no like '2015%';

--41.
select stu_no, stu_name from student where stu_height is null;

--42.
select stu_no, stu_name from student where stu_height is not null;

--43.
select stu_no, stu_name from student where stu_dept = '컴퓨터정보' or stu_dept = '기계';

--44.
select stu_no, stu_name, stu_dept from student where stu_gender = 'M' or stu_grade = 1;

--45.
select stu_no, stu_name from student
order by stu_no;

--46.
select stu_no, stu_name, stu_dept 
from student
order by stu_dept;

--47.
select * 
from student
order by stu_dept,stu_grade desc;

--48.
select * from student
order by stu_dept, stu_class;

--49.
select stu_dept || '과 ' || stu_grade || '학년 ' || stu_name || '입니다.' from student;

--50.
select lower(stu_gender) from student;

--51.
select stu_name, substr(stu_name,1,2) from student;

--52.
select stu_name, length(stu_name) from student;

--53.
select stu_name, instr(stu_name, '김') from student;

--54.
select stu_dept, instr(stu_dept, '기') from student;

--55.
select lpad(stu_dept, 20, '%') from student;

--56.
select nvl(to_char(stu_height),'미기록') as 신장
from student;

--57.
select stu_height, stu_no, stu_name 
from student
where stu_height = (select max(stu_height) from student);

--58.
select stu_name, stu_weight from student
where stu_weight = (select min(stu_weight) from student);

--59.
select count(distinct stu_dept) from student;

--60.
select count(distinct substr(stu_name,1,1)) from student;

--61.
select stu_grade, count (*) as 학생수
from student
group by stu_grade;

--62.
select stu_grade, count (*) as 학생수
from student
group by stu_grade
order by 학생수 desc;

--63.
select stu_dept, avg(stu_height) as 평균키
from student
group by stu_dept;

--64.
select stu_dept, stddev(stu_weight) as 체중의_표준편차
from student
group by stu_dept;

--65.
select stu_dept, stu_grade, avg(stu_weight) as 평균체중
from student
group by stu_dept, stu_grade
order by stu_dept;

--66.
select stu_dept, count(*) as 학생수
from student
group by stu_dept
order by 학생수 desc;

--67.
select stu_dept, stu_grade, avg(stu_weight) as 평균체중
from student
group by stu_dept, stu_grade
order by 평균체중 desc;

--68.
select stu_dept, avg(stu_height) as 평균신장
from student
group by stu_dept
order by 평균신장 desc;


