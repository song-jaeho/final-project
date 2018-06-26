<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.community-foot > span {
		font-size: large;
		padding: 8px;
		padding-top: 0px;
		color: #707070;
	}
	
	[id^=community-report-button], [id^=community-report-text] {
		font-size: medium;
		color: #707070;
		cursor: pointer;
	}
	
	.community-like-count-spans {
		font-size: large;
		padding-bottom: 0px;
	}
	
	.community-owner-name-strong {
		font-size: medium;
		font-weight: 600;
	}
	
	.loginUser-profile-images {
		width: 40px;
		height: 40px;
	}
	
	[id^=community-show-comment-button], [id^=community-hide-comment-button]{
		padding-left: 0px;
	}
	
	[id^=community-board] {
		border: none;
	}
	
	.voted-thumbs {
		font-weight: 600 !important;
		color: black !important;
	}
	
	.col-md-10 [id^=community-board-], [id^=comment-input-form-] .form-control {
		background-color: #f3f3f3;
		box-shadow: none;
	}
</style>

<div class="col-md-10">
<c:if test="${location ne 'library' and not empty loginUser and isOwner }">
	<div class="row">
		<div style="padding-left: 30px;">
			<button class="btn btn-danger" id="community-new-write-button">새 글 쓰기</button>	
		</div>
	</div>
</c:if>

<c:if test="${not empty communityWritingsList }">
	<c:forEach items="${communityWritingsList }" var="communityWritings" varStatus="communityVarStatus">
	
		<input type="hidden" value="${communityWritings.writtenComments.contents }" id="isWritten-box-${communityVarStatus.count }"> 
		<input type="hidden" value="${communityWritings.writtenComments.no }" id="written-commentNo-box-${communityVarStatus.count }"> 
		<input type="hidden" value="${communityWritings.writtenComments.commenterNo }" id="written-commenterNo-box-${communityVarStatus.count }"> 

		<c:if test="${communityWritings.status ne 'disabled' }">	
			<div class="panel panel-default" id="community-board-${communityVarStatus.count }">
				<div class="panel-body">
					<div class="community-head">
						<img alt="mini-profile-pic" src="${communityWritings.user.profileSmallImgUrl }" class="img-circle mini-profile-images" style="width: 60px; height: 60px;"/>
						<span class="community-owner-name-strong"><c:out value="${communityWritings.user.nick }"></c:out></span>
						<span class="community-time-ago">
							${communityWritings.formattedDate }
						</span>
						<input type="hidden" id="community-summary-idbox-${communityVarStatus.count }" value="${communityWritings.no }">
						<input type="hidden" id="community-user-idbox-${communityVarStatus.count }" value="${communityWritings.user.no }">
						<c:if test="${communityWritings.user.no eq loginUser.no }">
							<button class="btn btn-secondary btn-xs" id="writing-delete-btn-${communityVarStatus.count }">삭제</button>						
						</c:if>
					</div>
					<div class="community-body">
						<p>	
							<c:out value="${communityWritings.contents }"></c:out>						
						</p>
					</div>
					<div class="community-foot">
						<c:choose>
							<c:when test="${empty loginUser }">
								<span class="community-thumbs glyphicon glyphicon-thumbs-up btn"></span>
							</c:when>
							<c:when test="${communityWritings.history.voteSide eq 'p' }">
								<span class="community-thumbs glyphicon glyphicon-thumbs-up btn voted-thumbs" id="writing-thumbsup-${communityVarStatus.count  }"></span>
							</c:when>
							<c:otherwise>
								<span class="community-thumbs glyphicon glyphicon-thumbs-up btn" id="writing-thumbsup-${communityVarStatus.count  }"></span>	
							</c:otherwise>
						</c:choose>
									
						<strong class="community-like-count-spans" id="community-like-count-spans-${communityVarStatus.count }">
							<c:out value="${communityWritings.sumCount}"></c:out>
						</strong>
			
						<c:choose>
							<c:when test="${empty loginUser }">
								<span class="community-thumbs glyphicon glyphicon-thumbs-down btn"></span>
							</c:when>
							<c:when test="${communityWritings.history.voteSide eq 'n' }">
								<span class="community-thumbs glyphicon glyphicon-thumbs-down btn voted-thumbs" id="writing-thumbsdown-${communityVarStatus.count  }"></span>
							</c:when>
							<c:otherwise>
								<span class="community-thumbs glyphicon glyphicon-thumbs-down btn" id="writing-thumbsdown-${communityVarStatus.count  }"></span>	
							</c:otherwise>
						</c:choose>
						
						<c:if test="${not empty loginUser }">
							<span class="community-thumbs btn" id="write-comment-button-${communityVarStatus.count }">댓글</span>
							<span id="community-report-button-${communityVarStatus.count }">
								<span class="glyphicon glyphicon-exclamation-sign"></span>
								<span id="community-report-text-${communityVarStatus.count }">신고</span>
							</span>					
						</c:if>
						
						<form class="form-inline" id="comment-input-form-${communityVarStatus.count }">
							<div class="form-group">
								<label><img alt="profile-pic" src="${loginUser.profileSmallImgUrl }" class="img-circle loginUser-profile-images"></label>
								<input value="${communityWritings.writtenComments.contents }" type="text" class="form-control" id="comment-input-box-${communityVarStatus.count }" placeholder="댓글 입력..." style="width: 500px; border:none; border-bottom: 2px solid black; padding: 0px; margin-left: 5px;"/>
							</div>
							<div class="form-group">
								<p><span id="comment-character-count-${communityVarStatus.count }"></span></p>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-default" id="comment-cansle-button-${communityVarStatus.count }">취소</button>
								<button type="button" class="btn btn-warning" id="comment-confirm-button-${communityVarStatus.count }">확인</button>
							</div>
						</form>
																	
						<div id="community-comment-area-div-${communityVarStatus.count }">
							<div id="community-showHide-button-div-${communityVarStatus.count }">
								<c:choose>
									<c:when test="${communityWritings.commentCount eq 0 }">
										<p>댓글이 없습니다.</p>
									</c:when>
									<c:otherwise>
										<p class="btn" id="community-show-comment-button-${communityVarStatus.count }">댓글 <span>${communityWritings.commentCount }</span>개 모두 보기 <span class="glyphicon glyphicon-chevron-down"></span></p>
										<p class="btn" id="community-hide-comment-button-${communityVarStatus.count }">댓글 숨기기 <span class="glyphicon glyphicon-chevron-up"></span></p>	
									</c:otherwise>
								</c:choose>											
							</div>
							<div id="community-allcomment-board-${communityVarStatus.count }">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
</c:if>
<c:if test="${empty communityWritingsList }">
	<div class="jumbotron" style="background-color: #f3f3f3">
	  <h2>커뮤니티 글이 없습니다.</h2>
	  <p>DuckTube에는 커뮤니티 기능도 있답니다... 모르셨죠?</p>
	</div>
</c:if>
</div>
<div class="col-md-2">
	<c:if test="${location ne 'library' }">
		<%@ include file="recommendChannels.jsp" %>			
	</c:if>
</div>

<script>
$(function() {
	var url = AppManager.div.subscriptions.comments;
	var location = 'community';
	var creatorNo = '${creatorNo}';
	
	var commentIndex = 1;
	
	$('[id^=comment-input-form]').hide();
	$('[id^=community-report-text]').hide();
	$('[id^=community-hide-comment-button-]').hide();
	
	var reportHtml = '<form action="" class="formName">' +
					    '<div class="form-group">' +
					    '<label>어떤 점이 마음에 안 드셨나요?</label>' +
					    '<input type="text" placeholder="신고 사유" class="name form-control" required />' +
					    '</div>' +
					    '</form>';
	
	var writingHtml = '<h4>새 글 작성</h4>'+
						'<textarea class="form-control" rows="5" placeholder="내용 입력..." id="textbox"></textarea>';
	
	function getBoardNo($this, removeText) {
		var boardNo = $this.attr('id').replace(removeText, '');
		return boardNo;
	}
	
	function changeCss($this, target, value) {
		$this.css(target, value);
	}
	
	function clickToShowHide(target, $this, removeTarget, isHide) {
		if (isHide == true) {
			$(target+getBoardNo($this, removeTarget)).show();
			return;
		}
		$(target+getBoardNo($this, removeTarget)).hide();
		$(target+getBoardNo($this, removeTarget)).find('[id^=comment-input-box]').val('');
		$(target+getBoardNo($this, removeTarget)).find('[id^=comment-character-count]').text('');
	}
	
	function commentShowHide(no, isHide) {
		if (isHide == true) {
			$('#community-show-comment-button-'+no).hide();
			$('#community-hide-comment-button-'+no).show();
			return;
		}
		$('#community-show-comment-button-'+no).show();
		$('#community-hide-comment-button-'+no).hide();
	}
	
	function changeText($target, text) {
		$target.text(text);
	}
	
	function getThisParents(target, $this, parent, removeTarget) {
		return $(target+getBoardNo($this.parents(parent), removeTarget));
	}
	function getWritingNo(no) {
		return $('#community-summary-idbox-'+no).val();
	}

	$('[id^=community-board]').on('click', '[id^=writing-delete-btn]', function(event) {
		event.preventDefault();
		
		var $this = $(this);
		var index = $(this).attr('id').replace('writing-delete-btn-','');
		var writingNo = getWritingNo(index);
		AppManager.showConfirm('삭제', '진짜 삭제?', function() {
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.removeWriting,
				data: {'writingNo':writingNo, 'index':index},
				dataType: 'text',
				success: function(result) {			
					AppManager.showAlert('삭제 완료', '해당 글을 삭제했습니다.');
					$this.parents('[id^=community-board]').remove();
				},
				error: function() {
					AppManager.showAlert('오류발생', '삭제 실패..');
				}
			})
		},function() {});
	});

	$('.community-thumbs').hover(function() {
		changeCss($(this), "font-weight", "600");
	}, 
	function() {
		changeCss($(this), "font-weight", "normal");
	});
	
	$('[id^=community-report-button]').hover(function() {
		changeCss($(this), 'color', 'black');
		$('#community-report-text-'+getBoardNo($(this), 'community-report-button-')).show();
	},
	function() {
		changeCss($(this), 'color', '#707070');
		$('#community-report-text-'+getBoardNo($(this), 'community-report-button-')).hide();
	});
	
	$('[id^=community-report-button]').click(function() {
		var no = getBoardNo($(this), 'community-report-button-');
		var writingNo = getWritingNo(no);
		AppManager.showConfirm('신고', reportHtml, function() {
			var reportContents = this.$content.find('.name').val();
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.report,
				data: {'reportContents':reportContents, 'criteria':'writing', 'targetNo':writingNo},
				dataType: 'text',
				success: function(result) {
					if (result == 'w') {
						AppManager.showAlert('신고완료', '해당 글에 대한 신고가 접수되었습니다.');
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
	
	$('.community-foot').on('click', '[id^=write-comment-button]', function() {
		$('#comment-input-form-'+getBoardNo($(this), 'write-comment-button-')).show();
	});
	
	$('[id^=comment-input-box]').keyup(function() {
		var $thisInputBox = $('#comment-character-count-'+getBoardNo($(this), 'comment-input-box-'));
		changeText($thisInputBox, "입력 : "+$(this).val().length);
		$thisInputBox.show();
		if ($thisInputBox.text().replace('입력 : ', '') == 0) {
			$thisInputBox.hide();
		}
	});
	
	$('[id^=comment-cansle-button]').click(function() {
		clickToShowHide('#comment-input-form-', $(this), 'comment-cansle-button-', false);
	});
	
	$('[id^=comment-confirm-button]').click(function() {
		
		var no = getBoardNo($(this), 'comment-confirm-button-');
		var text = $('#comment-input-box-'+no).val();
		var writingNo = getWritingNo(no);
		
		var writtenText = $('#isWritten-box-'+no).val();
		console.log(writtenText);
		
		$('#comment-character-count-'+no).hide();
		clickToShowHide('#comment-input-form-', $(this), 'comment-confirm-button-', false);
		
		if (writtenText == null || writtenText.trim() == '') {
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.comment,
				data: {'writingNo':writingNo, 'commentContents':text},
				dataType: 'text',
				success: function(result) {
					if (result == 'success') {
						AppManager.changeDiv('#subscription-main-board', AppManager.div.subscriptions.community+"?creatorNo="+$('#owner-no-box').val());
						AppManager.changeDiv('#community-allcomment-board-'+no, AppManager.div.subscriptions.comments+"?writingNo="+writingNo+"&ownerNo="+$('#owner-no-box').val())
						AppManager.showAlert('등록완료', '댓글 등록 완료');
					} else {
						AppManager.showAlert('오류발생', '이런.. 댓글 등록 실패..');
					}
				},
				error: function() {
					AppManager.showAlert('오류발생', '이런.. 댓글 등록 실패..');
				}
			})			
		} else {
			var commentNo = $('#written-commentNo-box-'+no).val();
			var commenterNo = $('#written-commenterNo-box-'+no).val();
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.updateComment,
				data: {'writingNo':writingNo, 'commentContents':text, 'commentNo':commentNo, 'commenterNo':commenterNo},
				dataType: 'text',
				success: function(result) {
					if (result != null) {
						AppManager.changeDiv('#community-allcomment-board-'+no, AppManager.div.subscriptions.comments+"?writingNo="+writingNo+"&ownerNo="+$('#owner-no-box').val());
						AppManager.showAlert('등록완료', '댓글 수정 완료');
					} else {
						AppManager.showAlert('오류발생', '이런.. 댓글 수정 실패..');
					}
				},
				error: function() {
					AppManager.showAlert('오류발생', '이런.. 댓글 수정 실패..');
				}
			})
		}
	});
	
	$('[id^=community-showHide-button-div]').on('click', '[id^=community-show-comment-button]', function() {
		var no = getBoardNo($(this), 'community-show-comment-button-');
		var writingNo = $('#community-summary-idbox-'+no).val();
		var userNo = $('#community-user-idbox-'+no).val();
		commentShowHide(no, true);
		AppManager.changeDiv('#community-allcomment-board-'+no, url+"?writingNo="+writingNo+'&ownerNo='+userNo+"&creatorNo="+$('#owner-no-box').val()+"&commentIndex="+commentIndex);
		commentIndex++;
	});
		
	$('[id^=community-showHide-button-div]').on('click', '[id^=community-hide-comment-button]', function() {
		var no = getBoardNo($(this), 'community-hide-comment-button-');
		commentShowHide(no, false);
		$('#community-allcomment-board-'+no).empty();
	});
	
	function removeThumbsClass(no) {
		$('#writing-thumbsup-'+no).removeClass('voted-thumbs');
		$('#writing-thumbsdown-'+no).removeClass('voted-thumbs');
	}
	
	function removeAndAddCount(no, result) {
		removeThumbsClass(no);
		$('#community-like-count-spans-'+no).text(result);
	}
	$('[id^=writing-thumbsup]').click(function() {
		var $this = $(this);
		var no = getBoardNo($(this), 'writing-thumbsup-');
		var writingNo = getWritingNo(no);
		$.ajax({
			type: 'POST',
			url: AppManager.data.subscriptions.thumbs,
			data: {'which':'writing', 'targetNo':writingNo, 'side':'p'},
			dataType: 'text',
			success: function(result) {
				if($this.hasClass('voted-thumbs')) {
					removeAndAddCount(no, result);
					return;
				}
				removeAndAddCount(no, result);
				$this.addClass('voted-thumbs');
			}
		})
	});
	
	$('[id^=writing-thumbsdown]').click(function() {
		var $this = $(this);
		var no = getBoardNo($(this), 'writing-thumbsdown-');
		var writingNo = getWritingNo(no);
		$.ajax({
			type: 'POST',
			url: AppManager.data.subscriptions.thumbs,
			data: {'which':'writing', 'targetNo':writingNo, 'side':'n'},
			dataType: 'text',
			success: function(result) {
				if($this.hasClass('voted-thumbs')) {
					removeAndAddCount(no, result);
					return;
				}
				removeAndAddCount(no, result);
				$this.addClass('voted-thumbs');
			}
		})
	});
	
	$('#community-new-write-button').click(function(event) {
		event.preventDefault();
		AppManager.showConfirm('', writingHtml, function() {
			var writingContents = this.$content.find('#textbox').val();
			
			if (!writingContents.trim()) {
				AppManager.showAlert('오류', '내용이 없습니다..');
				return;
			}
			
			if (writingContents.length > 1000) {
				AppManager.showAlert('오류', '글이 너무 깁니다..');
				return;
			}

			$.ajax({
				type:'POST',
				url: AppManager.data.subscriptions.writing,
				dataType: 'text',
				data: {'writingContents':writingContents},
				success: function(result) {
					AppManager.changeDiv('#subscription-main-board', AppManager.div.subscriptions.community+"?creatorNo="+creatorNo);
				},
				error: function() {
					AppManager.showAlert('오류', '작성 실패. 유효한 환경에서 다시 시도해주세요.');
				},
				complete: function() {
				
				}
			});
			
		}, function() {})
	});
})
</script>
