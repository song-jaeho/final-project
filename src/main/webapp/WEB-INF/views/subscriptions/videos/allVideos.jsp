<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	[id^=subscription-video-video-no] {
		cursor: pointer;
	}
</style>
<tbody id="subscription-video-videos-tbody">			
<tr>
	<td>	
		<input type="hidden" value="${initUpdateListSize }" id="sub-vieos-init-size-box">		
		<input type="hidden" value="${likeListSize }" id="sub-likeVideos-size-box">
		<input type="hidden" value="${updateListSize }" id="sub-updateVideos-size-box">
		<input type="hidden" value="${wholeListSize }" id="sub-wholeVideos-size-box">
		<input type="hidden" value="${loginUser.no }" id="sub-videos-loginUser-box">		
		<input type="hidden" value="${noMorePage }" id="sub-videos-noMorePage">		
		<div class="row" id="subscription-video-videos-tbody-div">
		<c:if test="${not empty subVideos }">
			<c:forEach var="videoSummary" items="${subVideos }" varStatus="homeSubVarStatus">
					<div class="col-md-2" id="subscription-video-video-no-${homeSubVarStatus.count }">
						<input type="hidden" value="${videoSummary.video.no }" id="playlist-video-video-hiddenbox-${homeSubVarStatus.count }" />
						<c:if test="${not empty videoSummary }">
						<div class="thumbnail subscription-view-thumbnails" style="position: relative;">
					    	<img alt="mainImage" src="${videoSummary.video.previewA3Url }" class="thumbnails">
					    	
					    	<a class="btn" style="background-color: black; position: absolute; top: 94px; left: 4px; opacity: 0.7;">
					        	<span style="color: white;">${videoSummary.formattedDuration }</span>
					        </a>
					    	
					    	<div class="caption">
						    	<div class="row">
									<div class="col-md-10 subscription-video-main-videos-text-side">
										<p>
											<strong>
												<c:choose>
													<c:when test="${fn:length(videoSummary.video.title) ge 30 }">
														<c:out value="${fn:substring(videoSummary.video.title,0,30) }"></c:out>
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
										<div class="col-md-2 subscription-video-main-videos-button-side">
											<div class="dropdown text-right">
												<button class="btn btn-default btn-block dropdown-toggle subscription-video-none-border-and-white-back" type="button" id="subscription-video-videos-plus-button-${homeSubVarStatus.count }" data-toggle="dropdown" aria-expanded="true">
													<span class="glyphicon glyphicon-option-vertical"></span>
											 	</button>
											  	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="allVideos-dropdown-${homeSubVarStatus.count }">
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
		</c:if>
		<c:if test="${empty subVideos }">
			<h3 style="padding-left: 25px">해당 조건에 대한 비디오가 없습니다.</h3>
		</c:if>
		</div>
	</td>
</tr>
</tbody>
<c:if test="${not empty loginUser }">
	<c:forEach items="${loginUserPlaylists }" var="loginUserPlaylist" varStatus="lpVarStatus">
		<input type="hidden" value="${loginUserPlaylist.title }" id="loginUserPlaylist-${lpVarStatus.index }" />
		<input type="hidden" value="${loginUserPlaylist.no }" id="loginUserPlaylistNo-${lpVarStatus.index }" />
	</c:forEach>
</c:if>
<script type="text/javascript">
$(function() {
	
	var initUpdateListSize = parseInt($('#sub-vieos-init-size-box').val());
	var likeListSize = $('#sub-likeVideos-size-box').val();
	var updateListSize = $('#sub-updateVideos-size-box').val();
	var wholeListSize = $('#sub-wholeVideos-size-box').val();
	var loginUserNo = $('#sub-videos-loginUser-box').val();

	if (updateListSize == '') {
		updateListSize = initUpdateListSize;
	}
	
	if (likeListSize == '') {
		likeListSize = 0;
	}
	
	if (wholeListSize == '') {
		wholeListSize = 0;
	}
	
	var lastIndex; 
	
	if (likeListSize == '' || updateListSize == '' || wholeListSize == '') {
		lastIndex = parseInt(initUpdateListSize) + 1;
	} else {
		lastIndex = (parseInt(likeListSize)+parseInt(updateListSize)+parseInt(wholeListSize))+1;
	}
	var islikeLastPage = false;
	var isUpdateLastPage = false;
	var isWholeLastPage = false;
	var noMorePage = $('#sub-videos-noMorePage').val();
	if (noMorePage == null || noMorePage == '') {
		noMorePage = false;
	}
	
	function makeVideosHtml(videoInfo) {
		var newIndex = lastIndex;
		lastIndex++;

		var html = 
			'<div class="col-md-2" id="subscription-video-video-no-'+newIndex+'">'+
				'<input type="hidden" value="'+videoInfo.video.no+'" id="playlist-video-video-hiddenbox-'+newIndex+'" />'+
				
				'<div class="thumbnail subscription-view-thumbnails" style="position: relative;">'+
			    	'<img alt="mainImage" src="'+videoInfo.video.previewA3Url+'" class="thumbnails">'+
			    	
			    	'<a class="btn" style="background-color: black; position: absolute; top: 94px; left: 4px; opacity: 0.7;">'+
			        	'<span style="color: white;">'+videoInfo.formattedDuration+'</span>'+
			        '</a>'+
			    	
			    	'<div class="caption">'+
				    	'<div class="row">'+
							'<div class="col-md-10 subscription-video-main-videos-text-side">'+
								'<p>'+
									'<strong>';
		if (videoInfo.video.title.length >= 30) {
			videoInfo.video.title = videoInfo.video.title.substring(0, 30);
			videoInfo.video.title += '...';
		}
		html += videoInfo.video.title+	
									'</strong>'+
								'</p>'+
								'<div class="bottom-of-video-line">'+
									'<p>'+
										'조회수 '+videoInfo.watchCount+'회 : '+ 
										'<span class="glyphicon glyphicon-time"></span> '+videoInfo.formattedDate+''+
									'</p>'+
								'</div>'+
							'</div>';
		
		if (loginUserNo != null) {
			html += '<div class="col-md-2 subscription-video-main-videos-button-side">'+
						'<div class="dropdown text-right">'+
							'<button class="btn btn-default btn-block dropdown-toggle subscription-video-none-border-and-white-back" type="button" id="subscription-video-videos-plus-button-'+newIndex+'" data-toggle="dropdown" aria-expanded="true">'+
								'<span class="glyphicon glyphicon-option-vertical"></span>'+
						 	'</button>'+
						  	'<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="allVideos-dropdown-'+newIndex+'">'+
						  		'<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-laters">나중에 볼 동영상에 추가</a></li>'+
								'<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-playlists">재생목록에 추가</a></li>'+
								'<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-reports">신고</a></li>'+
						  	'</ul>'+
						'</div>'+
					'</div>';
		};
		html +=			'</div>'+
			      	'</div>'+
			    '</div>'+
			'</div>';
		return html;
	}
	
	var $mainDiv = AppManager.getMainDiv();
	
	var playlist = '${playlist}';
	var criteria = '${criteria}';
	var creatorNo = '${creatorNo}';
	
	var ajaxWating = false;
	
	$('[id^=subscription-video-videos-plus-button]').css('background-color','#f3f3f3').css('outline', 'none').hide();
	$('[id^=subscription-video-video-no]').hover(function() {
		$(this).find('[id^=subscription-video-videos-plus-button]').show();
	},
	function() {
		$(this).find('[id^=subscription-video-videos-plus-button]').hide();
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
	
	function getNumber($target, removeText) {
		var first = $target.attr('id').replace(removeText, '');
		var second;
		if (first.includes('-')) {
			second = first.substr(first.lastIndexOf('-')+1);
			first = first.slice(0,first.lastIndexOf('-'));
		}
		var total = {
			front: first,
			back: second
		}
		return total;
	}
	
	$('#subscription-video-videos-tbody').on('click', '[id^=allVideos-dropdown-] a', function() {
		var $this = $(this);
		
		var criteria = $(this).attr('class').replace('drowdown-', '');
		if (criteria == 'laters') {
			var videoNo = $this.parents('[id^=subscription-video-video-no-]').find('[id^=playlist-video-video-hiddenbox-]').val();
			console.log(videoNo);
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
			
			var videoNo = $this.parents('[id^=subscription-video-video-no-]').find('[id^=playlist-video-video-hiddenbox-]').val();
			$('#pjs-video-no').val(videoNo);
			$('#playlist-modal').modal("show");
			
		} else if (criteria == 'reports') {
			AppManager.showConfirm('신고', reportHtml, function() {
			var videoNo = $this.parents('[id^=subscription-video-video-no-]').find('[id^=playlist-video-video-hiddenbox-]').val();
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

	$('#subscription-video-videos-tbody').on('click', '.thumbnails, .subscription-video-main-videos-text-side', function() {
		var videoNo = $(this).parents('[id^=subscription-video-video-no]').find('[id^=playlist-video-video-hiddenbox]').val();
		AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+videoNo);
	});
	
	$mainDiv.scroll(function(event) {

		event.preventDefault();
		if (ajaxWating || noMorePage == 'true' || noMorePage == true) {
			return false;
		}
	
		var minlikeVideoSize = 1;
		var maxlikeVideoSize = 30;
		var minUpdateVideoSize = 1;
		var maxUpdateVideoSize = 30;
		var minWholeVideoSize = 1;
		var maxWholeVideoSize = 30;
		
		var tbodyHeight = $('#subscription-video-videos-tbody').height();
		var scrollPosition = $mainDiv.scrollTop() + $mainDiv.height();
		var loadPoint = tbodyHeight - 100;
		
		if (updateListSize == null || updateListSize == '') {
			minUpdateVideoSize = parseInt(initUpdateListSize)+1;
			maxUpdateVideoSize = parseInt(minUpdateVideoSize) + 30;
		} 
		
		if (likeListSize != null || likeListSize != '') {
			minlikeVideoSize = parseInt(likeListSize)+1;
			maxlikeVideoSize = parseInt(minlikeVideoSize) + 30;
		}
		
		if (wholeListSize != null || wholeListSize != '') {
			minWholeVideoSize = parseInt(wholeListSize)+1;
			maxWholeVideoSize = parseInt(minWholeVideoSize) + 30;
		} 
	
		if (scrollPosition >= loadPoint) {		
					
			ajaxWating = true;
			
			$.ajax({
				type:'POST',
				url:'/subscriptions/addPagingVideo.do',
				data: {'wholeMin':parseInt(minWholeVideoSize),'wholeMax':parseInt(maxWholeVideoSize), 'updateMin':parseInt(minUpdateVideoSize) ,'updateMax':parseInt(maxUpdateVideoSize),'likeMin':parseInt(minlikeVideoSize), 'likeMax':parseInt(maxlikeVideoSize), 'playlist':playlist, 'criteria':criteria, 'creatorNo':parseInt(creatorNo), 'gap':parseInt(30)},
				dataType: 'json',
				success: function(result) {
				
					noMorePage = result.noMorePage;
					console.log('result noMorePage:'+result.noMorePage);
					
					$.each(result.likeList, function(index, video){
						likeListSize ++;
						$('#subscription-video-videos-tbody-div').append($(makeVideosHtml(video)));
					});
					
					$.each(result.updateList, function(index, video){
						updateListSize ++;
						$('#subscription-video-videos-tbody-div').append($(makeVideosHtml(video)));
					});
					
					$.each(result.wholeList, function(index, video){
						wholeListSize ++;
						$('#subscription-video-videos-tbody-div').append($(makeVideosHtml(video)));
					});
					
					
					$('[id^=subscription-video-videos-plus-button]').css('background-color','#f3f3f3').css('outline', 'none').hide();
					$('[id^=subscription-video-video-no]').hover(function() {
						$(this).find('[id^=subscription-video-videos-plus-button]').show();
					},
					function() {
						$(this).find('[id^=subscription-video-videos-plus-button]').hide();
					});
					
				},
				complete: function() {
					ajaxWating = false;
				}
			});
		}
	})
})
</script>