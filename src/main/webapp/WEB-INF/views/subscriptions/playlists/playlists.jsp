<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.selected-playlist {
		border-left: 5px solid black;
	}
	.selected-criteria {
		border-left: 5px solid black;
	}
	[id^=subscription-playlist-no] {
		padding-right: 0px;
		padding-left: 5px;
		height: 210px;
	}
	.subscription-playlist-text-side {
		padding-left: 5px;
	}
	.playlist-thumbnails {
		width: 250px;
		height: 120px;
	}
	#playlists-btn-dropdown-criteria, #playlists-criteria, #subscription-showmore-button {
		background-color: #f3f3f3;
	}
</style>
<div>
	<div class="row">
		<div class="playlist-buttons">
			<div class="btn-group">
				<a type="button" class="btn btn-default none-boder-white-back-btn" data-toggle="dropdown" aria-expanded="false" id="playlists-btn-dropdown-criteria">
					<span>모든 재생목록</span> <%-- <span class="caret"> </span>--%>
				</a>
				<%-- 
					나중에 플레이리스트 상위 카테고리가 생겼을 경우.
					<ul class="dropdown-menu" role="menu" id="playlists-dropdown-btn-list">
						<li><a class="playlists-btn-dropdown selected-playlist" id="playlists-whole">모든 재생목록</a></li>
						<li><a class="playlists-btn-dropdown" id="playlists-created">생성된 재생목록</a></li>
						
						<c:forEach items="${playlists }" var="playlist" varStatus="playlistVarStatus">				
							<li><a class="playlists-btn-dropdown" id="playlists-no-${playlist.no }"> ${playlist.title }</a></li>									
						</c:forEach>
					</ul>
				--%>
			</div>
			<div class="btn-group pull-right">
				<a type="button" class="btn btn-default dropdown-toggle none-boder-white-back-btn" data-toggle="dropdown" aria-expanded="false" id="playlists-criteria">
					<span class="glyphicon glyphicon-th-list"></span> 정렬 기준
				</a>
				<ul class="dropdown-menu" role="menu" id="playlists-criteria-botton-list">
					<li><a class="playlists-btn-dropdown selected-criteria" id="playlists-recent">최근 추가된 동영상 순</a></li>
					<li><a class="playlists-btn-dropdown" id="playlists-eldest">만든 날짜(오래된 순)</a></li>
					<li><a class="playlists-btn-dropdown" id="playlists-newest">만든 날짜(최신순)</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div id="subscriptions-playlist-table-div">
		<%@ include file="allPlaylists.jsp" %>
	</div>

</div>
<script>
$(function() {
	var location = 'playlists';
	var url = AppManager.div.subscriptions.playlist;
	var userNo = "${creatorNo}";
	
	function getNowCriteria() {	
		var nowPick = {
			//playlist: $('.selected-playlist').attr('id').replace('playlists-', ''),
			criteria: $('.selected-criteria').attr('id').replace('playlists-', '')
		}
		return nowPick;
	}
	
	function getFullUrl() {
		
		var nowPlaylistNo = null;
		//var nowPlaylist = getNowCriteria().playlist;
		var nowCriteria = getNowCriteria().criteria;
		//if (nowPlaylist.startsWith('no')) {
		//	nowPlaylistNo = nowPlaylist.replace('no-', '');
		//}
		
		if (nowPlaylistNo != null) {
			return url+"?playlistNo="+nowPlaylistNo+"&creatorNo="+userNo+"&criteria="+nowCriteria+"&location="+location;			
		}
		return url+"?creatorNo="+userNo+"&criteria="+nowCriteria+"&location="+location;
	}
	
	function removeClassAndAddClass($removeTargetName, removeClassName, $addTargetName, addClassName) {
		$removeTargetName.removeClass(removeClassName);
		$addTargetName.addClass(addClassName);
	}
	
	$('#playlists-dropdown-btn-list').on('click', '[id^="playlists-"]', function() {
		removeClassAndAddClass($('#playlists-dropdown-btn-list [id^=playlists]'), 'selected-playlist', $(this), 'selected-playlist');	
		AppManager.changeDiv('#subscriptions-playlist-table-div', getFullUrl());
	});

	$('#playlists-criteria-botton-list').on('click', '[id^="playlists-"]', function() {
		removeClassAndAddClass($('#playlists-criteria-botton-list [id^=playlists]'), 'selected-criteria', $(this), 'selected-criteria');
		AppManager.changeDiv('#subscriptions-playlist-table-div', getFullUrl());
	});

	
	//$('#subscriptions-playlist-table-div').on('click', '.playlist-id-spans', function() {
		// 나중에 플레이리스트의 상위 카테고리가 존재할 경우에 사용.
	//	AppManager.changeDiv('#subscriptions-playlist-table-div', url+queryString+queryLast);
	//});
});
</script>