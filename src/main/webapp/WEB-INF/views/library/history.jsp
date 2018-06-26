<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.cc, .cr{
		color:black;
	}
    div[id^='row'] {
        /* padding: 10px; */
    }
    .hr {
        border: 0.5px solid #D3D3D3;
    }
    #set a{
        color: darkgray;
    }
    .context div:last-child {
        font-size: 12px;
        color: darkgray;
    }
    .av img {
        position: fixed;
    }
    .radio-inline, .radio {
        margin-bottom: 15px;
    }
    .content {
    	margin: 0px;
    }
    .cc-title-repair,.cc-comment-plus{
    	padding: 0px;
    }
    
    /* Popup container - can be anything you want */
.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* The actual popup */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}
</style>

    <div class="row content">
        <div class="col-sm-7 col-sm-offset-1">
        	<div class="row" style="margin-top: 10px"></div>
        	<div id="wrapper">
        		
        	</div>
        </div>
        <div class="col-sm-3 right" style="background-color: ; height: 200px">
            <form style="margin-top: 10px;"> 
                <div class="form-group">
                   <div class="col-sm-12 input-group" style="padding: 0">
                       <span id="history-search-btn" class="btn input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                       <input type="text" name="historySearch" class="form-control" placeholder="시청 기록 검색" value=""/>
                   </div>
                </div>
            </form>
            &nbsp;
            <div><h4>기록 유형</h4></div>
            <hr class="hr">
            <div> 
            	<div class="radio-inline col-sm-12" id="history-radio">
                    <div class="col-sm-6 text-left" >시청기록</div>
                    <div class="col-sm-6 text-right">
                       <input type="radio" name="select" value="watch" checked/>
                    </div>  
                </div>
            </div>
            <hr class="hr">
            <div>
                <div class="radio-inline col-sm-12" id="comment-radio">
                    <div class="col-sm-6 text-left" >댓글</div>
                    <div class="col-sm-6 text-right">
                       <input type="radio" name="select" value="coment"/>
                    </div>  
                </div>
            </div>
            <hr class="hr">
            <div>
                <div class="radio-inline col-sm-12" id="community-radio">
                    <div class="col-sm-6 text-left" >커뮤니티</div>
                    <div class="col-sm-6 text-right">
                       <input type="radio" name="select" value="community"/>
                    </div>  
                </div>
            </div>
            <hr class="hr">
            <div id="set" style="margin-left: 24px;">
                <div>
                	<a id="list-del" href="#">시청 기록 지우기</a>
                </div><br>
                <div>
                    <!-- <a id="list-stop" href="#">시청 기록 일시 정지</a> -->
                </div>
            </div>                
        </div>
    </div>

    <!-- Modal -->
    <div id="watch-modal" class="modal fade" role="dialog">
    	<div class="modal-dialog">
    		<!-- Modal content -->
    		<div class="modal-content">
    			<div class="modal-body">
    				
    			</div>
    			<div class="modal-footer">
    				
    			</div>
    		</div>
    	</div>
    </div>

<script type="text/javascript">
$(function(){
	
	var loginUser;
	var historyList;
	
	var watchPno = 1;
	var watchTotal = 20;
	var allListCount = 0;
	
	var watchHistoryOn = true;
	var commentOn = false;
	var communityOn = false;
	
	var historyURL = "/library/watchHistoryList";
	var rowVideoNo = 0;
	
	watchHistoryLists();
	
	function communityLists(){
		$.ajax({
			url:"/library/communityList",
			dataType:"json",
			data:{pageNo: watchPno},
			success:function(result){
				console.log(result);
				var communitySuccess = result.success;
				if(!communitySuccess){
					$("#wrapper").empty();
					$("#wrapper").append("<p style='margin-top: 10px;'>커뮤니티 목록이 없습니다.</p>");
					return;
				}
				
				historyList = result.list;
				var isSuccess = result.success;
				if(isSuccess){
					allListCount = historyList.length;
				} else {
					allListCount = 0;
				}
				$("#wrapper").empty();
				$.each(historyList, function(index, items){
					$("#wrapper").append(communityHtml(items));
				});
				watchPno = 2;
			}
		});
	}
	
	function commentLists(){
		$.ajax({
			url:"/library/commentList",
			data:{pageNo: watchPno},
			dataType:"json",
			success:function(result){
				console.log(result);
				var commentSuccess = result.success;
				if(!commentSuccess){
					$("#wrapper").empty();
					$("#wrapper").append("<p style='margin-top: 10px;'>댓글 목록이 없습니다.</p>");
					return;
				}
				historyList = result.list;
				var isSuccess = result.success;
				if(isSuccess){
					allListCount = historyList.length;
				}else {
					allListCount = 0;
				}
				$("#wrapper").empty();
				$.each(historyList, function(index, items){
					$("#wrapper").append(commentHtml(items));
				});
				watchPno = 2;
				//videoContentAdd(historyList);
			}
		});
	}
	
	function watchHistoryLists(){
		var searchKeyword = $("[name=historySearch]").val();
		console.log(searchKeyword);
		$.ajax({
			url:"/library/watchHistoryList",
			data:{pageNo : watchPno, keyword : searchKeyword},
			dataType:"json",
			contentType:"application/json",
			success:function(result){
				console.log(result);
				var listSuccess = result.success;
				if(!listSuccess){
					$("#wrapper").empty();
					$("#wrapper").append("<p style='margin-top: 10px;'>시청기록이 없습니다.</p>");
					allListCount = 0;
					return;
				} else {
					loginUser = result.user;
					historyList = result.list;
					allListCount = historyList.length;
				}
				
				$("#wrapper").empty();
				
				$.each(historyList, function(index, items){
					$("#wrapper").append(watchHistoryHtml(items));
				});
				watchPno = 2;
			}
		});
	}
	
	var scrollIn = false;
	AppManager.getMainDiv().scroll(function(event){
		var docHeight = $(document).height();
		var divHeight = $("#wrapper").height();
		var divScroll = $(this).scrollTop();
		
		if(allListCount < watchTotal){
			console.log("종료! watchTotal: " + watchTotal + "allListCount: " + allListCount);
			return;
		}
		
		if((docHeight+divScroll + 150) >= divHeight && scrollIn == false){
			scrollIn = true;
			$.ajax({
				url:historyURL,
				dataType:"json",
				data:{pageNo: watchPno},
				success:function(result){
					console.log(result);
					var isSuccess = result.success;
					historyList = result.list;
					if(isSuccess){
						allListCount = historyList.length;
					} else {
						allListCount = 0;
					}
					var commentLists;
					$.each(historyList, function(index, items){
						if(watchHistoryOn){
							$("#wrapper").append(watchHistoryHtml(items));
						} else if(commentOn) {
							$("#wrapper").append(commentHtml(items));
						} else if(communityOn) {
							$("#wrapper").append(communityHtml(items));
						}
					});
					console.log("allListCount: "+allListCount);
					console.log("watchPno: "+watchPno);
					watchPno++;
					//videoContentAdd(historyList);
        			scrollIn = false;
				}
			});
		}
	});
	var gubunCount = 1;
	function videoContentAdd(items){
		var $videoComments;
		var $vcReplys;
		$.each(items, function(index, item){
			if(item.type=='vc'){
				item.addclass("vc"+gubunCount);
				$videoComments = $(".vc"+gubunCount);
			} else if (item.type='vr') {
				$vcReplys = $(".vr");
			}
		});
		
		$videoComments.each(function(){
			$(this).parent().append("에 달린 댓글");
		});
		$vcReplys.each(function(){
			$(this).parent().append("의 댓글에 달린 답글");
		});
		gubunCount++;
	}
	
	function communityHtml(item){
		var row = '<div class="row" id="row-community-'+item.communityWritingNo+'">'
		+'<div class="col-sm-9 col-sm-offset-1" >'
			+'<div class="row community-colon">'
				+'<p>'+item.createDateStr+'</p>'
				+'<h4 class="cc-title-repair cm-title-h4">'+item.communityContents+'</h4>'
				+'<div class="col-sm-11 cc-title-repair" style="display:none;">'
					+'<input id="cc-repair-comment-'+item.communityWritingNo+'" class="form-control" type="text" value="'+item.communityContents+'"/>'
				+'</div>'
				+'<div class="col-sm-1 cc-title-repair" style="display:none;">'
					+'<button id="communitytitle-repair-btn" class="btn btn-default">확인</button>'
				+'</div>'
			+'</div>'
			+'<div class="row" style="margin-left: 20px;">'
				+'<a style="color: darkgray"><span class="glyphicon glyphicon-thumbs-up"></span></a> '+Utils.nullToInt(item.communityGood)+' &nbsp;'
				+'<a style="color: darkgray"><span class="glyphicon glyphicon-thumbs-down"></span></a> '+Utils.nullToInt(item.communityBad)+' &nbsp;'
				+'<a href="#" id="communitycomment-plus"><span style="margin-left: 30px;">댓글추가</span></a>'
			+'</div><br>'
			+'<div id="communitycomment-write" style="display:none;" class="row">'
				+'<div class="col-sm-11 cc-comment-plus">'
					+'<input id="cc-plus-comment-'+item.communityWritingNo+'" class="form-control" type="text"/>'
				+'</div>'
				+'<div class="col-sm-1 cc-comment-plus">'
					+'<button id="cmComment-update-btn" class="btn btn-default">확인</button>'
				+'</div>'
			+'</div>'
			+'<p>댓글<span id="cmcomment-count">'+Utils.nullToInt(item.communityCommentCount)+'</span>개&nbsp;&nbsp;' 
				+'<a id="cmcomment-all-btn" href="#" class="open" style="color: black">모두보기<span class="glyphicon glyphicon-menu-down"></span></a>'
			+'</p>'
			+'<div class="dropup" style="display:none">'
			  +'<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">정렬'
			  +'<span class="caret"></span></button>'
			  +'<ul class="dropdown-menu">'
			    +'<li><a id="cmComment-popular" href="#">인기순</a></li>'
			    +'<li><a id="cmComment-date" href="#">날짜순</a></li>'
			  +'</ul>'
			+'</div>'
			+'<div id="comment-wrapper" class="row">'
				
			+'</div>'
		+'</div>'
		+'<div class="col-sm-2 community-colon">'
			+'<div class="dropdown">'
	              +'<button id="btn-drop" class="btn btn-link" style="opacity: 0;">'
	                  +'<img src="/resources/temp/junsung/images/coron.png" width="6px" height="24px"/>'
	              +'</button>'
	              +'<ul id="btn-menu" class="dropdown-menu">'
	                  +'<li><a href="#" id="community-repair">수정</a></li>'
	                  +'<li><a href="#" id="community-del">삭제</a></li>'
	              +'</ul>'
	        +'</div>'
		+'</div>'
	+'</div>'
	+'<div class="row"><hr class="hr"></div>'
		return row;
	}
	
	function communityCommentHtml(item){
		var row = '<div class="row" style="margin-top:10px;" id="community-comment-'+item.commentNo+'">'
					+'<div class="col-sm-1">'
						+'<img src="'+(item.profile_small_img_url==null?"/resources/temp/junsung/images/duckduckIcon.png":item.profile_small_img_url)
						+'" width="50px" height="50px">'
					+'</div>'
					+'<div class="col-sm-9">'
						+'<p><span id="master-no-">'+item.masterNick+'</span>&nbsp;&nbsp;&nbsp;'+item.createDateStr+'</p>'
						+'<p>'+item.commentContent+'</p>'
						+'<div>'
							+'<a href="#" id="cmc-like-btn" style="color: '+(item.side=="p"?"green":"darkgray")+'">'
								+'<span class="glyphicon glyphicon-thumbs-up"></span></a> '+Utils.nullToInt(item.commentGood)+' &nbsp;'
							+'<a href="#" id="cmc-bad-btn" style="color: '+(item.side=="n"?"tomato":"darkgray")+'">'
								+'<span class="glyphicon glyphicon-thumbs-down"></span>'
							+'</a> '+  Utils.nullToInt(item.commentBad)
						+'</div>'
					+'</div>'
					+'<div class="col-sm-2">'
						+'<a href="#" id="writing-comment-del-btn" style="color: gray;"><span style="opacity: 0" class="glyphicon glyphicon-remove"></span></a>'
					+'</div>'
				+'</div>';
				
		return row;
	}
	
	function commentHtml(item){
		var row = '<div class="row" id="row-colon'+item.commentNo+'">'
						+'<div class="col-sm-9 col-sm-offset-1">'
							+'<h4><a class="'+item.type+' comment-video" id="'+item.videoNo+'" href="#">'+item.videoTitle+'</a>'+(item.videoSub==null?"":item.videoSub)+'</h4>'
					    	+'<p class="c">'+item.commentContent+'</p>'
					    	+'<div id="commnent-fixform" style="display:none">'
					    		+'<input type="text" class="form-control" value="'+item.commentContent+'"/>'
					    		+'<button id="comment-update-'+item.strNo+'" class="btn btn-default btn-xs">확인</button>'
					    	+'</div>'
					    	+'<p>'+item.strCreateDate+'</p>'
						+'</div>'
						+'<div class="col-sm-2">'
							+'<div class="dropdown">'
					              +'<button id="btn-drop" class="btn btn-link" style="opacity: 0;">'
					                  +'<img src="/resources/temp/junsung/images/coron.png" width="6px" height="24px"/>'
					              +'</button>'
					              +'<ul id="btn-menu" class="dropdown-menu">'
					                  +'<li><a href="#" id="comment-fix-'+item.strNo+'">수정</a></li>'
					                  +'<li><a href="#" id="comment-del-'+item.strNo+'">삭제</a></li>'
					              +'</ul>'
					        +'</div>'
						+'</div>'
				+'</div>'
				+'<div class="col-sm-12"><hr class="hr"></div>'
		return row;
	}
	
	function watchHistoryHtml(item){
		var row = '<div id="row-'+item.videoNo+'" class="row" style="margin-top: 10px;">'
        +'<div class="col-sm-3" style="padding: 0px; position: relative;">'
	    	+'<div id="video-el">'
	            +'<a href="#" class="history-video">'
	            	+'<img src="'+item.previewA2Url+'" width="250px" height="140px"/>'
	            +'</a>'
	            +'<p style="position: absolute; top: 5px; left: 210px; opacity: 0;">'
			        +'<button id="video-later" type="button" class="btn btn-default btn-sm pupup"' 
			        +'data-toggle="tooltip" data-placement="right" title="나중에 볼 동영상 추가">'
			        	+'<span class="'+(item.watchLaterNo==null?"glyphicon glyphicon-time":"glyphicon glyphicon-ok")+'"></span>'
			    	+'</button>'
		        +'</p>'
		        +'<p style="background-color: black; position: absolute; top: 110px; left: 10px; opacity: 0.7;">'
		        	+'<span style="color: white;">'+item.durationStr+'</span>'
		        +'</p>'
	    	+'</div>'
	    +'</div>'
	    +'<div class="col-sm-9 context" style="padding-left: 10px;">'
	        +'<div class="col-sm-11">'
	            +'<a href="#" class="history-video" style="color: black; font-size: 19px">'
	                +item.title
	            +'</a>'
	        +'</div>'
	        +'<div class="col-sm-1">'
	            +'<a href="#" id="watch-delete" style="opacity: 0.4" data-toggle="tooltip" data-placement="left" title="삭제">'
	            	+'<img src="/resources/temp/junsung/images/x.png" width="60px" height="60px"/>'
	            +'</a>'
	        +'</div>'
	        +'<div class="col-sm-12" style="margin-bottom: 10px; color: darkgray;">'
	            +'<a href="#" id="master-id-'+item.masterNo+'"><strong>'+item.masterNick+'</strong></a> 조회수<span>'+item.videoCount+'</span>회'
	        +'</div>'
	        +'<div class="col-sm-12">'+item.videoDetailShort+'</div>'
	    +'</div>'
	+'</div>';
		
		return row;
	}
	
	function addWatchLater(){
		console.log("akakakak");
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
	
	function deleteWatchLater(){
		var no = $("#pjs-video-no").val();
		$.ajax({
			type:"POST",
			url:"/library/laterRemove",
			data:{videoNo : no}
		});
	}
//시청기록	---------------------------------------------------------------------------------------------
	
	//시청기록 검색 버튼 클릭시
	$("#history-search-btn").click(function(){
		watchPno = 1;
		watchHistoryLists();
	});
	
	//시청기록 버튼 클릭
	$("#history-radio").click(function(event){
		historyURL = "/library/watchHistoryList";
		watchHistoryOn = true;
		commentOn = false;
		communityOn = false;
		watchPno = 1;
		$(this).find("input").prop("checked", true);
		$("[name=historySearch]").val("");
		$("[name=historySearch]").parent().show();
		watchHistoryLists();
	});
	
	//시청기록 비디오 마스터 아이디 클릭시
	$("#wrapper").on("click","[id^=master-id]", function(){
		var no = $(this).attr("id").replace("master-id-","");
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
	});
	
	//시청기록 비디오 이미지, 타이틀 클릭
	$("#wrapper").on("click", ".history-video", function(){
		var no = $(this).parents("[id^=row]").attr("id").replace("row-","");
		AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+no);
	});
	
	//시청기록 이미지 안에 나중에 볼 동영상 추가 버튼 클릭
	$("#wrapper").on("click", "[id^=video-later]", function(){
		var no = $(this).parents("[id^=row]").attr("id").replace("row-", "");
		$("#pjs-video-no").val(no);
		if($(this).find('span').attr("class")=='glyphicon glyphicon-ok'){
			$(this).find('span').removeClass('glyphicon glyphicon-ok');
			$(this).find('span').addClass('glyphicon glyphicon-time');
			$(this).attr("title", '나중에 볼 동영상 추가');
			console.log("삭제영상No: " + no);
			deleteWatchLater();
		} else {
			$(this).find('span').removeClass('glyphicon glyphicon-time');
			$(this).find('span').addClass('glyphicon glyphicon-ok');
			$(this).attr("title",'추가 삭제');
			console.log("추가영상No: " + no);
			addWatchLater();
		}
	});
	
	/* $("#wrapper").on("click", "[id^=video-later]", function(){
		
		$("#pjs-video-no").val(no);
		$("#watchlater-modal").modal('show');
	}); */
	
	//이미지에 커서가 들어갔을시 나중보기 버튼 생성및 삭제
	$("#wrapper").on("mouseenter", "[id^=video-el]", function(){
		$(this).find("p:first").attr("style","position: absolute; top: 5px; left: 210px; opacity: 0.7;");
	});
	$("#wrapper").on("mouseleave", "[id^=video-el]", function(){
		$(this).find("p:first").attr("style","position: absolute; top: 5px; left: 210px; opacity: 0;");
	});
	
	var delContent;
	function historyDel (user){
		delContent = '<h4>시청 기록 지우기</h4>'
					+'<p>'+user.nick+'('+user.email+')</p>'
					+'<p>YouTube 시청 기록이 모든 기기에서 삭제됩니다. 맞춤 동영상이 재설정되지만 다른 Google제품에서의 활동으로부터 계속 영향을 받을 수 있습니다.'
					+'자세한 내용을 확인하려면 내 활동을 방문하세요.</p>';
	}
	var delBtn = '<button class="btn btn-default" data-dismiss="modal">취소</button>'
				+'<a href="#" id="delete-all-history" type="button" class="btn btn-danger" data-dismiss="modal">기록지우기</a>';
				
	var stopContent;
	function historyStop(user){
		stopContent = '<h4>시청 기록 일시중지</h4>'
			 +'<p>'+user.nick+'('+user.email+')</p>'
			 +'<p>YouTube 시청 기록을 일시중지하면 시청한 동영상을 찾기가 어려워지고 Google에서 새로운 동영상 관련 추천 항목이 줄어들 수 있습니다.'
			 +'이 설정을 일시중지해도 이전 활동은 삭제되지 않으며 언제든 비공개 YouTube 시청 기록 데이터를 확인, 수정, 삭제할 수 있습니다.</p>';
	}
	var stopBtn = '<button class="btn btn-default" data-dismiss="modal">취소</button>'
				+'<a href="#" type="button" class="btn btn-danger" data-dismiss="modal">기록 일시중지</a>';
					 
	$("#list-del").click(function(){
		historyDel(loginUser);
		$(".modal-body").empty();
		$(".modal-body").append(delContent);
		$(".modal-footer").empty();
		$(".modal-footer").append(delBtn);
		$("#watch-modal").modal('show');
	});
	
	$("#list-stop").click(function(){
		historyStop(loginUser);
		$(".modal-body").empty();
		$(".modal-body").append(stopContent);
		$(".modal-footer").empty();
		$(".modal-footer").append(stopBtn);
		$("#watch-modal").modal('show');
	});
	
	//시청기록 모두 삭제 
	$("#watch-modal").on("click", "#delete-all-history", function(){
		console.log("모두지운다");
		$.ajax({
			url:"/library/deleteAllHistory"
		});
		$("#wrapper").empty();
	});
	
	$("#delete-all-history").click(function(){
		
	});
	
	//시청기록 삭제버튼 클릭
	$("#wrapper").on("click", "[id^=watch-delete]", function(){
		var no = $(this).parents("[id^=row]").attr("id").replace("row-","");
		$.ajax({
			type:"GET",
			url:"/library/watchRemove",
			data:{videoNo : no}
		});
		$(this).parents("[id^=row]").remove();
	});
	
//코멘트----------------------------------------------------------------------------------------------------	
	
	//코멘트에대한 제목 클릭
	$("#wrapper").on("click", ".comment-video", function(){
		var no = $(this).attr("id");
		console.log(no);
		AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+no);
	});
	
	//코멘트 검색 버튼을 클릭
	$("#comment-radio").click(function(event){
		historyURL = "/library/commentList";
		watchHistoryOn = false;
		commentOn = true;
		communityOn = false;
		watchPno = 1;
		$(this).find("input").prop("checked", true);
		$("[name=historySearch]").val("");
		$("[name=historySearch]").parent().hide();
		commentLists();
	});
	
	//댓글 검색 창에서 댓글 수정버튼 클릭시
	$("#wrapper").on("click", "[id^=comment-fix]", function(){
		$(this).parents("[id^=row-colon]").find("[id^=commnent-fixform]").toggle();
		$(this).parents("[id^=row-colon]").find("p:first").toggle();
		$(this).parent().parent().hide();
	});
	
	//댓글 검색창에서 수정에서 확인 버튼을 클릭시
	$("#wrapper").on("click", "[id^=comment-update]", function(){
		var strNo = $(this).attr("id").replace("comment-update-","");
		var gubun = strNo.substring(0,2);
		var no = strNo.substring(3);
		var comment = $(this).prev().val();
		$.ajax({
			type:"GET",
			url:"/library/allCommentUpdate",
			data:{gubun: gubun, commentNo: no, comment: comment}
		});
		$(this).parents("[id^=row-colon]").find("p:first").text(comment);
		$(this).parents("[id^=row-colon]").find("p:first").show();
		$(this).parent().hide();
	});
	
	//코멘트 삭제버튼 클릭
    $("#wrapper").on('click', '[id^=comment-del]', function(){
    	var $row = $(this).parents("[id^=row-colon]");
    	var strNo = $(this).attr("id").replace("comment-del-","");
    	var gubun = strNo.substring(0,2);
    	var no = strNo.substring(3);
    	console.log(gubun + ", " + no);
		$.ajax({
			type:"GET",
			url:"/library/commentsReplysRemove",
			data:{gubun: gubun, commentNo: no}
		});

    	$(this).parents('ul').hide();
    	$row.next().remove();
    	$row.remove();
    });
	
//커뮤니티----------------------------------------------------------------------------------------------------
	
	//라이팅 삭제 버튼 클릭
	$("#wrapper").on("click","[id^=community-del]", function(){
		var $btn = $(this);
		var no = $btn.parents("[id^=row-community]").attr("id").replace("row-community-","");
		console.log("cno: "+no);
		$btn.parent().hide();
		$.ajax({
			type:"GET",
			url:"/library/writingDelete",
			data:{writingNo: no},
			dataType:"json",
			success:function(result){
				console.log(result);
				var isSuccess = result.success;
				if(isSuccess){
					$btn.parents("[id^=row-community]").next().remove();
					$btn.parents("[id^=row-community]").remove();
				}
			}
		});
	});
	
	//라이팅 코멘트 삭제 버튼 클릭.
	$("#wrapper").on("click","[id^=writing-comment-del-btn]", function(){
		var $delBtn = $(this);
		var no = $(this).parents("[id^=community-comment]").attr("id").replace("community-comment-", "");
		$.ajax({
			type:"GET",
			url:"/library/writingCommentDelete",
			data:{commentNo: no},
			dataType:"json",
			success:function(result){
				console.log(result);
				var isSuccess = result.success;
				if(isSuccess){
					$delBtn.parents("[id^=community-comment]").remove();
				}
			}
		});
	});
	
	//커뮤니티  버튼 클릭
	$("#community-radio").click(function(){
		historyURL = "/library/communityList";
		watchHistoryOn = false;
		commentOn = false;
		communityOn = true;
		watchPno = 1;
		$(this).find("input").prop("checked", true);
		$("[name=historySearch]").val("");
		$("[name=historySearch]").parent().hide();
		$("#wrapper").empty();
		communityLists();
		
		//AppManager.changeDiv($("#wrapper"),AppManager.div.subscriptions.community + "?creatorNo="+ loginUser.no + "&location=library");
	});
	
	//커뮤니티에 코멘트 모두 보기 버튼 클릭
	$("#wrapper").on("click","[id^=cmcomment-all-btn]", function(){
		var $commentWrapper = $(this).parents("[id^=row-community]").find("[id^=comment-wrapper]");
		var $door = $(this);
		$door.parent().next().toggle();
		//console.log($door.next());
		if(!$door.attr("class")){
			$commentWrapper.empty();
			$door.addClass("open");
			return;
		}
		
		var no = $(this).parents("[id^=row-community]").attr("id").replace("row-community-", "");
		$.ajax({
			url:'/library/communityComment',
			dataType:'json',
			data:{communityNo: no},
			success:function(result){
				console.log(result);
				$door.removeClass("open");
				var listSuccess = result.success;
				if(!listSuccess){
					$commentWrapper.empty();
					$commentWrapper.append("<p>댓글이 없습니다.</p>");
					return;
				}
				$commentWrapper.empty();
				var communityComments = result.list;
				$.each(communityComments, function(index, items){
					$commentWrapper.append(communityCommentHtml(items));
				});
			}
		});
	});
	
	//커뮤니티 코멘트 정렬
	function cmCommentSortList(item, sortName){
		var $commentWrapper = item.parents("[id^=row-community]").find("[id^=comment-wrapper]");
		var no = item.parents("[id^=row-community]").attr("id").replace("row-community-", "");
		var sort = sortName;
		console.log(no);
		$.ajax({
			type:"GET",
			url:"/library/sortCmComment",
			data:{cmWritingNo: no, sortValue : sort},
			success:function(result){
				console.log(result);
				//$door.removeClass("open");
				var isSuccess = result.success;
				if(!isSuccess){
					$commentWrapper.empty();
					$commentWrapper.append("<p>댓글이 없습니다.</p>");
					return;
				}
				$commentWrapper.empty();
				var communityComments = result.list;
				$.each(communityComments, function(index, items){
					$commentWrapper.append(communityCommentHtml(items));
				});
			}
		});
	}
	
	//커뮤니티 코멘트 좋아요 싫어요 
	function writingCommentSide($sideBtn, sideValue){
		var commentNo = $sideBtn.parents("[id^=community-comment]").attr("id").replace("community-comment-","");
		var sideValue = sideValue;
		$.ajax({
			type:"GET",
			url:"/library/communityCommentVote",
			data:{commentNo: commentNo, sideValue: sideValue},
			dataType:"json",
			success:function(result){
				console.log(result);
				var isSuccess = result.success;
				if(isSuccess){
					var no = $sideBtn.parents("[id^=row-community]").attr("id").replace("row-community-", "");
					$.ajax({
						url:"/library/communityComment",
						dataType: "json",
						data:{communityNo: no},
						success:function(result){
							var $commentWrapper = $sideBtn.parents("[id^=row-community]").find("[id^=comment-wrapper]");
							$commentWrapper.empty();
							var communityComments = result.list;
							$.each(communityComments, function(index, items){
								$commentWrapper.append(communityCommentHtml(items));
							});
						}
					});
				}
			}
		});
	}
	
	$("#wrapper").on("click", "[id^=cmc-like-btn]", function(){
		$sideBtn = $(this);
		writingCommentSide($sideBtn, "p");
	});
	
	$("#wrapper").on("click", "[id^=cmc-bad-btn]", function(){
		$sideBtn = $(this);
		writingCommentSide($sideBtn, "n");
	});
	
	//커뮤니티 코멘트 인기순 정렬버튼 클릭
	$("#wrapper").on("click", "[id^=cmComment-popular]", function(){
		$item = $(this);
		cmCommentSortList($item,"popular");
	});
	
	//커뮤니티 코멘트 날짜순 정렬버튼 클릭
	$("#wrapper").on("click", "[id^=cmComment-date]", function(){
		$item = $(this);
		cmCommentSortList($item,undefined);
	});
	
	//커뮤니티 수정버튼 클릭
	$("#wrapper").on("click", "[id^=community-repair]", function(){
	    $(this).parents(".dropdown-menu").hide();
		$(this).parents("[id^=row-community]").find(".cc-title-repair").toggle();
	});
	
	$("#wrapper").on("click", "[id^=communitytitle-repair-btn]", function(){
		var no = $(this).parents("[id^=row-community]").attr("id").replace("row-community-","");
		var content = $(this).parents("[id^=row-community]").find("[id^=cc-repair-comment]").val();
		console.log(no+", "+content);
		$.ajax({
			type:"GET",
			url:"/library/communityTitleUpdate",
			data:{cmWritingNo: no, cmWritingContent: content},
			success:function(result){
				console.log(result);
			}
		});
		
		$(this).parents("[id^=row-community]").find(".cm-title-h4").text(content);
		$(this).parents("[id^=row-community]").find(".cc-title-repair").toggle();
	});
	
	//커뮤니티 댓글 추가
	$("#wrapper").on("click", "[id^=communitycomment-plus]", function(){
		$(this).parents("[id^=row-community]").find("[id=communitycomment-write]").toggle();
	});
	
	$("#wrapper").on("click", "[id^=cmComment-update-btn]", function(){
		$row = $(this).parents("[id^=row-community]");
		var writingNo = $row.attr("id").replace("row-community-","");
		var comment = $(this).parent().parent().find("input").val();
		var commentCount = 0;
		
		if(!comment){
			alert("값을 입력해 주세요.");
			return;
		}
		$(this).parents("[id^=row-community]").find("[id=communitycomment-write]").hide();
		$.ajax({
			type:"GET",
			url:"/library/cmCommentInsert",
			data:{writingNo: writingNo, comment: comment},
			dataType:"json",
			success:function(result){
				console.log(result);
				var isSuccess = result.success;
				/* if(!isSuccess){
					alert("하나의 댓글만 달 수 있습니다.");
					return;
				} */
				
				commentCount = result.commentCount;
				$row.find("[id^=cmcomment-count]").text(commentCount);
				
			}
		});
		
	});
//---------------------------------------------------------------------------------	
	
	
	//목록 삭제 버튼
	$("#wrapper").on("mouseenter", "[id^=del-row]", function(){
		$(this).attr("style","opacity:1");
	});
	$("#wrapper").on("mouseleave", "[id^=del-row]", function(){
		$(this).attr("style","opacity:0.4");
	});
	
	//... 버튼 클릭시 보여주고 없애기
    $("#wrapper").on('click', '[id^="btn-drop"]',function(){
    	$(this).next().toggle();
    });
    
	//댓글에 마우스가 들어갔을시 나왔을시
	$("#wrapper").on('mouseenter',"[id^='community-comment']", function(){
    	$(this).find("div:last span").attr("style", "opacity:0.4");
    });
    $("#wrapper").on("mouseleave","[id^='community-comment']", function(){
    	$(this).find("div:last span").attr("style", "opacity:0");
    });
	
  	//커뮤니티 목록에 마우스가 들어갔을시 나왔을시
    $("#wrapper").on('mouseenter',"[id^=row-community]", function(){
    	$(this).find("#btn-drop").attr("style", "opacity:0.4");
    });
    $("#wrapper").on("mouseleave","[id^=row-community]", function(){
       $(this).find("#btn-drop").attr("style", "opacity:0");
       $(this).find("#btn-menu").hide();
    });
	
   //코멘트 목록에 마우스가 들어갔을시 나왔을시
   $("#wrapper").on('mouseenter',"[id^='row-colon']", function(){
	   var no = $(this).attr("id").replace("row-colon-","");
	   rowVideoNo = no;
       $(this).find("div:last-child button").attr("style", "opacity:0.4");
   });
   $("#wrapper").on("mouseleave","[id^='row-colon']", function(){
	   $(this).find("div:last-child button").attr("style", "opacity:0");
       $(this).find(".dropdown-menu").hide();
   });
});
</script>