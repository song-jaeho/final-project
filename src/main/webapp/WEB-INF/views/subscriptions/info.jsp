<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	#info-buttons-td span{
		font-size: large;
		color: #707070;
	}
	
	[id^=info-button] {
		cursor: pointer;
	}
	
	#info-panel-box {
		box-shadow: none;
		border: none;
		background-color: #f3f3f3;
	}
</style>
<div class="col-md-10">
	<div class="row">
		<div class="col-md-7">
			<table class="table">
		  		<tbody>
		  			<tr>
		  				<td>
		  					<h4>설명</h4>
		  					<p>${channelInfo.longDetail }</p>
		  				</td>
		  			</tr>
		  		</tbody>
		  	</table>
		</div>
		<div class="col-md-5">
			<div class="panel panel-danger" id="info-panel-box">
				<div class="panel-heading"><strong>통계</strong></div>
				<table class="table">
					<tbody>
						<tr>
							<th>가입일</th>
							<td>${channelInfo.formattedDate }</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td>${channelInfo.totalViewCount }</td>
						</tr>
						<tr>
							<th></th>
							<td class="text-right" id="info-buttons-td">
								<span class="btn glyphicon glyphicon glyphicon-exclamation-sign" id="info-button-report"></span>
								<span class="btn glyphicon glyphicon-comment" id="info-button-chat"></span>
								<input type="hidden" value="${channelInfo.ownerNo }" id="info-hiddenbox">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="col-md-2">
	<%@ include file="recommendChannels.jsp" %>	
</div>
<script>
$(function() {
	
	var reportHtml = '<form action="" class="formName">' +
					    '<div class="form-group">' +
					    '<label>어떤 점이 마음에 안 드셨나요?</label>' +
					    '<input type="text" placeholder="신고 사유" class="name form-control" required />' +
					    '</div>' +
					    '</form>';
	
	$('[id^=info-button]').hover(function() {
		$(this).css('font-weight', '600').css('color', 'black');
	}, function() {
		$(this).css('font-weight', '').css('color', '');
	});
	
	$('#info-button-report').click(function() {
		AppManager.showConfirm('신고', reportHtml, function() {
		var ownerNo = $('#info-hiddenbox').val();
		var reportContents = this.$content.find('.name').val();
			$.ajax({
				type: 'POST',
				url: AppManager.data.subscriptions.report,
				data: {'criteria':'channel','targetNo':ownerNo, 'reportContents':reportContents},
				dataType: 'text',
				success: function(result) {
					if (result == 'ch') {
						AppManager.showAlert('신고완료', '해당 채널에 대한 신고가 접수되었습니다.');
					} else {
						AppManager.showAlert('오류발생', '신고 처리 실패..');
					}
				},
				error: function() {
					AppManager.showAlert('오류발생', '신고 처리 실패..');
				}
			})
		},function() {})
	});
})
</script>