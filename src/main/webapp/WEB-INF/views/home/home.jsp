<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

	#home-contents {
		padding-left: 100px;
		width: 100%;
	}

	#home-contents .video-detail {
		min-height: 240px;
	}

	#home-contents .video-duration {
		background-color: rgb(50,50,50);
		color: rgb(200,200,200);
		position: absolute;
		bottom: 0;
		right: 0;
		z-index: 1;
	}

	#home-contents .home-videos-text-side {
		padding-right: 0px;
		margin: 0px;
	}
	
	#home-contents .home-videos-button-side {
		padding-left: 0px;
		margin: 0px;
	}
	
	#home-contents .home-none-border-and-white-back {
		border: none;
		background-color: white;
	}
	
	#home-contents .home-video-category-names {
		font-weight: 600;
		font-size: large;
		cursor: pointer;
	}
	
	#home-contents .thumbnails {
		width: 100%;
	}

	#home-contents .thumbnails:hover {
		cursor: pointer;
	}

	#home-contents .bottom-of-video-line {
		margin-bottom: 20px;
		color: #707070;
		font-size: small;
	}
	
	#home-contents .video-info {
		min-height: 42px;
		max-height: 42px;
	}
	
	#home-contents .creator-nick {
		min-height: 21px;
		max-height: 21px;
	}
	
	#home-contents .creator-nick {
		width: 90%;
	}
	
	#home-contents #default-video-table strong {
		font-size: small;
	}
	
	#home-contents .dropdown {
		margin: 0px;
		padding: 0px;
	}
	
	#home-contents .dropdown-toggle:hover {
		cursor: pointer;
	}
	
</style>
<div id="home-contents" class="row">
	<div class="col-lg-12">
		<c:if test="${not empty recentRelation }">
			<c:if test="${not empty recentRelation.videos }">
				<div class="row">
					<table id="recent-video-table" class="table">
						<tr>
							<td>
								<h4>
									<span class="home-video-category-names">${recentRelation.categoryName }</span>
								</h4>
								<c:forEach var="video" items="${recentRelation.videos }">
									<div class="col-lg-2 video-detail">
										<label class="video-no hidden">${video.no }</label>
										<div style="position: relative;">
											<span class="video-duration"> ${video.durationStr } </span>
											<img alt="mainImage" src="${video.previewA2Url }" class="thumbnails">
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="row video-info">
													<div class="col-lg-10">
														<strong>${video.middleSizeTitle }</strong>
													</div>
													<div class="col-lg-1">
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
												<div class="row creator-nick">
													<div class="col-lg-12">
														<label>${video.userNick }</label>
													</div>
												</div>
											</div>
										</div>
										<div class="bottom-of-video-line row">
											<div class="col-lg-12">
												<span class="glyphicon glyphicon-eye-open"> ${video.watchCount }회 
													<c:choose>
														<c:when test="${not empty video.updateDateStr }">
															<span> - ${video.updateDateStr }(수정됨)</span>
														</c:when>
														<c:otherwise>
															<span> - ${video.createDateStr }(생성됨)</span>
														</c:otherwise>
													</c:choose>
												</span>
											</div>
										</div>						
									</div>	
								</c:forEach>
							</td>
						</tr>
					</table>
				</div>
			</c:if>
		</c:if>
		<div class="row">
			<table id="default-video-table" class="table">
				<c:forEach var="item" items="${result }" > 
					<tr>
						<td>
							<h4>
								<span class="home-video-category-names">${item.category.name }</span>
							</h4>
							<div class="row">
								<c:forEach var="video" items="${item.videos }">
									<div class="col-lg-2 video-detail">
										<label class="video-no hidden">${video.no }</label>
										<div style="position: relative;">
											<span class="video-duration"> ${video.durationStr } </span>
											<img alt="mainImage" src="${video.previewA2Url }" class="thumbnails">
										</div>
										<div class="row">
											<div class="col-lg-12">
												<div class="row video-info">
													<div class="col-lg-10">
														<strong>${video.middleSizeTitle }</strong>
													</div>
													<div class="col-lg-1">
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
												<div class="row creator-nick">
													<div class="col-lg-12">
														<label>${video.userNick }</label>
													</div>
												</div>
											</div>
										</div>
										<div class="bottom-of-video-line row">
											<div class="col-lg-12">
												<span class="glyphicon glyphicon-eye-open"> ${video.watchCount }회 
													<c:choose>
														<c:when test="${not empty video.updateDateStr }">
															<span> - ${video.updateDateStr }(수정됨)</span>
														</c:when>
														<c:otherwise>
															<span> - ${video.createDateStr }(생성됨)</span>
														</c:otherwise>
													</c:choose>
												</span>
											</div>
										</div>						
									</div>															
								</c:forEach>
							</div>
						</td>
					</tr>		
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<script>
$(function() {

	var fadeSpeed = 150;
	
	var $mainDiv = AppManager.getMainDiv();
	
	var $homeContents = $('#home-contents');

	$('#home-contents .thumbnails').on('click', function(){
		var videoNo = $(this).parents('div.video-detail:eq(0)').find('.video-no').text();
		AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo=" + videoNo);
	});
	
	$('#home-contents .video-detail').hover(function(){
		$(this).find('.dropdown').fadeIn(fadeSpeed);
	},function(){
		$(this).find('.dropdown').fadeOut(fadeSpeed);
	});
	
})
</script>