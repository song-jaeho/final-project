<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/temp/css/hover.css" >
<style type="text/css">

#search-contents {
	padding-left: 150px;
	max-width: 100%;
}

#search-contents #search-period {
	padding-left: 25px;
}

#search-contents #search-options label {
	color: rgb(70, 70, 70);
	margin-bottom: 10px;
}

#search-contents #search-options span:not(.disabled):hover {
	cursor: pointer;
}

#search-contents #search-options span.selected-option {
	color: rgb(20, 20, 20);
	font-weight: bold;
}

#search-contents #search-options span:not(.selected-option) {
	color: rgb(120, 120, 120);
}

#search-contents #search-form-opener:hover {
	cursor: pointer;
}

#search-contents .search-form-row {
	margin-top: 50px;
	margin-bottom: 50px;
}

#search-contents .video-detail, 
#search-contents .channel-detail,
#search-contents .playlist-detail {
	min-height: 140px;
	max-height: 140px;
	margin: 15px 0px 15px 0px;
}

#search-contents .header {
	margin-right: 10px;
	padding: 0px;
	min-height: 140px;
	max-height: 140px;
	max-width: 250px;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
}

#search-contents .header div {
	margin: 0px;
	padding: 0px;
}

#search-contents .body div {
	margin: 0px;
	padding 0px;
	width: 680px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	color: rgb(150, 150, 150);
}

#search-contents .body {
	min-height: 140px;
	max-height: 140px;
	position: relative;
}

#search-contents .footer {
	min-height: 140px;
	max-height: 140px;
	line-height: 140px;
	text-align: left;
	vertical-align: middle;
}

#search-contents .top {
	position: absolute;
	top: 0;
}

#search-contents .mid {
	vertical-align: middle;
	position: absolute;
	top: 35%;
}

#search-contents p {
	margin: 10px 0px 10px 0px;
}

#search-contents .bot {
	position: absolute;
	bottom: 0;
}

.channel-owner-nick , .video-title , .playlist-title {
	font-size: large;
	font-weight: bold;
	color: rgb(70,70,70);
}

.channel-owner-nick:hover , .video-title:hover , 
.playlist-title:hover , .creator-nick:hover ,
.playlist-owner-nick:hover, .first-video-title:hover, 
.second-video-title:hover, .playlist-video-count-parent span:hover
{
	text-decoration: underline;
	color: rgb(40,30,170);
	cursor: pointer;
}

#search-contents .thumbnails {
	min-height: 140px;
	max-height: 140px;
	vertical-align: middle;
	text-align: center;
}

#search-contents .channel-detail button {
	border-radius: 0 !important;
}

#searchc-contents .video-duration-parent,
#search-contents .playlist-cover-parent {
	min-height: 140px;
	min-width: 250px;
	position: relative;
}

#search-contents .video-duration {
	background-color: rgb(30, 30, 30);
	pointer-events: none;
	color: rgb(220, 220, 220);
	position: absolute;
	bottom: 0px;
	right: 0px;
	z-index: 1;
}

#search-contents .playlist-cover {
	background-color: rgba(0, 0, 0, 0.7);
	pointer-events: none;
	position: absolute;
	height: 140px;
	width: 120px;
	right: 0px;
	bottom: 0px;
	z-index: 1;
}

#search-contents .playlist-cover .span-mid-center {
	font-size: 12pt;
	position: absolute;
	color: white;
	bottom: 55px;
	right: 55px;
}

.matched-word {
	font-weight: bold;
	color: rgb(220,45,30);
}



#search-contents .dropdown {
	visibility: hidden;
	margin: 0px;
	padding: 0px;
}

#search-contents .dropdown-toggle:hover {
	cursor: pointer;
}

</style>
<div style="padding-bottom: 5px;"></div>
<script type="text/playlist" id="sample-playlist-div">
	<div class="col-md-12 playlist-detail">
		<div class="row">
			<div class="col-md-3 header hvr-grow-shadow">
				<div class="col-md-12">
					<span class="owner-no hidden"></span>
					<span class="playlist-no hidden"></span>
					<span class="first-video-no hidden"></span>
					<span class="second-video-no hidden"></span>
					<div style="position: relative;">
						<img alt="playlist-image" src="" class="thumbnails">
						<span class="text-center playlist-cover">
							<span class="span-mid-center"><strong>&#35; </strong><span class="playlist-video-count"></span></span>
						</span>
					</div>
				</div>
			</div>
			<div class="col-md-6 body">
				<div class="row top">
					<div class="col-md-12">
						<span class="playlist-title"></span> <strong>&#183;</strong> <span class="playlist-owner-nick"></span>
					</div>
				</div>
				<div class="row mid">
					<div class="col-md-12">
						<div class="row">
							<p><span class="first-video-title"></span><span class="first-video-duration"></span></p>
							<p><span class="second-video-title"></span><span class="second-video-duration"></span></p>
						</div>
					</div>
				</div>
				<div class="row bot">
					<div class="col-md-12 playlist-video-count-parent">
						<span>모든 재생목록 보기 (동영상 <span class="playlist-video-count"></span> 개)</span>
					</div>
				</div>
			</div>
		</div>		
		<div class="col-md-3 footer">
		</div>		
	</div>
</script>
<script type="text/channel" id="sample-channel-div">
	<div class="col-md-12 channel-detail">
		<div class="row">
			<div class="col-md-3 header hvr-grow-shadow">
				<span class="owner-no hidden"></span>
				<img alt="profile" src="" class="thumbnails">
			</div>
			<div class="col-md-6 body">
				<div class="row top">
					<div class="col-md-12">
						<div class="row">
							<span class="channel-owner-nick"></span> 님의 채널
						</div>
						<div class="row">
							<span class="member-count"></span> <strong>&#183;</strong> <span class="video-count"></span>
						</div>
					</div>
				</div>
				<div class="row mid">
					<div class="col-md-12">
						<div class="row">
							<span class="channel-title"></span>
						</div>
					</div>
				</div>
				<div class="row bot">
					<span class="channel-flag"></span>
				</div>
			</div>
			<div class="col-md-3 footer">
				<button class="btn btn-danger btn-lg btn-subscription"></button>
			</div>
		</div>				
	</div>
</script>
<script type="text/video" id="sample-video-div">
	<div class="col-md-12 video-detail">
		<div class="row">
			<div class="col-md-3 header hvr-grow-shadow">
				<div class="col-md-12">
					<span class="video-no hidden"></span>
					<div style="position: relative;">
						<span class="video-duration"></span>
						<img alt="mainImage" src="" class="thumbnails">
					</div>
				</div>
			</div>
			<div class="col-md-6 body">
				<div class="row top">
					<div class="col-md-12">
						<div class="row">
							<span class="video-title"></span>
						</div>
						<div class="row">
							<span class="creator-nick"></span>
							<span class="creator-no"></span>
							<span class="glyphicon glyphicon-eye-open watch-count"> <strong>&#183;</strong> </span> 
							<span class="create-date"></span>
						</div>
					</div>
				</div>
				<div class="row mid">
					<div class="col-md-12">
						<span class="video-detail-text"></span>
					</div>
				</div>
				<div class="row bot">
					<span class="video-flag"></span>
				</div>
			</div>
			<div class="col-md-3 footer">
				<div class="col-md-4">
					<div class="dropdown">
						<span class="glyphicon glyphicon-option-vertical dropdown-toggle" data-toggle="dropdown" aria-expanded="true"></span>
					  	<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
					  		<li role="presentation"><a role="menuitem" tabindex="-1">관심 없음</a></li>
					  		<li role="presentation"><a role="menuitem" tabindex="-1">나중에 볼 동영상에 추가</a></li>
					  		<li role="presentation"><a role="menuitem" tabindex="-1">재생목록에 추가</a></li>
					  		<li role="presentation"><a role="menuitem" tabindex="-1">신고</a></li>
					  	</ul>
					</div>
				</div>
			</div>
		</div>				
	</div>			
</script>
<div id="search-contents" class="row">
	<div class="col-xs-12">
		<div class="row search-form-row well">
			<form style="display: none;" class="form" id="search-form"
				action="/home/video-search" method="post"
				enctype="application/x-www-form-urlencoded">
				<div class="row" id="search-options">
					<div class="col-xs-3 option-col" id="search-period">
						<div class="row">
							<label><strong>업로드 날짜</strong></label>
						</div>
						<div class="row">
							<span class="selected-option" data-type="createDate"
								data-item="total">전체</span>
						</div>
						<div class="row">
							<span data-type="createDate" data-item="hour">지난 1시간</span>
						</div>
						<div class="row">
							<span data-type="createDate" data-item="today">오늘</span>
						</div>
						<div class="row">
							<span data-type="createDate" data-item="week">이번 주</span>
						</div>
						<div class="row">
							<span data-type="createDate" data-item="month">이번 달</span>
						</div>
						<div class="row">
							<span data-type="createDate" data-item="year">올해</span>
						</div>
					</div>
					<div class="col-xs-3 option-col" id="search-type">
						<div class="row">
							<label><strong>구분</strong></label>
						</div>
						<div class="row">
							<span class="selected-option" data-type="type" data-item="total">전체</span>
						</div>
						<div class="row">
							<span data-type="type" data-item="video">동영상</span>
						</div>
						<div class="row">
							<span data-type="type" data-item="channel">채널</span>
						</div>
						<div class="row">
							<span data-type="type" data-item="playlist">재생목록</span>
						</div>
					</div>
					<div class="col-xs-3 option-col" id="search-function">
						<div class="row">
							<label><strong>기능별</strong></label>
						</div>
						<div class="row">
							<span class="selected-option" data-type="function"
								data-item="total">전체</span>
						</div>
						<div class="row">
							<span data-type="function" data-item="short-time">단편(4분
								이하)</span>
						</div>
						<div class="row">
							<span data-type="function" data-item="long-time">장편(20분
								이상)</span>
						</div>
						<div class="row">
							<span data-type="function" data-item="high-fps">높은
								fps(25Hz이상)</span>
						</div>
					</div>
					<div class="col-xs-2 option-col" id="search-sort-by">
						<div class="row">
							<label><strong>정렬 기준</strong></label>
						</div>
						<div class="row">
							<span class="selected-option" data-type="sortBy"
								data-item="relation">관련성</span>
						</div>
						<div class="row">
							<span data-type="sortBy" data-item="create-date">업로드 날짜</span>
						</div>
						<div class="row">
							<span data-type="sortBy" data-item="long-time">긴 재생시간</span>
						</div>
						<div class="row">
							<span data-type="sortBy" data-item="short-time">짧은 재생시간</span>
						</div>
						<div class="row">
							<span data-type="sortBy" data-item="watch-count">조회수</span>
						</div>
						<div class="row">
							<span data-type="sortBy" data-item="like-count">평점</span>
						</div>
					</div>
					<div class="col-xs-1" id="search-cateogry">
						<div class="row">
							<div class="row">
								<label><strong>분류</strong></label>
							</div>
							<div class="row">
								<select name="primaryCategoryNo">
									<option value="">모든 분류</option>
									<c:forEach var="category" items="${categories }">
										<option value="${category.no }">${category.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="hidden">
					<button id="btn-fake-submit" class="btn btn-light">
						<strong>검색</strong>
					</button>
				</div>
			</form>
			<div class="row">
				<div class="col-xs-12" align="center" id="search-form-opener">
					<strong>필터 <span class="glyphicon glyphicon-chevron-down"></span></strong>
				</div>
			</div>
		</div>
		<div class="row">
			<table id="searched-videos-table" class="table">
				<tbody>
					<tr>
						<td>
							<div class="row"></div>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td><p id="empty-bottom" style="min-height: 150px; visibility: hidden;"></p></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
<script>
	$(function() {

		var $searchContents = $('#search-contents');
		
		var $sampleVideoDiv = $($('#sample-video-div').html());

		var $sampleChannelDiv = $($('#sample-channel-div').html());

		var $samplePlaylistDiv = $($('#sample-playlist-div').html());

		var $searchForm = $('#search-form');

		var $formOpener = $('#search-form-opener');

		var $btnSearchSubmit = $('#btn-fake-submit');

		var $itemArea = $('#searched-videos-table tbody tr td div.row');

		var $navSearchForm = $('#top-nav-search-form');

		var $mainDiv = AppManager.getMainDiv();

		var $responseItems = $('<div></div>');
		
		var fadeSpeed = 150;
		
		var slideSpeed = 150;

		var videoRequestCnt = 4;
		
		var videoResponseCnt = 0;
		
		var channelRequestCnt = 1;
		
		var channelResponseCnt = 0;
		
		var playlistRequestCnt = 2;
		
		var playlistResponseCnt = 0;
		
		var currPage = 0;

		var requestable = true;
		
		$searchContents.ready(function() {
			search();
		});

		// -- video link start
		
		$searchContents.on('click', '.video-detail .header', function() {
			var videoNo = $(this).find('.video-no').text();
			AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo=" + videoNo);
		});

		$searchContents.on('click', '.video-detail .video-title', function() {
			var videoNo = $(this).parents('.video-detail:eq(0)').find('.video-no').text();
			AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo=" + videoNo);
		});
		
		$searchContents.on('click', '.video-detail .creator-nick', function() {
			var ownerNo = $(this).parents('.video-detail:eq(0)').find('.creator-no').text();
			AppManager.changeMainDiv(AppManager.div.subscriptions.main + "?creatorNo=" + ownerNo);
		});
		
		// -- video link end
		
		// -- channel link start
		
		$searchContents.on('click', '.channel-owner-nick', function(){
			var ownerNo = $(this).parents('.channel-detail:eq(0)').find('.owner-no').text();
			AppManager.changeMainDiv(AppManager.div.subscriptions.main + "?creatorNo=" + ownerNo);
		});
		
		$searchContents.on('click', '.channel-detail .header', function() {
			var ownerNo = $(this).find('.owner-no').text();
			AppManager.changeMainDiv(AppManager.div.subscriptions.main + "?creatorNo=" + ownerNo);
		});
		
		// -- channel link end
		
		// -- playlist link start
		
		$searchContents.on('click', '.playlist-detail .header', function() {
			var playlistNo = $(this).find('.playlist-no').text();
			AppManager.changeMainDiv(AppManager.div.video.player + "?subListNo=" + playlistNo);
		});
		
		$searchContents.on('click', '.playlist-detail .playlist-title', function() {
			var playlistNo = $(this).parents('.playlist-detail:eq(0)').find('.playlist-no').text();
			AppManager.changeMainDiv(AppManager.div.video.player + "?subListNo=" + playlistNo);
		});
		
		$searchContents.on('click', '.playlist-detail .playlist-owner-nick', function() {
			var ownerNo = $(this).parents('.playlist-detail:eq(0)').find('.owner-no').text();
			AppManager.changeMainDiv(AppManager.div.subscriptions.main + "?creatorNo=" + ownerNo);
		});
		
		$searchContents.on('click', '.playlist-detail .first-video-title', function() {
			var videoNo = $(this).parents('.playlist-detail:eq(0)').find('.first-video-no').text();
			AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo=" + videoNo);
		});
		
		$searchContents.on('click', '.playlist-detail .second-video-title', function() {
			var videoNo = $(this).parents('.playlist-detail:eq(0)').find('.second-video-no').text();
			AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo=" + videoNo);
		});
		
		$searchContents.on('click', '.playlist-detail .playlist-video-count-parent', function() {
			var playlistNo = $(this).parents('.playlist-detail:eq(0)').find('.playlist-no').text();
			AppManager.changeMainDiv(AppManager.div.library.playList + "?plno=" + playlistNo);
		});
		
		// -- playlist link end
		
		$searchContents.on('mouseenter', '.video-detail', function() {
			$(this).find('.dropdown').fadeIn(fadeSpeed);
		});

		$searchContents.on('mouseleave', '.video-detail', function() {
			$(this).find('.dropdown').fadeOut(fadeSpeed);
		});

		$('#search-contents select[name=primaryCategoryNo]').change(function(event) {
			event.preventDefault();
			search();
		});

		$('#search-contents #search-options span').not('.disabled').click(function(event) {
			event.preventDefault();
			var $div = $(this).parents('div.option-col');
			$div.find('span.selected-option').removeClass('selected-option');
			$(this).addClass('selected-option');
			search();
		});

		$formOpener.click(function() {
			var $span = $formOpener.find('span');
			$searchForm.slideToggle(slideSpeed, function() {
				$span.toggleClass('glyphicon-chevron-up');
				$span.toggleClass('glyphicon-chevron-down');
			});
		});

		$btnSearchSubmit.click(function(event) {
			event.preventDefault();
			search();
		});

		$mainDiv.scroll(function() {
			var contentsHeight = $searchContents.height();
			var scrollPosition = $mainDiv.scrollTop() + $mainDiv.height();
			var loadPoint = contentsHeight - 250;
			
			if (scrollPosition >= loadPoint) {
				$searchForm.submit();
				return false;
			}
		});

		function search() {
			if (!requestable) {
				AppManager.showAlert('알림', '현재 다른 작업이 진행 중입니다. 잠시 기다려주세요.');
				return false;
			}
			
			$itemArea.fadeOut(fadeSpeed, function(){
				$itemArea.empty();
				$itemArea.show();
				currPage = 0;
				$searchForm.submit();
			});
		}

		$searchForm.submit(function(event) {
			event.preventDefault();
			if(!requestable) { // 아직 요청에대한 ajax응답을 받지 못했으므로 요청을 차단한다.
				return false;
			}
			requestable = false;
			
			var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
			var data = $navSearchForm.find('input[name=keywords]').val();
			data = data.replace(regExp, "");
			$navSearchForm.find('input[name=keywords]').val(data);
			if(!Utils.trimAll(data)){
				//requestable = true;
				//return;
			}
			
			data = Utils.AsOneWhiteSpace(data);
			data = Utils.replaceAll(data,' ','_');
			var words = data.split('_');
			
			var videoStartRn = (currPage * videoRequestCnt) + 1;
			var channelStartRn = (currPage * channelRequestCnt) + 1;
			var playlistStartRn = (currPage * playlistRequestCnt) + 1;
			
			var videoEndRn = videoStartRn + videoRequestCnt - 1;
			var channelEndRn = channelStartRn + channelRequestCnt - 1;
			var playlistEndRn = playlistStartRn + playlistRequestCnt - 1;
			
			// 0 이면 첫페이지 상태
			// 서비스가 전달받은 시작rn들이 1이면 해당 검색결과의 갯수를 합산하여 데이터와 함께 담아주고 시작 rn들이 1이 아니라면 데이터만 내려보내준다.
			// 각각의 cnt들의 최근 결과 갯수가 내가 설정한 요청 갯수보다 작을 때 더 이상의 데이터가 존재하지 않음을 의미한다.
			// 서버에서 불필요한 쿼리가 돌아가지 않도록 서비스는 각각의 요청rn들에 대한 0 여부를 판단하여 로직을 돌린다.
			// 저번 요청에서의 결과갯수 합이 0이라면 더 이상 데이터가 존재하지 않음을 뜻하므로 서버로의 데이터 요청을 차단한다.
			// 검색 방식의 변화로 인한 재요청은 가능하도록 flag를 true로 변환해준다.
			if(currPage != 0){
				if(videoResponseCnt < videoRequestCnt){
					videoStartRn = 0;
					videoEndRn = 0;
				}
				if(channelResponseCnt < channelRequestCnt){
					channelStartRn = 0;
					channelEndRn = 0;
				}
				if(playlistResponseCnt < playlistRequestCnt){
					playlistStartRn = 0;
					playlistEndRn = 0;
				}
				
				if(videoResponseCnt < videoRequestCnt && 
					channelResponseCnt < channelRequestCnt && 
					playlistResponseCnt < playlistRequestCnt){
					requestable = true;
					return false;
				}
			}
			
			console.log('데이터 요청 시작');
			
			var formData = new FormData();

			formData.append('videoStartRn', videoStartRn);
			formData.append('videoEndRn', videoEndRn);
			formData.append('channelStartRn', channelStartRn);
			formData.append('channelEndRn', channelEndRn);
			formData.append('playlistStartRn', playlistStartRn);
			formData.append('playlistEndRn', playlistEndRn);
			formData.append('keywords', data);
			formData.append('pno', currPage);
			formData.append('primaryCategoryNo', $searchForm.find('select[name=primaryCategoryNo]').val());
			
			$.each($searchForm.find('span.selected-option'), function(index, item) {
				formData.append($(this).attr('data-type'), $(this).attr('data-item'));
			});

			$.ajax({
				url : "/home/video-search",
				type : "post",
				data : formData,
				processData: false,
				contentType: false,
				success : function(result) {
					console.log(result);
					var videos = result.videos;
					var channels = result.channels;
					var playlists = result.playlists;
					
					if(videos){
						videoResponseCnt = result.videos.length;
					}
					if(channels){
						channelResponseCnt = result.channels.length;
					}
					if(playlists){
						playlistResponseCnt = result.playlists.length;
					}
						
					if(currPage == 0){
						$itemArea.append('<h4>검색결과</h4>');
						$itemArea.append('<span> 동영상 <strong>' + Utils.toZero(result.videoSize) + '</strong>개, </span>');
						$itemArea.append('<span> 채널 <strong>' + Utils.toZero(result.channelSize) + '</strong>개, </span>');
						$itemArea.append('<span> 재생목록 <strong>' + Utils.toZero(result.playlistSize) + '</strong>개</span>');
					}
					
					// video result
					$.each(result.videos, function(i, video) {
						var $newVideoDiv = $sampleVideoDiv.clone(true, true);

						$newVideoDiv.find('span.video-no').text(video.no);
						$newVideoDiv.find('img.thumbnails').attr('src', video.previewA2Url + "&" + (new Date()).getTime());
						$newVideoDiv.find('.video-duration').text(video.durationStr);
						
						var videoTitle = video.title;
						var creatorNick = video.userNick;
						
						$.each(words, function(index, word) {
							videoTitle = Utils.replaceAll(videoTitle, word, '<span class="matched-word">' + word + '</span>');
							creatorNick = Utils.replaceAll(creatorNick, word, '<span class="matched-word">' + word + '</span>');
						});
						
						$newVideoDiv.find('.video-title').html(videoTitle);
						$newVideoDiv.find('.creator-nick').html(creatorNick);
						$newVideoDiv.find('.video-detail-text').text(video.detail);
						$newVideoDiv.find('.creator-no').text(video.creatorNo);

						$watchCount = $newVideoDiv.find('.watch-count').text(" " + video.watchCount + "회");
						var dateText = video.createDateStr + "(생성됨)";
						if (video.updateDateStr != null && video.updateDatestr != "" && !video.updateDateStr) {
							dateText = video.updateDatestr + "(수정됨)";
						}
						$newVideoDiv.find('.create-date').text(dateText);

						$itemArea.append($newVideoDiv.hide().fadeIn(fadeSpeed));
					});
					
					
					// channel result
					$.each(result.channels, function(i, channel) {
						var $newChannelDiv = $sampleChannelDiv.clone(true, true);

						$newChannelDiv.find('.owner-no').text(channel.ownerNo);
						$newChannelDiv.find('.thumbnails').attr('src', channel.ownerProfileBigImgUrl);
						
						var channelTitle = channel.channelTitle;
						var ownerNick = channel.ownerNick;
						$.each(words, function(index, word) {
							channelTitle = Utils.replaceAll(channelTitle, word, '<span class="matched-word">' + word + '</span>');
							ownerNick = Utils.replaceAll(ownerNick, word, '<span class="matched-word">' + word + '</span>');
						});
						
						$newChannelDiv.find('.channel-title').html(channelTitle);
						$newChannelDiv.find('.channel-owner-nick').html(ownerNick);
						$newChannelDiv.find('.member-count').text('구독자 ' + Utils.toZero(channel.memberCount) + '명');
						$newChannelDiv.find('.video-count').text('동영상 ' + channel.videoCount + '개');
						$newChannelDiv.find('.btn-subscription').html(Utils.toZero(channel.memberCount) + '명 구독 ');

						$itemArea.append($newChannelDiv.hide().fadeIn(fadeSpeed));
					});

					// playlist result
					$.each(result.playlists, function(i, playlist) {
						var $newPlaylistDiv = $samplePlaylistDiv.clone(true, true);

						$newPlaylistDiv.find('.owner-no').text(playlist.ownerNo);
						$newPlaylistDiv.find('.playlist-no').text(playlist.playlistNo);
						$newPlaylistDiv.find('.first-video-no').text(playlist.firstVideoNo)
						$newPlaylistDiv.find('.second-video-no').text(playlist.secondVideoNo);
						$newPlaylistDiv.find('.thumbnails').attr('src', playlist.playlistImgUrl + "&" + (new Date()).getTime());
						$newPlaylistDiv.find('.playlist-title').text(playlist.playlistTitle);
						$newPlaylistDiv.find('.playlist-owner-nick').text(playlist.ownerNick);
						
						var firstVideoTitle = playlist.firstVideoTitle;
						var secondVideoTitle = playlist.secondVideoTitle;
						$.each(words, function(index, word) {
							firstVideoTitle = Utils.replaceAll(firstVideoTitle, word, '<span class="matched-word">' + word + '</span>');
							secondVideoTitle = Utils.replaceAll(secondVideoTitle, word, '<span class="matched-word">' + word + '</span>');
						});
						
						$newPlaylistDiv.find('.first-video-title').html(firstVideoTitle);
						$newPlaylistDiv.find('.first-video-duration').html('<strong> &#183; </strong> (' + Utils.timeFormat(playlist.firstVideoDuration) + ')');
						if(playlist.secondVideoTitle){
							$newPlaylistDiv.find('.second-video-title').html(secondVideoTitle);
						}
						if(playlist.secondVideoDuration){
							$newPlaylistDiv.find('.second-video-duration').html('<strong> &#183; </strong> (' + Utils.timeFormat(playlist.secondVideoDuration) + ')');
						}
						$newPlaylistDiv.find('.playlist-video-count').text(playlist.playlistVideoCount);

						$itemArea.append($newPlaylistDiv.hide().fadeIn(fadeSpeed));
					});

					currPage++;
 					requestable = true;
 					$mainDiv.trigger('scroll');
				},
				error : function(err) {
					AppManager.showAlert('알림', '알 수 없는 오류가 발생하였습니다. 다시 시도해 주세요.');
					requestable = false;
				}
			});
		});
	})
</script>