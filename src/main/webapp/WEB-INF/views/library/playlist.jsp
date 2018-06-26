<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: auto}
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #fafafa;
      height: 100%;
      width: 430px;
      position: fixed;
    }
    .rightdiv {
        margin-left: 500px;
        padding: 0px;
    }
    .sidenav div,p {
        margin-left: 30px;
    }
    #text-h1 {
        margin-top: 20px;
        font-size: 24px;
    }
    #av img {
        width: 357px;
        height: 200px;
        margin-top: 20px;
    }
    #av {
        margin: 20px;
    }
    .hr {
        border: 0.5px solid #D3D3D3;
    }
	.content {
		margin: 0px;
	}
	div[id^='row'] {
		height: 70px;
		padding-left: 0;
	}
	/* The container */
.container2 {
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
.container2 input {
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
.container2:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container2 input:checked ~ .checkmark {
    background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.container2 input:checked ~ .checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.container2 .checkmark:after {
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
</style>

	<div class="row content">
        <div class="col-sm-4 sidenav">
            <div id="av" class="text-center">
                <a href="#" class="play-list"><img id="title-img" 
                src="${empty oneplayList.playlistRepImg ? '/resources/temp/junsung/images/no-image.png' : oneplayList.playlistRepImg }" /></a>
                
                <a href="#" style=" color:gray; position: absolute; top:10px; left:400px;" id="playlist-del">
	            	<span style="font-size: 20px; color: darkgray;" class="glyphicon glyphicon-remove pull-right"></span>
	            </a>
            </div>
            <div>
                <a href="#" class="play-list playlist-title" id="text-h1" style="color: black">${oneplayList.playlistTitle }</a>
                <input id="title-input" class="playlist-title" type="text" style="display: none" value="${oneplayList.playlistTitle }"/>
                <button id="pl-title-change" style="display: none" class="btn btn-default btn-xs playlist-title" >확인</button>
                <a href="#"  >
                	<span id="pl-title-setting" style="font-size: 20px; color: darkgray;" class="glyphicon glyphicon-edit pull-right"></span>
                </a>
            </div>
            <p style="color:gray">
               	 동영상 <span>${oneplayList.videoCount }</span>개 , 생성:<span>${oneplayList.createDateStr}</span>
            </p>
            <div>
                <a href="#" class="play-list">
                    <img id="shuffle" src="/resources/temp/junsung/images/shuffle_icon.png" width="20px" height="20px" style="opacity: 0.3;"/>
                </a>
            </div>
            <hr>
            <div id="update-btns" class="col-sm-12" style="margin: 0">
                <div class='col-sm-6' id="${LOGIN_USER.no }" style="margin: 0">
                    <a href="#" class="myid"><img src="${LOGIN_USER.profileSmallImgUrl }" width="40px" height="40px"/></a>
                    <a href="#" class="myid" style="color: black"><strong>${LOGIN_USER.nick }</strong></a>
                </div>
                <div class="col-sm-6" style="margin-left: 0; margin-top: 10px">
                    <a href="#" id="write-a" style="color: gray;" class="pull-right">
                        <span class="glyphicon glyphicon-pencil" style="font-size: 19px; color: darkgray"></span>설명쓰기
                    </a>
                </div>
            </div>
            <div class="col-sm-12" style="margin-left: 0; padding: 0;"><hr></div>
            <div class="col-sm-12" style="padding-right: 20px; margin-left: 0px;">
         		<div id="write-box">
         			<p id="content-p" class="content-boxes">${oneplayList.playlistContents }</p>
         			<div class="from-group content-boxes" style="display: none;">
		            	<textarea id="content-text" class="form-control" rows="4">${oneplayList.playlistContents }</textarea>
		            	<button id="content-change-btn" class="btn btn-default btn-xs pull-right" style="margin-top: 10px;">확인</button>
            		</div>
            	</div>
            </div>
            <div class="col-sm-12" style="margin-left: 0; padding: 0;"><hr></div>
           	<form action="#22" method="get">
           		<div class="col-sm-12 form-group" style="margin-left: 0; padding-left: 30px;">
	            	<select class="form-control" id="side-select" name="playlistStatus">
	            	<c:choose>
	            		<c:when test="${oneplayList.playlistStatus eq 'enabled' }">
	            			<option value="enabled" selected>공개</option>
	            			<option value="disabled">비공개</option>
	            		</c:when>
	            		<c:otherwise>
	            			<option value="enabled">공개</option>
	            			<option value="disabled" selected>비공개</option>
	            		</c:otherwise>
	            	</c:choose>
	            	</select>
            	</div>
           	</form>
        </div>

        <div class="col-sm-8 rightdiv">
            <div class="col-sm-12" style=" padding: 10px; margin-top: 10px; margin-bottom: 10px;">
            	<input id="title-img-hidden" type="hidden" value="${oneplayList.playlistRepImg }" />
            </div>
            <div class="col-sm-12" id="wrapper">
	            
            </div>
                        
        </div>
    </div>
    
<script>
$(function(){
	
	/* var testItem = {
			videoNo : 144,
    		preview_a1_url : "/resources/temp/junsung/images/Desert.jpg",
    		title : "Duck!",
    		userNo: 81,
    		userNick : "박덕덕",
    		count : 11,
    		lastDay : "14일전",
    		duration : "00:22:33",
    		detail : "두두두두라라두루루다루루루나나나"
    } */
	
	var itemVideoNo = 0;
	var saveTitleImg;
	var playListNo = 0;
	var loginUser;
	var plno = "${plno}";
	var playListCount = 0;
	var boxNo = 1;
	var listSuccess = false;
	var playList;
	
	playListData();
	
	//선택한 플레이리스트 목록 가져오기
	function playListData(){
		$.ajax({
			url:"/library/playlistData",
			data:{plno: plno},
			dataType:"json",
			success:function(result){
				console.log(result);
				listSuccess = result.success;
				loginUser = result.user;
				if(!listSuccess){
					//$("#wrapper").empty();
					$("#wrapper").append("<p>영상이 없습니다.</p>");
					//$("#wrapper").append(rowHtml(testItem,1));
					//titleImgChange();
					return;
				}
				playList = result.list;
				playListCount = playList.length;
				$("#wrapper").empty();
				$.each(playList, function(index, items){
					$("#wrapper").append(rowHtml(items));
					boxNo++;
					playListNo++;
					if(playListNo==20){
						return false;
					}
				});
								
				//titleImgChange();
			}
		});
	}
	
	 AppManager.getMainDiv().scroll(function(event){
		var docHeight = $(document).height();
		var divHeight = $("#wrapper").height();
		var divScroll = $(this).scrollTop();
		
		if(playListNo >= playListCount-1){
			return;
		}
		
		if((docHeight + divScroll + 150) >= divHeight){
			for(var i = 0; i < 6; i++){
				$("#wrapper").append(rowHtml(playList[playListNo], boxNo));
				if(playListNo>=playListCount-1){
					break;
				}
				playListNo++;
				boxNo++;
			}
		}
	});
	
	function rowHtml(item, count){
		var row = '<div id="row" class="col-sm-12">'
			        +'<div class="col-sm-1">'
			        	+'<p id="list-order" style="line-height: 65px" >'+item.playlistOrder+'</p>'
			    	+'</div>'
			     	+'<div class="col-sm-11 box">'
			          +'<div class="item" id="item-'+item.videoNo+'">'
			        	+'<div class="col-sm-2" style="padding: 0; position: relative;">'
			                +'<a href="#" class="play-movie">'
			                	+'<img src="'+item.preview_a1_url+'" width="120px" height="70px"/>'
			                +'</a>'
			                +'<p style="background-color: black; position: absolute; top: 47px; left: -24px; opacity: 0.7;">'
					        	+'<span style="color: white;">'+item.durationStr+'</span>'
					        +'</p>'
			            +'</div>'
			            +'<div class="col-sm-6 list" style="padding-left: 0;">'
			                +'<h4 style="margin-left: 0; margin-top: 0;"><a href="#" class="play-movie" style="color: black">'+item.title+'</a></h4>'
			                +'<p style="margin-left: 0;"><a href="#" id="master-no-'+item.userNo+'" style="color: darkgray">'+item.userNick+'</a></p>'
			            +'</div>'
			            +'<div class="col-sm-3" style="height: 100px;">'
			                +'<div class="dropdown">'
			                      +'<button id="btn-drop" class="btn btn-link" style="opacity: 0;">'
			                          +'<img src="/resources/temp/junsung/images/coron.png" width="6px" height="24px"/>'
			                      +'</button>'
			                      +'<ul id="btn-menu-'+item.videoNo+'" class="dropdown-menu">'
			                          +'<li><a href="#" id="play-later">나중에볼동영상</a></li>'
			                          +'<li><a href="#" id="play-menu">재생목록</a></li>'
			                          +'<li><a href="#" id="play-img">재생목록 미리보기 이미지로 설정</a></li>'
			                          +'<li><a href="#" id="play-del">삭제</a></li>'
			                      +'</ul>'
			                +'</div>'
			            +'</div>'
			        +'</div>'
			    +'</div>' 
			+'</div>'
			+'<div class="col-sm-12"><hr class="hr"></div>'
			
			return row;
	}
	
	//숫자 정렬
	function rowNumSort(){
		var num = 1;
		$nums = $("[id^=row]").find("div:first p");
		$nums.each(function(){
			$(this).text(num);
			num++;
		});
	}
	
	//대표 이미지 교체
	function titleImgChange(){
		if($("[id=title-img-hidden]").val()){
			return;
		}
		var titleImg = $("#wrapper img:first").attr("src");
		if(!titleImg){
			$("#title-img").attr("src","/resources/temp/junsung/images/no-image.png");
			return;
		}
		$("#title-img").attr("src",titleImg);
	}
	
///////////////////////////////////////////////////	
	var $srcItem,
    $destItem,
    $srcBox,
    $destBox;

	$(".item").attr('draggable', 'true');
	
	$('#wrapper').on('dragstart', '.item', function() {
	    // 드래그 시작
	    //console.log("drag start");
	    // 드래그한 아이템의 복사본을 생성한다.
	    var $item = $(this).clone(); 
	    
	    // srcItem이 null이거나 srcItem에 들어있는 엘리먼트와 지금 드래그한 엘리먼트가 다를 경우에 새로 담는다.
	    if (!$srcItem || $srcItem.attr("id") != $item.attr("id")) {
	        // 드래그한 아이템을 srcItem에 담기
	        $srcItem = $(this);
	        // 드래그한 아이템이 들어있던 box를 srcBox에 담기
	        $srcBox = $(this).parents('.box');
	        console.log($srcItem);
	        console.log($srcBox);
	    }     
	});
	
	// 드래그한 아이템이 특정 박스위에 도착했을 때 발생하는 이벤트
	$("#wrapper").on("dragover", ".box", function(){
		event.preventDefault();
	    //console.log("dragover!");
	    // srcItem이 비어있으면 취소
	    var $item = $(this).find('.item');
	    if ($srcItem.attr("id") == $item.attr("id")) {
	    	//console.log("id가 같다");
	        return;
	    }
	    
	    // 드롭대상 박스와 그 박스안에 있는 아이템을 각각 destBox와 desItem에 담기
	    if (!$destItem || $destItem.attr("id") != $item.attr("id")) {
	        $destItem = $(this).find('.item').clone();
	        $destBox = $(this);
	        console.log($destItem);
	        console.log($destBox);
	    }
	});
	
	// 드래그한 아이템이 드롭이 되면 발생하는 이벤트
	$("#wrapper").on("drop", ".box", function(){
		event.preventDefault();
		//console.log("drop!");
	    // 드래그한 아이템을 destBox에 부착하고
	    // dest박스에 있었던 아이템은 srcBox에 부착시킨다.
	    if ($destBox) {
	        $destBox.empty().append($srcItem);
	        $srcBox.empty().append($destItem);
	    }
	    
	    /* if(!saveTitleImg){
			titleImgChange();
	    } */
	    
	  //playlistVideos order 순서를 변경해 줘야한다.
	    var plno = $("#playlist-no").val();
	    var beforeVideoNo = $destItem.attr("id").replace("item-","");
	    var beforeOrder = $destItem.parents("[id^=row]").find("[id^=list-order]").text();
	    var afterVideoNo = $srcItem.attr("id").replace("item-","");
	    var afterOrder = $srcItem.parents("[id^=row]").find("[id^=list-order]").text();
	    
	    var nums = {playlistNo: plno, videoNo: beforeVideoNo, beforeOrder: beforeOrder, afterVideoNo: afterVideoNo, afterOrder: afterOrder}
	    
	    $.ajax({
	    	type:"POST",
	    	url:"/library/playlistOrderUpdate",
	    	data:JSON.stringify(nums),
	    	contentType:"application/json"
	    });
	    
	    $srcItem = null;
	    $srcBox = null;
	    $destItem = null;
	    $destBox = null;
	    
	    //titleImgChange();
	    
	});
	
////////////////////////////////////////////////////////////////////////////////////
	
	//공개 비공개 설정
	$("#side-select").change(function(){
		console.log($("[name=playlistStatus]").val());
		var status = $("[name=playlistStatus]").val();
		var plno = $("#playlist-no").val();
		$.ajax({
			type:"GET",
			url:"/library/statusUpdate",
			data:{status: status, plno: plno}
		});
	});
	
	//플레이리스트 콘텐츠 수정하기.
	$("#write-a").click(function(){
		$(".content-boxes").toggle();
	});
	
	$("#content-change-btn").click(function(){
		var plno = $("#playlist-no").val();
		var content = $("#content-text").val();
		
		$.ajax({
			type:"POST",
			url:"/library/playlistContentUpdate",
			data:{plno: plno, content: content }
		});
		
		$(".content-boxes").toggle();
		$("#content-p").text(content);
	});
	
	//플레이리스트 제목 수정하기
	$("#pl-title-setting").click(function(){
		$(".playlist-title").toggle();
	});
	
	$("#pl-title-change").click(function(){
		var plno = $("#playlist-no").val();
		var title = $("#title-input").val();
		
		$.ajax({
			type:"POST",
			url:"/library/playlistTitleUpdate",
			data:{plno: plno, title: title }
		});
		$(".playlist-title").toggle();
		$("#text-h1").text(title);
		$("#btn-playlist-"+plno).html("<span class='glyphicon glyphicon-align-justify list-icon'></span>"+title);
		
	});

    //재생목록 미리보기 이미지로 설정
    $("#wrapper").on('click',"[id^='play-img']", function(){
    	var no = $(this).parents("[id^=item]").attr("id").replace("item-","");
    	var src = $(this).parents("[id='item-"+no+"']").find("div:first img").attr("src");
    	var plno = $("#playlist-no").val();
    	//saveTitleImg = src;
    	$("#title-img").attr("src", src);
    	
    	//아작스로 이 플레이리스트 타이틀이미지를 업로드 한다.
    	$.ajax({
    		type:"POST",
    		url:"/library/playlistImgUpdate",
    		data:{plno: plno, titleImg: src}
    	});
    	
    	$(this).parents('ul').hide();
    });
    
	//재생목록 클릭했을때
    $("#wrapper").on('click','[id^="play-menu"]', function(){
    	var no = $(this).parents("[id^=item]").attr("id").replace("item-","");
    	//var src = $(this).parents("[id='item-"+no+"']").find("div:first img").attr("src");
    	//$("#pjs-video-src").val(src);
		$("#pjs-video-no").val(no);
    	$("#playlist-modal").modal('show');
    	$(this).parent().parent().hide();
    });
	
    //나중에보기에 넣는 버튼
    $("#wrapper").on('click', '[id^=play-later]', function(){
    	var no = $(this).parents("[id^=item]").attr("id").replace("item-","");
    	$("#pjs-video-no").val(no);
    	$("#watchlater-modal").modal('show');
    	$(this).parents('ul').hide();
    });

  	//플레이리스트 삭제
	$("#playlist-del").click(function(){
		var r = confirm("삭제하시겠습니까?");
		if(r==true){
			var plno = $("#playlist-no").val();
			$.ajax({
				type:"GET",
				url:"/library/playlistRemove",
				data:{plno: plno}
			});
			$("#btn-playlist-"+plno).remove();
			$("#pl-modal-"+plno).remove();
			AppManager.changeMainDiv(AppManager.div.home.popular);
		}
		
	});
    
    //플레이리스트 비디오 삭제버튼 클릭
    $("#wrapper").on('click', '[id^=play-del]', function(){
    	var $row = $(this).parents("[id^=row]");
    	var no = $(this).parents("[id^=item]").attr("id").replace("item-", "");
		var plno = $("#playlist-no").val();
    	$.ajax({
    		type:"POST",
    		url:"/library/playlistVideoRemove",
    		data:{videoNo : no, plno: plno},
    		dataType:"json",
    		success:function(result){
    			console.log(result);
    			var saveImg = result.saveTitleImg;
    			var titleImg = result.videoImg; 
    			if(saveImg){
    				$("#title-img").attr("src", titleImg);
    			}
    		}
    	});
    	
    	$row.next().remove();
    	$row.remove();
    	rowNumSort();
    });
    
  	//다른 사람 아이디 클릭시 다른사람 홈으로 이동
    $("#wrapper").on("click", "[id^=master-no]", function(){
    	var no = $(this).attr("id").replace("master-no-","");
    	console.log("master: "+no);
    	AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
    });
  	
  	//내아이디 클릭시 내 홈으로 이동
    $(".myid").click(function(){
    	var no = $(this).parent().attr("id");
    	AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
    });
  	
  	//단일 플레이 리스트 화면으로 이동
    $("#wrapper").on("click", ".play-movie", function(){
    	var no = $(this).parents("[id^=item]").attr("id").replace("item-","");
    	console.log("비디오 플레이어 이동 No: " + no);
    	AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+no);
    });
  	
  	//플레이리스트 화면으로 이동
    $(".play-list").click(function(){
    	if(!listSuccess){
    		alert("비디오를 추가해주세요.");
    		return;
    	}
    	console.log();
    	var no = $("#playlist-no").val();
    	AppManager.changeMainDiv(AppManager.div.video.player + "?subListNo="+ no);
    	//playList.playlistNo;
    });
  	
    //... 버튼 클릭시 보여주고 없애기
    $("#wrapper").on('click', '[id^="btn-drop"]',function(){
    	$("[id=btn-menu-"+itemVideoNo+"]").toggle();
    });
    
   //목록에 마우스가 들어갔을시 나왔을시
   $("#wrapper").on('mouseenter',"[id^='row']", function(){
	   var no = $(this).find("[id^=item]").attr("id").replace("item-","");
	   itemVideoNo = no;
	   $(this).find("div:last-child button").attr("style", "opacity:0.4");
   });
   $("#wrapper").on("mouseleave","[id^='row']", function(){
	   $(this).find("div:last-child button").attr("style", "opacity:0");
       $(this).find(".dropdown-menu").hide();
   });
    
   $("#shuffle").hover(function(){
       $(this).attr("style", "opacity:1");
   }, function(){
       $(this).attr("style", "opacity:0.3");
   });
});
</script>