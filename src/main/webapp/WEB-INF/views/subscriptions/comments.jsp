<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.comment-user-profile-images {
		width: 50px;
		height: 50px;
	}
	.comment-thumbs {
		font-size: medium;
		color: #707070;
	}
	[id^=user-comment-table] {
		padding-top: 10px;
	}
	[id^=comment-report-button], [id^=comment-report-text], [id^=reply-report-button], [id^=reply-report-text] {
		font-size: medium;
		color: #707070;
		cursor: pointer;
	}
	[id^=reply-container-] .row {
		padding-left: 25px;
	}
	[id^=comment-user-profile-image], [id^=comment-user-profile-name], [id^=reply-user-profile-image], [id^=reply-user-profile-name] {
		cursor: pointer;
	}
</style>
<c:forEach items="${communityCommentsList }" var="communityComments" varStatus="commentsVarStatus">
<div id="user-comment-table-${newIndex }-${commentsVarStatus.count }">
	<div class="col-md-1">
		<img id="comment-user-profile-image-${newIndex }-${commentsVarStatus.count }"
		alt="user-profile" src="${communityComments.user.profileSmallImgUrl }" class="comment-user-profile-images img-circle"/>
	</div>
	<div class="col-md-11">
		<div id="comment-user-profile-name-${newIndex }-${commentsVarStatus.count }">
			<input type="hidden" value="${communityComments.user.no }" id="comment-user-no-${newIndex }-${commentsVarStatus.count }" />
			<input type="hidden" value="${communityComments.no }" id="comment-hidden-no-box-${newIndex }-${commentsVarStatus.count }">
			<strong class="comment-owner-name-strong">
				<c:out value="${communityComments.user.nick }"></c:out>	
			</strong>
			<span class="comment-time-ago"> ${communityComments.formattedDate }</span>
			<c:if test="${isOwner }">
				<c:if test="${empty communityComments.replies and communityComments.commenterNo ne loginUser.no }">
					<span><button type="button" class="btn btn-xs btn-danger" id="comment-reply-btn-${newIndex }-${commentsVarStatus.count }">이 댓글에 답변 달기</button></span>			
				</c:if>
			</c:if>
		</div>
		<div id="comment-user-profile-contents-${newIndex }-${commentsVarStatus.count }" style="width: 550px;">
			<c:out value="${communityComments.contents }"></c:out>
		</div>
		<div id="comment-user-profile-likes-${newIndex }-${commentsVarStatus.count }">
			<c:choose>
				<c:when test="${empty loginUser }">
					<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn"></span>
				</c:when>
				<c:when test="${communityComments.history.voteSide eq 'p' }">
					<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn voted-thumbs" id="comment-thumbsup-${newIndex }-${commentsVarStatus.count }"></span>
				</c:when>
				<c:otherwise>
					<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn" id="comment-thumbsup-${newIndex }-${commentsVarStatus.count }"></span>	
				</c:otherwise>
			</c:choose>
			
			<strong class="comment-like-count-spans" id="comment-like-count-spans-${newIndex }-${commentsVarStatus.count }">${communityComments.commentSumCount }</strong>
			
			<c:choose>
				<c:when test="${empty loginUser }">
					<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn"></span>
				</c:when>
				<c:when test="${communityComments.history.voteSide eq 'n' }">
					<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn voted-thumbs" id="comment-thumbsdown-${newIndex }-${commentsVarStatus.count }"></span>
				</c:when>
				<c:otherwise>
					<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn" id="comment-thumbsdown-${newIndex }-${commentsVarStatus.count }"></span>	
				</c:otherwise>
			</c:choose>
			
			<c:if test="${not empty loginUser }">
				<span id="comment-report-button-${newIndex }-${commentsVarStatus.count }">
					<span class="glyphicon glyphicon-exclamation-sign"></span>
					<span id="comment-report-text-${newIndex }-${commentsVarStatus.count }">신고</span>
				</span>			
			</c:if>
		</div>
	</div>
	<div id="reply-container-${newIndex }-${commentsVarStatus.count }">
		<c:if test="${not empty communityComments.replies }">
			<div class="row">
				<div class="col-md-1">
					<img id="reply-user-profile-image-${newIndex }-${commentsVarStatus.count }"
					alt="user-profile" src="${communityComments.replies.user.profileSmallImgUrl }" class="comment-user-profile-images img-circle"/>
				</div>
				<div class="col-md-11">
					<div id="reply-user-profile-name-${newIndex }-${commentsVarStatus.count }">
						<input type="hidden" value="${communityComments.replies.user.no }" id="reply-user-no-${newIndex }-${commentsVarStatus.count }" />
						<input type="hidden" value="${communityComments.replies.no }" id="reply-hidden-no-box-${newIndex }-${commentsVarStatus.count }">
						<span class="badge">게시자</span>
						<strong class="comment-owner-name-strong">${communityComments.replies.user.nick }</strong>
						<span class="comment-time-ago"> ${communityComments.replies.formattedDate }</span>
						<c:if test="${not empty communityComments.replies and isOwner}">
							<span><button type="button" class="btn btn-xs btn-info" id="comment-reply-modify-btn-${newIndex }-${commentsVarStatus.count }">수정</button></span>
						</c:if>
					</div>
					<div id="reply-user-profile-contents-${newIndex }-${commentsVarStatus.count }">
						<c:out value="${communityComments.replies.contents }"></c:out>
					</div>
					<div id="reply-user-profile-likes-${newIndex }-${commentsVarStatus.count }">
					
						<c:choose>
							<c:when test="${empty loginUser }">
								<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn"></span>
							</c:when>
							<c:when test="${communityComments.replies.history.voteSide eq 'p' }">
								<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn voted-thumbs" id="reply-thumbsup-${newIndex }-${commentsVarStatus.count }"></span>
							</c:when>
							<c:otherwise>
								<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn" id="reply-thumbsup-${newIndex }-${commentsVarStatus.count }"></span>	
							</c:otherwise>
						</c:choose>
				
						<strong class="comment-like-count-spans" id="reply-like-count-spans-${newIndex }-${commentsVarStatus.count }">${communityComments.replies.commentReplySumCount }</strong>
						
						<c:choose>
							<c:when test="${empty loginUser }">
								<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn"></span>
							</c:when>
							<c:when test="${communityComments.replies.history.voteSide eq 'n' }">
								<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn voted-thumbs" id="reply-thumbsdown-${newIndex }-${commentsVarStatus.count }"></span>
							</c:when>
							<c:otherwise>
								<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn" id="reply-thumbsdown-${newIndex }-${commentsVarStatus.count }"></span>	
							</c:otherwise>
						</c:choose>
									
						<c:if test="${not empty loginUser }">
							<span id="reply-report-button-${newIndex }-${commentsVarStatus.count }">
								<span class="glyphicon glyphicon-exclamation-sign"></span>
								<span id="reply-report-text-${newIndex }-${commentsVarStatus.count }">신고</span>
							</span>						
						</c:if>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</div>
</c:forEach>
<%@ include file="commentScript.jsp" %>
<script>
	var newIndex = '${newIndex}';

	$('[id^=comment-report-button-'+newIndex+']').click(function() {
	
		var first = getNumber($(this), 'comment-report-button-').front;
		var second = getNumber($(this), 'comment-report-button-').front;
		var commentNo = $('#comment-hidden-no-box-'+first+'-'+second).val();
		
		AppManager.showConfirm('신고', commentReportHtml, function() {
			var reportContents = this.$content.find('.name').val();
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.report,
				data: {'reportContents':reportContents, 'criteria':'comment', 'targetNo':commentNo},
				dataType: 'text',
				success: function(result) {
					if (result == 'c') {
						AppManager.showAlert('신고완료', '해당 댓글에 대한 신고가 접수되었습니다.');
					} else {
						AppManager.showAlert('오류발생', '신고 처리 실패..');
					}
				},
				error: function() {
					AppManager.showAlert('오류발생', '신고 처리 실패..');
				}
			})
		}
		,function() {});
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=comment-thumbsup-'+newIndex+']', function() {
		
		var first = getNumber($(this), 'comment-thumbsup-').front;
		var second = getNumber($(this), 'comment-thumbsup-').back;
		
		var commentNo = getCommentNo(first, second);
		var $this = $(this);
		$.ajax({
			type: 'POST',
			url: AppManager.data.subscriptions.thumbs,
			data: {'which':'comment', 'targetNo':commentNo, 'side':'p'},
			dataType: 'text',
			success: function(result) {
				if ($this.hasClass('voted-thumbs')) {
					removeAndAddCount(first, second, result, 'comment');
					return;
				}
				removeAndAddCount(first, second, result, 'comment');
				$this.addClass('voted-thumbs');
			}
		})
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=comment-thumbsdown-'+newIndex+']', function() {
		
		var first = getNumber($(this), 'comment-thumbsdown-').front;
		var second = getNumber($(this), 'comment-thumbsdown-').back;
		
		var commentNo = getCommentNo(first, second);
		var $this = $(this);
		$.ajax({
			type: 'POST',
			url: AppManager.data.subscriptions.thumbs,
			data: {'which':'comment', 'targetNo':commentNo, 'side':'n'},
			dataType: 'text',
			success: function(result) {
				if ($this.hasClass('voted-thumbs')) {
					removeAndAddCount(first, second, result, 'comment');
					return;
				}
				removeAndAddCount(first, second, result, 'comment');
				$this.addClass('voted-thumbs');
			}
		})
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=comment-reply-modify-btn-'+newIndex+']', function(event) {
			
		event.preventDefault();
		
		var first;
		var second;
		var commentNo;
		var $this = $(this);
		
		first = getNumber($this, 'comment-reply-modify-btn-').front;
		second = getNumber($this, 'comment-reply-modify-btn-').back;
		commentNo = getCommentNo(first, second);
		
		var replierNo = getReplyerAndReplyNo(first, second).replierNo;
		var replyNo = getReplyerAndReplyNo(first, second).replyNo;
			
		AppManager.showConfirm('수정', commentReplyHtml, function() {
			var replyContents = this.$content.find('.name').val();
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.modifyReply,
				data: {'replyContents':replyContents, 'targetNo':replyNo, 'commentNo':commentNo, 'replierNo':replierNo},
				dataType: 'text',
				success: function(result) {
					AppManager.changeDiv('#reply-container-'+first+'-'+second, AppManager.div.subscriptions.reply+'?targetNo='+commentNo+"&creatorNo="+$('#owner-no-box').val()+"&first="+first+"&second="+second);
				},
				error: function() {
	
				}
			})
		},
		function() {})
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=comment-reply-btn-'+newIndex+']', function(event) {
		
		event.preventDefault();
		
		var first;
		var second;
		var commentNo;
		var $this = $(this);
	
		first = getNumber($this, 'comment-reply-btn-').front;
		second = getNumber($this, 'comment-reply-btn-').back;
		commentNo = getCommentNo(first, second);
		
		AppManager.showConfirm('대댓글', commentReplyHtml, function() {
			var replyContents = this.$content.find('.name').val();
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.reply,
				data: {'replyContents':replyContents, 'targetNo':commentNo},
				dataType: 'text',
				success: function(result) {
					AppManager.changeDiv('#reply-container-'+first+'-'+second, AppManager.div.subscriptions.reply+'?targetNo='+commentNo+"&creatorNo="+$('#owner-no-box').val()+"&first="+first+"&second="+second);
					$('#comment-reply-btn-'+first+'-'+second).remove();
				},
				error: function() {
	
				}
			})
		},
		function() {})
	
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=reply-thumbsup-'+newIndex+']', function() {
	
		var first = getNumber($(this), 'reply-thumbsup-').front;
		var second = getNumber($(this), 'reply-thumbsup-').back;
		var replyNo = getReplyNo(first, second);
		var $this = $(this);
		$.ajax({
			type: 'POST',
			url: AppManager.data.subscriptions.thumbs,
			data: {'which':'reply', 'targetNo':replyNo, 'side':'p'},
			dataType: 'text',
			success: function(result) {
				if ($this.hasClass('voted-thumbs')) {
					removeAndAddCount(first, second, result, 'reply');
					return;
				}
				removeAndAddCount(first, second, result, 'reply');
				$this.addClass('voted-thumbs');
			}
		})
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=reply-thumbsdown-'+newIndex+']', function() {
	
		var first = getNumber($(this), 'reply-thumbsdown-').front;
		var second = getNumber($(this), 'reply-thumbsdown-').back;
		var replyNo = getReplyNo(first, second);
		var $this = $(this);
		$.ajax({
			type: 'POST',
			url: AppManager.data.subscriptions.thumbs,
			data: {'which':'reply', 'targetNo':replyNo, 'side':'n'},
			dataType: 'text',
			success: function(result) {
				if ($this.hasClass('voted-thumbs')) {
					removeAndAddCount(first, second, result, 'reply');
					return;
				}
				removeAndAddCount(first, second, result, 'reply');
				$this.addClass('voted-thumbs');
			}
		})
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=reply-report-button-'+newIndex+']', function() {
	
		var first = getNumber($(this), 'reply-report-button-').front;
		var second = getNumber($(this), 'reply-report-button-').back;
		var replyNo = getReplyNo(first, second);
		
		AppManager.showConfirm('신고', commentReportHtml, function() {
			var reportContents = this.$content.find('.name').val();
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.report,
				data: {'reportContents':reportContents, 'criteria':'reply', 'targetNo':replyNo},
				dataType: 'text',
				success: function(result) {
					if (result == 'r') {
						AppManager.showAlert('신고완료', '해당 대댓글에 대한 신고가 접수되었습니다.');
					} else {
						AppManager.showAlert('오류발생', '신고 처리 실패..');
					}
				},
				error: function() {
					AppManager.showAlert('오류발생', '신고 처리 실패..');
				}
			})
		}
		,function() {});
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=comment-user-profile-image], .comment-owner-name-strong', function() {
	
		var no = $(this).parents('[id^=user-comment-table]').find('[id^=comment-user-no]').val();
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
	});
	
	$('[id^=user-comment-table]').on('click', '[id^=reply-user-profile-image], .comment-owner-name-strong', function() {
	
		var no = $(this).parents('[id^=user-comment-table]').find('[id^=reply-user-no]').val();
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
	});
</script>