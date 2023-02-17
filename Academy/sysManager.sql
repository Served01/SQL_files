select * from DBA_TABLES;
select * from DBA_INDEXES;
select * from DBA_VIEWS;

create view studA
    as select *
        from hyun.student;

select*from studA;

create view studB
as select stu_no, stu_name
from hyun.student;

select * from studB;

CREATE view studC
as select a.stu_no, a.stu_gender, b.stu_name
from studA a, studB b
where a.stu_no = b.stu_no;

select * from studC;