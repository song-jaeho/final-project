<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<spring:eval expression="@config" var="config" scope="request" />
<style>

	#kyh .tag-values input {
		margin-bottom: 10px;
	}
	
	#kyh .tag-values .col-xs-2 {
		text-align: center;
		vertical-align: middle;
		height: 44px;
		margin: 0px;
		padding: 0px;
	}
	
	#kyh .tag-values span , #kyh .tag-input span {
		text-align: center;
		padding: 5px 30px 0px 0px;
	}
	
	#kyh .tag-values .col-xs-2:hover , #kyh .tag-input .col-xs-2:hover {
		cursor: pointer;
	}
	
	#kyh .tag-values input:hover {
		cursor: inherit;
	}
	
	#kyh .progress-bar-outer {
		position: relative;
		margin: 0px;
		padding: 0px;
		width: 100%;
		height: 10px;
		background-color: #c4b7a6;
	}
	
	#kyh .progress-bar-inner {
		position: absolute;
		margin: 0px;
		padding: 0px;
		width: 100%;
		height: 100%;
		background-color: #c94c4c;
		z-index: 1;
	}
	
	#kyh button {
		font-weight: bold;
	}
	
	#kyh {
		padding-left: 100px;
		padding-top: 50px;
	}
	
	#kyh .fragment {
		margin: 0px;
		padding: 0px;
	}
	
	#kyh .hidden-values {
		display: none;
	}
	
	#kyh .plus-work-row {
		border-bottom: 1px solid rgb(200, 200, 200);
		padding-bottom: 50px;
	}
	
	#kyh #sample-work-group .work-title {
		background-color: #c5d5c5;
	}
	
	#kyh .work-group {
		margin-left: 70px;
		margin-top: 50px;
		padding: 0px;
	}
	
	#kyh .work-group textarea {
		overflow-y: scroll;
		resize: none;
	}
	
	#kyh .separate {
		margin: 0px;
		padding: 10px;
	}
	
	#kyh .div-category {
		padding-top: 0px;
	}
	
	#kyh .work-body {
		display: none;
	}
	
	#kyh .open-close {
		padding-bottom: 30px;
	}
	
	#kyh #sample-work-group {
		display: none;
	}
	
	#kyh .work-title {
		height: 70px;
		background-color: #96897f;
		color: rgb(240, 240, 240);
		cursor: pointer;
	}
	
	#kyh #plus-work-group {
		background-color: #96897f;
		color: rgb(240, 240, 240);
		margin-left: 70px;
		margin-top: 50px;
		padding: 0px;
		cursor: pointer;
	}
	
	#kyh video {
		background-color: black;
	}
	
	#kyh .preview-selector video::-webkit-media-controls-overlay-play-button {
	 	display: none;
	}
	
	#kyh .preview-selector video::-webkit-media-controls-play-button {
		display: none;
	}
	
	#kyh .preview-selector video::-webkit-media-controls-volume-slider {
		display: none;
	}
	
	#kyh .preview-selector video::-webkit-media-controls-mute-button {
		display: none;
	}
	
	#kyh .preview-selector video::-webkit-media-controls-fullscreen-button {
		display: none;
	}
</style>
<div id="kyh" class="container-fluid">
	<!-- tag list -->
	<script type="text/tag-value" id="sample-tag-value">
	<div class="row">
		<div class="col-xs-10">
			<strong>
				<input type="text" class="form-control" name="tagList" readonly/>
			</strong>
		</div>
		<div class="col-xs-2">
			<span class="glyphicon glyphicon-minus"></span>
		</div>
	</div>
	</script>

	<!-- work group base tag start ----------------------------------------------------------------------------------------------------------------->
	<script type="text/sample-work-group" id="sample-work-group">
	<div class="work-group col-xs-3">
		<div class="progress-bar-outer">
			<div class="progress-bar-inner"></div>
		</div>
		<div class="work-title separate">
			<h4>
				<span><strong>동영상 작업 그룹</strong></span>
				<span class="glyphicon glyphicon-chevron-down pull-right open-close"></span>
			</h4>
		</div>
		<form action="${config.fileServerHost }/creator/video-upload" method="post" enctype="multipart/form-data" class="well separate work-body col-xs-12">
			<div class="hidden-values">
				<p class="video-url"></p>
				<input name="videoNo" value="0" />
				<input name="selectedDuration" type="number" step="0.01" value="0" />
				<input name="creatorNo" type="number" value="${LOGIN_USER.no }" />
			</div>
			<div class="form-group">
				<label> 동영상 파일</label>
				<input class="form-control" name="videoFile" type="file" />
			</div>
			<div class="preview-selector" style="display:none;">
				<label><strong> 원하는 미리보기 이미지를 선택하세요</strong></label>
				<div class="form-group" align="center">
					<video onseeked="PreviewSelectorEvents.seeked(this);"
						onplay="PreviewSelectorEvents.play(this);"
						preload="auto;" width="320" height="180" controls>
					</video>
				</div>
			</div>
			<div class="row div-category">
				<div class="form-group col-xs-6">
					<label> 주 카테고리</label>
					<select class="form-control" name="primaryCategoryNo">
						<c:forEach var="category" items="${categories }">
							<option value="${category.no }">${category.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-xs-6">
					<label> 보조 카테고리</label>
					<select class="form-control" name="secondaryCategoryNo">
						<c:forEach var="category" items="${categories }">
							<option value="${category.no }" >${category.name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label> 제목</label>
				<input class="form-control" name="title" type="text" placeholder="제목을 입력하세요">
			</div>
			<div class="form-group">
				<label> 상세 설명</label>
				<textarea class="form-control" name="detail" rows="3" placeholder="내용을 입력하세요"></textarea>
			</div>
				<div class="form-group tag-input">
					<div class="row">
						<div class="col-xs-4">
							<label> 태그 등록</label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-10">
							<input type="text" class="form-control tag-input">
						</div>
						<div class="col-xs-2">
							<span class="glyphicon glyphicon-plus"></span>
						</div>
					</div>
				</div>
				<div class="form-group tag-values"></div>
			<div class="text-right">
				<button class="btn btn-default btn-sx btn-video-submit">제출</button>
				<button class="btn btn-basic btn-sx btn-create-cancel">취소</button>
			</div>
		</form>
	</div>
	</script>
	<!-- work group base tag end ----------------------------------------------------------------------------------------------------------------->

	<div class="row plus-work-row">
		<div id="plus-work-group" class="col-xs-3">
			<div class="separate">
				<h4>
					<span><strong>새 작업 그룹 생성</strong></span><span class="glyphicon glyphicon-plus pull-right"></span>
				</h4>
			</div>
		</div>
	</div>
	<div id="work-group-list" class="hidden">
		<c:forEach var="video" items="${videos }" varStatus="status">
			<c:if test="${status.index % 3 eq 0 }">
				<div class='row work-group-row'>
			</c:if>
			<div class="work-group col-xs-3">
				<div class="progress-bar-outer">
					<div class="progress-bar-inner"></div>
				</div>
				<div class="work-title separate">
					<h4>
						<span><strong>${video.shortTitle }</strong></span>
						<span class="glyphicon glyphicon-chevron-down pull-right open-close"></span>
					</h4>
				</div>
				<form action="${config.fileServerHost }/creator/video-update" method="post" 
					enctype="multipart/form-data" class="well separate work-body col-xs-12">
					<div class="hidden-values">
						<p class="video-url">${video.url }</p>
						<input name="videoNo" value="${video.no }" /> 
						<input name="selectedDuration" type="number" step="0.01" value="-1" />
						<input name="creatorNo" type="number" value="${LOGIN_USER.no }" />
					</div>
					<div class="form-group">
						<label> 동영상 파일</label> 
						<input class="form-control" name="videoFile" type="file" />
					</div>
					<div class="preview-selector">
						<label><strong> 원하는 미리보기 이미지를 선택하세요</strong></label>
						<div class="form-group" align="center">
							<video src="${video.url }" onseeked="PreviewSelectorEvents.seeked(this);"
								onplay="PreviewSelectorEvents.play(this);"
								poster="${video.previewA2Url }"
								width="320" height="180" controls>
							</video>
						</div>
					</div>
					<div class="row div-category">
						<div class="form-group col-xs-6">
							<label> 주 카테고리</label> <select class="form-control" name="primaryCategoryNo">
								<c:forEach var="category" items="${categories }">
									<option value="${category.no }"
										${category.no eq video.primaryCategoryNo ? 'selected' : '' }>${category.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-xs-6">
							<label> 보조 카테고리</label> <select class="form-control" name="secondaryCategoryNo">
								<c:forEach var="category" items="${categories }">
									<option value="${category.no }"
										${category.no eq video.secondaryCategoryNo ? 'selected' : '' }>${category.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label> 제목</label> <input class="form-control" name="title" type="text" placeholder="제목을 입력하세요" value="${video.title }">
					</div>
					<div class="form-group">
						<label> 상세 설명</label>
						<textarea class="form-control" name="detail" rows="3"
							placeholder="내용을 입력하세요">${video.detail }</textarea>
					</div>
					<div class="form-group tag-input">
						<div class="row">
							<div class="col-xs-4">
								<label> 태그 등록</label>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-10">
								<input type="text" class="form-control tag-input">
							</div>
							<div class="col-xs-2">
								<span class="glyphicon glyphicon-plus"></span>
							</div>
						</div>
					</div>
					<div class="form-group tag-values">
						<c:forEach var="tag" items="${video.tagList}">
							<div class="row">
								<div class="col-xs-10">
									<strong>
										<input type="text" class="form-control" name="tagList" value="${tag}" readonly/>
									</strong>
								</div>
								<div class="col-xs-2">
									<span class="glyphicon glyphicon-minus"></span>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="text-right">
						<button class="btn btn-default btn-sx btn-video-update">수정</button>
						<button class="btn btn-basic btn-sx btn-video-delete">삭제</button>
					</div>
				</form>
			</div>
			<c:if test="${status.index % 3 eq 2 || status.end }">
	</div>
	</c:if>
	</c:forEach>
	</div>
</div>
<script>
	var PreviewSelectorEvents = {
		seeked : function(video) {
			var selectedDuration = video.currentTime.toFixed(2);
			var $myForm = $(video).parents('form:eq(0)');
			$myForm.find("input[name='selectedDuration']").val(selectedDuration);
		},

		play : function(video) {
			video.pause();
		}
	};
	$(function() {

		var slideSpeed = 250;

		var fadeSpeed = 250;

		var shortTitleSize = 22;

		var $sampleTagValue = $($('#sample-tag-value').html());
			
		var $sampleWorkGroup = $($('#sample-work-group').html());

		var isContentsLoading = false;
		
		$('.preview-selector video').each(function() {
			var posterUrl = $(this).attr('poster');
			if (posterUrl != null && posterUrl != "") {
				$(this).attr('poster', posterUrl + "&" + (new Date()).getTime()); // 리소스 갱신 강제하기
			}
		});

		$('#work-group-list').removeClass('hidden').hide().slideDown(slideSpeed);

		$('#kyh #plus-work-group').on('click', function() {
			createNewWorkGroup().fadeIn(fadeSpeed);
		});
		
		$('#kyh .tag-values').on('click', 'span', function(){
			$(this).parents('.row:eq(0)').slideUp(slideSpeed, function(){
				$(this).remove();
			});
		});

		$('#kyh').on('keyup', '.tag-input input[type=text]', function(e){

			var keyCode = e.keyCode;
			var commaAscii = '188';
			var backSpaceAscii = '8';
			var $tagInput = $(this);
			
			if(keyCode == commaAscii){
				
				var $tagListDiv = $tagInput.parents('form:eq(0)').find('.tag-values');
				var string = Utils.trimAll($tagInput.val()).replace(',','');
				
				if(string != ''){
					if($tagListDiv.find('input').length >=3){
						AppManager.showAlert('경고','태그는 3개를 초과할 수 없습니다');
						$tagInput.val('');
						return false;
					}
					
					var isExist = false;
					var currentTags = $tagListDiv.find('input').each(function(){
						if(string == $(this).val()){
							AppManager.showAlert('경고','동일한 태그가 이미 존재합니다');
							$tagInput.val('');
							isExist = true;
							return false;
						}
					});
					if(isExist){
						return false;
					}
					
					$tagInput.attr('readonly','readonly');
					var $tag = $sampleTagValue.clone(true, true);
					$tagListDiv.append($tag);
					$tag.find('input').val(string).hide().slideDown(slideSpeed, function(){
						$tagInput.removeAttr('readonly');
					});
				}
				$tagInput.val('');
			}
		});
		
		$('#kyh').on('click', '.work-group .work-title', function() {

			var $spanOpenClose = $(this).find('span.open-close');
			var isOpen = $spanOpenClose.hasClass('glyphicon-chevron-up');
			var $myForm = $(this).siblings('form');

			if (isOpen) {
				$spanOpenClose.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
				$myForm.slideUp(slideSpeed);
			} else {
				$spanOpenClose.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
				$myForm.slideDown(slideSpeed);
			}
		});

		$('#kyh').on('change', 'input[name="videoFile"]', function() {

			var file = this.files[0];
			var $myForm = $(this).parents('#kyh form:eq(0)');
			var $myPreviewSelector = $myForm.find('.preview-selector');

			if (file) {
				var string = file.name.split("\\");
				var fullname = string[string.length - 1];
				
				if(Utils.checkSpace(fullname)){
					AppManager.showAlert('오류','공백을 제거해 주세요');
					return false;
				}
				
				var nameAndExtension = fullname.split(".");
				if (nameAndExtension.length != 2) {
					$myForm.find('input[name=videoFile]').val('');
					AppManager.showAlert('오류','파일 이름은 특수문자가 올 수 없습니다');
					return false;
				}
				
				if (Utils.specialCharCheck(nameAndExtension[0])) {
					$myForm.find('input[name=videoFile]').val('');
					AppManager.showAlert('오류','파일 이름은 특수문자가 올 수 없습니다');
					return false;
				}
				
				if (nameAndExtension[1].toLowerCase() != "mp4") {
					$myForm.find('input[name=videoFile]').val('');
					AppManager.showAlert('오류','mp4 파일을 선택해주세요');
					return false;
				}
				
				var fileUrl = window.URL.createObjectURL(file);

				$myForm.find('video').attr('src', fileUrl);
				$myPreviewSelector.slideDown(slideSpeed);
			} else {
				$myPreviewSelector.slideUp(slideSpeed);
			}
		});


		$('#kyh').on('click', '.btn-video-update', function(event) {
			
			event.preventDefault();
			
			var $myForm = $(this).parents('form:eq(0)');

			var title = $myForm.find('input[name="title"]').val();
			if (title == null) {
				alert("수정할 제목을 입력해주세요.");
				return false;
			} else {
				title = Utils.trimAll(title);
				if (title == "") {
					alert("수정할 제목을 입력해주세요.");
					return false;
				}
			}

			var detail = $myForm.find('textarea[name="detail"]').val();
			if (detail == null) {
				alert("수정할 내용을 입력해주세요.");
				return false;
			} else {
				detail = Utils.trimAll(detail);
				if (detail == "") {
					alert("수정할 내용을 입력해주세요.");
					return false;
				}
			}
			
			AppManager.showConfirm('수정 확인', '해당 내용으로 수정하시겠습니까?', function() {

				var formData = new FormData();
				
				var $workTitle = $myForm.siblings('.work-title').find('strong');
				var $btns = $myForm.find('button').attr('disabled', 'disabled');
				var $myProgressBar = $myForm.siblings('.progress-bar-outer').find('.progress-bar-inner');
				var params = $myForm.serialize().split('&');
				var file = $myForm.find("input[type='file']")[0].files[0];
				if (file != null) {
					formData.append('videoFile', file);
					
				}
				
				$workTitle.fadeOut(fadeSpeed, function() {
					$workTitle.text('업데이트 진행중...');
					$workTitle.fadeIn(fadeSpeed);
				});

				$.each(params, function(i, param) {
					var kv = param.split('=');
					formData.append(kv[0], kv[1]);
				});

				$.ajax({
					url : $myForm.attr('action'),
					type : $myForm.attr('method'),
					enctype : $myForm.attr('enctype'),
					data : formData,
					processData : false, // 파일 전송시 필수
					contentType : false, // 파일 전송시 필수
					xhr : function() {
						var xhr = $.ajaxSettings.xhr();
						xhr.upload.onprogress = function(e) {

							var percentage = 100 * (e.loaded / e.total);
							if (e.lengthComputable) {
								$myProgressBar.css('width', percentage + '%');
							}
						};
						return xhr;
					},
					success : function(video) {
						var shortTitle = Utils.getShortString(shortTitleSize, video.title);
						
						$myForm.find('input[name=videoNo]').val(video.no);
						$myForm.find('input[name="selectedDuration"]').val(-1);
						$myForm.find('input[name=videoFile]').val('');
						$myForm.find('video').attr('poster',video.previewA2Url);
						
						$workTitle.fadeOut(fadeSpeed, function() {
							$workTitle.text(shortTitle);
							$workTitle.fadeIn(fadeSpeed);
						});
					},
					error : function(xhr, text, error) {
						console.log(xhr);
						console.log(text);
						console.log(error);
					},
					complete : function() {
						$btns.removeAttr('disabled');
					}
				});

			}, function() {
				//AppManager.showAlert('취소', '취소 되었습니다.');
			})
		});

		$('#kyh').on('click', '.btn-video-submit', function(event) {
			
			event.preventDefault();
			
			var $myForm = $(this).parents('form:eq(0)');
			
			var title = $myForm.find('input[name="title"]').val();
			if (title == null) {
				alert("제목을 입력해주세요.");
				return false;
			} else {
				title = Utils.trimAll(title);
				if (title == "") {
					alert("제목을 입력해주세요.");
					return false;
				}
			}

			var detail = $myForm.find('textarea[name="detail"]').val();
			if (detail == null) {
				alert("내용을 입력해주세요.");
				return false;
			} else {
				detail = Utils.trimAll(detail);
				if (detail == "") {
					alert("내용을 입력해주세요.");
					return false;
				}
			}
			
			AppManager.showConfirm("제출","해당 내용으로 등록하시겠습니까 ?",function(){

				var formData = new FormData();
				
				var $workTitle = $myForm.siblings('.work-title').find('strong');
				var $btns = $myForm.find('button').attr('disabled', 'disabled');
				var $myProgressBar = $myForm.siblings('.progress-bar-outer').find('.progress-bar-inner');
				var params = $myForm.serialize().split('&');
				var file = $myForm.find("input[type='file']")[0].files[0];
				formData.append('videoFile', file);
				
				$workTitle.fadeOut(fadeSpeed, function() {
					$workTitle.text('업로드 진행중...');
					$workTitle.fadeIn(fadeSpeed);
				});

				$.each(params, function(i, param) {
					var kv = param.split('=');
					formData.append(kv[0], kv[1]);
				});

				$.ajax({
					url : $myForm.attr('action'),
					type : $myForm.attr('method'),
					enctype : $myForm.attr('enctype'),
					data : formData,
					processData : false, // 파일 전송시 필수
					contentType : false, // 파일 전송시 필수
					xhr : function() {
						var xhr = $.ajaxSettings.xhr();
						xhr.upload.onprogress = function(e) {

							var percentage = 100 * (e.loaded / e.total);
							if (e.lengthComputable) {
								$myProgressBar.css('width', percentage + '%');
							}
						};
						return xhr;
					},
					success : function(video) {
						var shortTitle = Utils.getShortString(shortTitleSize, video.title);
						$myForm.attr('action', "${config.fileServerHost }/creator/video-update");
						
						$myForm.find('input[name=videoNo]').val(video.no);
						$myForm.find('input[name=selectedDuration]').val(-1);
						$myForm.find('input[name=videoFile]').val('');
						$myForm.find('video').attr('poster',video.previewA2Url);

						$workTitle.fadeOut(fadeSpeed, function() {
							$workTitle.text(shortTitle);
							$workTitle.fadeIn(fadeSpeed);
						});

						$myForm.find('.btn-video-submit')
							.removeClass('btn-video-submit')
							.addClass('btn-video-update')
							.text('수정');
						$myForm.find('.btn-create-cancel')
							.removeClass('btn-create-cancel')
							.addClass('btn-video-delete')
							.text('삭제');
					},
					error : function(xhr, text, error) {
						console.log(xhr);
						console.log(text);
						console.log(error);
					},
					complete : function() {
						$btns.removeAttr('disabled');
					}
				});
				
			}, function(){
				
			});
		});

		$('#kyh').on('click', '.btn-video-delete', function(event) {
			event.preventDefault();
			var $btn = $(this);

			AppManager.showConfirm('삭제확인', '삭제하시겠습니까?', function() {
				
				var $myForm = $btn.parents('form:eq(0)');
				var $btns = $myForm.find('button').attr('disabled', 'disabled');
				var $workGroup = $btn.parents('.work-group:eq(0)');
				var $workGroupRow = $workGroup.parents('.work-group-row:eq(0)');
				var videoNo = $myForm.find('.hidden-values input[name=videoNo]').val();
				
				$.ajax({
					url : '${config.fileServerHost }/creator/video-delete?vno=' + videoNo,
					success: function(result){
						if(result == "success"){
							$myForm.slideUp(slideSpeed, function() {
								$workGroup.fadeOut(fadeSpeed, function() {
									$(this).remove();

									$workGroupRow.nextAll().each(function() {
										var $prevRow = $(this).prev('.work-group-row');
										$prevRow.append($(this).find('.work-group').first());
									});

									$('.work-group-row').each(function() {
										var childSize = $(this).find('.work-group').length;
										if (childSize == 0) {
											$(this).remove();
										}
									});
								});
							});
						} else {
							AppManager.showAlert("오류", "알 수 없는 오류가 발생했습니다");
						}
					},
					fail: function(){
						
					},
					complete: function(){
						
					}
				});
			}, function() {
				//AppManager.showAlert('취소', '취소 되었습니다');
			});
		});

		$('#kyh').on('click', '.btn-create-cancel', function(event) {
			event.preventDefault();
			var $btn = $(this);
			
			AppManager.showConfirm('업로드 취소','동영상 업로드를 취소하시겠습니까 ?', function(){
				var $workGroup = $btn.parents('.work-group:eq(0)');
				var $workGroupRow = $workGroup.parents('.work-group-row:eq(0)');
				var $myForm = $btn.parents('form:eq(0)');

				$myForm.slideUp(slideSpeed, function() {
					$workGroup.fadeOut(fadeSpeed, function() {
						$(this).remove();

						$workGroupRow.nextAll().each(function() {
							var $prevRow = $(this).prev('.work-group-row');
							$prevRow.append($(this).find('.work-group').first());
						});

						$('.work-group-row').each(function() {
							var childSize = $(this).find('.work-group').length;
							if (childSize == 0) {
								$(this).remove();
							}
						});
					});
				});
			}, function(){});
		});

		function createNewWorkGroup() {

			var $workGroupList = $('#kyh #work-group-list');
			var $newWorkGroup = $sampleWorkGroup.clone(true, true);
			$newWorkGroup.find('.progress-bar-inner').css('width', '0%');
			$newWorkGroup = $newWorkGroup.removeAttr('id').hide();

			var $firstRow = $workGroupList.find('.work-group-row:eq(0)');
			if(!$firstRow.length){
				$workGroupList.append("<div class='row work-group-row'></div>");
				$firstRow = $workGroupList.find('.work-group-row:eq(0)');
			}
			
			$firstRow.prepend($newWorkGroup);
			$workGroupList.find('.work-group-row').each(function(){
				if($(this).find('.work-group').length >= 3){
					var $nextRow = $(this).next('.work-group-row');
					if(!$nextRow){
						$workGroupList.append("<div class='row work-group-row'></div>");
						$nextRow = $(this).next('.work-group-row');
					}
					$nextRow.prepend($(this).find('.work-group:last-child'));
				}
			});
			return $newWorkGroup;
		}
	});
</script>