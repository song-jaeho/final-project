<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	[id^=subscription-playlist-no] {
		cursor: pointer;
	}
</style>
<div>
	<table class="table">
		<tbody>
		<%--
			<c:forEach var="playlist" items="${playlists }" varStatus="homeVarStatus"> 
			나중에 플레이리스트의 상위카테고리가 나오면 이거 쓰도록 함	
		--%>
			<tr>
				<td>
					<%-- 
					나중에 플레이리스트의 상위카테고리가 나오면 이거 쓰도록 함
					<h4>
						<span class="playlist-buttons">
							<a type="button" class="btn btn-default none-boder-white-back-btn">
								<span class="playlist-id-spans" id="playlist-table-no-1">생성된 재생목록</span>
							</a>										
						</span>
					</h4>					
					 --%>
					<c:if test="${not empty playlists }">
					<div class="row">
						<c:forEach var="playlist" items="${playlists }" varStatus="playlistVarStatus">
						<c:if test="${not empty playlist.videos }">
							<div class="col-md-2" id="subscription-playlist-no-${playlistVarStatus.count }">
							<input type="hidden" value="${playlist.no }" id="playlists-hiddenbox-${playlistVarStatus.count }">
							<input type="hidden" value="${playlist.videos[0].video.no }" id="playlists-videoOne-hiddenbox-${playlistVarStatus.count }">
								<c:if test="${not empty playlist }">
									<div class="thumbnail subscription-view-thumbnails">
								    	<img alt="mainImage" 	    	
								    	<c:choose>
								    		<c:when test="${not empty playlist.img }" >
								    			src="${playlist.img }"
								    		</c:when>
								    		<c:when test="${empty playlist.img }" >
								    			src="${playlist.videos[0].video.previewA3Url }"
								    		</c:when>								    		
								    	</c:choose>
								    	class="playlist-thumbnails" style="position: relative;"/>
								    	

								    	<div style="background-color: black; position: absolute; top: 5px; left: 125px; opacity: 0.7; width: 100px; height: 120px;">
								    		<div style="position: absolute; top: 50px; left: 40px;">
									        	<p style="color: white;">${playlist.videoCount }</p>
									        	<span class="glyphicon glyphicon-menu-hamburger" style="color: white;"></span>								    		
								    		</div>
								        </div>
								        
								        <div id="playlist-allplay-div-${playlistVarStatus.count }" style="background-color: black; position: absolute; top: 4px; opacity: 0.7; width: 217px; height: 122px;">
								    		<div style="position: absolute; top: 50px; left: 70px;">								    			
									        	<p style="color: white;"><span class="glyphicon glyphicon-play" style="color: white;"></span> 모두 재생</p>							    		
								    		</div>
								        </div>
								    	
								    	<div class="caption">
									    	<div class="row">
												<div class="col-md-11 subscription-playlist-text-side">
													<p>
														<strong>
															<c:choose>
																<c:when test="${fn:length(playlist.title) ge 30 }">
																	<c:out value="${fn:substring(playlist.title,0,30) }"></c:out>
																	...
																</c:when>
																<c:otherwise>
																	<c:out value="${playlist.title }"></c:out>
																</c:otherwise>				
															</c:choose>
														</strong>
													</p>
													<div class="bottom-of-video-line">
														<p>
															업데이트 : ${playlist.formattedRecentUpdateDate }
														</p>
													</div>
												</div>
											</div>
								      	</div>
								    </div>						
								</c:if>
							</div>																		
						</c:if>
						</c:forEach>
					</div>
					</c:if>
					<c:if test="${empty playlists }">
						<div class="jumbotron" style="background-color: #f3f3f3">
						  <h2>플레이리스트가 없습니다.</h2>
						  <p>이런....</p>
						</div>
					</c:if>
					<%--
					<c:if test="${listLength > 1 }">
						<button type="button" class="btn subscription-none-border-and-white-back" id="subscription-showmore-button"><span class="glyphicon glyphicon-chevron-right"></span> 더보기</button>					
					</c:if>					
					 --%>
				</td>
			</tr>
	<%-- 
		</c:forEach>
			
	 --%>
		</tbody>
	</table>
</div>
<script>
$(function() {
	$('[id^=playlist-allplay-div]').hide();
	$('[id^=subscription-showmore-button]').css('outline', 'none').css('padding-left', '0px');
	
	function getNo($target, removeText) {
		return $target.attr('id').replace(removeText, '');
	};
	
	$('[id^=subscription-playlist-no]').hover(function() {
		$('#playlist-allplay-div-'+getNo($(this), 'subscription-playlist-no-')).show();
	},function() {
		$('#playlist-allplay-div-'+getNo($(this), 'subscription-playlist-no-')).hide();
	});
	
	$('[id^=subscription-playlist-no').click(function() {
		var no = $(this).attr('id').replace('subscription-playlist-no-', '');
		AppManager.changeMainDiv(AppManager.div.video.player+'?subListNo='+$('#playlists-hiddenbox-'+no).val()+"&videoNo="+$('#playlists-videoOne-hiddenbox-'+no).val());
	});
	
	
})
</script>
	