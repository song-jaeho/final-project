<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	[id^=subscription-video-no] {
		cursor: pointer;
	}
	
	.subscription-video-pager {
		margin: 0px;
		margin-top: 5px;
	}
	
	.subscription-video-pager a {
		color: black;
	}
	
	.playlist-buttons [id^=subscription-] {
		background-color: #f3f3f3;
	}
</style>
<div class="col-md-10">
	<div>
		<table class="table">
			<tbody>
			<c:if test="${not empty subVideos }">
				<tr>
					<td>	
						<h4>
							<span class="playlist-buttons">
								<a class="btn btn-default playlist-name-atag" id="subscription-playlist-name-0">업로드한 동영상</a>									
								<a class="btn btn-default play-all-atag" id="subscription-playall-0">모두 재생</a>
								<input type="hidden" id="playlist-hiddenbox-${0 }" value="${0 }">			
							</span>
						</h4>				
						<div class="row">							
							<c:forEach var="videoSummary" items="${subVideos }" varStatus="firstVarStatus">
								<div class="col-md-3" id="subscription-video-no-0-${firstVarStatus.count }">
								<input type="hidden" value="${videoSummary.video.no }" id="playlist-video-hiddenbox-0-${firstVarStatus.count }" />
									<c:if test="${not empty videoSummary }">
										<div class="thumbnail subscription-view-thumbnails" style="position: relative;">
									    	<img alt="mainImage" src="${videoSummary.video.previewA3Url }" class="subscription-main-thumbnails">
									    	
									        <a class="btn" style="background-color: black; position: absolute; top: 110px; left: 10px; opacity: 0.7;">
									        	<span style="color: white;">${videoSummary.formattedDuration }</span>
									        </a>
							    	
									    	<div class="caption">
										    	<div class="row">
													<div class="col-md-10 subscription-main-videos-text-side">
														<p>
															<strong>
																<c:choose>
																	<c:when test="${fn:length(videoSummary.video.title) ge 35 }">
																		<c:out value="${fn:substring(videoSummary.video.title, 0, 35) }"></c:out>
																		...	
																	</c:when>
																	<c:otherwise>
																		<c:out value="${videoSummary.video.title }"></c:out>
																	</c:otherwise>
																</c:choose>			
															</strong>
														</p>
														<div class="bottom-of-video-line">
															<p>
																조회수 ${videoSummary.watchCount }회 : 
																<span class="glyphicon glyphicon-time"></span> ${videoSummary.formattedDate }
															</p>
														</div>
													</div>
													<c:if test="${not empty loginUser }">
														<div class="col-md-2 subscription-main-videos-button-side">
															<div class="dropdown text-right">
																<button class="btn btn-default btn-block dropdown-toggle subscription-none-border-and-white-back" type="button" id="subscription-videos-plus-button-0" data-toggle="dropdown" aria-expanded="true">
																	<span class="glyphicon glyphicon-option-vertical"></span>
															 	</button>
															  	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="video-dropdown-main-${homeVarStatus.count }">
															  		<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-laters">나중에 볼 동영상에 추가</a></li>
															  		<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-playlists">재생목록에 추가</a></li>
															  		<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-reports">신고</a></li>
															  	</ul>
															</div>
														</div>													
													</c:if>
												</div>
									      	</div>
									    </div>						
									</c:if>
								</div>															
							</c:forEach>
						</div>
						<nav>
						  <ul class="pager subscription-video-pager" id="subscription-video-pager-${0 }">
							<li>
								<input type="hidden" value="1" id="sv-previous-hiddenbox-${0 }">
								<a href="#" id="sv-previous-pager-${0 }" style="border-color: black;"><span class="glyphicon glyphicon-chevron-left"></span> Previous</a>
							</li>
							<c:if test="${fn:length(subVideos) ge 5 }">
								<li>
									<input type="hidden" value="5" id="sv-next-hiddenbox-${0 }">
									<a href="#" id="sv-next-pager-${0 }" style="border-color: black;">Next <span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>						  								
							</c:if>			  	
						  </ul>
						</nav>
					</td>
				</tr>
			</c:if>
			<c:forEach var="playlist" items="${playlists }" varStatus="homeVarStatus"> 
			<c:if test="${not empty playlist and not empty playlist.videos}">		
				<tr>
					<td>
						<h4>
							<span class="playlist-buttons">
								<a class="btn btn-default playlist-name-atag" id="subscription-playlist-name-${homeVarStatus.count }">${playlist.title }</a>									
								<a class="btn btn-default play-all-atag" id="subscription-playall-${homeVarStatus.count }">모두 재생</a>
								<input type="hidden" id="playlist-hiddenbox-${homeVarStatus.count }" value="${playlist.no }" />																			
							</span>
						</h4>
						<div class="row">
							<c:forEach var="videos" items="${playlist.videos }" varStatus="homeSubVarStatus">		
								<div class="col-md-3" id="subscription-video-no-${homeVarStatus.count }-${homeSubVarStatus.count }">
								<input type="hidden" value="${videos.video.no }" id="playlist-video-hiddenbox-${homeVarStatus.count }-${homeSubVarStatus.count }" />
									<c:if test="${not empty videos }">
										<div class="thumbnail subscription-view-thumbnails" style="position: relative;">
									    	<img alt="mainImage" src="${videos.video.previewA3Url }" class="subscription-main-thumbnails">
									    	
									        <a class="btn" style="background-color: black; position: absolute; top: 110px; left: 10px; opacity: 0.7;">
									        	<span style="color: white;">${videos.formattedDuration }</span>
									        </a>
									    						    	
									    	<div class="caption">
										    	<div class="row">
													<div class="col-md-10 subscription-main-videos-text-side">
														<p>
															<strong>
																<c:choose>
																	<c:when test="${fn:length(videos.video.title) ge 35 }">
																		<c:out value="${fn:substring(videos.video.title, 0, 35) }"></c:out>
																		...
																	</c:when>
																	<c:otherwise>
																		<c:out value="${videos.video.title }"></c:out>
																	</c:otherwise>
																</c:choose>
															</strong>
														</p>
														<div class="bottom-of-video-line">
															<p>
																조회수 ${videos.watchCount }회 : 
																<span class="glyphicon glyphicon-time"></span> ${videos.formattedDate }
															</p>
														</div>
													</div>
													<div class="col-md-2 subscription-main-videos-button-side">
														<c:if test="${not empty loginUser }">
															<div class="dropdown text-right">
																<button class="btn btn-default btn-block dropdown-toggle subscription-none-border-and-white-back" type="button" id="subscription-videos-plus-button-${homeSubVarStatus.count }" data-toggle="dropdown" aria-expanded="true">
																	<span class="glyphicon glyphicon-option-vertical"></span>
															 	</button>
															  	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="video-dropdown-${homeVarStatus.count }-${homeSubVarStatus.count }">
															  		<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-laters">나중에 볼 동영상에 추가</a></li>
															  		<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-playlists">재생목록에 추가</a></li>
															  		<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-reports">신고</a></li>
															  	</ul>
															</div>														
														</c:if>
													</div>
												</div>
									      	</div>
									    </div>						
									</c:if>
								</div>															
							</c:forEach>
						</div>
						<nav>
						  <ul class="pager subscription-video-pager" id="subscription-video-pager-${homeVarStatus.count }">
							<li>
								<input type="hidden" value="1" id="sv-previous-hiddenbox-${homeVarStatus.count }">
								<a href="#" id="sv-previous-pager-${homeVarStatus.count }" style="border-color: black;"><span class="glyphicon glyphicon-chevron-left"></span> Previous</a>
							</li>
							<c:if test="${fn:length(playlist.videos) ge 5 }">
								<li>
									<input type="hidden" value="5" id="sv-next-hiddenbox-${homeVarStatus.count }">
									<a href="#" id="sv-next-pager-${homeVarStatus.count }" style="border-color: black;">Next <span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>						  								
							</c:if>		  	
						  </ul>
						</nav>
					</td>
				</tr>
			</c:if>		
			</c:forEach>
			<c:if test="${empty subVideos and empty playlists}">
				<tr>
					<td>
						<div class="jumbotron" style="background-color: #f3f3f3">
						  <h1>아무런 비디오도 없습니다!</h1>
						  <p>이 사용자는 DuckTube를 적극적으로 이용해주지 않는군요..</p>
						</div>
					</td>
				</tr>	
			</c:if>
			</tbody>
		</table>
	</div>
</div>

<div class="col-md-2">
	<%@ include file="recommendChannels.jsp" %>		
</div>
<c:if test="${not empty loginUser }">
	<c:forEach items="${loginUserPlaylists }" var="loginUserPlaylist" varStatus="lpVarStatus">
		<input type="hidden" value="${loginUserPlaylist.title }" id="loginUserPlaylist-${lpVarStatus.index }" />
		<input type="hidden" value="${loginUserPlaylist.no }" id="loginUserPlaylistNo-${lpVarStatus.index }" />
	</c:forEach>
</c:if>
<script>
$(function() {	
	
	function pagingManager($this, pagingCriteria) {
		
		if (pagingCriteria == 'plus') {
			$this.parents('tr').find('[id^=sv-previous-hiddenbox]').val(parseInt($this.parents('tr').find('[id^=sv-previous-hiddenbox]').val())+4);
			$this.parents('tr').find('[id^=sv-next-hiddenbox]').val(parseInt($this.parents('tr').find('[id^=sv-next-hiddenbox]').val())+4);
			return;
		}
		if (pagingCriteria == 'minus') {
			$this.parents('tr').find('[id^=sv-previous-hiddenbox]').val(parseInt($this.parents('tr').find('[id^=sv-previous-hiddenbox]').val())-4);
			$this.parents('tr').find('[id^=sv-next-hiddenbox]').val(parseInt($this.parents('tr').find('[id^=sv-next-hiddenbox]').val())-4);
			return;
		}
		
		var result = {
			min : $this.parents('tr').find('[id^=sv-previous-hiddenbox]').val(),
			max : $this.parents('tr').find('[id^=sv-next-hiddenbox]').val()
		}
		return result;
	}
	
	function videoCounter($this) {
		var count = 1;
		$this.parents('tr').find('[id^=subscription-video-no-]').each(function(index, item) {
			count = getNumber($(item), 'subscription-video-no-').back;
		});
		return count;
	}
	
	$('[id^=sv-previous-pager-]').hide();
	$('[id^=subscription-video-no]').filter(function(index, item) {

		var min = pagingManager($(item), 'none').min;
		var max = pagingManager($(item), 'none').max;
		
		var videoCount = getNumber($(item), 'subscription-video-no-').back;
		if (videoCount >= max) {
			$(item).hide();
		}
	});
	
	$('[id^=sv-next-pager]').click(function(event) {
		event.preventDefault();
	
		pagingManager($(this), 'plus');
		var $this = $(this);
		var min = pagingManager($(this), 'none').min;
		var max = pagingManager($(this), 'none').max;
		var videoMaxCount = videoCounter($(this));
		
		$(this).parents('tr').find('[id^=subscription-video-no]').filter(function(index, item) {
			var videoCount = getNumber($(item), 'subscription-video-no-').back;
			$(item).hide();

			if (videoCount >= min && videoCount < max) {
				$(item).show();
				if (min > 1) {
					$this.parents('ul').find('[id^=sv-previous-pager]').show();	
				}
				if (max > videoMaxCount) {
					$this.hide();
				}
			}
		});
	});
	
	$('[id^=sv-previous-pager]').click(function(event) {
		event.preventDefault();
	
		pagingManager($(this), 'minus');
		var $this = $(this);
		var min = pagingManager($(this), 'none').min;
		var max = pagingManager($(this), 'none').max;
		var videoMaxCount = videoCounter($(this));
		
		$(this).parents('tr').find('[id^=subscription-video-no]').filter(function(index, item) {
			var videoCount = getNumber($(item), 'subscription-video-no-').back;
			$(item).hide();

			if (videoCount >= min && videoCount < max) {
				$(item).show();
				if (min < 2) {
					$this.hide();	
				}
				if (max <= videoMaxCount) {
					$this.parents('ul').find('[id^=sv-next-pager]').show();	
				}
			}
		});
	});
	
	function makePlaylistHtml() {
		var lists = [];	
		$('[id^=loginUserPlaylist-]').each(function(index) {
			lists[index] = $(this).val();
		});		
		var playListHtml = '<form action="" class="formName">' +
						    '<div class="form-group">';						  			    
		if (lists.length < 1) {
			playListHtml += '<p>플레이리스트가 없습니다.</p>';		
		} else {
			playListHtml += '<select class="form-control">';
			for(var i=0; i<lists.length; i++) {
				playListHtml += '<option id="loginPlaylist-'+i+'">'+lists[i]+'</option>';
			}
			playListHtml += '</select>';
		}					  			    		
		playListHtml += '</div>'+
						'</form>';						
		return playListHtml;
	}
	
	var reportHtml = '<form action="" class="formName">' +
					    '<div class="form-group">' +
					    '<label>어떤 점이 마음에 안 드셨나요?</label>' +
					    '<input type="text" placeholder="신고 사유" class="name form-control" required />' +
					    '</div>' +
					    '</form>';
					    
	$('[id^=subscription-videos-plus-button]').css('background-color', '#f3f3f3').css('outline', 'none').hide();
	$('[id^=subscription-video-no]').hover(function() {
		$(this).find('[id^=subscription-videos-plus-button]').show();
	},
	function() {
		$(this).find('[id^=subscription-videos-plus-button]').hide();
	});
	
	function getNumber($target, removeText) {
		var first = $target.attr('id').replace(removeText, '');
		var second = 1;
		if (first.includes('-')) {
			second = first.substr(first.lastIndexOf('-')+1);
			first = first.slice(0,first.lastIndexOf('-'));
		}
		var total = {
			front: parseInt(first),
			back: parseInt(second)
		}
		return total;
	}
	
	$('[id^=video-dropdown-]').on('click', 'a', function() {
		var first;
		var second;
		if ($(this).parents('[id^=video-dropdown]').attr('id').includes('main')) {
			first = getNumber($(this).parents('[id^=video-dropdown-main]'), 'video-dropdown-main-').front;
		} else {
			first = getNumber($(this).parents('[id^=video-dropdown]'), 'video-dropdown-').front;
			second = getNumber($(this).parents('[id^=video-dropdown]'), 'video-dropdown-').back;
		}
		var $this = $(this);
		
		var criteria = $(this).attr('class').replace('drowdown-', '');
		if (criteria == 'laters') {
			var videoNo = $this.parents('[id^=subscription-video-no-]').find('[id^=playlist-video-hiddenbox]').val();
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.addPlaylist,
				data: {'criteria':'watchLater','videoNo':videoNo},
				dataType: 'text',
				success: function(result) {
					if (result == 'success') {
						AppManager.showAlert('등록 완료', '해당 비디오를 나중에 볼 동영상에 등록했습니다.');
					} else if (result == 'already') {
						AppManager.showAlert('등록 실패', '이미 나중에 볼 동영상에 등록되어 있습니다.');
					}
				}
			})
	
		} else if (criteria == 'playlists') {
			
			var videoNo = $this.parents('[id^=subscription-video-no-]').find('[id^=playlist-video-hiddenbox]').val();
			$('#pjs-video-no').val(videoNo);
			$('#playlist-modal').modal("show");
			
			/*
			AppManager.showConfirm('플레이리스트에 추가', makePlaylistHtml(), function() {
				var no = this.$content.find('[id^=loginPlaylist]:selected').attr('id').replace('loginPlaylist-', '');
				var playlistNo = $('#loginUserPlaylistNo-'+no).val();
				var playlistName = this.$content.find('[id^=loginPlaylist]:selected').text();
				var videoNo = $this.parents('[id^=subscription-video-no-]').find('[id^=playlist-video-hiddenbox]').val();

				$.ajax({
					type: 'POST',
					url: AppManager.data.subscriptions.addPlaylist,
					data: {'criteria':'myPlaylist','playlistNo':playlistNo, 'videoNo':videoNo},
					dataType: 'text',
					success: function(result) {
						if (result == 'success') {
							AppManager.showAlert('등록 완료', '해당 비디오를 '+playlistName+'플레이리스트에 등록했습니다.');
						} else if (result == 'already') {
							AppManager.showAlert('등록 실패', '이미 해당 플레이리스트에 존재하는 비디오입니다.');
						}
					}
				})
			}, function() {})
			*/
			
		} else if (criteria == 'reports') {
			AppManager.showConfirm('신고', reportHtml, function() {
			var videoNo = $this.parents('[id^=subscription-video-no-]').find('[id^=playlist-video-hiddenbox]').val();
			var reportContents = this.$content.find('.name').val();
				$.ajax({
					type: 'POST',
					url: AppManager.data.subscriptions.report,
					data: {'criteria':'video','targetNo':videoNo, 'reportContents':reportContents},
					dataType: 'text',
					success: function(result) {
						if (result == 'v') {
							AppManager.showAlert('신고완료', '해당 비디오에 대한 신고가 접수되었습니다.');
						} else {
							AppManager.showAlert('오류발생', '신고 처리 실패..');
						}
					},
					error: function() {
						AppManager.showAlert('오류발생', '신고 처리 실패..');
					}
				})
			},function() {})
		}
	});
	
	$('[id^=subscription-video-no]').on('click', '.subscription-main-thumbnails, .subscription-main-videos-text-side', function() {
		var videoNo = $(this).parents('[id^=subscription-video-no]').find('[id^=playlist-video-hiddenbox]').val();
		AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+videoNo);
	});

});
</script>