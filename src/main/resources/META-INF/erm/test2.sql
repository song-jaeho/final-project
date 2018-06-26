select
	*
from
	videos
where
	video_title like '%ÄÚ¹Ìµð%';


select
	video_fps
from
	video_meta;


select
	C.category_no,
	sum( WH.watch_count )
from
	videos V, video_categories C,
	(
		select
			video_no,
			count(*) watch_count
		from
			watch_history
		group by
			video_no
	) WH
where
	V.video_no = WH.video_no
and
	V.primary_category_no = C.category_no
and
	V.video_status = 'enabled'
group by
	C.category_no;
	
	
--
select
	WH.video_no,
	count(*),
	row_number ()  over ( order by  count(*) desc) rn
from
	watch_history WH, videos V, video_categories C
where
	WH.video_no = V.video_no
and 
	V.creator_no != 39
and
	V.primary_category_no = C.category_no
and
	c.category_no in (10,9,7)
group by
	Wh.video_no;

-- top 3 primary category
select
	category_no
from (
			select 
				 C.category_no,
				 row_number () over ( order by sum(watch_count) desc ) rn
			from
				videos V, video_categories C,
				(
					select
						video_no,
						count(*) watch_count
					from
						watch_history
					where
						user_no = 29
					group by
						video_no
				) WH
			where
				WH.video_no = V.video_no
			and 
				V.primary_category_no = C.category_no
			group by
				C.category_no
		)
where
	rn <= 3;
	
--


select
	count(*)
from
	watch_history
where
	video_no = 90
group by
	video_no;

select
	C.category_no,
	V.creator_no,
	count(*) watch_count
from
	watch_history WH, videos V, video_categories C
where
	WH.video_no = V.video_no
and
	V.primary_category_no = C.category_no
group by
	C.category_no,V.creator_no
order by
	C.category_no, count(*) desc;

select
	C.category_no,
	V.creator_no,
	count(*)
from
	watch_history WH, videos V, video_categories C
where
	WH.video_no = V.video_no
and
	V.primary_category_no = C.category_no
group by
	C.category_no,V.creator_no
order by
	C.category_no, count(*) desc;


select *
from 
	watch_history WH, users U, videos V
where
	V.video_no = WH.video_no
and	
	V.creator_no = U.user_no
and
	U.user_no = 34;

select distinct
	S.owner_no
from
	subscriptions S, videos V, 
	(
		select
			category_no
		from (
					select 
						 C.category_no,
						 row_number () over ( order by sum(watch_count) desc ) rn
					from
						videos V, video_categories C,
						(
							select
								video_no,
								count(*) watch_count
							from
								watch_history
							where
								user_no = 35
							group by
								video_no
						) WH
					where
						WH.video_no = V.video_no
					and 
						V.primary_category_no = C.category_no
					group by
						C.category_no
				)
		where
			rn <= 3
	) C
where
	S.owner_no = V.creator_no
and
	V.primary_category_no = C.category_no;

select distinct
	S.owner_no
from
	subscriptions S, videos V, 
	(
		select
			category_no
		from (
					select 
						 C.category_no,
						 row_number () over ( order by sum(watch_count) desc ) rn
					from
						videos V, video_categories C,
						(
							select
								video_no,
								count(*) watch_count
							from
								watch_history
							where
								user_no = 29
							group by
								video_no
						) WH
					where
						WH.video_no = V.video_no
					and 
						V.primary_category_no = C.category_no
					group by
						C.category_no
				)
		where
			rn <= 3
	) C
where
	S.owner_no = V.creator_no
and
	V.primary_category_no = C.category_no;

select
	category_no,
	watch_count
from (
			select
				category_no,
				watch_count
			from (
						select 
							 C.category_no,
							 sum(WH.watch_count) watch_count
						from
							videos V, video_categories C,
							(
								select
									video_no,
									count(*) watch_count
								from
									watch_history
								where
									user_no = 29
								group by
									video_no
							) WH
						where
							WH.video_no = V.video_no
						and 
							V.primary_category_no = C.category_no
						group by
							C.category_no
					)
			order by
				watch_count desc
		  )
where
	rownum <= 3;

select
	video_no
from (
	select
		video_no,
		count(*) cnt,
		max(create_date) watchDate
	from
		watch_history
	where
		user_no = 34
	group by
		video_no
	order by
		watchDate desc
)
where
	rownum = 1;

select
	video_no,
	user_no,
	max(create_date) watchDate
from
	watch_history
where
	user_no = 29
group by
	video_no, user_no
order by
	watchDate desc;

select
	V.video_title,
	(
		select
			count(*)	as cnt
		from
			watch_history
		where
			video_no = V.video_no
	),
	(
		select
			user_nick
		from
			users
		where
			user_no = V.creator_no
	)
from
	videos V
