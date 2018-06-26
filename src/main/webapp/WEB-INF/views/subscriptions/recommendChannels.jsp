<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.recommend-channel-imgs {
		height: 35px;
		width: 35px;
		margin-right: 5px;
	}
	.divs-with-padding {
		cursor: pointer;
	}
	
	#recommend-channel-panel {
		box-shadow: none;
		border: none;
		background-color: #f3f3f3;
	}
	
</style>
<div class="panel panel-danger" id="recommend-channel-panel">
	<div class="panel-heading">추천 채널</div>
	<div class="panel-body">
	<c:if test="${not empty recommendChannels }">
	  	<c:forEach items="${recommendChannels }" var="channel" varStatus="recommendVarStatus">
	  		<div class="divs-with-padding">
				<div style="padding-bottom: 5px;">
					<img alt="recommend-profile" src="${channel.userImgUrl }" class="recommend-channel-imgs img-circle" />			
					<strong>
						<c:choose>
							<c:when test="${fn:length(channel.title) gt 8 }">
								<c:out value="${fn:substring(channel.title, 0, 8) }"></c:out>
								...
							</c:when>
							<c:otherwise>
								<c:out value="${channel.title }"></c:out>
							</c:otherwise>
						</c:choose>
					</strong>
					<input type="hidden" value="${channel.ownerNo }" id="recommendChannel-hiddenbox-${recommendVarStatus.count }">
				</div>
				<c:if test="${not empty loginUser }">
					<div class="text-center" id="recommendChannel-buttonarea-${recommendVarStatus.count }">
					<c:choose>
						<c:when test="${channel.ownerNo eq loginUser.no }">
						
						</c:when>
						<c:when test="${channel.subscribe eq 'true'}">
							<button class="btn btn-default btn-sm" id="recommend-cansle-btn-${recommendVarStatus.count }">구독중</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-danger btn-sm" id="recommend-subscribe-btn-${recommendVarStatus.count }">구독</button>
						</c:otherwise>
					</c:choose>
					</div>									
				</c:if>
			</div>
	  	</c:forEach>	
	</c:if>
	<c:if test="${empty recommendChannels }">
		<div class="divs-with-padding">
			<div class="text-center">
				추천 채널이 없습니다.
			</div>
		</div>
	</c:if>
	</div>
</div>
<script type="text/javascript">
$(function() {
	
	function getOwner(no) {
		return $('#recommendChannel-hiddenbox-'+no).val();
	}
	
	$('.divs-with-padding').on('click', 'img, strong', function() {
		var no = $(this).parents('.divs-with-padding').find('[id^=recommendChannel-hiddenbox]').val();
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
	});
	
	$('[id^=recommendChannel-buttonarea]').on('click', '[id^=recommend-]', function() {
		var $this = $(this); 	
		if ($(this).attr('id').includes('cansle')) {
			var no = $this.attr('id').replace('recommend-cansle-btn-', '');
			$.ajax({
				type: 'GET',
				url: AppManager.data.subscriptions.subscribe,
				data: {'ownerNo':getOwner(no)},
				dataType: 'json',
				success: function(result) {
					$this.remove();		
					$('#recommendChannel-buttonarea-'+no).append('<button class="btn btn-danger btn-sm" id="recommend-subscribe-btn-'+no+'">구독</button>');
					$('[id^=subscription-list-hiddenbox]').each(function(index, item) {
						if (result.user.no == $(item).val()) {
							$(item).parents('[id^=subscription-list-li]').remove();
						}
					});
				}
			})
		} else {
			var no = $this.attr('id').replace('recommend-subscribe-btn-', '');
			$.ajax({
				type: 'GET',
				url: AppManager.data.subscriptions.subscribe,
				data: {'ownerNo':getOwner(no)},
				dataType: 'json',
				success: function(result) {
					$this.remove();		
					$('#recommendChannel-buttonarea-'+no).append('<button class="btn btn-default btn-sm" id="recommend-cansle-btn-'+no+'">구독중</button>');
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
})
</script>