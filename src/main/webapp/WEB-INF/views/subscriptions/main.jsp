<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	#main-image-container {
		padding: 0;
		margin: 0;
		background-color: #fafafa;
	}
	#main-image {
		width: 100%;
		height: 350px;
		padding-bottom: 30px;
	}
	#profile-image {
		width: 80px;
		height: 80px;
	}
	.mini-profile-images {
		width: 60px;
		height: 60px;
	}
	.none-border-buttons{
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 0px;
		background-color: #fafafa;
	}
	.sub-main-active-button {
		border-bottom: solid;
	}
	
	[id^=notice-config-button] {
		font-size: x-large;
	}
	.none-boder-white-back-btn {
		outline: none;
		border: none;
		font-size: large;
	}
	#subscription-main-board {
		padding-top: 25px;
	}
	#subscription-main-board table {
		margin: 0;
	}
	#criteria-button-group {
		padding-top: 10px;
		background-color: #fafafa;
	}
	.playlist-name-atag, .play-all-atag{
		border: none;
		padding-left: 0;
		padding-right: 10px;
	}
	.playlist-name-atag {
		font-size: medium;
		font-weight: 500;	
	}
	.play-all-atag, #subscribe-count-p, #criteria-button-group span, .community-time-ago{
		color: #707070;
	}
	.subscription-main-thumbnails {
		width: 250px;
	}
	.bottom-of-video-line, #sub-modal-recent-keyword {
		color: #707070;
		font-size: small;
	}
	.divs-with-padding, .community-head {
		padding-bottom: 20px;
	}
	#profile-image {
		width: 80px;
		height: 80px;
	}
	#channel-owner-name-space {
		margin-top: 0px;
	}
	.subscriptions-subcontainer {
		margin-left: 8%;
		width: 80%;
		
	}
	.subscription-main-videos-text-side {
		padding-right: 0px;
		padding-left: 10px;
	}
	.subscription-main-videos-button-side {
		padding-left: 0px;
		margin: 0px;
	}
	.subscription-none-border-and-white-back {
		border: none;
		background-color: white;
		color: gray;
	}
	[id^=subscription-video-no] {
		padding-right: 0px;
		padding-left: 10px;
		height: 240px;
	}
	
	.subscription-view-thumbnails {
		border: none;
		margin: 0px;
	}
	
	#subscription-search-group {
		width: 25%;
		padding-top: 5px;
	}

</style>

<div class="container" id="main-image-container" style="width: 100%">
	<c:if test="true">
		<img alt="mainImage" src="${thisUserChannel.imgUrl }" id="main-image">
	</c:if>
	<div class="subscriptions-subcontainer">
		<div class="row" id="top-info-group-row">
			<div class="col-md-1">
				<img alt="profile-pic" src="${user.profileSmallImgUrl }" id="profile-image" class="img-circle">
			</div>
			<div class="col-md-8">
				<h2 id="channel-owner-name-space">${thisUserChannel.title }<span></span></h2>
				<p id="subscribe-count-p">구독자 <span id="subscribe-count">${user.subscriptionCount }</span>명</p>
				<input type="hidden" value="${user.no }" id="owner-no-box" />
			</div>
			<div class="col-md-3">
			<c:choose>
				<c:when test="${empty loginUser }">
					<!-- 
					<div id="top-right-side-btn-group" class="pull-right">
						<button class="btn btn-warning btn-lg" id="subscribe-button">구독 ${user.subscriptionCount }명</button>
					</div>							
					 -->
				</c:when>
				<c:when test="${not empty loginUser and loginUser.no eq user.no }">
					
				</c:when>
				<c:when test="${!isSubscribe and not empty loginUser }">
					<div id="top-right-side-btn-group" class="pull-right">
						<button class="btn btn-danger btn-lg" id="subscribe-button">구독 ${user.subscriptionCount }명</button>
					</div>			
				</c:when>
				<c:when test="${isSubscribe and not empty loginUser }">
					<div id="top-right-side-btn-group" class="pull-right">
						<button class="btn btn-light btn-lg" id="cansle-subscribe-button">구독중 ${user.subscriptionCount }명</button>
						<c:choose>
							<c:when test="${noticeStatus eq 'on' }">
								<span class="glyphicon glyphicon-bell btn btn-default btn-lg none-border-buttons" id="notice-config-button-yes"></span>
							</c:when>
							<c:when test="${noticeStatus eq 'off' }">
								<span class="glyphicon glyphicon-ban-circle btn btn-default btn-lg none-border-buttons" id="notice-config-button-no"></span>
							</c:when>
						</c:choose>
					</div>
				</c:when>
			</c:choose>			
			</div>
		</div>
	
		<div class="btn-group btn-group-lg" role="group" aria-label="..." id="criteria-button-group">
		  	<button type="button" class="btn btn-default none-border-buttons sub-main-active-button"><span id="category-home">홈</span></button>
		  	<button type="button" class="btn btn-default none-border-buttons"><span id="category-videos">동영상</span></button>
		  	<button type="button" class="btn btn-default none-border-buttons"><span id="category-playlist">재생목록</span></button>
		  	<button type="button" class="btn btn-default none-border-buttons"><span id="category-community">커뮤니티</span></button>
		  	<button type="button" class="btn btn-default none-border-buttons"><span id="category-channels">채널</span></button>
		  	<button type="button" class="btn btn-default none-border-buttons"><span id="category-info">정보</span></button>
		  	<button type="button" class="btn btn-default none-border-buttons" id="search-button"><span class="glyphicon glyphicon-search"></span></button>
		  	<div class="input-group" id="subscription-search-group">
		      	<input type="text" class="form-control" placeholder="검색어..." id="subscription-search-textbox"/>
		      	<span class="input-group-btn">
		       		<button class="btn btn-default" type="button" id="subscription-search-button">검색</button>
		    	</span>
		    </div>
		</div>
	</div>
</div>

<div class="subscriptions-subcontainer" id="subscriptions-container">
	<div class="row" id="subscription-main-board">
		<%@ include file="home.jsp" %>
	  </div>
</div>
<script>
$(function() {
	
	var userNo = $('#owner-no-box').val();
	
	var location = 'main';
	var noticeStatus = '${noticeStatus}';
	if (!noticeStatus) {
		noticeStatus = true;
	}

	$('[id^=subscription-videos-plus-button]').css('background-color', '#f3f3f3').css('outline', 'none').hide();
	$('[id^=subscription-video-no]').hover(function() {
		$(this).find('[id^=subscription-videos-plus-button]').show();
	},
	function() {
		$(this).find('[id^=subscription-videos-plus-button]').hide();
	});
		
	function removeClassAndAddClass($removeTargetName, removeClassName, $addTargetName, addClassName) {
		$removeTargetName.removeClass(removeClassName);
		$addTargetName.addClass(addClassName);
	}
	
	function addRecent($this, recentKeyword) {
		$this.text(recentKeyword.replace(/[+]/gi, ' '));
	}
	
	function searchKeywordConverter(str) {
		return str.replace(/ /gi, '+');
	}
	
	function getOwner() {
		return $('#owner-no-box').val();
	}
	
	function makeHtml(count) {
		var html = {
			subBtn : '<button class="btn btn-danger btn-lg" id="subscribe-button">구독 '+count+'명</button>',
			subCansleBtn : '<button class="btn btn-light btn-lg" id="cansle-subscribe-button">구독중 '+count+'명</button>',
			noticeBtn : '<span class="glyphicon glyphicon-bell btn btn-default btn-lg none-border-buttons" id="notice-config-button-yes"></span>',
			noticeCansleBtn : '<span class="glyphicon glyphicon-ban-circle btn btn-default btn-lg none-border-buttons" id="notice-config-button-no"></span>'
		}
		return html;
	}
	
	$('#top-right-side-btn-group').on('click','[id^=notice-config-button]', function() {
		$.ajax( {
			type:'GET',
			url: AppManager.data.subscriptions.notice,
			data: {'creatorNo':getOwner()},
			dataType: 'text',
			success: function(result) {
				console.log(result);
				noticeStatus = result;
				if (noticeStatus == 'on') {
					$('[id^="notice-config-button"]').remove();
					$('#top-right-side-btn-group').append('<span class="glyphicon glyphicon-bell btn btn-default btn-lg none-border-buttons" id="notice-config-button-yes"></span>');
				} else {
					$('[id^="notice-config-button"]').remove();
					$('#top-right-side-btn-group').append('<span class="glyphicon glyphicon-ban-circle btn btn-default btn-lg none-border-buttons" id="notice-config-button-no"></span>');
				}
			}
		})
	});
	
	$('#subscription-search-group').hide();
	
	$('#subscription-search-textbox').click(function() {
		$(this).val('');
	});
	
	$('#criteria-button-group button').click(function() {	
		if ($(this).attr('id') == 'search-button') {		
			$('#subscription-search-group').toggle(500);
			return;
		}
		if ($(this).attr('id') == 'subscription-search-button') {
			var subscriptSearchKeyword = searchKeywordConverter($('#subscription-search-textbox').val());
			removeClassAndAddClass($('#criteria-button-group button'), 'sub-main-active-button', $('#search-button'), 'sub-main-active-button');
			addRecent($('#subscription-search-textbox'), subscriptSearchKeyword);
			AppManager.changeDiv('#subscription-main-board', AppManager.div.subscriptions.search+'?keyword='+subscriptSearchKeyword+"&location="+location+"&creatorNo="+userNo);
			return false;
		}
		removeClassAndAddClass($('#criteria-button-group button'), 'sub-main-active-button', $(this), 'sub-main-active-button');		
		var cat = $(this).find('span').attr('id').replace('category-', '');
		if (cat == 'videos') {
			AppManager.changeDiv('#subscription-main-board', AppManager.div.subscriptions.videos+"?creatorNo="+userNo);
			return;
		}
		if (cat == 'home') {
			AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+userNo);
			return;
		}
		AppManager.changeDiv('#subscription-main-board', AppManager.div.subscriptions.main.replace('main', cat)+"?creatorNo="+userNo);		
	});
	
	$('#top-right-side-btn-group').on('mouseenter', '[id^="notice-config-button"]', function() {
		$(this).css("background-color", "#fafafa");
	});
	$('#subscription-main-board').on('mouseenter', '.playlist-buttons a', function() {
		$(this).css("background-color", "#f3f3f3");		
	});
	$('#criteria-button-group').on('mouseenter', 'button', function() {
		$(this).css("background-color", '#fafafa').css('outline', 'none');
	});
	
	$('#subscriptions-container').on('click', '.playlist-buttons [id^=subscription]', function() {
		var thisButtonId = $(this).attr('id');
		
		if(thisButtonId.includes('playall')) {			
			
			var no = thisButtonId.replace('subscription-playall-', '');
			AppManager.changeMainDiv(AppManager.div.video.player+'?subListNo='+$('#playlist-hiddenbox-'+no).val()+"&videoNo="+$('#playlist-video-hiddenbox-'+no+"-1").val());
			
		} else if (thisButtonId.includes('playlist')) {
			var no = thisButtonId.replace('subscription-playlist-name-', '');

			if (no == 0) {
				removeClassAndAddClass($('#criteria-button-group button'), 'sub-main-active-button', $('#category-videos').parent('button'), 'sub-main-active-button');
				AppManager.changeDiv('#subscription-main-board', AppManager.div.subscriptions.videos+"?creatorNo="+userNo);
				return;
			}
			var playlistNo = $('#playlist-hiddenbox-'+no).val();
			
			AppManager.changeMainDiv(AppManager.div.library.playList+"?plno="+parseInt(playlistNo));
		}
	});
	
	$('#top-right-side-btn-group').on('click', '#subscribe-button', function() {
		$.ajax({
			type: 'GET',
			url: AppManager.data.subscriptions.subscribe,
			data: {'ownerNo':getOwner(), 'whether':false},
			dataType: 'json',
			success: function(result) {
				$('#subscribe-button').remove();			
				$('#top-right-side-btn-group').prepend(makeHtml(result.user.subscriptionCount).subCansleBtn).append(makeHtml().noticeBtn);
				$('#subscribe-count').text(result.user.subscriptionCount);
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
	});
	
	$('#top-right-side-btn-group').on('click', '#cansle-subscribe-button', function() {
		$.ajax({
			type: 'GET',
			url: AppManager.data.subscriptions.subscribe,
			data: {'ownerNo':getOwner(), 'whether':true},
			dataType: 'json',
			success: function(result) {
				$('#cansle-subscribe-button').remove();
				$('[id^=notice-config-button]').remove();
				$('#top-right-side-btn-group').prepend(makeHtml(result.user.subscriptionCount).subBtn);
				$('#subscribe-count').text(result.user.subscriptionCount);
				$('[id^=subscription-list-hiddenbox]').each(function(index, item) {
					if (result.user.no == $(item).val()) {
						$(item).parents('[id^=subscription-list-li]').remove();
					}
				});
			}
		})
	});
});
</script>