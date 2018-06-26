-- 복합키 추가

alter table cmw_comments add constraint cmw_comments_sk unique (writing_no,commenter_no);

alter table cmwc_replies add constraint cmwc_replies_sk unique (comment_no, replier_no);

alter table video_comments add constraint video_comments_sk unique (video_no, commenter_no);

alter table vc_replies add constraint vc_replies_sk unique ( comment_no, replier_no );

commit;

-- videos 테이블 수정

alter table videos modify (next_video_no null);

alter table videos
drop constraint SYS_C009240;

alter table videos  modify (video_status default 'enabled');

ALTER TABLE videos RENAME COLUMN release_date TO update_date;

-- video_meta 테이블 수정

ALTER table video_meta
MODIFY (video_file_name varchar2(100 char));

-- watch_later 테이블 수정

alter table
   watch_later
add
   create_date  date default sysdate NOT null ;

-- video_vote_history 테이블 수정

alter table
   video_vote_history
add
   create_date  date default sysdate NOT null ;
   
-- playlist 테이블 수정   

alter table
	playlists
add 
	update_date date default sysdate not null;
   
-- 실행 문

update 
	videos
set 
	primary_category_no = 10 , 
	secondary_category_no = 8
where
	creator_no = 37;

delete 
from video_meta
where video_no = any( select video_no from videos where creator_no = 34 );

delete
from videos
where creator_no = 34;

select 
	video_no,
	update_date
from videos
order by update_date asc;

commit;
