<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.search-video-thumbnails {
		width: 250px;
	}
	.search-video-lines {
		width: 80%;
	}
	[id^=search-video-line-no] {
		cursor: pointer;
	}
	[id^=search-video-no-] {
		width: 25%;
	}
	[id^=search-video-title-] {
		color: black;
		font-weight: 500;
		font-size: 20px;
	}
	.search-video-namespace {
		padding-right: 10px;
		font-size: 15px;		
	}
	.search-video-metadata-line {
		color: gray;
	}
	
	[id^=subscription-search-videos-plus-button] {
		background-color: #f3f3f3;
	}
</style>
<div id="only-use-to-changediv">
	<div class="row search-video-lines">
		<table class="table">
			<tbody>
			<c:if test="${not empty searchVideos }">
				<c:forEach var="searchVideo" items="${searchVideos }" varStatus="searchVarStatus">
					<tr id="search-video-line-no-${searchVarStatus.count }">
						<th id="search-video-no-${searchVarStatus.count }" style="position: relative;">
							<img alt="video-thumbnail" class="search-video-thumbnails" 
							src="${searchVideo.video.previewA3Url }" id="search-video-thumbnail-${searchVarStatus.count }">
							<input type="hidden" value="${searchVideo.video.no }" id="search-hiddenbox-${searchVarStatus.count }">
							
							<a class="btn" style="background-color: black; position: absolute; top: 114px; left: 8px; opacity: 0.7;">
					        	<span style="color: white;">${searchVideo.formattedDuration }</span>
					        </a>
						</th>
						<td>
							<div class="row">
								<div class="col-md-10">
									<p id="search-video-title-${searchVarStatus.count }"><c:out value="${searchVideo.video.title }" /></p>											
								</div>
								<div class="col-md-2">
									<c:if test="${not empty loginUser }">
										<div class="dropdown text-right">
											<button class="btn btn-default btn-block dropdown-toggle subscription-none-border-and-white-back" type="button" id="subscription-search-videos-plus-button-${searchVarStatus.count }" data-toggle="dropdown" aria-expanded="true">
												<span class="glyphicon glyphicon-option-vertical"></span>
										 	</button>
										  	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="search-dropdown-${searchVarStatus.count }">
										  		<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-laters">나중에 볼 동영상에 추가</a></li>
												<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-playlists">재생목록에 추가</a></li>
												<li role="presentation"><a role="menuitem" tabindex="-1" class="drowdown-reports">신고</a></li>
										  	</ul>
										</div>									
									</c:if>
								</div>
							</div>
							<div class="search-video-metadata-line">
								<p>
									조회수 
											${searchVideo.watchCount }												
									회 : 
									<span class="glyphicon glyphicon-time"></span> 
									${searchVideo.formattedDate }
								</p>
								<p>
									<c:choose>
										<c:when test="${fn:length(searchVideo.video.detail) gt 250 }">
											<c:out value="${fn:substring(searchVideo.video.detail, 0, 250) }"></c:out>
											...
										</c:when>
										<c:otherwise>
											<c:out value="${searchVideo.video.detail }"></c:out>
										</c:otherwise>
									</c:choose>		
								</p>
							</div>
						</td>
					</tr>
				</c:forEach>		
			</c:if>
			<c:if test="${empty searchVideos }">
				<tr>
					<td>
						<div class="jumbotron" style="background-color: #f3f3f3">
						  <h3>검색 결과가 없습니다.</h3>
						  <p>이거 꼭 보고싶었는데... 그렇죠?</p>
						</div>
					</td>
				</tr>
			</c:if>
			</tbody>
		</table>
	</div>
</div>
<script>
$(function() {
	
	$('[id^=subscription-search-videos-plus-button]').css('background-color', '#f3f3f3').css('outline', 'none').hide();
	$('[id^=search-video-line-no]').hover(function() {
		$(this).find('[id^=subscription-search-videos-plus-button]').show();
	},
	function() {
		$(this).find('[id^=subscription-search-videos-plus-button]').hide();
	});
	
	var reportHtml = '<form action="" class="formName">' +
					    '<div class="form-group">' +
					    '<label>어떤 점이 마음에 안 드셨나요?</label>' +
					    '<input type="text" placeholder="신고 사유" class="name form-control" required />' +
					    '</div>' +
					    '</form>';
	
	var location = 'search';
	$('.search-video-namespace').hover(function() {
		$(this).css('color', 'black').css('font-weight', 'bolder');
	},
	function() {
		$(this).css('color', 'gray').css('font-weight', '');
	});
	
	function removeClassAndAddClass($removeTargetName, removeClassName, $addTargetName, addClassName) {
		$removeTargetName.removeClass(removeClassName);
		$addTargetName.addClass(addClassName);
	};
	
	function getNumber($target, removeText) {
		return $target.attr('id').replace(removeText, '');
	}
	
	$('.search-video-namespace').click(function() {
		removeClassAndAddClass($('#criteria-button-group button'), 'sub-main-active-button', $('#category-home').parent('button'), 'sub-main-active-button');
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+$('#owner-no-box').val());
	});
	
	$('[id^=search-dropdown]').on('click', 'a', function() {
		var no = getNumber($(this).parents('[id^=search-dropdown]'), 'search-dropdown-');
		var $this = $(this);
		
		var criteria = $(this).attr('class').replace('drowdown-', '');
		if (criteria == 'laters') {
			var videoNo = $this.parents('[id^=search-video-line-no-]').find('[id^=search-hiddenbox]').val();
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
			
			var videoNo = $this.parents('[id^=search-video-line-no]').find('[id^=search-hiddenbox]').val();
			$('#pjs-video-no').val(videoNo);
			$('#playlist-modal').modal("show");
			
		} else if (criteria == 'reports') {
			AppManager.showConfirm('신고', reportHtml, function() {
			var videoNo = $this.parents('[id^=search-video-line-no-]').find('[id^=search-hiddenbox]').val();
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
	
	$('[id^=search-video-line-no ]').on('click', '[id^=search-video-no], .search-video-metadata-line', function(event) {
		event.preventDefault();
		var videoNo = $(this).parents('[id^=search-video-line-no]').find('[id^=search-hiddenbox]').val();
		AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+videoNo);
	});
})
</script>
