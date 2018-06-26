<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.subscribe-subscrice-profile {
		width: 160px;
		height: 160px;
	}
	
	.subscribe-info-container {
		width: 90%;
	}

	.subscribe-namespace {
		font-weight: 500;
		font-size: x-large;
	}
	
	.subscribe-metadata-line {
		color: #707070;
	}
	
	.none-border-buttons{
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 0px;
		background-color: #f3f3f3;
	}

</style>
<div class="subscribe-info-container">
	<div style="margin-bottom: 80px;"></div>

	<table>
		<tbody>
			<c:if test="${empty subscribeList }">
				<tr>
					<td>
						<div class="jumbotron" style="padding-left: 500px; background-color: #f3f3f3"><h2>구독중인 채널이 없습니다.</h2></div>							
					</td>
				</tr>
			</c:if>
			<c:forEach items="${subscribeList }" var="subscription" varStatus="subscribeVarStatus">
				<tr id="subscription-list-${subscribeVarStatus.count }" style="height: 200px;">
					<th class="subscribe-table-th" style="padding-left: 200px; width: 30%">
						<img alt="video-thumbnail" class="img-circle subscribe-subscrice-profile" 
						src="${subscription.userImgUrl }" id="subscriptionlist-imgbox-${subscribeVarStatus.count }">
						<input type="hidden" value="${subscription.ownerNo }" id="subscriptionlist-hiddenbox-${subscribeVarStatus.count }">
					</th>
					<td style="padding-left: 50px;">
						<div class="row" style="width: 900px;">
							<div class="col-md-9">
								<p id="subscribe-namespace-${subscribeVarStatus.count }" class="subscribe-namespace"><c:out value="${subscription.title }" /></p>											
							</div>
							<div class="col-md-3" id="subscribelist-buttonarea-${subscribeVarStatus.count }">
								<div id="top-right-side-btn-group-${subscribeVarStatus.count }" class="pull-right">
									<button class="btn btn-light btn-lg" id="subscribelist-subscribe-button-cansle-${subscribeVarStatus.count }">구독중 ${subscription.subscriptionCount }명</button>
									
									<c:choose>
										<c:when test="${subscription.notice eq 'on' }">
											<span class="glyphicon glyphicon-bell btn btn-default btn-lg none-border-buttons" id="notice-config-button-yes-${subscribeVarStatus.count }"></span>
										</c:when>
										<c:when test="${subscription.notice eq 'off' }">
											<span class="glyphicon glyphicon-ban-circle btn btn-default btn-lg none-border-buttons" id="notice-config-button-no-${subscribeVarStatus.count }"></span>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="subscribe-metadata-line" id="subscribe-metadata-line-${subscribeVarStatus.count }">
							<p>
								구독자 <span id="subscribelist-countbox-${subscribeVarStatus.count }">${subscription.subscriptionCount }</span> 명  <span class="glyphicon glyphicon-map-marker" style="font-size: xx-small;"></span> 동영상 ${subscription.videoCount }개 			
							</p>
							<p>
								<c:choose>
									<c:when test="${fn:length(subscription.longDetail) gt 200 }">
										<c:out value="${fn:substring(subscription.longDetail, 0, 200) }"></c:out>
										...
									</c:when>
									<c:otherwise>
										<c:out value="${subscription.longDetail }"></c:out>
									</c:otherwise>
								</c:choose>
							</p>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
$(function() {
	
	function replacer($target, removetext) {
		return $target.attr('id').replace(removetext, '');
	}
	
	$('.subscribe-info-container tr').css('cursor', 'pointer');
	
	$('.none-border-buttons').mouseenter(function() {
		$(this).css('background-color', '#f3f3f3');
	});
	
	function getOwner(no) {
		return $('#subscriptionlist-hiddenbox-'+no).val();
	}
	
	$('[id^=subscription-list]').on('click', '[id^=subscribe-namespace]', function() {
		var no = replacer($(this), 'subscribe-namespace-');
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+$('#subscriptionlist-hiddenbox-'+no).val());
	});
	
	$('[id^=subscribe-metadata-line]').on('click', 'p', function() {
		var no = replacer($(this).parents('[id^=subscribe-metadata-line]'), 'subscribe-metadata-line-');
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+$('#subscriptionlist-hiddenbox-'+no).val());
	});
	
	$('[id^=subscriptionlist-imgbox]').click(function() {
		var no = replacer($(this), 'subscriptionlist-imgbox-');
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+$('#subscriptionlist-hiddenbox-'+no).val());
	});
	
	$('[id^=subscribelist-buttonarea-]').on('click', '[id^=subscribelist-subscribe-button-]', function() {
		var $this = $(this); 	
		if ($(this).attr('id').includes('cansle')) {
			var no = $this.attr('id').replace('subscribelist-subscribe-button-cansle-', '');
			$.ajax({
				type: 'GET',
				url: AppManager.data.subscriptions.subscribe,
				data: {'ownerNo':getOwner(no)},
				dataType: 'json',
				success: function(result) {
					$this.parents('[id^=subscribelist-buttonarea-]').find('[id^=notice-config]').remove();
					$this.remove();
					$('#top-right-side-btn-group-'+no).append('<button class="btn btn-danger btn-lg" id="subscribelist-subscribe-button-'+no+'">구독 '+result.user.subscriptionCount+'명</button>');
					$('#subscribelist-countbox-'+no).text(result.user.subscriptionCount);
					$('[id^=subscription-list-hiddenbox]').each(function(index, item) {
						if (result.user.no == $(item).val()) {
							$(item).parents('[id^=subscription-list-li]').remove();
						}
					});
				}
			})
		} else {
			var no = $this.attr('id').replace('subscribelist-subscribe-button-', '');
			$.ajax({
				type: 'GET',
				url: AppManager.data.subscriptions.subscribe,
				data: {'ownerNo':getOwner(no)},
				dataType: 'json',
				success: function(result) {
					$this.remove();
					$('#top-right-side-btn-group-'+no).append('<button class="btn btn-light btn-lg" id="subscribelist-subscribe-button-cansle-'+no+'">구독중 '+result.user.subscriptionCount+'명</button>');
					$('#subscribelist-countbox-'+no).text(result.user.subscriptionCount);
					$('#top-right-side-btn-group-'+no).append('<span class="glyphicon glyphicon-bell btn btn-default btn-lg none-border-buttons" id="notice-config-button-yes-'+no+'"></span>');
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
	
	$('[id^=subscribelist-buttonarea]').on('click','[id^=notice-config-button]', function() {
		var $this = $(this);
		var no;
		
		if ($this.attr('id').includes('yes')) {
			no = $this.attr('id').replace('notice-config-button-yes-', '');
		} else {
			no = $this.attr('id').replace('notice-config-button-no-', '');
		}

		$.ajax( {
			type:'GET',
			url: AppManager.data.subscriptions.notice,
			data: {'creatorNo':getOwner(no)},
			dataType: 'text',
			success: function(result) {
				noticeStatus = result;
				if (noticeStatus == 'on') {
					$this.remove();
					$('#top-right-side-btn-group-'+no).append('<span class="glyphicon glyphicon-bell btn btn-default btn-lg none-border-buttons" id="notice-config-button-yes-'+no+'"></span>');
				} else {
					$this.remove();
					$('#top-right-side-btn-group-'+no).append('<span class="glyphicon glyphicon-ban-circle btn btn-default btn-lg none-border-buttons" id="notice-config-button-no-'+no+'"></span>');
				}
			}
		})
	});
})
</script>