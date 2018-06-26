<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.channels-profile-images {
		width: 100px;
		height: 100px;
	}
	[id^=channels-name] {
		padding-top: 10px;
	}
	.recommend-channel-div {
		padding-top: 15px;
		height: 250px;
	}
	#channels-btn-dropdown-criteria {
		background-color: #f3f3f3;
	}
	[id^=channel-linkbox] {
		height: 170px;
	}
</style>
<div>
	<table class="table">
		<thead>
			<tr>
				<th>
					<div class="playlist-buttons">
						<div class="btn-group">
							<a type="button" class="btn btn-default none-boder-white-back-btn" data-toggle="dropdown" aria-expanded="false" id="channels-btn-dropdown-criteria">
								<span>추천 채널</span>
							</a>
						</div>
					</div>
				</th>
			</tr>
		</thead>
		<tbody>														
			<tr>	
				<c:if test="${not empty channels }">					
				<td class="channels-box">
					<div class="row">
						<c:forEach var="channel" items="${channels }" varStatus="channelVarStauts">
						<div class="col-md-2 recommend-channel-div">
							<div class="text-center">
								<div id="channel-linkbox-${channelVarStauts.count }">
									<input type="hidden" value="${channel.ownerNo }" id="channels-hiddenbox-${channelVarStauts.count }">
									<img alt="mainImage" src="${channel.userImgUrl }" class="img-circle channels-profile-images">										
									<div id="channels-name-${channelVarStauts.count }">
										<strong>
											<c:choose>
												<c:when test="${fn:length(channel.title) ge 30 }">
													<c:out value="${fn:substring(channel.title,0,30) }" />
													...
												</c:when>
												<c:otherwise>
													<c:out value="${channel.title }" />
												</c:otherwise>
											</c:choose>		
										</strong>
									</div>
									<div class="bottom-of-video-line">
										<p>
											구독자
											 <span id="channels-countbox-${channelVarStauts.count }">${channel.subscribeCount }</span>
											명
										</p>
									</div>
								</div>
								<div id="channels-buttonarea-${channelVarStauts.count }">
									<c:choose>
										<c:when test="${empty loginUser }">
											
										</c:when>
										<c:when test="${not empty loginUser and loginUser.no eq channel.ownerNo }">
										
										</c:when>
										<c:when test="${channel.subscribe eq 'true' }">
											<button type="button" class="btn btn-default" id="channels-subscribe-cansle-button-${channelVarStauts.count }">구독중</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-danger" id="channels-subscribe-button-${channelVarStauts.count }">구독</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</td>						
				</c:if>
				<c:if test="${empty channels }">
					<td>
						<div class="jumbotron" style="background-color: #f3f3f3">
						  <h2>추천 채널이 없습니다.</h2>
						  <p>요즘 볼만한 채널이 없어요.</p>						
						</div>
					</td>
				</c:if>
			</tr>
		</tbody>
	</table>
</div>
<script>
$(function() {
	
	$('[id^=channel-linkbox]').css('cursor', 'pointer');
	
	function getOwner(no) {
		return $('#channels-hiddenbox-'+no).val();
	}
	
	$('[id^=channel-linkbox]').click(function() {
		var owner = getOwner($(this).attr('id').replace('channel-linkbox-', ''));
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+owner);
	});
	
	$('[id^=channels-buttonarea-]').on('click', '[id^=channels-subscribe-]', function() {
		var $this = $(this); 	
		if ($(this).attr('id').includes('cansle')) {
			var no = $this.attr('id').replace('channels-subscribe-cansle-button-', '');
			$.ajax({
				type: 'GET',
				url: AppManager.data.subscriptions.subscribe,
				data: {'ownerNo':getOwner(no)},
				dataType: 'json',
				success: function(result) {
					$this.remove();		
					$('#channels-buttonarea-'+no).append('<button type="button" class="btn btn-danger" id="channels-subscribe-button-'+no+'">구독</button>');
					$('#channels-countbox-'+no).text(result.user.subscriptionCount);
					$('[id^=subscription-list-hiddenbox]').each(function(index, item) {
						if (result.user.no == $(item).val()) {
							$(item).parents('[id^=subscription-list-li]').remove();
						}
					});
				}
			})
		} else {
			var no = $this.attr('id').replace('channels-subscribe-button-', '');
			$.ajax({
				type: 'GET',
				url: AppManager.data.subscriptions.subscribe,
				data: {'ownerNo':getOwner(no)},
				dataType: 'json',
				success: function(result) {
					$this.remove();		
					$('#channels-buttonarea-'+no).append('<button type="button" class="btn btn-default" id="channels-subscribe-cansle-button-'+no+'">구독중</button>');
					$('#channels-countbox-'+no).text(result.user.subscriptionCount);
					var newindex = 1;
					$('[id^=subscription-list-hiddenbox]').each(function(index, item) {
						var listIndex = $(item).attr('id').replace('subscription-list-hiddenbox-', '');
						if (newindex < listIndex) {
							newindex = listIndex;
						}
					});
					newindex = parseInt(newindex) + 1;
					var thisUserSub = result.subscriptionList.filter(function(subscription) {
						if (subscription.ownerNo == result.user.no) {
							return true;
						} else {
							return false;
						}
					});
					var newHtml = AppManager.makeSubListHtml(newindex, thisUserSub[0].ownerNo, thisUserSub[0].userImgUrl, thisUserSub[0].title, thisUserSub[0].unsightVideoCount);
					$('#subscriptionlist-total-button').after(newHtml);
				}
			})
		}
	});
});
</script>