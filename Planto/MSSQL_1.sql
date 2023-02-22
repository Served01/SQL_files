select * 
    from TB_ORG;

select * 
    from tb_user;

select * 
    from tb_user_if;

select * 
    into TB_USER_IF 
    from TB_USER;

alter table tb_user_if 
    drop column reg_dt, update_dt;

exec sp_rename 'tb_user.[EMPNO]', 'EMP_NO', 'COLUMN';

insert 
    into tb_user_if(user_id, user_nm, user_password, org_cd, use_yn, emp_no, pstn_nm, email, tel) 
    select user_id, user_nm, user_password, org_cd, use_yn, emp_no, pstn_nm, email, tel 
    from tb_user;

-- 변경할 테이블: tb_user
-- 변경시 참고할 테이블: tb_user_if

-- 추가, 변경, 삭제 데이터 각각 2개씩 변경해놓기

-- 추가 데이터
insert 
    into tb_user_if (user_id, user_nm, user_password, org_cd, use_yn, emp_no, pstn_nm, email, tel, if_datetime)
    values ('wslim01', '임우성', '1aaaaa', 'ORG10', 'Y', '1234', '사원', 'sss@planto.co.kr', null, getdate());

insert 
    into tb_user_if (user_id, user_nm, user_password, org_cd, use_yn, emp_no, pstn_nm, email, tel, if_datetime)
    values ('wslim02', '임우성2', '12aaaaa', 'ORG12', 'Y', '1321', '대리', 'sss@planto.co.kr', null, getdate());

-- 변경 데이터
update tb_user_if 
    set org_cd = 'ORG11', use_yn = 'N'
    where user_id = 'icca01';

update tb_user_if 
    set org_cd = 'ORG11', use_yn = 'N'
    where user_id = 'iccp01';
    
-- 삭제 데이터
select * from tb_user 
    where user_id ='icuser01';

delete from tb_user_if 
    where user_id = 'icuser01';

delete from tb_user_if 
    where user_id = 'icuser02';

delete from tb_user_if 
    where user_id = 'wslim01';

delete from tb_user_if 
    where user_id = 'wslim02';

-- 삭제된 데이터 조회
select user_id 
    from tb_user 
    where user_id 
        not in (select user_id from tb_user_if);

-- 추가된 데이터 조회
select * 
    from tb_user_if 
    where user_id 
        not in (select user_id from tb_user);

-- 수정되지 않은 데이터 조회
select a.* 
    from tb_user_if as a, tb_user as b
    where a.user_id = b.USER_ID
        and isnull(a.user_nm, '0') = isnull(b.user_nm, '0')
        and isnull(a.user_password, '0') = isnull(b.user_password, '0')
        and isnull(a.org_cd, '0') = isnull(b.org_cd, '0')
        and isnull(a.use_yn, '0') = isnull(b.use_yn, '0')
        and isnull(a.emp_no, '0') = isnull(b.emp_no, '0')
        and isnull(a.pstn_nm, '0') = isnull(b.pstn_nm, '0')
        and isnull(a.email, '0') = isnull(b.email, '0') 
        and isnull(a.tel, '0') = isnull(b.tel, '0');
    
-- 수정된 데이터의 user_id
select user_id  
    from tb_user_if 
    where user_id 
        not in ((
            select a.user_id from tb_user_if as a, tb_user as b
                where a.user_id = b.USER_ID
                and isnull(a.user_nm, '0') = isnull(b.user_nm, '0')
                and isnull(a.user_password, '0') = isnull(b.user_password, '0')
                and isnull(a.org_cd, '0') = isnull(b.org_cd, '0')
                and isnull(a.use_yn, '0') = isnull(b.use_yn, '0')
                and isnull(a.emp_no, '0') = isnull(b.emp_no, '0')
                and isnull(a.pstn_nm, '0') = isnull(b.pstn_nm, '0')
                and isnull(a.email, '0') = isnull(b.email, '0') 
                and isnull(a.tel, '0') = isnull(b.tel, '0'))
            union (
                select user_id 
                rom tb_user_if where user_id 
                    not in (
                        select user_id from tb_user)
                                                        )
                                                            );


-------------------------------------------------------------


-- 수정 쿼리문
-- 첫번째
update a
    set a.user_id = b.user_id
        ,a.user_nm = b.user_nm
        ,a.user_password = b.user_password
        ,a.org_cd = b.org_cd
        ,a.use_yn = b.use_yn
        ,a.emp_no = b.emp_no
        ,a.pstn_nm = b.pstn_nm
        ,a.email = b.email
        ,a.tel = b.tel
        ,update_dt = getdate()
    from tb_user a
    join tb_user_if b
        on a.user_id = b.user_id
    where a.user_id 
        in (
            select user_id  
                from tb_user_if 
                where user_id 
                    not in ((
                        select a.user_id 
                            from tb_user_if as a, tb_user as b
                                where a.user_id = b.USER_ID
                                and isnull(a.user_nm, '0') = isnull(b.user_nm, '0')
                                and isnull(a.user_password, '0') = isnull(b.user_password, '0')
                                and isnull(a.org_cd, '0') = isnull(b.org_cd, '0')
                                and isnull(a.use_yn, '0') = isnull(b.use_yn, '0')
                                and isnull(a.emp_no, '0') = isnull(b.emp_no, '0')
                                and isnull(a.pstn_nm, '0') = isnull(b.pstn_nm, '0')
                                and isnull(a.email, '0') = isnull(b.email, '0') 
                                and isnull(a.tel, '0') = isnull(b.tel, '0'))
                        union (
                            select user_id 
                                from tb_user_if 
                                where user_id 
                                    not in (
                                        select user_id from tb_user)
                                                                        )
                                                                            )
                                                                                );


-- 삭제 쿼리문 (순서대로 실행)
-- 첫번째
delete 
    from tb_user_author_map
    where user_id 
        in (
            select user_id 
                from tb_user
                where user_id 
                    not in (
                        select user_id from tb_user_if)
                                                            );
-- 두번째
delete 
    from tb_user
    where user_id 
        in (
            select user_id 
                from tb_user
                where user_id 
                    not in (
                        select user_id from tb_user_if)
                                                            );


-- 입력 쿼리문
-- 첫번째
insert 
    into tb_user (user_id, user_nm, user_password, org_cd, use_yn, emp_no, pstn_nm, emali, tel, reg_dt)
    select user_id, user_nm, user_password, org_cd, use_yn, emp_no, pstn_nm, emali, tel, getdate()
    from TB_USER_IF 
        where user_id 
            in (
                select user_id 
                    from tb_user_if 
                    where user_id 
                        not in (
                            select user_id 
                                from tb_user)
                                                );


