update Review_info set RV_score = 4, RV_content = '리뷰up' where RV_number = 1 and RV_bknumber = 20220001 and RV_id = 'hyun';

select * from review_info;

commit;