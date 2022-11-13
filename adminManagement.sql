create table Member_info(
    mb_id varchar2(20) primary key
        constraint mb_id check (length(mb_id) between 4 and 20),
    mb_pw varchar2(20) not null
        constraint mb_pw check (length(mb_pw) between 8 and 20),
    mb_name varchar2(12) not null,
    mb_email varchar2(30) not null,
    mb_tel varchar2(15) not null,
    mb_date date 
        default sysdate not null,
    mb_deleted varchar2(7) 
        default '0' not null,
    mb_deleted_date date null
)

insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('admin',12345678,'admin','admin@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun1',12345678,'test1','test1@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun2',12345678,'test2','test2@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun3',12345678,'test3','test3@gmail.com','010-1234-4567');
insert into Member_info(mb_id,mb_pw,mb_name,mb_email,mb_tel) values('hyun4',12345678,'test4','test4@gmail.com','010-1234-4567');

select * from Member_info;



create table Delivery_info(
    dv_id varchar2(20) not null,
        constraint dv_id_fk foreign key(dv_id)
            references Member_info(mb_id),
    dv_name varchar2(12) null,
    dv_tel varchar2(15) null,
    dv_address varchar2(100) null
)

insert into Delivery_info values('admin','admin','010-7894-1234','신림언저리0');
insert into Delivery_info values('hyun1','house1','010-7894-1234','신림언저리1');
insert into Delivery_info values('hyun2','house2','010-7894-1234','신림언저리2');
insert into Delivery_info values('hyun3','house3','010-7894-1234','신림언저리3');
insert into Delivery_info values('hyun4','house4','010-7894-1234','신림언저리4');

select * from Delivery_info;



create table Book_info(
    bk_number number(8) primary key,
    bk_title VARCHAR2(100) not null,
    bk_writer VARCHAR2(100) not null,
    bk_publisher VARCHAR2(50) not null,
    bk_pubdate date not null,
    bk_image VARCHAR2(500) not null,
    bk_local VARCHAR2(20) not null,
    bk_genre VARCHAR2(50) not null,
    bk_infodate date 
        default sysdate not null,
    bk_detail VARCHAR2(1500) not null,
    bk_quantity number(10) not null,
    bk_price number(10) not null,
    bk_title_upper varchar2(100) not null,
    bk_deleted varchar2(7) 
        default '0' not null
)

insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper)
    values(20220001,'Java교육','임우성','ㅇㅅㅇ',sysdate,'bk_image.jpg','국내','소설','책 디테일1',5,500,upper('Java교육'));
insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper) 
    values(20220002,'Jsp교육','김경빈','ㅇㅅㅇ',sysdate,'bk_image.jpg','국내','인문','책 디테일2',16,2500,upper('Jsp교육'));
insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper) 
    values(20220003,'CSS교육','이영호','ㅇㅅㅇ',sysdate,'bk_image.jpg','국내','취미','책 디테일3',0,26000,upper('CSS교육'));
insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper) 
    values(20220004,'Spring교육','최우성','ㅇㅅㅇ',sysdate,'bk_image.jpg','해외','경제','책 디테일4',200,1500,upper('Spring교육'));
insert into BOOK_INFO(bk_number, bk_title, bk_writer, bk_publisher, bk_pubdate, bk_image, bk_local, bk_genre, bk_detail, bk_quantity, bk_price, bk_title_upper) 
    values(20220005,'컴퓨터교육','박경수','ㅇㅅㅇ',sysdate,'bk_image.jpg','해외','예술','책 디테일5',1000,13000,upper('컴퓨터교육'));
    
select * from BOOK_INFO;



create table Review_info(
rv_number number(10) primary key,
rv_bknumber number(8) not null,
    constraint rv_bknumber_fk foreign key(rv_bknumber)
            references Book_info(bk_number),
rv_id varchar2(20) not null,
    constraint rv_id_fk foreign key(rv_id)
        references Member_info(mb_id),
rv_date date
    default sysdate not null,
rv_score number(1) not null,
rv_content varchar2(1500) null,
rv_deleted varchar2(7)
    default '0' not null
);

create sequence review_seq
	start with 1
	increment by 1
	maxvalue 9999999999
	nocycle;
	
drop sequence review_seq;

select * from review_info;

insert into review_info(rv_number, rv_bknumber, rv_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun1', 4, '내용1');
insert into review_info(rv_number, rv_bknumber, rv_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun2', 5, '내용2');
insert into review_info(rv_number, rv_bknumber, rv_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun3', 3, '내용3');
insert into review_info(rv_number, rv_bknumber, rv_id, rv_score, rv_content)
	values(review_seq.nextval, 20220002, 'hyun4', 4, '내용4');
insert into review_info(rv_number, rv_bknumber, rv_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun1', 5, '내용5');
insert into review_info(rv_number, rv_bknumber, rv_id, rv_score, rv_content)
	values(review_seq.nextval, 20220001, 'hyun2', 3, '내용6');



create table order_info(
    or_number varchar2(10) primary key,
    or_mbid varchar2(20) not null,
        constraint or_mbid_fk foreign key(or_mbid)
            references Member_info(mb_id),
    or_mbname varchar2(12) not null,
        constraint or_mbname_fk foreign key(or_mbname)
            references Member_info(mb_name),
    or_mbtel varchar2(15) not null,
        constraint or_mbtel_fk foreign key(or_mbtel)
            references Member_info(mb_tel),
    or_status varchar2(12)
    	default '0' not null,
    or_date date 
        default sysdate not null,
    or_delivery number(10) null,
    or_deliveryCost number (5)
    	default 3000 not null,
    or_dvname varchar2(100) not null,
    or_dvtel varchar2(15) not null,
    or_dvaddress varchar2(100) not null 
)

create sequence order_seq
	start with 1
	increment by 1
	maxvalue 9999999999
	nocycle;
	
drop sequence order_seq;

insert into ORDER_INFO values('22FEB105564','admin',1,sysdate,12345678,2500,'신림언저리');
select * from order_INFO;
drop table order_info;


create table order_items(

    ori_number varchar2(40) not null,
	constraint ori_number_fk foreign key(ori_number)
	    references order_info(or_number),
    ori_bknumber number(8) not null,
        constraint ori_bknumber_fk foreign key(ori_bknumber)
            references book_info(bk_number),
    ori_bkprice number(10),
    ori_bkdiscount number(3) 
        default 0 not null,
    ori_cacount number(3) 
    	default 1 not null
  )  
insert into order_items values('22FEB105564',70001000,2400,10,1);
insert into order_items values('22FEB105564',70001000,
                        (select bk_price from book_info where bk_number = 70001000),
                        (select ca_bkcount from  Cart_info where ca_mbid = 'admin' and ca_bknumbers = 70001000),1);
                        
select * from ORDER_INFO;
select * from order_items;

 drop table ORDER_INFO;
 drop table order_items;
 
 
 
delete from ORDER_INFO where 
 
 
Cart_info	

ca_number	장바구니 번호	번호	NUMBER		not null	PK, FK
ca_mbid	회원아이디	아이디	VARCHAR2	20	not null	FK
ca_bknumber	책번호	번호	NUMBER	8	not null	FK
ca_bkcount	선택된 갯수	개수	NUMBER	4	not null	

create table Cart_info(
	ca_mbid varchar2(20) not null,
		constraint ca_mbid_fk foreign key(ca_mbid)
            references mb_info(mb_id),
    ca_bknumbers number(8) not null,
    	constraint ca_bknumbers_fk foreign key(ca_bknumbers)
    		references book_info(bk_number),
	 ca_bkcount number(3) 
	    	default 1 not null
	    		constraint ca_bkcount check (ca_bkcount between 0 and 999)
)
select c.ca_mbid,c.ca_bknumbers from cart_info c,Mb_info m
where c.ca_mbid = 'admin'
and c.ca_mbid = m.mb_id;

drop table cart_info;
   
delete from CART_INFO where ca_bknumbers = 70001000;


insert into cart_info(ca_mbid,ca_bknumbers) values ('admin',70001000);
insert into cart_info(ca_mbid,ca_bknumbers) values ('admin',70001001);
insert into cart_info(ca_mbid,ca_bknumbers)  values ('admin',70001002);
insert into cart_info(ca_mbid) values('admin');
select * from cart_info where ca_mbid = 'admin';

commit

drop table cart_info;
Wish_info	
wi_number	찜목록 번호	번호	NUMBER		not null	PK, FK
wi_mbid	회원아이디	아이디	VARCHAR2	20	not null	FK
wi_bknumber	책번호	번호	NUMBER	8	not null	FK
wi_bkcount	책재고	재고량	NUMBER	4	not null	


create table Wish_info(
	wi_mbid varchar2(20) not null,
		constraint wi_mbid_fk foreign key(wi_mbid)
            references mb_info(mb_id),
    wi_bknumbers number(8) not null,
    	constraint wi_bknumbers_fk foreign key(wi_bknumbers)
    		references book_info(bk_number)
)

insert into Wish_info values('admin',70001000);
select * from wish_info;

drop table Wish_info;