<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.videos-focused-menu {
		border-left: 5px solid black;
	}
	.subscription-video-main-videos-text-side {
		padding-right: 0px;
		padding-left: 5px;
	}
	.subscription-video-main-videos-button-side {
		padding-left: 0px;
		margin: 0px;
	}
	.subscription-video-none-border-and-white-back {
		border: none;
		background-color: #f3f3f3;
		color: gray;
	}
	[id^=subscription-video-video-no] {
		padding-right: 0px;
		padding-left: 0px;
		height: 240px;
	}
	#subscription-video-videos-tbody td{
		padding: 8px;
	}
	.playlist-buttons #videos-choose, .playlist-buttons #videos-playall, .playlist-buttons #videos-criteria{
		background-color: #f3f3f3;
	}
</style>
<div>
	<table class="table">
		<colgroup>
			<col width="*"/>
			<col width="*"/>
			<col width="*"/>
			<col width="*"/>
			<col width="*"/>
			<col width="*"/>
		</colgroup>
		<thead>
			<tr>
				<th colspan="6">
					<div class="playlist-buttons">									
						<div class="btn-group">
							<a type="button" class="btn btn-default dropdown-toggle none-boder-white-back-btn" data-toggle="dropdown" aria-expanded="false" id="videos-choose">
								<span id="videos-btn-dropdown-criteria">업로드한 동영상</span> <span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu" id="videos-dropdown-btn-list">
								<li><a class="videos-btn-dropdown" id="videos-whole">전체 동영상</a></li>
								<li><a class="videos-btn-dropdown videos-focused-menu" id="videos-uploaded">업로드한 동영상</a></li>
								<li><a class="videos-btn-dropdown" id="videos-liked">좋아요 표시한 동영상</a></li>
							</ul>
						</div>								
						<a class="btn btn-default play-all-atag" id="videos-playall">모두 재생</a>
						
						<div class="btn-group pull-right">
							<a type="button" class="btn btn-default dropdown-toggle none-boder-white-back-btn" data-toggle="dropdown" aria-expanded="false" id="videos-criteria">
								<span class="glyphicon glyphicon-th-list"></span> 정렬 기준
							</a>
							<ul class="dropdown-menu" role="menu" id="videos-criteria-botton-list">
								<li><a class="videos-btn-dropdown" id="videos-hottest">인기 동영상</a></li>
								<li><a class="videos-btn-dropdown" id="videos-eldest">추가된 날짜(오래된 순)</a></li>
								<li><a class="videos-btn-dropdown videos-focused-menu" id="videos-newest">추가된 날짜(최신순)</a></li>
							</ul>
						</div>
					</div>
				</th>
			</tr>
		</thead>
		<%@ include file="allVideos.jsp" %>
	</table>
</div>
<script>
$(function() {

	function getId($this, removeText) {
		return $this.attr('id').replace(removeText, '');
	};
	
	function changeBorderleft(removeTarget, $addTarget) {
		$(removeTarget).removeClass('videos-focused-menu');
		$addTarget.addClass('videos-focused-menu');
	};
	
	function changeTo() {
		var videoPlaylist = getId($('#videos-dropdown-btn-list .videos-focused-menu'), 'videos-');
		var videoCriteria = getId($('#videos-criteria-botton-list .videos-focused-menu'), 'videos-');	
		AppManager.changeDiv('#subscription-video-videos-tbody', AppManager.div.subscriptions.videos+'?playlist='+videoPlaylist+'&criteria='+videoCriteria+"&creatorNo="+$('#owner-no-box').val());
	};
	
	$('#videos-dropdown-btn-list').on('click', '[id^="videos-"]', function() {
		$('#videos-btn-dropdown-criteria').text($(this).text());
		changeBorderleft('#videos-dropdown-btn-list a', $(this));
		changeTo();
	});
	$('#videos-playall').click(function() {
		var playlistName = $('#videos-btn-dropdown-criteria').text();

		var videoNumbers = [];
		$('[id^=playlist-video-video-hiddenbox]').each(function(index, item) {
			videoNumbers[index] = $(item).val();
		});
		AppManager.changeMainDiv(AppManager.div.video.player+"?allList="+JSON.stringify(videoNumbers));
	});
	$('#videos-criteria-botton-list a').click(function() {
		changeBorderleft('#videos-criteria-botton-list a', $(this));
		changeTo();
	});
});
</script>
	
		