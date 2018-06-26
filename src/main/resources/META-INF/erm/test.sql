select
	*
from
	videos V1, 
	(
		select distinct
			primary_category_no
		from 
			videos V1, 
			(
					select
						video_no
					from (
								select
									*
								from
									video_vote_history
								where
									user_no = 31
								and
									side = 'p'
							  )
			) V2
		where
			V1.video_no = V2.video_no
	) V2
where
	V1.primary_category_no = V2.primary_category_no;

select
	LISTAGG(word, ',') WITHIN GROUP(ORDER BY word) 
from
	tags;

select
	*
from
	videos
where
	video_status != 'enabled';


select
	V.video_no,
	T.words
from
	videos V , ( 
						select  
							video_no, 
							LISTAGG(word, ',') WITHIN GROUP(ORDER BY video_no) words
						from 
							tags 
						group by 
							video_no 
					) T
where	
	V.video_no = T.video_no;


select distinct
	V.*
from
	videos V, tags T
where 
	V.video_no  = T.video_no;


select 
	V.video_no,
	C.cnt,
	V.video_title,
	V.video_detail,
	U.user_nick,
	VM.preview_a4_url,
	V.create_date
from 
	videos V , video_meta VM , users U ,  
	(
		select 
			video_no,
			count(*)	as cnt
		from
			watch_history
		group by 
			video_no
	)	C
where
	V.video_no = C.video_no
and
	V.creator_no = U.user_no
and 
	V.video_no = VM.video_no
order by
	C.cnt desc;

select
	video_no,
	sum(tag_similarity + title_similarity + detail_similarity)
from(
		select distinct
			V.video_no,
			TW.words,
			case
				when TW.words like '%무비%' then 1
			else
				0
			end as tag_similarity,
			case
				when V.video_title like '%무비%' then 1
			else
				0
			end as title_similarity,
			case 
				when V.video_detail like '%무비%' then 1
			else
				0
			end as detail_similarity
		from
			videos V, tags T,
			(
			select  
				video_no, 
				listagg(word, ',') within group(order by video_no) words
			from 
				tags 
			group by 
				video_no 
			) TW
		where
			V.video_no = T.video_no(+)
		and
			V.video_no = TW.video_no(+)
)
group by
	video_no;

commit;

select
	video_no
from
	videos
where
	creator_no = 39;

select
	video_no,  W.*
from
	watch_history W;

select
REGEXP_COUNT('안녕하세요 안녕!!','안녕',1)
from dual;



select
regexp_replace(
    '영화,영화같은,영화는,영화란'
    ,'([^,]+)(,\1)+', '\1'
)from dual
;

select
video_no,
regexp_replace(
    replace( replace(video_title,chr(0),',') ,' ',','),
    '([^,]+)(,\1)+', 
    '\1'
)
from
	videos;

select
	V.video_no,
	TW.words,
	nvl(  
		(
			REGEXP_COUNT(TW.words,'영화',1) +
			REGEXP_COUNT(V.video_title,'영화',1) +
			REGEXP_COUNT(V.video_detail,'영화',1)
		), 0
	) match_count
from
	videos V,
	(
	select  
		video_no, 
		listagg(word, ',') within group(order by video_no) words
	from 
		tags 
	group by 
		video_no 
	) TW
where
	V.video_no = TW.video_no(+);




select 
	video_no,
	count(*)	as cnt
from
	watch_history
where 
	video_no = 90
group by 
	video_no;
	
select
	V.video_title,
	V.video_detail,
	VM.preview_a2_url,
	VM.video_url,
	(
		select 
			category_name
		from
			video_categories
		where
			category_no = V.primary_category_no 
	),
	(
		select 
			category_name
		from
			video_categories
		where
			category_no = V.secondary_category_no
	)
from
	videos V, video_meta VM
where
	V.video_no = VM.video_no
and 
	V.creator_no = 35;
	
insert into channels ( owner_no, channel_title, channel_long_detail, channel_img_url ) 
values ( 29, 'duck님의 채널', 'duck님의 채널입니다.', 'ㅁㄴㅇㅁㄴㅇ' );

update videos
set
	video_status = 'enabled'
where
	video_status != 'enabled';
	
commit;
