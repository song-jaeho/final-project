<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<style>
 	#end-video-div {
        top: 0px; 
        width: 854px; 
        height: 450px; 
        position: absolute; 
        visibility: hidden;
    }
    #black-EVD {
        position: absolute; 
        background-color: black; 
        width: 854px; 
        height: 480px; 
        opacity: 0.7; 
    }
    /*영상 */
    #myVideo {
        position: relative; 
        z-index: 0;
        background-color: black;
    }
    #custom-playlist {
        display: inherit;
    }
    #next-playlist{
        display: inherit;
    }
    .op-list {
        margin-top: 10px; 
    }
    /* 진행바 CSS */
    .progress-small {
        overflow:hidden; 
        height:5px ;
        margin-bottom:0px; 
        background-color:rgba(255,255,255,.4); 
        border-radius:0px; 
        -webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.1); 
        box-shadow:inset 0 1px 2px rgba(0,0,0,.1); 
    } 
    .progress-bar-small { 
        float:left; 
        width:0;
        height:100%; 
        font-size:6px;
        line-height:7px; 
        color:#fff; 
        text-align:center; 
        background-color:#428bca; 
        -webkit-box-shadow:inset 0 -1px 0 rgba(0,0,0,.15); 
        box-shadow:inset 0 -1px 0 rgba(0,0,0,.15); 
        -webkit-transition:width .6s ease; 
        transition:width .6s ease; 
    } 
    
    .progress-bar-s-danger {background-color:red;} 
    .progress-bar-s-info {background-color:#5bc0de;} 
    .progress-bar-s-warning {background-color:#f0ad4e;} .progress-bar-s-success {background-color:#5cb85c;} .progress-bar-s-grey{background-color:#6a737a}
    /* 영상 컨트롤러 */
    #v-controller {
        width: 854px; 
        height: 40px; 
        bottom: 45px; 
        position: relative;
        background: linear-gradient(180deg, rgba(246, 255, 0, .0), rgba(0, 0, 0, .8));
        color:white;
        visibility: visible;
    }
    /* 시간 컨트롤러 */
    #minut-controller {
        width: 40px; 
        height: 20px;
        background-color: black;
        color: white; 
        opacity: 90%;
        position: absolute; 
        bottom: 40px; 
        text-align: center; 
        margin-left: 0px;
        visibility: hidden;
    }
    /* 볼륨 컨트롤러 */ 
    #volume-controller {
        width: 80px; 
        height: 6px;
        color: white; 
        position: absolute; 
        left: 25px;
        bottom: 7px; 
        text-align: center; 
        visibility: hidden;
    }
    /* 플레이버튼 */
    #v-play {
        margin-left: 5px; 
        margin-right: 5px;
    }
    
    .image-EVD {
        opacity: 100%;
        position: relative;
        margin-top: 10px;
    }
    .bg-EVD{
    	margin-top: 10px;
    }
    
    /*자동재생 On시 영상 종료 화면 스타일*/
    #v-loader {
      border: 12px solid #f3f3f3;
      border-radius: 50%;
      border-top: 12px solid #3498db;
      width: 80px;
      height: 80px;
      position:absolute;
      -webkit-animation: spin 2s linear infinite; /* Safari */
      animation: spin 2s linear infinite;
      z-index:4;
      top:45%; 
      left:45%;
    }
    /*자동재생 On시 영상 종료 화면 실행 중 취소 버튼 스타일*/
    #auto-cencle {
      position:absolute;
      width: 50px;
      height: 30px;
      color : white;
      top:65%; 
      left:47%;
      text-align:center;
      z-index:5;
      text-decoration: none;
    }
    /* Safari */
    @-webkit-keyframes spin {
      0% { -webkit-transform: rotate(0deg); }
      100% { -webkit-transform: rotate(360deg); }
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
    
    .vote-click {
    	background-color: #f2f2f2;
    	color : black;
    }
    
    .a-link{
    	color : black;
    	text-decoration: none;
    }
    .a-link:hover{
    	color : black;
    	text-decoration: none;
    }
</style>

<div style="margin:30px">
<div class="col-sm-1"></div>
 <div class="col-sm-7">
   <div >
       <div id = "video-div">
        <video id="myVideo" preload="none" width="854" height="480"  controlsList="nodownload">
          <source src="${VIDEO_DETAILE.url }" type="video/mp4">
        </video>
        <!-- 재생종료시 나오는 화면 -->
        <div id="end-video-div">
            <div id="black-EVD"></div>
            <!--자동재생 on시-->
            <div id="auto-on-div">
            	<div id="v-loader"></div>
                <a href="#" id="auto-cencle">취소</a>
            </div>
            <!--자동재생 off시-->
            <div id="auto-off-div">
            	<div class="col-sm-12">
            	<c:forEach var="endList" items="${END_LIST }" begin="0" end="3">
	                <a id="end-video-${endList.no }" href="#">
		                <div class="col-sm-3">
		                   <div id ="group-EVD-${endList.no }" class="group-EVD" style="visibility: hidden;">
		                       <div id="text-EVD-${endList.no }" class="text-EVD" style="width: 190px; height: 130px; padding: 10px; color: white; position: absolute; z-index: 3;">
		                       ${endList.title }
		                           <div id="video-end-time-${endList.no }" style="width: 50px;height: 15px; background-color: black; font-size: 12px; text-align: center; right: 0px; bottom: 0px;margin: 10px; position: absolute;">
		                               ${endList.durationStr }
		                           </div>
		                       </div>
		                       <div id="bg-EVD-${endList.no }" class="bg-EVD" style="width: 190px; height: 130px; background-color: black; opacity: 0.3; position: absolute;z-index: 2;">
		                       </div>
		                   </div>
		                    <img id="image-EVD-${endList.no }" class="image-EVD"  src="${endList.previewA1Url }" width="190" height="130" />
		                </div>
	                </a>
            	</c:forEach>
            	</div>
            	<div class="col-sm-12">
            	<c:forEach var="endList" items="${END_LIST }" begin="4" end="7">
	                <a id="end-video-${endList.no }" href="#">
		                <div class="col-sm-3">
		                   <div id ="group-EVD-${endList.no }" class="group-EVD" style="visibility: hidden;">
		                       <div id="text-EVD-${endList.no }" class="text-EVD" style="width: 190px; height: 130px; padding: 10px; color: white; position: absolute; z-index: 3;">
		                       ${endList.title }
		                           <div id="video-end-time-${endList.no }" style="width: 50px;height: 15px; background-color: black; font-size: 12px; text-align: center; right: 0px; bottom: 0px;margin: 10px; position: absolute;">
		                               ${endList.durationStr }
		                           </div>
		                       </div>
		                       <div id="bg-EVD-${endList.no }" class="bg-EVD" style="width: 190px; height: 130px; background-color: black; opacity: 0.3; position: absolute;z-index: 2;">
		                       </div>
		                   </div>
		                    <img id="image-EVD-${endList.no }" class="image-EVD"  src="${endList.previewA1Url }" width="190" height="130" />
		                </div>
	                </a>
            	</c:forEach>
            	</div>
            	<div class="col-sm-12">
            	<c:forEach var="endList" items="${END_LIST }" begin="8" end="11">
	                <a id="end-video-${endList.no }" href="#">
		                <div class="col-sm-3">
		                   <div id ="group-EVD-${endList.no }" class="group-EVD" style="visibility: hidden;">
		                       <div id="text-EVD-${endList.no }" class="text-EVD" style="width: 190px; height: 130px; padding: 10px; color: white; position: absolute; z-index: 3;">
		                       ${endList.title }
		                           <div id="video-end-time-${endList.no }" style="width: 50px;height: 15px; background-color: black; font-size: 12px; text-align: center; right: 0px; bottom: 0px;margin: 10px; position: absolute;">
		                               ${endList.durationStr }
		                           </div>
		                       </div>
		                       <div id="bg-EVD-${endList.no }" class="bg-EVD" style="width: 190px; height: 130px; background-color: black; opacity: 0.3; position: absolute;z-index: 2;">
		                       </div>
		                   </div>
		                    <img id="image-EVD-${endList.no }" class="image-EVD"  src="${endList.previewA1Url }" width="190" height="130" />
		                </div>
	                </a>
            	</c:forEach>
            	</div>
            </div>
        </div><!-- end-video-div 종료 -->
        <!-- v-controller 시작 -->
        <div id = "v-controller">
           <!--시간표시-->
            <div id="minut-controller">
                0:00
            </div>
            
           <!--진행바-->
            <div id ="v-back-progress-bar" class="progress-small"> 
                <div id="v-progress-bar" role="progressbar aria-valuenow=10 aria-valuemin=0" class="progress-bar-small progress-bar-s-danger" style="width:0%" aria-valuemax="100">  
                </div>
            </div>
            <!--진행바 종료-->
            <span id="v-play" style="
        margin-top: 5px; font-size: 18px;" 
         class="glyphicon glyphicon-play"></span>
            <span><span id="current-play-time">00:00</span> / <span id="end-play-time">00:00</span></span>
            <span id="volume-btn" style="margin-left: 5px; margin-right: 5px; margin-top: 5px; font-size: 20px;" class="glyphicon glyphicon-volume-up">
            </span>
            <!--볼륨조절-->
            <div id ="volume-controller" class="progress-small"> 
                <div id="volume-progress-bar" role="progressbar aria-valuenow=10 aria-valuemin=0" class="progress-bar-small progress-bar-s-danger" style="width:100%" aria-valuemax="100">  
                </div>
            </div>
            
            <!--오른쪽 메뉴들-->
            <span id="v-fullScreen" style=" margin-top: 5px; font-size: 18px;margin-left: 5px; margin-right: 5px;" class="glyphicon glyphicon-resize-full pull-right"></span>
            <span id="v-speed" class="dropup pull-right"  style=" margin-top: 5px; font-size: 18px;margin-left: 5px; margin-right: 5px;">
			    <span class="dropdown-toggle" data-toggle="dropdown">
			    <span style="color:white; background-color:rgba(0,0,0,0);" class="glyphicon glyphicon-dashboard"></span></span>
			    <ul class="dropdown-menu" style="color:white; background-color:rgba(0,0,0,0);">
			      <li class="text-right">x<span id="speed-1">0.5</span></li>
			      <li class="text-right">x<span id="speed-2">0.7</span></li>
			      <li class="text-right">x<span id="speed-3">1.0</span></li>
			      <li class="text-right">x<span id="speed-4">1.2</span></li>
			      <li class="text-right">x<span id="speed-5">1.5</span></li>
			    </ul>
			  </span>
            
        </div><!-- v-controller 종료-->
    </div><!--video-div 종료-->
   </div>
  
   <table class="table">
   		<colgroup>
   			<col width="*">
   			<col width="10%">
   			<col width="10%">   			
   			<col width="7%">   			
   		</colgroup>
   		<tr>
   			<td colspan="3"><h4>${VIDEO_DETAILE.title }</h4></td>
   		</tr>
   		<tr style ="font-size: 18px; color: gray;">
   			<td><span>조회수 : <span id="watch-count">${VIDEO_VIEW_COUNT }</span></span></td>
   			<c:choose>
   				<c:when test="${VIDEO_VOTE_BY_USER eq 'n' }">
		   			<td id="video-like-btn-${VIDEO_DETAILE.videoNo }" style ="text-align: center;"><span class="glyphicon glyphicon-thumbs-up"></span><span id="like-text">${VIDEO_LIKE_COUNT }</span></td>
   					<td id="video-hate-btn-${VIDEO_DETAILE.videoNo }" style ="text-align: center;" class="vote-click"><span class="glyphicon glyphicon-thumbs-down"></span><span id="hate-text">${VIDEO_HATE_COUNT }</span></td>
   				</c:when>
   				<c:when test="${VIDEO_VOTE_BY_USER eq 'p' }">
		   			<td id="video-like-btn-${VIDEO_DETAILE.videoNo }" style ="text-align: center;" class="vote-click"><span class="glyphicon glyphicon-thumbs-up"></span><span id="like-text">${VIDEO_LIKE_COUNT }</span></td>
   					<td id="video-hate-btn-${VIDEO_DETAILE.videoNo }" style ="text-align: center;"><span class="glyphicon glyphicon-thumbs-down"></span><span id="hate-text">${VIDEO_HATE_COUNT }</span></td>
   				</c:when>
   				<c:otherwise>
		   			<td id="video-like-btn-${VIDEO_DETAILE.videoNo }" style ="text-align: center;"><span class="glyphicon glyphicon-thumbs-up"></span><span id="like-text">${VIDEO_LIKE_COUNT }</span></td>
   					<td id="video-hate-btn-${VIDEO_DETAILE.videoNo }" style ="text-align: center;"><span class="glyphicon glyphicon-thumbs-down"></span><span id="hate-text">${VIDEO_HATE_COUNT }</span></td>   				
   				</c:otherwise>
   			</c:choose>
   			<td id="library-list-btn" class="text-center">
   				<c:if test="${null ne LOGIN_USER }">
   					<span class="glyphicon glyphicon-list"></span>
	   			</c:if>
   			</td>
   		<tr>
   		<tr>
   			<td colspan="2">
				 <ul class="media-list"><!-- 등록자 미디어리스트 시작-->
	              <li class="media">
	                <div class="media-left">
	                  <a class="a-link" id="uploder-link-${VIDEO_DETAILE.creatorNo}" href="#">
	                    <img class="media-object img-circle" src="${VIDEO_DETAILE.profileBigImgUrl }" width="50" height="50" alt="...">
	                  </a>
	                </div>
	                <div class="media-body">
	                    <h4 class="media-heading"><a class="a-link" id="uploder-text-link-${VIDEO_DETAILE.creatorNo}">${VIDEO_DETAILE.userNick } </a><small>${VIDEO_DETAILE.lastDate}</small></h4>
	                    <p><small>게시일: ${VIDEO_DETAILE.formatDate }</small></p>
	                    <p>${VIDEO_DETAILE.detail }</p>
	                    <p>카테고리	${VIDEO_DETAILE.categoryName }</p>
	                </div>
	              </li>
	            </ul><!-- 등록자 미디어리스트 종료-->   			
   			</td>
   			<c:if test="${null eq SUB_DETAIL }">
	   			<td colspan="2"><button id="sub-btn" class="pull-right btn btn-warning">구독 <span id ="sub_count">${SUB_COUNT }</span></button></td>
   			</c:if>
   			<c:if test="${null ne SUB_DETAIL }">
	   			<td colspan="2"><button id="sub-btn" class="pull-right btn btn-danger">구독 중 <span style="margin-left:5px;" id ="sub_count">${SUB_COUNT }</span></button></td>
   			</c:if>
   		</tr>
   </table>
   <!-- 
   <p>
        시간이동(나중에 자막기능에서 사용할 예정)
        <br>
        <span class="btn btn-warning btn-xs" id="change-1">00:10</span>
        <span class="btn btn-success btn-xs" id="change-2">00:40</span>
        <span class="btn btn-primary btn-xs" id="change-3">01:10</span>
    </p>
     -->
    
    <!-- 
    <p>
        <span id="onePlay" class="btn btn-info btn-xs">하나 재생</span>
        <span id="listPlay" class="btn btn-success btn-xs">리스트 재생</span>
    </p> 
    -->
    <div class="col-sm-12">
        <hr />
    </div>
    <div>
       <h4>댓글 <span id = "comment-count">${COMMENTS_VIEW_COUNT }</span>개</h4>
    </div>
    <div class="col-sm-12">
    <c:if test="${ null ne LOGIN_USER }">
    <hr>
	<div class="alert alert-warning">
        <ul class="media-list"><!-- 댓글 미디어리스트 시작-->
          <li class="media">
            <div class="media-left">
              <a class="a-link"  href="#">
                <img class="media-object img-circle" src="${LOGIN_USER.profileSmallImgUrl }" width="50" height="50" alt="...">
              </a>
            </div>
            <div id ="comment-media-list" class="media-body">
	            <c:set var="isExist" value="N"/>
		        <c:forEach var="comment" items="${VIDEO_COMMENTS }">
			        <c:choose>
			            <c:when test="${comment.commenterNo eq LOGIN_USER.no }">
			            	<c:set var="isExist" value="Y"/>
				            	<h4 class='media-heading'>${comment.userNick }<small style="margin-left:5px;">${comment.lastDate }</small></h4>
					        	<p>${comment.contents }</p>
					        	<p>
			    					<span class='glyphicon glyphicon-thumbs-up'></span><span>0</span>
			    					<span style='margin-left : 7px;' class='glyphicon glyphicon-thumbs-down'></span><span>0</span>
			    				</p>
						    	<div class='col-sm-12' id='reply-form-${comment.no}'>
			    				</div>
			    	
			    				<p id='reply-page-${comment.no}'>
			    					<span id='reply-icon-${comment.no}' class='glyphicon glyphicon-triangle-bottom'></span>
			    					<span id='reply-text-${comment.no}'>답글펼치기</span>
			    					<span style='margin-left : 20px;' id='comment-update-${comment.no}'>수정</span>
			    					<span style='margin-left : 20px;' id='comment-delete-${comment.no}'>삭제</span>
			    				</p>
			            </c:when>
					</c:choose>
		        </c:forEach>
		        <c:if test="${isExist  eq 'N'}">
	            	<form method="post" id="comment-form" action="">
	            		<input type="hidden" name="commenterNo" value="${LOGIN_USER.no }">
	            		<input type="hidden" name="videoNo" value="${VIDEO_DETAILE.videoNo }">
	        	        <textarea class="form-control"name="contents" rows="3" style="resize:none;"></textarea>
	    	            <button id="btn-add-comment" class="pull-right btn btn-primary">댓글</button>
		                <button class="pull-right btn btn-default">CENCLE</button>
	            	</form>
		        </c:if>
            </div>
          </li>
        </ul><!-- 댓글 미디어리스트 종료-->
       </div>
	<hr>
    </c:if>
    <c:if test="${null eq LOGIN_USER }">
    	<hr>
    	<blockquote>
			<div class="text-center">로그인 후 이용할 수 있습니다.</div>
		</blockquote>
		<hr>
	</c:if>
    </div>
    <div class="col-sm-12">
       <ul class="media-list" id="comments-list"><!-- 미디어리스트 시작-->
      	<!-- ajax 처리 -->
        </ul><!-- 미디어리스트 종료-->
    </div>
  </div>
  <div class="col-sm-3">
  <!-- 재생목록 리스트  -->
  <c:if test="${not empty SUB_PLAY_LIST}">
     <div id="custom-playlist" class="col-sm-12">
        <div id="cp-header" style="height:120px; background-color: #d9d9d9; padding-left:10px; padding-top:5px;">
            <h3><span id="sub-list-title-${SUB_PLAY_LIST_NO }">${SUB_PLAY_LIST_TITLE}</span></h3>
        </div>
        <div id="cp-body" style="OVERFLOW-Y:auto; height:360px;  padding:10px; background-color: #f0f0f0;">
			<ul class="col-sm-12 media-list"><!-- SUB_PLAY_LIST 미디어리스트 시작-->
			  	<c:forEach var="subList" items="${SUB_PLAY_LIST}" varStatus="no">
				  	<c:choose>
				  		<c:when test="${subList.videoNo eq  VIDEO_DETAILE.videoNo}">
				  		<input id="end-index" type="hidden" value="${no.current }"/>
				           <li class="media" id ="sub-list-index-${subList.playOrderNo }">
							<a class="a-link"  id="sub-list-url-${subList.videoNo }" href="#">
					            <div class="media-left">
					            	<span id="plaing-${subList.playOrderNo}">▶</span>
					                <img class="media-object" src="${subList.previewA4Url }" width="100" height="56" alt="...">
					            </div>
					            <div class="media-body">
					                <p>${subList.title }</p>
					                <p><small>${subList.userNick }</small></p>
					            </div>
							</a>
				          </li>
				  		</c:when>
				  		<c:otherwise>
				            <li class="media" id ="sub-list-index-${subList.playOrderNo }">
							<a class="a-link"  id="sub-list-url-${subList.videoNo }" href="#">
					            <div class="media-left">
					            	<span>${no.index+1 }</span>
					                <img class="media-object" src="${subList.previewA4Url }" width="100" height="56" alt="...">
					            </div>
					            <div class="media-body">
					                <p>${subList.title }</p>
					                <p><small>${subList.userNick }</small></p>
					            </div>
							</a>
				          </li>
				  		</c:otherwise>
				  	</c:choose>
			  	</c:forEach>
	        </ul><!-- SUB_PLAY_LIST 미디어리스트 종료-->
        </div>
    </div>
  </c:if>
  <c:if test="${not empty ALL_LIST}">
     <div id="custom-playlist" class="col-sm-12">
        <div id="cp-header" style="height:120px; background-color: #d9d9d9; padding-left:10px; padding-top:5px;">
            <h3>재생목록</h3>
        </div>
        <div id="cp-body" style="OVERFLOW-Y:auto; height:360px; padding:10px; background-color: #f0f0f0;">
	  		<ul class="col-sm-12 media-list"><!-- ALL_LIST 미디어리스트 시작-->
			  	<c:forEach var="allList" items="${ALL_LIST}" varStatus="no">
				  	<c:choose>
				  		<c:when test="${allList.videoNo eq  VIDEO_DETAILE.videoNo}">
				           <li class="media" id ="all-list-index-${no.index+1 }">
							<a class="a-link"  id="all-list-url-${allList.videoNo }" href="#">
					            <div class="media-left">
					            	<span id="plaing-${no.index+1}">▶</span>
					                <img class="media-object" src="${allList.previewA4Url }" width="100" height="56" alt="...">
					            </div>
					            <div class="media-body">
					                <p>${allList.title }</p>
					                <p><small>${allList.userNick }</small></p>
					            </div>
							</a>
				          </li>
				  		</c:when>
				  		<c:otherwise>
				            <li class="media" id ="all-list-index-${no.index+1 }">
							<a class="a-link"  id="all-list-url-${allList.videoNo }" href="#">
					            <div class="media-left">
					            	<span>${no.index+1 }</span>
					                <img class="media-object" src="${allList.previewA4Url }" width="100" height="56" alt="...">
					            </div>
					            <div class="media-body">
					                <p>${allList.title }</p>
					                <p><small>${allList.userNick }</small></p>
					            </div>
							</a>
				          </li>
				  		</c:otherwise>
				  	</c:choose>
			  	</c:forEach>
	        </ul><!-- ALL_LIST 미디어리스트 종료-->
        </div>
    </div>
  </c:if>
  <!-- 다음 동영상 -->   
  <c:if test="${empty SUB_PLAY_LIST and empty ALL_LIST}">
    <div id="next-playlist"  class="col-sm-12">
     <div class="pull-right">
            자동재생 <input type="checkbox" id="next-auto-toggle" data-toggle="toggle" data-size="mini" checked>
        </div>
        <h4>다음 동영상</h4>
	        <ul class="col-sm-12 media-list"><!-- 다음 동영상 미디어리스트 시작-->
	          <li class="media">
				<a class="a-link"  id="next-video-url-${NEXT_VIDEO.no }" href="#">
		            <div class="media-left">
		                <img class="media-object" src="${NEXT_VIDEO.previewA4Url }" width="170" height="95" alt="...">
		            </div>
		            <div class="media-body">
		                <p id="np-title">${NEXT_VIDEO.title }</p>
		                <p><small>${NEXT_VIDEO.userNick }</small></p>
		            </div>
				</a>
	          </li>
	        </ul><!-- 다음 동영상 미디어리스트 종료-->
	        
        <div class="col-sm-12">
            <hr/>
        </div>
     </div>
  </c:if>
         
    <div class="col-sm-12" id="other-playlist">
        <ul id="other-play-list"class="col-sm-12 media-list op-list"><!-- 동영상 미디어리스트 시작-->
           <c:forEach var="playList" items="${PLAY_LIST}">
       		<li id="op-list-${playList.no }" class="media">
              <a class="a-link"  id="play-no-${playList.no}" href='#'>
		            <div class="media-left">
	    	            <img class="media-object" src="${playList.previewA1Url }" width="170" height="95" alt="...">
		            </div>
	            	<div class="media-body">
	        	        <p>${playList.title }</p>
	    	            <p><small>${playList.userNick }</small></p>
		            </div>
    	          </a>
	          </li>
           </c:forEach>
        </ul><!-- 동영상 미디어리스트 종료-->
    </div><!--other-playlist종료-->
  </div><!-- col-sm-3 영상 리스트 종료 -->
  <div class="col-sm-1"></div>
 </div> 
    
    
     
 <script type="text/javascript">
 $(function() {
	var vid = document.getElementById("myVideo");
	var vdiv = document.getElementById("video-div");
	vid.preload = "metadata"
	setTimeout(function(){
		vid.play();
		// 여기에 ajax로 조회수 올라가는 것 만들기
		
   	    var history = {};
		history["targetNo"] = '${VIDEO_DETAILE.videoNo}';
		history["userNo"] = '${LOGIN_USER.no}';
		var watchcount = "[id=watch-count]";
		$.ajax({
           	type:'POST',
           	url:'/video/inwatch/',
           	data: JSON.stringify(history),
           	contentType:'application/json', 
           	dataType:'json',
           	success:function() {
           		
           	},complete:function() {
           		$.ajax({
    		    	type:'GET',
    		    	url:'/video/inwatch/'+'${VIDEO_DETAILE.videoNo}',
    		    	dataType:'json',
    		    	success:function(watch) {
    		    		$(watchcount).text(watch);
    		    	}
    		    });
           	}
        });
		
        $("[id=v-play]").removeClass('glyphicon-play').addClass('glyphicon-pause');
	}, 500);
    vid.ontimeupdate = function() {prograssBar()};
    /* 진행바  */
    function prograssBar() {
    	var nowTime= vid.currentTime;
        var endTime = ${VIDEO_DETAILE.duration };
        var currentBar = (nowTime/endTime)*100;
        // 현재시간
        var nowTimeText = "";
        if(nowTime < 60){
            if(nowTime<10){
                nowTimeText = "0:0"+Math.floor(nowTime);  
            } else {
                nowTimeText = "0:"+Math.floor(nowTime)
            }
        } else {
            if((nowTime%60) < 10) {
                nowTimeText = Math.floor(nowTime/60) + ":0" +Math.floor(nowTime%60);
            } else{
            	
                nowTimeText = Math.floor(nowTime/60) + ":" +Math.floor(nowTime%60);
            }
        }
        // 전체시간
        var endTimeText = "";
        if(endTime < 60){
            if(endTime<10){
                endTimeText = "0:0"+Math.floor(endTime);  
            } else {
                endTimeText = "0:"+Math.floor(endTime)
            }
        } else {
            if((endTime%60) < 10) {
                endTimeText = Math.floor(endTime/60) + ":0" +Math.floor(endTime%60);
            } else{
                endTimeText =Math.floor(endTime/60) + ":" +Math.floor(endTime%60);
            }
        }
        document.getElementById("current-play-time").innerHTML = nowTimeText;
        document.getElementById("end-play-time").innerHTML = endTimeText;
        // 진행바 움직이기
        $("[id=v-progress-bar]").css('width',currentBar.toFixed(2)+'%');
        $('#end-video-div').css('visibility','hidden');
    }

    $("[id=v-back-progress-bar]").mouseover(function(event) {
    	var maxBar= $(this).css('width').replace(/px/ig, "");
        var mouseUpBar=event.offsetX;
        var wantBarP = (parseInt(mouseUpBar)/parseInt(maxBar))*100;
        
        //시간이동
        var endTime = vid.duration;
        var wantTime = (endTime*wantBarP)/100;
        $(this).click(function() {
            vid.currentTime= wantTime;
        });
        
    });
    /*영상 끝난 뒤 화면 show/hide 여부*/
    function hideAutoEndDiv() {
        $('[id^=end-video-div]').css('visibility','hidden');
        $('[id^=auto-on-div]').css('visibility','hidden');
        $('[id^=auto-off-div]').css('visibility','hidden');
    };
    function showAutoOnEndDiv() {
        $('[id^=end-video-div]').css('visibility','visible');
        $('[id^=auto-off-div]').css('visibility','hidden');
        $('[id^=auto-on-div]').css('visibility','visible');
        
    }; 
    function showAutoOffEndDiv() {
        $('[id^=end-video-div]').css('visibility','visible');
        $('[id^=auto-on-div]').css('visibility','hidden');
        $('[id^=auto-off-div]').css('visibility','visible');
        
    };
    
	/* 영상 끝난 뒤 화면 on  */
    vid.onended = function() {

	    // 자동재생 true/false 여부
	    var onOff = $('[id=next-auto-toggle]').prop('checked');
        
		
    	var subList = "${SUB_PLAY_LIST_SIZE}";
		console.log(subList);
		// 재생목록이 있는 경우!
		if(subList != "") {
			// 현재 재생 목록 번호
			var nowNo = $("[id^=plaing]").attr("id").replace("plaing-","");
			console.log("nowNo",nowNo);
			// 다음 재생 목록 번호
			var nextNo = parseInt(nowNo) + 1;
			console.log("nextNo",nextNo);
			// 다음 재생 목록 위치
			var nextIndex = $("[id=sub-list-index-"+nextNo+"]");
			console.log("nextIndex",nextIndex);
			// 다음 재생 목록 영상 번호
			var nextVideoNo = nextIndex.find("a").attr("id").replace("sub-list-url-","");
			console.log("nextVideoNo",nextVideoNo);
			
			// 영상 리스트 번호
	    	var subListNo= $("[id^=sub-list-title]").attr("id").replace("sub-list-title-","");
	    	var lastNo = '${SUB_PLAY_LIST_SIZE}';
			console.log("lastNo",lastNo);
			if(lastNo != nowNo){			
				AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo="+nextVideoNo+"&subListNo="+subListNo);
			}
			
	    	// 함수 빠져나감.
	    	return false;
		} 
		// 전체 재생이 있는 경우!
		var allList = "${ALL_PLAY_LIST_SIZE}";
		if(allList != "") {
			// 현재 재생 목록 번호
			var nowNo = $("[id^=plaing]").attr("id").replace("plaing-","");
			console.log("nowNo",nowNo);
			// 다음 재생 목록 번호
			var nextNo = parseInt(nowNo) + 1;
			console.log("nextNo",nextNo);
			// 다음 재생 목록 위치
			var nextIndex = $("[id=all-list-index-"+nextNo+"]");
			console.log("nextIndex",nextIndex);
			// 다음 재생 목록 영상 번호
			var nextVideoNo = nextIndex.find("a").attr("id").replace("all-list-url-","");
			console.log("nextVideoNo",nextVideoNo);
			
			// 영상길이
	    	var lastNo = '${ALL_PLAY_LIST_SIZE}';
			console.log("lastNo",lastNo);
			if(lastNo != nowNo){			
				AppManager.changeMainDiv(AppManager.div.video.player + '?videoNo='+nextVideoNo+'&allList=${LIST_STRING}');
			}
			
	    	// 함수 빠져나감.
	    	return false;
		} 
		
        /*다음 영상 재생 토글 on/off*/
        
	    
	    $('[id=next-auto-toggle]').change(function() {
	        onOff = $('[id=next-auto-toggle]').prop('checked');//true/false 여부
	        console.log(onOff);
	    });
        if(onOff) {
            showAutoOnEndDiv();
            var nextAuto = setTimeout(function(){
            	AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo=${NEXT_VIDEO.no }");
            }, 2000);
            /* 자동재생 on시*/
            $('[id=auto-cencle]').click(function(){
                onOff = false;
                clearTimeout(nextAuto);
                hideAutoEndDiv();
                showAutoOffEndDiv();
                $("[id=v-play]").removeClass('glyphicon-pause').addClass('glyphicon-play');   
                $('[id=v-controller]').css('visibility','visible'); 
                return false;
            });
            $("[id=v-play]").removeClass('glyphicon-pause').addClass('glyphicon-play');   
            $('[id=v-controller]').css('visibility','visible'); 
        } else{
            /* 자동재생 off시 */
            showAutoOffEndDiv();
            $("[id=v-play]").removeClass('glyphicon-pause').addClass('glyphicon-play');   
            $('[id=v-controller]').css('visibility','visible'); 
        }
    };   
    
    
    /* 재생 중 화면 off + 컨트롤러 on/off */
    vid.onplaying = function() {
    	hideAutoEndDiv();
        // 화면 밖으로 나가면 콘트롤러 사라짐
        $('[id=video-div]').mouseleave(function() {
            $('[id=v-controller]').css('visibility','hidden'); 
        });
        $('[id=video-div]').mouseenter(function() {
            $('[id=v-controller]').css('visibility','visible'); 
        });
        /* 마우스 움직이지 않고 콘트롤러 사라지기*/
        var time = 0;
        var deleteController = function() {
            if (time >= 2) {
                $('[id=v-controller]').css('visibility','hidden'); 
                $('[id=minut-controller]').css('visibility','hidden');
                $('[id=volume-controller]').css('visibility','hidden');
                // 실행취소
                clearInterval(setDC);
            } else {
                time += 0.5;

            }
        }
        // setInterval 
        var setDC = setInterval(deleteController, 500);

        $('[id=video-div]').mousemove(function () {
            time = 0;
            clearInterval(setDC);
            setDC = setInterval(deleteController, 500);

            $('[id=v-controller]').css('visibility','visible'); 
        });
    };
    vid.onpause = function() {
        $('[id=video-div]').mouseleave(function() {
            $('[id=v-controller]').css('visibility','visible'); 
        });
    };
    
    /* 시간변화 */
  /*   $("[id^=change]").click(function() {
    	hideAutoEndDiv();
        var secondText = $(this).text();
        var arr = secondText.split(":");
        var minut = arr[0] * 60;
        var second = arr[1];
        var time = parseInt(minut) + parseInt(second);
        vid.currentTime= time;
    }); */
    /* 마우스 클릭 영상 시간 이동 */ 
    $("[id=v-back-progress-bar]").mousemove(function(event) {
    	var maxBar= $(this).css('width').replace(/px/ig, "");
        var mouseUpBar=event.offsetX;
        var wantBarP = (parseInt(mouseUpBar)/parseInt(maxBar))*100;
        
        var endTime = vid.duration;
        var wantTime = (endTime*wantBarP)/100;
        $(this).click(function() {
            vid.currentTime= wantTime;
            hideAutoEndDiv();
        });

        var wantTimeText = "";
        if(wantTime < 60){
            if(wantTime<10){
                wantTimeText = "0:0"+Math.floor(wantTime);  
            } else {
                wantTimeText = "0:"+Math.floor(wantTime)
            }
        } else {
            if((wantTime%60) < 10) {
                wantTimeText = Math.floor(wantTime/60) + ":0" +Math.floor(wantTime%60);
            } else{
                wantTimeText = Math.floor(wantTime/60) + ":" +Math.floor(wantTime%60);
            }
        }
        /* 마우스 up 위치에 시간 뜨기*/
        $("[id=v-back-progress-bar]").mouseleave(function() {
            $('[id=minut-controller]').css('visibility','hidden');
        });
        $('[id=minut-controller]').css('visibility','visible');
        $('[id=minut-controller]').text(wantTimeText);
        $('[id=minut-controller]').css('margin-left',event.offsetX+'px');
        
    });
    
    
    /* 영상 속도  */
    $("[id^=speed]").click(function() {
        $('#end-video-div').css('visibility','hidden');
        var speed = $(this).text();
        vid.playbackRate = speed; 
    });
/* 
    var list = ['영상1'];
     */
    /* 영상재생  */
  /*   $("[id=onePlay]").click(function() {
        if(list.length > 1){
            list = ['영상1'];
            $("[id=np-title]").text(list[0]);
            $('[id=custom-playlist]').css('display','none');
            $('[id=next-playlist]').css('display','inherit');   
        }
    }); */
    /* 리스트재생  */
   /*  $("[id=listPlay]").click(function() {
        if(list.length = 1){
            list = ['영상1','영상2','영상3','영상4','영상5','영상6','영상7'];
            
            var row = "";
            for(i=0; i <list.length ; i++) {
                row += "<ul>";
                row +="<li>"+list[i]+"</li>";
                row +="</ul>"
            }
            $('[id=cp-body]').html(row);
            
            $('[id=custom-playlist]').css('display','inherit');
            $('[id=next-playlist]').css('display','none');   
        }
    }); */
	/* 전체화면  */
    $("[id=v-fullScreen]").click(function() {
        if(!document.fullscreenElement &&    // alternative standard method
      !document.mozFullScreenElement && !document.webkitFullscreenElement && $(this).hasClass('glyphicon-resize-full')) {
            $(this).removeClass('glyphicon-resize-full').addClass('glyphicon-resize-small'); 
            if (vdiv.requestFullscreen) {
                vdiv.requestFullscreen();
                $('[id=myVideo]').css('width','1920px').css('height','1080px');
                $('[id=v-controller]').css('width','1920px').css('bottom','20px'); 
                $('[id=end-video-div]').css('width','1920px').css('height','1080px');
                $('[id=black-EVD]').css('width','1920px').css('height','1080px');
            } else if (vdiv.mozRequestFullScreen) {
                vdiv.mozRequestFullScreen();
                $('[id=myVideo]').css('width','1920px').css('height','1080px');
                $('[id=v-controller]').css('width','1920px').css('bottom','20px'); 
                $('[id=end-video-div]').css('width','1920px').css('height','1080px');
                $('[id=black-EVD]').css('width','1920px').css('height','1080px');
            } else if (vdiv.webkitRequestFullscreen) {
                vdiv.webkitRequestFullscreen();
                $('[id=myVideo]').css('width','1920px').css('height','1080px');
                $('[id=v-controller]').css('width','1920px').css('bottom','20px'); 
                $('[id=end-video-div]').css('width','1920px').css('height','1080px');
                $('[id=black-EVD]').css('width','1920px').css('height','1080px');
            }

        } else{
        	 $(this).removeClass('glyphicon-resize-small').addClass('glyphicon-resize-full'); 
             
             function concelScreenCss() {     
                 $('[id=myVideo]').css('width','854px').css('height','480px');
                 $('[id=end-video-div]').css('width','854px').css('height','480px');
                 $('[id=black-EVD]').css('width','854px').css('height','480px');
                 $('[id=v-controller]').css('width','854px').css('bottom','45px'); 
             }
             
             if (document.cancelFullScreen) {
                 document.cancelFullScreen();
                 concelScreenCss();
             } else if (document.mozCancelFullScreen) {
                 document.mozCancelFullScreen();
                 concelScreenCss(); 
             } else if (document.webkitCancelFullScreen) {
                 document.webkitCancelFullScreen();
                 concelScreenCss(); 
             }
         }

    });
	
    /* 재생/일시정지  */
    $("[id=v-play]").click(function() {
        if($(this).hasClass('glyphicon-play')){
            vid.play();
            $(this).removeClass('glyphicon-play').addClass('glyphicon-pause');  
        } else {
            vid.pause();
            $(this).removeClass('glyphicon-pause').addClass('glyphicon-play');  
        }
    });
   
    /* 볼륨 컨트롤러 나타나기 */
    $('[id=volume-btn]').mouseover(function() {
        var volumeX = $('[id=volume-btn]').offset().left-$('[id=v-controller]').offset().left +25;
        $('[id=volume-controller]').css('visibility','visible');
        $('[id=volume-controller]').css('left',volumeX+'px');
        $('[id=volume-controller]').css('bottom','15px');
    });
    
    $('[id=v-controller]').mouseleave(function() {
    	if(vid.onplaying){
    		$('[id=volume-controller]').css('visibility','hidden');
    	}
    });
    
    
    /*볼륨조절*/
    $('[id=volume-controller]').mousemove(function(event) {
        var maxBar= $(this).css('width').replace(/px/ig, "");
        var mouseUpBar=event.offsetX;
        var wantBarP = (parseInt(mouseUpBar)/parseInt(maxBar))*100;
        //볼륨 입력
        var wantVolume = (wantBarP)/100;
        $(this).click(function() {
            vid.volume= wantVolume;
            // 볼륨바 움직이기
            $("[id=volume-progress-bar]").css('width',wantBarP.toFixed(2)+'%');
        });
    });
    
    /*음소거*/
    $('[id=volume-btn]').click(function() {
        console.log('volume'+vid.volume);
        if($(this).hasClass('glyphicon-volume-up')) {
            vid.muted = true;
            $("[id=volume-btn]").removeClass('glyphicon-volume-up').addClass('glyphicon-volume-off'); 
            $("[id=volume-progress-bar]").css('width','0%');
        } else if($(this).hasClass('glyphicon-volume-off')) {
            vid.muted = false;
            $("[id=volume-btn]").removeClass('glyphicon-volume-off').addClass('glyphicon-volume-up'); 
            $("[id=volume-progress-bar]").css('width',(vid.volume.toFixed(2))*100+'%');
        }
    });
    
    /*이미지 위에 마우스 올리면 글자 나오기*/
    $('[id^=image-EVD]').mouseover(function() {
        $(this).prev().css('visibility','visible');
    });
    $('[id^=group-EVD]').mouseout(function() {
        $('[id^=group-EVD]').css('visibility','hidden');
    });
    

    // Comment ajax 처리
    
    function getCommentRow(comment) {
    	var row = "<li class='media'>";
    	row += "<div class='media-left'>";
    	row += "<a class='a-link'  href='#'>";
    	row += "<img class='media-object img-circle' src='"+ comment.profileSmallImgUrl +"' width='50' height='50' alt='...'>";
    	row += "</a>";
    	row += "</div>";
    	
    	row += "<div class='media-body' id='comment-no-"+comment.no+"'>";
    	row += "<h4 class='media-heading'>"+ comment.userNick +" <small>"+ comment.lastDate +"</small></h4>";
    	row += "<p>"+ comment.contents +"</p>";
    	row += "<p>";
    	row += "<span id='comment-like-"+comment.no+"'><span class='glyphicon glyphicon-thumbs-up'></span><span id='comment-text-like-"+comment.no+"'>0</span></span>";
    	row += "<span style='margin-left : 7px;'  id='comment-hate-"+comment.no+"'><span class='glyphicon glyphicon-thumbs-down'></span><span id='comment-text-hate-"+comment.no+"'>0</span></span>";
    	row += "<span style='margin-left : 20px;' id='comment-btn-"+comment.no+"'>답글</span>";
    	row += "</p>";
		// 답글 form
    	row += "<div class='col-sm-12' id='reply-form-"+comment.no+"'>";
    	row += "</div>";
    	
    	row += "<p id='reply-page-"+comment.no+"'>";
    	row += "<span id='reply-icon-"+comment.no+"' class='glyphicon glyphicon-triangle-bottom'></span>";
    	row += "<span id='reply-text-"+comment.no+"'>답글펼치기</span>";
    	row += "</p>";
		// 답글 form
    	row += "<div class='col-sm-12'>";
    	row += "<ul class='media-list' id='reply-list-"+comment.no+"'>";
    	
    	row += "</ul>";
    	row += "</div>";
    	
    	row += "</div>";
    	row += "</li>";
    	
    	return row;
    }
    function getMyCommentRow(comment) {
    	var row = "<h4 class='media-heading'>"+ comment.userNick +" <small>"+ comment.lastDate +"</small></h4>";
    	row += "<p>"+ comment.contents +"</p>";
    	row += "<p>";
    	row += "<span class='glyphicon glyphicon-thumbs-up'></span><span>0</span>";
    	row += "<span style='margin-left : 7px;'  class='glyphicon glyphicon-thumbs-down'></span><span>0</span>";
    	row += "</p>";
		// 답글 form
    	row += "<div class='col-sm-12' id='reply-form-"+comment.no+"'>";
    	row += "</div>";
    	
    	row += "<p id='reply-page-"+comment.no+"'>";
    	row += "<span id='reply-icon-"+comment.no+"' class='glyphicon glyphicon-triangle-bottom'></span>";
    	row += "<span id='reply-text-"+comment.no+"'>답글펼치기</span>";
    	row += "<span style='margin-left : 20px;' id='comment-update-"+comment.no+"'>수정</span>";
    	row += "<span style='margin-left : 20px;' id='comment-delete-"+comment.no+"'>삭제</span>";
    	row += "</p>";
		// 답글 form
    	row += "<div class='col-sm-12'>";
    	row += "<ul class='media-list' id='reply-list-"+comment.no+"'>";
    	
    	row += "</ul>";
    	row += "</div>";
    	
    	return row;
    }
    // 수정폼
    
    function getMyUpdateCommentRow(upcomment) {
    	var row = "<div class='media-body'>";
    	row += "<form method='post' id='comment-form' action=''>";
    	row += "<input type='hidden' name='no' value='"+upcomment.no+"'>";
    	row += "<input type='hidden' name='commenterNo' value='${LOGIN_USER.no}'>";
    	row += "<input type='hidden' name='videoNo' value='${VIDEO_DETAILE.videoNo }'>";
    	row += "<textarea class='form-control'name='contents' rows='3' style='resize:none;'>"+upcomment.contents+"</textarea>";
    	row += "<button id='btn-update-comment' class='pull-right btn btn-primary'>댓글</button>";
    	row += "<button class='pull-right btn btn-default'>CENCLE</button>";
    	row += "</form>";
    	row += "</div>";
    	
    	return row;
    }
    function getMyFormCommentRow() {
    	var row = "<div class='media-body'>";
    	row += "<form method='post' id='comment-form' action=''>";
    	row += "<input type='hidden' name='commenterNo' value='${LOGIN_USER.no}'>";
    	row += "<input type='hidden' name='videoNo' value='${VIDEO_DETAILE.videoNo }'>";
    	row += "<textarea class='form-control'name='contents' rows='3' style='resize:none;'></textarea>";
    	row += "<button id='btn-update-comment' class='pull-right btn btn-primary'>댓글</button>";
    	row += "<button class='pull-right btn btn-default'>CENCLE</button>";
    	row += "</form>";
    	row += "</div>";
    	
    	return row;
    }
    function getFormCommentRow() {
    	var row = "<div class='media-body'>";
    	row += "<form method='post' id='comment-form' action=''>";
    	row += "<input type='hidden' name='commenterNo' value='${LOGIN_USER.no}'>";
    	row += "<input type='hidden' name='videoNo' value='${VIDEO_DETAILE.videoNo }'>";
    	row += "<textarea class='form-control'name='contents' rows='3' style='resize:none;'></textarea>";
    	row += "<button id='btn-add-comment' class='pull-right btn btn-primary'>댓글</button>";
    	row += "<button class='pull-right btn btn-default'>CENCLE</button>";
    	row += "</form>";
    	row += "</div>";
    	
    	return row;
    }
    $.ajax({
    	type:'GET',
    	url:'/video/seComments/'+'${VIDEO_DETAILE.videoNo}',
    	dataType:'json',
    	// 등록 후 페이지 고정 방법 찾아내기.
    	success:function(comments) {
    		var $commentList = $('[id=comments-list]');
    		var userNo = '${LOGIN_USER.no}';
			$.each(comments, function(index, comment){
				if(userNo == "") {
					$commentList.append(getCommentRow(comment));
				} else {
					if(comment.commenterNo != userNo){
						$commentList.append(getCommentRow(comment));
					}
				}
			});
    	}/* ,complete:function(comments) {
    		$.each(comments, function(index, comment){
    			$('[id=comment-text-hate-'+comment.no+']').text(comment);
			});
    	} */
    });
    // 댓글 삽입
    $("#comment-media-list").on('submit','[id=comment-form]',function() {
    	var vComment = {};
    	vComment["commenterNo"] = $("[name=commenterNo]").val();
    	vComment["videoNo"] = $("[name=videoNo]").val();
    	vComment["contents"] = $("[name=contents]").val();
    	
    	$.ajax({
        	type:'POST',
        	url:'/video/incomments/',
        	data: JSON.stringify(vComment),
        	contentType:'application/json', //서버로 보내는 컨텐츠 타입
        	dataType:'json',
        	// 등록 후 페이지 고정 방법 찾아내기.
        	success:function(vComment) {
        		$("[id=comment-media-list]").html(getMyCommentRow(vComment));
        	},complete:function() {
        		 $("[name=contents]").val("");
        		 $.ajax({
      		    	type:'GET',
      		    	url:'/video/incomments/'+'${VIDEO_DETAILE.videoNo}',
      		    	dataType:'json',
      		    	success:function(count) {
      		    		var $commentCount = $('[id=comment-count]');
      					$commentCount.text(count);
      		    	}
      		    });
	    	}
        });
    	return false;
    });
    // 댓글 수정
    
	$("#comment-media-list").on('click','[id^=comment-update]',function() {
    	$.ajax({
        	type:'GET',
        	url:'/video/upComments/'+'${VIDEO_DETAILE.videoNo}/${LOGIN_USER.no }',
        	dataType:'json',
        	success:function(comments) {
        		var $updateForm = $("[id=comment-media-list]");
        		$updateForm.html(getMyUpdateCommentRow(comments));
        		
        	}
        });
    });
    // 댓글 삭제
    
	$("#comment-media-list").on('click','[id^=comment-delete]',function() {
        var commentNo =  $(this).attr("id").replace("comment-delete-","");
        var vComment = {};
    	vComment["commenterNo"] = '${LOGIN_USER.no }';
    	vComment["no"] = commentNo;
    	$.ajax({
        	type:'POST',
        	url:'/video/deComments/',
        	data: JSON.stringify(vComment),
            contentType:'application/json',
        	dataType:'json',
        	success:function() {
        		var $updateForm = $("[id=comment-media-list]");
        		$updateForm.html(getFormCommentRow());
        		$.ajax({
     		    	type:'GET',
     		    	url:'/video/incomments/'+'${VIDEO_DETAILE.videoNo}',
     		    	dataType:'json',
     		    	success:function(count) {
     		    		var $commentCount = $('[id=comment-count]');
     					$commentCount.text(count);
     		    	}
     		    });
        	}
        });
    });
   
     $("#comment-media-list").on('click','[id^=btn-update-comment]',function() {
    	var vComment = {};
    	vComment["no"] = $("[name=no]").val();
    	vComment["commenterNo"] = $("[name=commenterNo]").val();
    	console.log(vComment["commenterNo"]);
    	vComment["videoNo"] = $("[name=videoNo]").val();
    	console.log(vComment["videoNo"]);
    	vComment["contents"] = $("[name=contents]").val();
    	console.log(vComment["contents"]);
    	
    	$.ajax({
        	type:'POST',
        	url:'/video/upComments/',
        	data: JSON.stringify(vComment),
        	contentType:'application/json', //서버로 보내는 컨텐츠 타입
        	dataType:'json',
        	success:function(vComment) {
        		var $updateForm = $("[id=comment-media-list]");
        		console.log($updateForm);
        		$updateForm .html(getMyCommentRow(vComment));
        		console.log(getMyCommentRow(vComment));
        	},complete:function() {
        		 $("[name=contents]").val("");
	    	}
        });
    	return false;
    });
    
	// 답글처리
	
    // 답글 form 생성
    $("#comments-list").on('click','[id^=comment-btn]',function() {


    	var user = '${LOGIN_USER.no}';
    	
    	if(user == ""){
    		alert("로그인 후 이용해주세요.");
    	} else {
	    	var no = $(this).attr("id").replace("comment-btn-","");
	    	var row = "<div class='col-sm-12'>";
	    	row += "<ul class='media-list'>";
	    	row += "<li class='media'>";
	    	row += "<div class='media-left'>";
	    	row += "<a class='a-link'  href='#'>";
	    	row += "<img class='media-object img-circle' src='${LOGIN_USER.profileSmallImgUrl }' width='50' height='50' alt='...'>";
	    	row += "</a>";
	    	row += "</div>";
	    	row += "<div class='media-body'>";
	    	row += "<form method='post' id='reply-form-"+no+"' action=''>";
	    	row += "<input type='hidden' name='replierNo' value='${LOGIN_USER.no }'>";
	    	row += "<input type='hidden' name='commentNo' value='"+no+"'>";
	    	row += "<textarea class='form-control'name='replyContents' rows='3' style='resize:none;'></textarea>";
	    	row += "<button id='btn-add-reply-"+no+"' class='pull-right btn btn-primary'>댓글</button>";
	    	row += " <button class='pull-right btn btn-default'>CENCLE</button>";
	    	row += "</form>";
	    	row += "</div>";
	    	row += "</li>";
	    	row += "</ul>";
	    	row += "</div>";
	    
	    	
	    	$('[id=reply-form-'+no+']').append(row);
    	}
    });
	
	// 답글 리스트 생성
	function getReplyRow(reply) {
    	var row = "<li class='media'>";
    	row += "<div class='media-left'>";
    	row += "<a class='a-link'  href='#'>";
    	row += "<img class='media-object img-circle' src='"+ reply.profileSmallImgUrl +"' width='50' height='50' alt='...'>";
    	row += "</a>";
    	row += "</div>";
    	
    	row += "<div class='media-body' id='reply-no-"+reply.no+"'>";
    	row += "<h4 class='media-heading'>"+ reply.userNick +" <small>"+ reply.createDate +"</small></h4>";
    	row += "<p>"+ reply.contents +"</p>";
    	row += "<p>";
    	row += "<span class='glyphicon glyphicon-thumbs-up'></span><span>0</span>";
    	row += "<span class='glyphicon glyphicon-thumbs-down'></span><span>0</span>";
    	row += "</p>";
    	row += "</div>";
    	row += "</li>";
    	
    	return row;
    }

    $("#comments-list").on('click','[id^=reply-page]',function() {
    	console.log("펼치기");
    	var commentNo = $(this).attr("id").replace("reply-page-","");
    	// 글자 바꾸기
    	if($('[id=reply-icon-'+commentNo+']').hasClass('glyphicon-triangle-bottom')) {
    		$('[id=reply-icon-'+commentNo+']').removeClass('glyphicon-triangle-bottom').addClass('glyphicon-triangle-top');
    		$('[id=reply-text-'+commentNo+']').text("숨기기");
			
    	    $.ajax({
    	    	type:'GET',
    	    	url:'/video/sereply/'+commentNo,
    	    	dataType:'json',
    	    	success:function(replies) {
    	    		var $replyList = $('[id=reply-list-'+commentNo+']');
    				$.each(replies, function(index, reply){
    					$replyList.append(getReplyRow(reply));
    				});
    	    	}
    	    });
    		
    	}else if($('[id=reply-icon-'+commentNo+']').hasClass('glyphicon-triangle-top')) {
    		$('[id=reply-icon-'+commentNo+']').removeClass('glyphicon-triangle-top').addClass('glyphicon-triangle-bottom');
    		$('[id=reply-text-'+commentNo+']').text("답글펼치기");
    		$('[id=reply-list-'+commentNo+']').empty();
    		
    	}
    	
    });
	
	
	// 답글 등록
    $("#comments-list").on('submit','[id^=reply-form]',function() {
    	var reply = {};
    	reply["commentNo"] = $("[name=commentNo]").val();
    	reply["replierNo"] = $("[name=replierNo]").val();
    	reply["contents"] = $("[name=replyContents]").val();
    	
    	$.ajax({
        	type:'POST',
        	url:'/video/inreply/',
        	data: JSON.stringify(reply),
        	contentType:'application/json', //서버로 보내는 컨텐츠 타입
        	dataType:'json',
        	// 등록 후 페이지 고정 방법 찾아내기.
        	success:function(reply) {
        		$("[name=replyContents]").val("");
        	}
        });
    	return false;
    });
    
    //AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo=" + nextVideoNo);
    
    // 영상리스트 처리
    /* function getPlayListRow(playList) {
    	var row = "<li id='op-list-"+playList.videoNo+"' class='media'>";
    	row	+= "<a class='a-link'  id='play-no-"+playList.videoNo+"' href='#'>";
    	row += "<div class='media-left'>";
    	row += "<img class='media-object' src='"+playList.preview_a1_url+"' width='170' height='95' alt='...'>";
    	row += "</div>";
    	row += "<div class='media-body'>";
    	row += "<p>"+playList.title+"</p>";
    	row += "<p><small>"+playList.masterNick+"</small></p>";
    	row += "</div>";
    	row += "</a>";
    	row += "</li>";
    	
    	return row;
    }
    $.ajax({
    	type:'GET',
    	url:'/video/playList/'+'${LOGIN_USER.no }',
    	dataType:'json',
    	// 등록 후 페이지 고정 방법 찾아내기.
    	success:function(playLists) {
    		var $playList = $('[id=other-play-list]');
			$.each(playLists, function(index, playList){
				$playList.append(getPlayListRow(playList));
			});
    	}
    });
    
    $("#other-play-list").on('click','[id^=play-no]', function(event) {
    	event.preventDefault();
    	var no = $(this).attr("id").replace("play-no-","");
    	console.log(no);
    	AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo="+no);
    });
     */
    /* 영상 좋아요 싫어요 체크 */
    function getVoteRow(vote) {
    	var row = vote;
    	return row;
    }
    
    $("[id^=video-like-btn]").click(function() {
    	var userNo = '${LOGIN_USER.no}';
    	var creatorNo = '${VIDEO_DETAILE.creatorNo}';
    	if(userNo == "") {
    		alert("로그인 후 이용할 수 있습니다.");
    		
    		return false;
    	}
    	if(userNo == creatorNo) {
			alert("본인 영상에는 '좋아요'를 할 수 없습니다.");
    		
    		return false;
    	}
    	var btn = this;
    	var hatebtn = "[id^=video-hate-btn]";
    	if($("[id^=video-hate-btn]").hasClass('vote-click')){
    		//싫어요가 표시되어 있다면?

    	    var history = {};
			history["targetNo"] = '${VIDEO_DETAILE.videoNo}';
			history["userNo"] = '${LOGIN_USER.no}';
			history["voteSide"] = "p";
			console.log("좋아요up" + history);
			
    		$.ajax({
            	type:'POST',
            	url:'/video/upvote/',
            	data: JSON.stringify(history),
            	contentType:'application/json', 
            	dataType:'json',
            	success:function() {
            		
            	},complete:function() {
            		$.ajax({
        		    	type:'GET',
        		    	url:'/video/upvote/'+'${VIDEO_DETAILE.videoNo}/p',
        		    	dataType:'json',
        		    	success:function(vote) {
        		    		var $likevote = $('[id=like-text]');
        					$likevote.text(vote);
        		    	},complete:function() {
                    		$(btn).addClass('vote-click'); 
        		    	}
        		    });
            		$.ajax({
        		    	type:'GET',
        		    	url:'/video/upvote/'+'${VIDEO_DETAILE.videoNo}/n',
        		    	dataType:'json',
        		    	success:function(vote) {
        		    		var $hatevote = $('[id=hate-text]');
        					$hatevote.text(vote);
        		    	},complete:function() {
        		    		$(hatebtn).removeClass('vote-click');
        		    	}
        		    });
            	}
            });
    	} else {
	    	if($(this).hasClass('vote-click')) {
	    	    // 좋아요 취소
	    		var history = {};
				history["targetNo"] = '${VIDEO_DETAILE.videoNo}';
				history["userNo"] = '${LOGIN_USER.no}';
				console.log("좋아요de" + history);
				
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/devote/',
	            	data: JSON.stringify(history),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		
	            	},complete:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/devote/'+'${VIDEO_DETAILE.videoNo}/p',
            		    	dataType:'json',
            		    	success:function(vote) {
            		    		var $likevote = $('[id=like-text]');
            					$likevote.text(vote);
            		    	},complete:function() {
        	            		$(btn).removeClass('vote-click'); 
            		    	}
            		    });
	            	}
	            });
	    	} else {
	    	    //좋아요
				var history = {};
				history["targetNo"] = '${VIDEO_DETAILE.videoNo}';
				history["userNo"] = '${LOGIN_USER.no}';
				history["voteSide"] = "p";

				console.log("좋아요in" + history);
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/invote/',
	            	data: JSON.stringify(history),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		
	            	},complete:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/invote/'+'${VIDEO_DETAILE.videoNo}/p',
            		    	dataType:'json',
            		    	success:function(vote) {
            		    		var $likevote = $('[id=like-text]');
            					$likevote.text(vote);
            		    	},complete:function() {
        	            		$(btn).addClass('vote-click'); 
            		    	}
            		    });
	            	}
	            });
	    	}
    	}
    });
    
    $("[id^=video-hate-btn]").click(function() {
    	
    	var userNo = '${LOGIN_USER.no}';
    	var creatorNo = '${VIDEO_DETAILE.creatorNo}';
    	if(userNo == "") {
    		alert("로그인 후 이용할 수 있습니다.");
    		
    		return false;
    	}
    	if(userNo == creatorNo) {
			alert("본인 영상에는 '싫어요'를 할 수 없습니다.");
    		
    		return false;
    	}
    	var btn = this;
    	var likebtn = "[id^=video-like-btn]";
    	if($("[id^=video-like-btn]").hasClass('vote-click')){
    		//좋아요가 표시되어 있다면?
    		
    	    var history = {};
			history["targetNo"] = '${VIDEO_DETAILE.videoNo}';
			history["userNo"] = '${LOGIN_USER.no}';
			history["voteSide"] = "n";
			console.log("싫어요up" + history);
			
    		$.ajax({
            	type:'POST',
            	url:'/video/upvote/',
            	data: JSON.stringify(history),
            	contentType:'application/json', 
            	dataType:'json',
            	success:function() {
            		
            	},complete:function() {
            		$.ajax({
        		    	type:'GET',
        		    	url:'/video/upvote/'+'${VIDEO_DETAILE.videoNo}/n',
        		    	dataType:'json',
        		    	success:function(vote) {
        		    		var $hatevote = $('[id=hate-text]');
        					$hatevote.text(vote);
        		    	},complete:function() {
                    		$(btn).addClass('vote-click'); 
        		    	}
        		    });
            		$.ajax({
        		    	type:'GET',
        		    	url:'/video/upvote/'+'${VIDEO_DETAILE.videoNo}/p',
        		    	dataType:'json',
        		    	success:function(vote) {
        		    		var $likevote = $('[id=like-text]');
        					$likevote.text(vote);
        		    	},complete:function() {
        		    		$(likebtn).removeClass('vote-click');
        		    	}
        		    });
            	}
            });
    	} else {
	    	if($(this).hasClass('vote-click')) {
	    	    // 싫어요 취소
	    		var history = {};
				history["targetNo"] = '${VIDEO_DETAILE.videoNo}';
				history["userNo"] = '${LOGIN_USER.no}';
				console.log("싫어요de" + history);
				
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/devote/',
	            	data: JSON.stringify(history),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		
	            	},complete:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/devote/'+'${VIDEO_DETAILE.videoNo}/n',
            		    	dataType:'json',
            		    	success:function(vote) {
            		    		var $hatevote = $('[id=hate-text]');
            					$hatevote.text(vote);
            		    	},complete:function() {
        	            		$(btn).removeClass('vote-click'); 
            		    	}
            		    });
	            	}
	            });
	    	} else {
	    	    //싫어요 
	    	    
	    	    var history = {};
				history["targetNo"] = '${VIDEO_DETAILE.videoNo}';
				history["userNo"] = '${LOGIN_USER.no}';
				history["voteSide"] = "n";
				console.log("싫어요in" + history);
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/invote/',
	            	data: JSON.stringify(history),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		
	            	},complete:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/invote/'+'${VIDEO_DETAILE.videoNo}/n',
            		    	dataType:'json',
            		    	success:function(vote) {
            		    		var $hatevote = $('[id=hate-text]');
            					$hatevote.text(vote);
            		    	},complete:function() {
        	            		$(btn).addClass('vote-click'); 
            		    	}
            		    });
	            	}
	            });
	    	}
    	}
    		
    });
    
    
    /* 댓글 좋아요 싫어요 체크 */
    
    $("#comments-list").on('click',"[id^=comment-like]",function() {
    	var userNo = '${LOGIN_USER.no}';
        var commentNo =  $(this).attr("id").replace("comment-like-","");
        console.log(commentNo);
    	if(userNo == "") {
    		alert("로그인 후 이용할 수 있습니다.");
    		
    		return false;
    	}
    	var btn = this;
    	var hatebtn = "[id^=comment-hate]";
    	if($("[id^=comment-hate]").hasClass('vote-click')){
    		//싫어요가 표시되어 있다면?

    	    var history = {};
			history["targetNo"] = commentNo;
			history["userNo"] = '${LOGIN_USER.no}';
			history["voteSide"] = "p";
			console.log("좋아요up" + history);
			
    		$.ajax({
            	type:'POST',
            	url:'/video/upCvote/',
            	data: JSON.stringify(history),
            	contentType:'application/json', 
            	dataType:'json',
            	success:function() {
            		
            	},complete:function() {
            		$.ajax({
        		    	type:'GET',
        		    	url:'/video/upCvote/'+commentNo+'/p',
        		    	dataType:'json',
        		    	success:function(vote) {
        		    		var likevote ='[id=comment-text-like-'+commentNo+']';
       		    		 $(likevote).text(vote);
        		    	},complete:function() {
                    		$(btn).addClass('vote-click'); 
        		    	}
        		    });
            		$.ajax({
        		    	type:'GET',
        		    	url:'/video/upCvote/'+commentNo+'/n',
        		    	dataType:'json',
        		    	success:function(vote) {
        		    		var hatevote ='[id=comment-text-hate-'+commentNo+']';
       		    		 	$(hatevote).text(vote);
        		    	},complete:function() {
        		    		$(hatebtn).removeClass('vote-click');
        		    	}
        		    });
            	}
            });
    	} else {
	    	if($(this).hasClass('vote-click')) {
	    	    // 좋아요 취소
	    		var history = {};
				history["targetNo"] = commentNo;
				history["userNo"] = '${LOGIN_USER.no}';
				console.log("좋아요de" + history);
				
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/deCvote/',
	            	data: JSON.stringify(history),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		
	            	},complete:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/deCvote/'+commentNo+'/p',
            		    	dataType:'json',
            		    	success:function(vote) {
            		    		var likevote ='[id=comment-text-like-'+commentNo+']';
           		    		 $(likevote).text(vote);
            		    	},complete:function() {
        	            		$(btn).removeClass('vote-click'); 
            		    	}
            		    });
	            	}
	            });
	    	} else {
	    	    //좋아요
				var history = {};
				history["targetNo"] = commentNo;
				history["userNo"] = '${LOGIN_USER.no}';
				history["voteSide"] = "p";

				console.log("좋아요in" + history);
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/inCvote/',
	            	data: JSON.stringify(history),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		
	            	},complete:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/inCvote/'+commentNo+'/p',
            		    	dataType:'json',
            		    	success:function(vote) {
            		    		var likevote ='[id=comment-text-like-'+commentNo+']';
           		    		 $(likevote).text(vote);
            		    	},complete:function() {
        	            		$(btn).addClass('vote-click'); 
            		    	}
            		    });
	            	}
	            });
	    	}
    	}
    });
    
    $("#comments-list").on('click',"[id^=comment-hate]",function() {
    	var userNo = '${LOGIN_USER.no}';
        var commentNo =  $(this).attr("id").replace("comment-hate-","");
        
        
    	if(userNo == "") {
    		alert("로그인 후 이용할 수 있습니다.");
    		
    		return false;
    	}
    	var btn = this;
    	var likebtn = "[id^=comment-like]";
    	if($("[id^=comment-like]").hasClass('vote-click')){
    		//좋아요가 표시되어 있다면?
    		
    	    var history = {};
			history["targetNo"] = commentNo;
			history["userNo"] = '${LOGIN_USER.no}';
			history["voteSide"] = "n";
			console.log("싫어요up" + history);
			
    		$.ajax({
            	type:'POST',
            	url:'/video/upCvote/',
            	data: JSON.stringify(history),
            	contentType:'application/json', 
            	dataType:'json',
            	success:function() {
            		
            	},complete:function() {
            		$.ajax({
        		    	type:'GET',
        		    	url:'/video/upCvote/'+commentNo+'/n',
        		    	dataType:'json',
        		    	success:function(vote) {
        		    		var hatevote ='[id=comment-text-hate-'+commentNo+']';
       		    		 	$(hatevote).text(vote);
        		    	},complete:function() {
                    		$(btn).addClass('vote-click'); 
        		    	}
        		    });
            		$.ajax({
        		    	type:'GET',
        		    	url:'/video/upCvote/'+commentNo+'/p',
        		    	dataType:'json',
        		    	success:function(vote) {
        		    		var likevote ='[id=comment-text-like-'+commentNo+']';
       		    		 	$(likevote).text(vote);
        		    	},complete:function() {
        		    		$(likebtn).removeClass('vote-click');
        		    	}
        		    });
            	}
            });
    	} else {
	    	if($(this).hasClass('vote-click')) {
	    	    // 싫어요 취소
	    		var history = {};
				history["targetNo"] = commentNo;
				history["userNo"] = '${LOGIN_USER.no}';
				console.log("싫어요de" + history);
				
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/deCvote/',
	            	data: JSON.stringify(history),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		
	            	},complete:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/deCvote/'+commentNo+'/n',
            		    	dataType:'json',
            		    	success:function(vote) {
            		    		var hatevote ='[id=comment-text-hate-'+commentNo+']';
           		    		 	$(hatevote).text(vote);
            		    	},complete:function() {
        	            		$(btn).removeClass('vote-click'); 
            		    	}
            		    });
	            	}
	            });
	    	} else {
	    	    //싫어요 
	    	    
	    	    var history = {};
				history["targetNo"] = commentNo;
				history["userNo"] = '${LOGIN_USER.no}';
				history["voteSide"] = "n";
				console.log("싫어요in" + history);
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/inCvote/',
	            	data: JSON.stringify(history),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		
	            	},complete:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/inCvote/'+commentNo+'/n',
            		    	dataType:'json',
            		    	success:function(vote) {
            		    		var hatevote ='[id=comment-text-hate-'+commentNo+']';
           		    		 	$(hatevote).text(vote);
            		    	},complete:function() {
        	            		$(btn).addClass('vote-click'); 
            		    	}
            		    });
	            	}
	            });
	    	}
    	}
    		
    });
    
	// 구독 여부
    $("[id=sub-btn]").click(function(event) {
    	event.preventDefault();
    	var user = '${LOGIN_USER}';
    	var userNo = '${LOGIN_USER.no}';
    	var creatorNo = '${VIDEO_DETAILE.creatorNo}';
    	if(user == "") {
    		alert("로그인 후 이용해주세요.");
    	} else if(userNo == creatorNo) {
    		alert("본인은 구독하실 수 없습니다.");
    	} else {
	    	if($("[id=sub-btn]").hasClass("btn-warning")) {
	    		var subscription = {};
	    		subscription["userNo"] = '${LOGIN_USER.no}';
	    		subscription["ownerNo"] = '${VIDEO_DETAILE.creatorNo}';
				console.log(subscription);
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/insub/',
	            	data: JSON.stringify(subscription),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/insub/${VIDEO_DETAILE.creatorNo}',
            		    	dataType:'json',
            		    	success:function(sub) {
            					console.log(sub);
            		    		var subbtn ="[id=sub-btn]";
            		    		$(subbtn).removeClass("btn-warning").addClass("btn-danger");
            		    		$(subbtn).text("구독 중   "+sub);
            		    	}
            		    });
	            	}
	            });
	    		
	    	}else {
	    	    var subscription = {};
	    	    subscription["userNo"] = '${LOGIN_USER.no}';
	    	    subscription["ownerNo"] = '${VIDEO_DETAILE.creatorNo}';
				console.log(subscription);
				
	    		$.ajax({
	            	type:'POST',
	            	url:'/video/desub/',
	            	data: JSON.stringify(subscription),
	            	contentType:'application/json', 
	            	dataType:'json',
	            	success:function() {
	            		$.ajax({
            		    	type:'GET',
            		    	url:'/video/desub/${VIDEO_DETAILE.creatorNo}',
            		    	dataType:'json',
            		    	success:function(sub) {
            					console.log(sub);
            		    		var subbtn ="[id=sub-btn]";
            		    		$(subbtn).removeClass("btn-danger").addClass("btn-warning");
            		    		$(subbtn).text("구독   " + sub);
            		    	}
            		    });
	            	}	
	            });
	    	}
    	}	
    });
    
    $("#library-list-btn").click(function(){
    	var no = ${VIDEO_DETAILE.videoNo};
    	$("#pjs-video-no").val(no);
    	$("#playlist-modal").modal('show');
    });
	
    //페이지 이동
    
    $("[id^=end-video]").click(function(event) {
    	event.preventDefault();
    	var no = $(this).attr("id").replace("end-video-","");
    	AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo="+no);
    }); 
    // 다음 동영상 재생
    $("[id^=next-video-url]").click(function(event) {
    	event.preventDefault();
    	var no = $(this).attr("id").replace("next-video-url-","");
    	AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo="+no);
    });
    $("[id^=play-no]").click(function(event) {
    	event.preventDefault();
    	var no = $(this).attr("id").replace("play-no-","");
    	AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo="+no);
    });

    $("[id^=sub-list-url]").click(function(event) {
    	event.preventDefault();
    	var no = $(this).attr("id").replace("sub-list-url-","");
    	var subListNo= $("[id^=sub-list-title]").attr("id").replace("sub-list-title-","");
    	AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo="+no+"&subListNo="+subListNo);
    });
    $("[id^=all-list-url]").click(function(event) {
    	event.preventDefault();
    	var no = $(this).attr("id").replace("all-list-url-","");
    	AppManager.changeMainDiv(AppManager.div.video.player + "?videoNo="+no+'&allList=${LIST_STRING}');
    });
    $("[id^=uploder-link]").click(function(event) {
    	event.preventDefault();
    	var no = $(this).attr("id").replace("uploder-link-","");
    	AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
    });
    $("[id^=uploder-text-link]").click(function(event) {
    	event.preventDefault();
    	var no = $(this).attr("id").replace("uploder-text-link-","");
    	AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
    });
	// 재생 갯수
    var endIndex = $("[id=end-index]").val();
	console.log(endIndex);
	$("[id=list-last]").text(endIndex);
    
});
</script>

