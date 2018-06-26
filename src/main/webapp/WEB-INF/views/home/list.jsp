<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="/js/AppManager.js"></script>
<script src="/js/Utils.js"></script>
<style> 
	
	#side-bar {
		padding-left: 25px;
		padding-top: 10px;
        position: fixed;
        top:50px;
		width: 235px;
        height: 100%;
        left: 0px;
        overflow-y: auto;
        background-color: rgb(238,238,238);
	}
	
	#navbar {
		background-color: rgb(252,252,252);
	}
	
	#main-contents {
		background-color: rgb(243,243,243);
		width: 1685px;
		height: 880px;
		margin: 0px;
		padding: 0px;
		overflow-y: scroll;
	}
	
	#side-bar hr {
	    display: block;
	    height: 1px;
	    border: 0;
	    border-top: 1px solid rgb(200,200,200);
	    margin: 1em 0;
	    padding: 0; 
	}
	
    #side-bar a {
        color : black;
    }
	
	#screen {
		overflow: hidden;
		width: 1920px;
		height: 930px;
		margin: 0px;
		padding: 0px;
	}
	
	#foot-container {
		overflow: hidden;
		width: 1920px;
		height: 880px;
		margin: 0px; 
		padding: 0px;
	}
	
	#top-nav {
		overflow: hidden;
		width: 1920px;
		height: 50px;
		margin: 0px;
		padding: 0px;
	}
	
	#left-nav {
		overflow: hidden;
		width: 235px;
		height: 880px;
		margin: 0px;
		padding: 0px;
		float: left; 
	}

	#top-nav-search-form {
		margin-left: 550px; 
	}
	
	#top-nav-search-form input {
		width: 500px;
	}
	
	#membership-id-able, #membership-nick-able{
		color: #7cb2a4;
	}
	
	.list-icon {
		color: gray; 
		margin-right: 25px; 
		font-size: 17px;
	}

	/* The container */
.playlist-container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 18px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default checkbox */
.playlist-container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
}

/* On mouse-over, add a grey background color */
.playlist-container:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.playlist-container input:checked ~ .checkmark {
    background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.playlist-container input:checked ~ .checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.playlist-container .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}

.subscription-list-buttons img {
	width: 28px; 
	height: 28px; 
	margin-right: 12px;
}

.thumbnail {
	background-color: rgb(243,243,243);
}
</style> 
</head> 
<body>
<input id="playlist-no" type="hidden" value=""/>
<input id="pjs-video-no" type="hidden" value=""/>
<input id="pjs-video-src" type="hidden" value=""/>
<input id="login-user-hidden-box" type="hidden" value="${LOGIN_USER.no }">
<div id="screen" class="container">
	<div id="top-nav" class="row">
	    <nav class="navbar navbar-default navbar-fixed-top" style="z-index: 10;">
	      <div class="container-fluid">
	        <div id="navbar-header" class="navbar-header">
	          <a class="navbar-brand" href="#"><img style="top: 10px" src="/resources/temp/junsung/images/duck_logo.png" width="125px" height="30px"/></a>
	           <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	        </div>
	        <div id="navbar" class="navbar-collapse collapse">
	          <form id="top-nav-search-form" class="navbar-form navbar-left" role="search">
	            <div class="form-group">
	              <input type="text" name="keywords" class="form-control" placeholder="Search">
	            </div>
	            <button type="submit" class="btn btn-default">검색</button>
	          </form>
	          <ul class="nav navbar-nav navbar-right">
	          <c:choose>
	          	<c:when test="${empty LOGIN_USER }">
	          		<li><a href="#" id="membership-join-button">회원 가입</a></li>
	          		<li><a id="btn-login" href="#">로그인</a></li>
	          	</c:when>
	          	<c:otherwise>
	          		<li><a id="btn-movie-upload-form" href="#"><span class="glyphicon glyphicon-facetime-video list-icon"></span></a></li>
	          		<li><a href="#" style="padding: 0px; line-height: 50px">
	          			<img src="${LOGIN_USER.profileSmallImgUrl }" class="img-circle" width="35px" height="35px" style="vertical-align: middle;"
	          			id="login-user-mini-profile"/>
	          		</a></li>
		            <li class="dropdown">
		              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		              	${LOGIN_USER.nick }<span class="caret"></span>
		              </a>
		              <ul class="dropdown-menu" role="menu">
		                <li class="divider"></li>
		                <li class="dropdown-header">설정</li>
		                <li><a href="#"><span class="glyphicon glyphicon-cog list-icon"></span>설정</a></li>
		                <li><a href="#"><span class="glyphicon glyphicon-question-sign list-icon"></span>고객센터</a></li>
		                <li><a href="#"><span class="glyphicon glyphicon-exclamation-sign list-icon"></span>의견보내기</a></li>
		                <li><a href="#" id="logout-btn"><span class="glyphicon glyphicon-log-out list-icon"></span>로그아웃</a></li>
		              </ul>
		            </li>
	          	</c:otherwise>
	          </c:choose>	
	          </ul>
	        </div>
	      </div>
	    </nav>
	</div>
	<div id="foot-container" class="row">
		<div id="left-nav">
		    <aside class="container-fluid" id="side-bar">
		     <div class="row">
		          <ul class="nav nav-sidebar">
					  <li class="active">
					  	<a href="#" id="btn-home-list"><span class="glyphicon glyphicon-home list-icon"></span>
					  		홈 <span class="sr-only">(current)</span></a>
					  </li>
					  <li><a id="btn-home-popular" href="#">
					  	  <span style="color:${menu eq 'popular'? 'tomato':'gray'};" class="glyphicon glyphicon-fire list-icon"></span>
					    	인기
					  </a></li>
					  <c:if test="${not empty LOGIN_USER }">
					  	<li><a id="btn-home-subscription" href="#"><span class="glyphicon glyphicon-inbox list-icon"></span>
					  		구독
					  	</a></li>
					  </c:if>
		          </ul>
		          <c:if test="${not empty LOGIN_USER }">
			          <hr/>
			          <h5>라이브러리</h5>
			          <ul id="library-menu" class="nav nav-sidebar">
			            <li><a id="btn-history" href="#"><span class="glyphicon glyphicon-repeat list-icon"></span>최근 본 동영상</a></li>
			            <li><a id="btn-watch-later" href="#"><span class="glyphicon glyphicon-time list-icon"></span>나중에 볼 동영상</a></li>
			            <li><a id="btn-likes-movies" href="#"><span class="glyphicon glyphicon-thumbs-up list-icon"></span>좋아요 한 동영상</a></li>
			            <c:choose>
			            	<c:when test="${empty playlist }">
			            		<li><a id="btn-playlist-0" href="#"><span class="glyphicon glyphicon-align-justify list-icon"></span>재생목록</a></li>
			            	</c:when>
			            	<c:otherwise>
			            		<li><a href="#" id="side-pl-plus"><span class="glyphicon glyphicon-menu-down list-icon"></span>재생목록보기</a></li>
			            		<div id="side-pl-menu" style="display: none; margin-left:15px;">
			            		<c:forEach var="list" items="${playlist }">
			            			<li><a id="btn-playlist-${list.playlistNo }" href="#">
			            				<span class="glyphicon glyphicon-align-justify list-icon"></span>${list.playlistTitle}
			            			</a></li>
			            		</c:forEach>
			            		</div>
			            	</c:otherwise>
			            </c:choose>
			          </ul>
			          <hr/>
			          <h5>구독</h5>
			          <ul class="nav nav-sidebar" id="subscription-list-ul" style="padding-bottom: 50px;">
			            <li id="subscriptionlist-total-button"><a id="btn-subscriptions" href="#"><span class="glyphicon glyphicon-inbox list-icon"></span>구독</a></li>
			            <c:forEach items="${subscriptionList }" var="subscription" varStatus="subscriptionListVarStatus">
			            	<c:if test="${not empty subscription and subscriptionListVarStatus.count le 7 }">
			            		<li style="cursor: pointer;" id="subscription-list-li-${subscriptionListVarStatus.count }">
			            			<a class="subscription-list-buttons" id="subscription-list-button-${subscriptionListVarStatus.count }">
			            			<input type="hidden" value="${subscription.ownerNo }" id="subscription-list-hiddenbox-${subscriptionListVarStatus.count }">
			            				<img alt="mini-profile" src="${subscription.userImgUrl }" class="img-circle">
			            				<span style="padding-left: 5px;">	            				
			            					<c:choose>
												<c:when test="${fn:length(subscription.title) gt 8 }">
													<c:out value="${fn:substring(subscription.title, 0, 8) }"></c:out>
													...
												</c:when>
												<c:otherwise>
													<c:out value="${subscription.title }"></c:out>
												</c:otherwise>
											</c:choose>				            				
			            				</span>
			            				<c:if test="${subscription.unsightVideoCount ne 0 }">
				            				<span class="badge pull-right">${subscription.unsightVideoCount }</span>		            				
			            				</c:if>
			            			</a>
			            		</li>
			            	</c:if>
			            </c:forEach>
			          </ul>
			          <c:if test="${subscriptionListLength gt 7 }">
				      <ul class="nav nav-sidebar" id="subscriptionlist-showbutton-ul" style="padding-bottom: 50px;">
				          <li>
				          	<a href="#" id="subscriptionlist-showmore-button">
				          		<span class="glyphicon glyphicon-chevron-down" style="padding-left: 7px; padding-right: 19px;"></span> 
				          		show ${subscriptionListLength - 7 } more
				          	</a>
				          </li>  
				      </ul>			          
			          </c:if>
		          </c:if>
		        </div>
		    </aside>
		</div>
		<div id="main-contents"></div>
	</div>
	<!-- Modal -->
	  <div class="modal fade" id="membership-modal" role="dialog">
    	<div class="modal-dialog">
    
	      	<!-- Modal content-->
	      	<div class="modal-content">
	        	<div class="modal-header">
	          		<button type="button" class="close" data-dismiss="modal">&times;</button>
	          		<h4 class="modal-title">회원 가입 (체크는 필수 입력사항입니다.)</h4>
	        	</div>
	        	<div class="modal-body">
	          		<form action="#" id="membership-form">
	          			<div class="form-group">
	          				<label>아이디(이메일) <span id="membership-id-able">사용 가능한 아이디</span> <span class="glyphicon glyphicon-ok"></span> </label>
	          				<input type="email" class="form-control" name="email" />
	          			</div>
	          			<div class="form-group">
	          				<label>이름 <span class="glyphicon glyphicon-ok"></span> </label>
	          				<input type="text" class="form-control" name="name" />
	          			</div>
	          			<div class="form-group">
	          				<label>닉네임 <span id="membership-nick-able">사용 가능한 닉네임</span> <span class="glyphicon glyphicon-ok"></span> </label>
	          				<input type="text" class="form-control" name="nickname" />
	          			</div>
	          			<div class="form-group">
	          				<label>비밀 번호 <span class="glyphicon glyphicon-ok"></span> </label>
	          				<input type="password" class="form-control" name="password" />
	          			</div>
	          			<div class="form-group">
	          				<label>주소 <span class="glyphicon glyphicon-ok"></span> </label>
	          				<input type="text" class="form-control" name="address" />
	          			</div>
	          			<div class="form-group">
	          				<label>자기소개</label>
	          				<textarea rows="3" cols="1" name="introduce" class="form-control" id="introduce-textarea"></textarea>
	          			</div>
	          			<div class="form-group">
	          				<label>전화번호</label>
	          				<input type="text" class="form-control" name="phone" />
	          			</div>
	          			<div class="form-group">
	          				<label>성별</label>
	          				<label class="radio-inline">
								<input type="radio" name="gender" value="남" checked="checked"> 남
							</label>
							<label class="radio-inline">
							  	<input type="radio" name="gender" value="여"> 여
							</label>
	          			</div>
	          			<div class="form-group">
	          				<label>생년원일</label>
	          				<input type="date" name="birthday" class="form-control" />
	          			</div>
	          		</form>
	        	</div>
	        	<div class="modal-footer">
	          		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	          		<button type="button" class="btn btn-primary" id="membership-form-confirm-button">확인</button>
	        	</div>
	      	</div>
	      
	    </div>
  	</div>
  	
  	<!-- login modal -->
  	<div id="login-modal" class="modal fade" role="dialog">
  		<div class="modal-dialog">
  			<!-- modal content -->
  			<div class="modal-content">
  				<div class="modal-header">
  					<button class="close" data-dismiss="modal">&times;</button>
  					<h4 class="modal-title">로그인</h4>
  				</div>
  				<div class="modal-body">
  					<form id="login-form" action="list" method="post">
  						<div class="form-group">
  							<label>이메일</label>
  							<input type="email" class="form-control" name="loginEmail" value="duck@naver.com"/>
  						</div>
  						<div class="form-group">
  							<label>비밀번호 입력</label>
  							<input type="password" class="form-control" name="loginPwd" value="zxcv1234"/>
  						</div>
  					</form>
  				</div>
  				<div class="modal-footer">
  					<button class="btn btn-success" id="login-btn">로그인</button>
  					<button class="btn btn-default" data-dismiss="modal">닫기</button>
  				</div>
  			</div>
  		</div>
  	</div>
  	
  	<!-- Insert PlayList Modal -->
    <div id="playlist-modal" class="modal fade" role="dialog">
    	<div class="modal-dialog">
    		<!-- Modal content -->
    		<div class="modal-content">
    			<div class="modal-body" id="playlist-modalbody">
    				<h3 style="margin-bottom: 40px;">추가할 위치 . . .</h3>
    				<form id="video-insert-form">
    						<div id="pl-modal-wrapper">
    							<label id="pl-modal-${list.playlistNo }" class="playlist-container">${list.playlistTitle }
									 <input type="checkbox" name="playlistGroup" value="${list.playlistNo }"/>
									 <span class="checkmark"></span>
								</label>
    						</div>
							<div id="plus-btn" class="text-right">
								<button id="video-add-btn" type="reset" class="btn btn-primary" data-dismiss="modal">추가</button>
								<button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
							<input id="playlist-video" type="hidden" name="videoNo" value=""/>
							<input id="video-src" type="hidden" name="preview" value=""/>
    					
    				</form>
    			</div>
    			<div class="modal-footer">
    				<p>
    					<button id="playlist-new" class="btn btn-link">
    						<span class="glyphicon glyphicon-plus"></span> 새로만들기
    					</button>
    				</p>
    				<div style="display: none" id="make-btns">
    					<form id="playlist-form">
	    					<div id="make-name" class="form-group">
		    					<label class="pull-left">이름</label>
		    					<input type="text" name="playlistName" class="form-control"/>
		    				</div>
		    				<div class="form-group">
	    						<label class="pull-left">개인정보보호</label>
	    						<select class="form-control" name="playlistStatus">
	    							<option value="enabled" selected>공개</option>
	    							<option value="disabled">비공개</option>
	    						</select>
	    					</div>
		    				<div id="make-btn" class="text-right">
								<button id="playlist-add-btn" type="reset" class="btn btn-primary" data-dismiss="modal">생성</button>
								<button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
						</form>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    
    <!-- Insert watch later modal -->
    <div id="watchlater-modal" class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">나중에 볼 동영상에 추가하시겠습니까?</h4>
	        </div>
	        <div class="modal-body">
	          <button id="watchlater-add" class="btn btn-primary" data-dismiss="modal">확인</button>
    		  <button class="btn btn-secondary" data-dismiss="modal">취소</button>
	        </div>
	      </div>
	    </div>
	</div>
    
</div>
</body>
<script>
$(function(){ 
	
	var $contentsDiv = $('#main-contents');
	var requestURL = '${divURL}';

	AppManager.setMainDiv($contentsDiv);
	AppManager.changeMainDiv(requestURL);

	window.onbeforeunload = function(event){
		AppManager.saveRecentURL();
	};
	
//---------------------------------------------------------------------------------------------	
	
	var plusPlay = '<span class="glyphicon glyphicon-plus"></span> 새로만들기';
	var minusPlay = '<span class="glyphicon glyphicon-minus"></span> 닫기';
	
	function addWatchLater(){
		$.ajax({
			type:"POST",
			url:"/home/watchlaterInsert",
			data:{videoNo : $("#pjs-video-no").val()},
			success: function(result){
				console.log(result);
				if(result == "fail"){
					alert("이미 있는 동영상입니다.");
					return;
				}
			}
		});
	}
	
	//플레이리스트 목록 클릭
	$("#side-pl-plus").click(function(){
		$("#side-pl-menu").toggle();
	});
	
	$('#login-user-mini-profile').click(function() {
		if ($('#login-user-hidden-box').val() == null) {
			return;
		}
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+parseInt($('#login-user-hidden-box').val()));
	});
	
	//모달이 열릴때
	$("#playlist-modal").on("show.bs.modal", function(){
		var vno = $("#pjs-video-no").val();
		//console.log("모달일열린다. 리스트 초기화 체크 표시 no: " + vno);
		$.ajax({
			type:"GET",
			url:"/home/plModalOpenEvent",
			dataType:"json",
			data:{videoNo: vno},
			success:function(result){
				console.log(result);
				var isSuccess =result.success;
				var playlist = result.playlist;
				$("#pl-modal-wrapper").empty();
				if(!isSuccess){
					$("#pl-modal-wrapper").append("<p>재생목록이 없습니다.</p>");
					$("#video-add-btn").hide();
				} else {
					$.each(playlist, function(index, item){
						$("#video-add-btn").show();
						$("#pl-modal-wrapper").append(playlistModalHtml(item));
					});
				}
			}
		});
	});
	
	//플레이리스트 모달이 닫힐때 
	$("#playlist-modal").on("hide.bs.modal", function(){
		$("#make-btns").hide();
		$("#playlist-modalbody input").prop("disabled", false).prop("checked", false);
		$("#plus-btn").show();
		$("#playlist-new").empty().append(plusPlay); 
	});
	
	//나중에 볼 동영상 추가
	$("#watchlater-add").click(function(){
		//console.log("나중에 볼 동영상에 추가할 비디오No: " + $("#pjs-video-no").val());
		addWatchLater();
	});
	
	//플레이리스트 새로만들기 클릭
    $("#playlist-new").click(function(){
		if($("#make-btns").css('display')=='none'){
			$("#make-btns").show();
			$("#playlist-modalbody input").prop("disabled", true).prop("checked", false);
			$("#plus-btn").hide();
			$("#playlist-new").empty().append(minusPlay);
		} else {
			$("#make-btns").hide();
			$("#playlist-modalbody input").prop("disabled", false);
			$("#plus-btn").show();
			$("#playlist-new").empty().append(plusPlay);
		}
    });
	
  	//플레이리스트 생성
	$("#playlist-add-btn").click(function(){
		//console.log("플레이리스트이름: " + $("[name=playlistName]").val());
		//console.log("개인정보: "+ $("[name=playlistStatus]").val());
		if(!($("#btn-playlist-0").css("display")=="")){
			$("#btn-playlist-0").css("display","none");
			//$("#library-menu").append(playlistMenuBogi());
		}
		$.ajax({
			type: "POST",
			url: "/home/playlistInsert",
			data: $("#playlist-form").serialize(),
			dataType: "json",
			success: function(result){
				console.log(result);
				
				var lastList = result.list[0];
				$("#side-pl-menu").prepend(playlistHtml(lastList));
				
				
				//$("#video-insert-form").prepend(playlistModalHtml(lastList));
			}
		});
	});
  	
	//플레이리스트에 비디오 추가
	$("#video-add-btn").click(function(){
		var videoNo = $("#pjs-video-no").val();
		var preview = $("#pjs-video-src").val();
		
		$("#playlist-video").val(videoNo);
		$("#video-src").val(preview);
		//console.log("비디오리스트에 추가할 비디오 No: " + $("#playlist-video").val());
		$.ajax({
			type: "POST",
			url: "/home/videosInsert",
			data: $("#video-insert-form").serialize()
			
		});
	});
	
	function playlistMenuBogi(){
		var row = '<li><a href="#" id="side-pl-plus"><span class="glyphicon glyphicon-menu-down list-icon"></span>재생목록보기</a></li>'
			+'<div id="side-pl-menu" style="display: none; margin-left:15px;">'
			+'</div>';
		return row;
	}
	
	function playlistHtml(item){
		var row = '<li><a id="btn-playlist-'+item.playlistNo+'" href="#">'
			+'<span class="glyphicon glyphicon-align-justify list-icon"></span>'+item.playlistTitle
			+'</a></li>';
		return row;
	}
	
	function playlistModalHtml(item){
		var row = '<label id="pl-modal-'+item.playlistNo+'" class="playlist-container">'+item.playlistTitle
		 			+'<input type="checkbox" name="playlistGroup" value="'+item.playlistNo+'" '+(item.checkPlaylistVideo != null?"checked":"")+'/>'
			 		+'<span class="checkmark"></span>'
				 +'</label>';
		return row;
	}
	
	//로그아웃 버튼클릭
	$("#logout-btn").click(function(){
		console.log("logout btn click!")
		$.ajax({
			url:"/home/logout",
			success:function(result){
				window.location.reload();
			},
			error:function(result){
				console.log("logout fail");
			}
		});
	});
	
	//로그인 버튼 클릭
	$("#login-btn").click(function(event){
		event.preventDefault();
		
		if($("[name=loginEmail]").val()==''){
			alert('이메일을 입력하세요!');
			$("[name=loginEmail]").focus();
			return;
		}
		if($("[name=loginPwd]").val()==''){
			alert('비밀번호를 입력하세요!');
			$("[name=loginPwd]").focus();
			return;
		}

		$.ajax({
			type:"POST",
			url:"/home/login",
			data:$("#login-form").serialize(),
			success:function(result){
				console.log('result : ' + result);
				if(result=="error"){
					alert("error 아이디 또는 비밀번호가 틀렸습니다.");
					$("[name=loginEmail]").val('');
					$("[name=loginPwd]").val('');
					$("[name=loginEmail]").focus();
					return;
				}
				console.log("login success");
				window.location.reload();
			},
			error:function(result){
				
			}
		});
	});
	
	//LOGIN 모달이 닫힐때 이벤트
	$("#login-modal").on("hide.bs.modal", function(){
		$("[name=loginEmail]").val('');
		$("[name=loginPwd]").val('');
	});
	
	$('#btn-history').click(function(event){
		event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.library.history);
	});
	
	$('#btn-likes-movies').click(function(event){
		event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.library.likesMovies);
	});

	$('#subscription-list-ul').on('click', '#btn-subscriptions', function(event) {
		event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.subscriptions.subscribe);
	});
	
	$('#subscription-list-ul').on('click', '[id^=subscription-list-button]', function(event) {
		event.preventDefault();
		var thisNo = $(this).attr('id').replace('subscription-list-button-', '');
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+$('#subscription-list-hiddenbox-'+thisNo).val());
	});
	
	$('#subscriptionlist-showbutton-ul').on('click', '[id^=subscriptionlist-showmore]', function(event) {
		event.preventDefault();
		var $this = $(this);
		if ($(this).attr('id').includes('cansle')) {
			$.ajax({
				type:'POST',
				url:'/home/sublistShowMore',
				data: {'which':'hide'},
				dataType: 'json',
				success: function(result) {
					$('#subscription-list-ul').empty().append('<li id="subscriptionlist-total-button"><a id="btn-subscriptions" href="#"><span class="glyphicon glyphicon-inbox list-icon"></span>구독</a></li>');
					result.sublist.forEach(function(item, index) {
						var newHtml = AppManager.makeSubListHtml(index+1, item.ownerNo, item.userImgUrl, item.title, item.unsightVideoCount);
						$('#subscriptionlist-total-button').after(newHtml);
					})
					$('#subscriptionlist-showbutton-ul').append('<li>'+
			          	'<a href="#" id="subscriptionlist-showmore-button">'+
			          		'<span class="glyphicon glyphicon-chevron-down" style="padding-left: 7px; padding-right: 19px;"></span>'+ 
			          		'show '+result.totalLength+' more'+
			          	'</a>'+
			          '</li>');
					$this.remove();
				}
			});
		} else {
			$.ajax({
				type:'POST',
				url:'/home/sublistShowMore',
				data: {'which':'show'},
				dataType: 'json',
				success: function(result) {
					$('#subscription-list-ul').empty().append('<li id="subscriptionlist-total-button"><a id="btn-subscriptions" href="#"><span class="glyphicon glyphicon-inbox list-icon"></span>구독</a></li>');
					result.sublist.forEach(function(item, index) {
						var newHtml = AppManager.makeSubListHtml(index+1, item.ownerNo, item.userImgUrl, item.title, item.unsightVideoCount);
						$('#subscriptionlist-total-button').after(newHtml);
					})
					$('#subscriptionlist-showbutton-ul').append('<li>'+
			          	'<a href="#" id="subscriptionlist-showmore-button-cansle">'+
			          		'<span class="glyphicon glyphicon-chevron-up" style="padding-left: 7px; padding-right: 19px;"></span>'+ 
			          		'간략히 보기'+
			          	'</a>'+
			          '</li>');
					$this.remove();
				}
			});
		}
	});
	
	//로그인 버튼 클릭시 모달 보여주기.
	$('#btn-login').click(function(event){
		event.preventDefault();
		$("#login-modal").modal("show");
		//AppManager.changeMainDiv(AppManager.div.user.loginForm);
	});

	$('#btn-home-subscription').click(function(event){
		event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.home.subscription+"?userNo=${LOGIN_USER.no}");
	});
	
	$('#btn-home-list').click(function(event){
		event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.home.home);
	});
	
	$('#membership-join-button').click(function() {
		$('#membership-modal').modal('show');
		$('#introduce-textarea').val('간단한 자기소개를 입력해주세요.');
	});
	
	$('#membership-form-confirm-button').click(function() {
		var user = {
			email : $('[name=email]').val(),
			name : $('[name=name]').val(),
			nick : $('[name=nickname]').val(),
			password : $('[name=password]').val(),
			address : $('[name=address]').val(),
			shortIntroduce : $('[name=introduce]').val(),
			phone : $('[name=phone]').val(),
			gender : $('[name=gender]').filter(':checked').val(),
			birthday : $('[name=birthday]').val()
		};
		if (!user.email || !user.name || !user.nick || !user.password || !user.address) {
			alert('필수 값(체크 표시된 값)은 반드시 입력해야 합니다.');
			return;
		}
		$.ajax({
			type:'POST',
			url: '/user/membership',
			data: JSON.stringify(user),
			contentType: 'application/json',
			dataType: 'json',
			success: function(result) {
				if (result) {
					$('#membership-modal').modal('hide');					
				}
			}, error : function(result) {
				alert('가입 실패 : 유효한 값을 입력해주세요');
			}
		})
	});
	
	$('#membership-modal').on('hide.bs.modal', function() {
		$('[name=email]').val('');
		$('[name=name]').val('');
		$('[name=nickname]').val('');
		$('[name=password]').val('');
		$('[name=address]').val('');
		$('[name=introduce]').val('');
		$('[name=phone]').val('');
		$(':radio').val('');
		$('[name=birthday]').val('');
	});
	
	$('[name=email]').on('keyup', function() {
		if (!$(this).val()) {
			return;
		}
		$.ajax({
			type:'POST',
			url: '/user/emailCheck',
			data: $(this).val(),
			contentType: 'application/json',
			dataType: 'json',
			success: function(result) {
				if (result) {
					$('#membership-id-able').css('color', 'red').text('존재하는 아이디입니다.');
				}
			}, 
			error: function() {
				$('#membership-id-able').css('color', '#7cb2a4').text('사용 가능한 아이디');
			}
		})
	});
	
	$('[name=nickname]').on('keyup', function() {
		if (!$(this).val()) {
			return;
		}
		$.ajax({
			type:'POST',
			url: '/user/nicknameCheck',
			data: $(this).val(),
			contentType: 'application/json',
			dataType: 'json',
			success: function(result) {
				if (result) {
					$('#membership-nick-able').css('color', 'red').text('존재하는 닉네임입니다.');
				}
			},
			error: function() {
				$('#membership-nick-able').css('color', '#7cb2a4').text('사용 가능한 닉네임');
			}
		})
	});

	$('#introduce-textarea').click(function() {
		$(this).val('');
	});
	
	$('#btn-home-popular').click(function(event){
		event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.home.popular);
	});

	$('#btn-movie-upload-form').click(function(event){
		event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.creator.movieUploadForm);
	});
	
	$('#btn-watch-later').click(function(event){
		event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.library.watchLater);
	});
	
	$("#library-menu").on("click", "[id^=btn-playlist]", function(){
		event.preventDefault();
		var plno = $(this).attr("id").replace("btn-playlist-","");
		//console.log("aa: "+plno);
		$("#playlist-no").val(plno);
		AppManager.changeMainDiv(AppManager.div.library.playList+"?plno="+plno);
	});
	
	$('#top-nav-search-form input[name=keywords]').on('click', function(){
		$(this).select();
	});
	
	$('#top-nav-search-form').submit(function(event){
		event.preventDefault();

		var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		var data = $(this).find('input').val();
		data = data.replace(regExp, "");

		if(!Utils.trimAll(data)){
			//requestable = true;
			//return;
		} 

		$(this).find('input').val(data);

		if($('#btn-fake-submit').length){
			$('#btn-fake-submit').trigger('click');
		} else {
			AppManager.changeMainDiv(AppManager.div.home.search);
		}
	});
	
});
</script>
</html>