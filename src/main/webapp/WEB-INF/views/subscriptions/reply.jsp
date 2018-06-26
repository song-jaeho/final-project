<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${not empty communityReplies }">
<div class="row">
	<div class="col-md-1">
		<img id="reply-user-profile-image-${first }-${second }"
		alt="user-profile" src="${communityReplies.user.profileSmallImgUrl }" class="comment-user-profile-images img-circle"/>
	</div>
	<div class="col-md-11">
		<div id="reply-user-profile-name-${first }-${second }">
			<input type="hidden" value="${communityReplies.user.no }" id="reply-user-no-${first }-${second }" />
			<input type="hidden" value="${communityReplies.no }" id="reply-hidden-no-box-${first }-${second }">
			<span class="badge">게시자</span>
			<strong class="comment-owner-name-strong">${communityReplies.user.nick }</strong>
			<span class="comment-time-ago"> ${communityReplies.formattedDate }</span>
			<c:if test="${isOwner }">
				<span><button type="button" class="btn btn-xs btn-info" id="comment-reply-modify-btn-${first }-${second }">수정</button></span>
			</c:if>
		</div>
		<div id="reply-user-profile-contents-${first }-${second }">
			<c:out value="${communityReplies.contents }"></c:out>
		</div>
		<div id="reply-user-profile-likes-${first }-${second }">
		
			<c:choose>
				<c:when test="${empty loginUser }">
					<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn"></span>
				</c:when>
				<c:when test="${communityComments.replies.history.voteSide eq 'p' }">
					<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn voted-thumbs" id="reply-thumbsup-${first }-${second }"></span>
				</c:when>
				<c:otherwise>
					<span class="comment-thumbs glyphicon glyphicon-thumbs-up btn" id="reply-thumbsup-${first }-${second }"></span>	
				</c:otherwise>
			</c:choose>

			<strong class="comment-like-count-spans" id="reply-like-count-spans-${first }-${second }">${communityReplies.commentReplySumCount }</strong>
			
			<c:choose>
				<c:when test="${empty loginUser }">
					<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn"></span>
				</c:when>
				<c:when test="${communityComments.replies.history.voteSide eq 'n' }">
					<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn voted-thumbs" id="reply-thumbsdown-${first }-${second }"></span>
				</c:when>
				<c:otherwise>
					<span class="comment-thumbs glyphicon glyphicon-thumbs-down btn" id="reply-thumbsdown-${first }-${second }"></span>	
				</c:otherwise>
			</c:choose>
			
			<c:if test="${not empty loginUser }">
				<span id="reply-report-button-${first }-${second }">
					<span class="glyphicon glyphicon-exclamation-sign"></span>
					<span id="reply-report-text-${first }-${second }">신고</span>
				</span>			
			</c:if>
		</div>
	</div>
</div>
</c:if>
<script type="text/javascript">
$(function() {
	var commentReportHtml = '<form action="#" class="formName">' +
							    '<div class="form-group">' +
							    '<label>어떤 점이 마음에 안 드셨나요?</label>' +
							    '<input type="text" placeholder="신고 사유" class="name form-control" required />' +
							    '</div>' +
							    '</form>';
	
	function getReplyNo(first, second) {
		return $('#reply-hidden-no-box-'+first+'-'+second).val();
	}
							    
    function removeThumbsClass(first, second, which) {
		if (which == 'comment') {
			$('#comment-thumbsup-'+first+'-'+second).removeClass('voted-thumbs');
			$('#comment-thumbsdown-'+first+'-'+second).removeClass('voted-thumbs');
		} else if (which == 'reply') {
			$('#reply-thumbsup-'+first+'-'+second).removeClass('voted-thumbs');
			$('#reply-thumbsdown-'+first+'-'+second).removeClass('voted-thumbs');
		}
	}
	
	function removeAndAddCount(first, second, result, which) {
		if (which == 'comment') { 
			removeThumbsClass(first, second, which);
			$('#comment-like-count-spans-'+first+'-'+second).text(result);
		} else if (which == 'reply') {
			removeThumbsClass(first, second, which);
			$('#reply-like-count-spans-'+first+'-'+second).text(result);
		}		
	}						    
});
</script>