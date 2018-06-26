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
                <a href="#" class="later-list"><img id="title-img" src="/resources/temp/junsung/images/no-image.png" /></a>
            </div>
            <div>
                <a href="#" class="later-list" id="text-h1" style="color: black">나중에 볼 동영상</a>
            </div>
            <p style="color:gray">
               	 동영상 <span>0</span>개 , 업데이트:<span>0</span>
            </p>
            <div>
                <a href="#" class="later-list">
                    <img id="shuffle" src="/resources/temp/junsung/images/shuffle_icon.png" width="20px" height="20px" style="opacity: 0.3;"/>
                </a>
            </div>
            <hr>
            <div id="update-btns" class="col-sm-12" style="margin: 0">
                <div class='col-sm-6' style="margin: 0">
                    <a href="#" class="side-my"><img src="" width="40px" height="40px"/></a>
                    <a href="#" class="side-my" style="color: black"><strong>conerstone</strong></a>
                </div>
            </div>
        </div>
        
        <div class="col-sm-8 rightdiv">
            <div class="row" style=" padding: 10px; margin-top: 10px; margin-bottom: 10px;"></div>
            <div id="wrapper" class="row">
	            
            </div>
                        
        </div>
    </div>
    
<script>
$(function(){
	/* var testItem = {
			videoNo : 144,
    		preview_a1_url : "/resources/temp/junsung/images/no-image.png",
    		title : "Hello Duck!",
    		masterNo: 81,
    		masterNick : "박덕덕",
    		count : 11,
    		lastDay : "14일전",
    		duration : "00:22:33",
    		detail : "두두두두라라두루루다루루루나나나"
    } */
	
	var rowVideoNo = 0;
	var listNo = 0;
	var boxNo = 1;
	var loginUserNo = 0;
	var listCount = 0;
	var laterSuccess = false;
	var laterList;
	var lastDay = 0;
	
	getLaterMovieList();
	
	function getLaterMovieList(){
		$.ajax({
			url:'/library/laterList',
			dataType:'json',
			success:function(result){
				console.log(result);
				var loginUser = result.user;
				laterSuccess = result.laterSuccess;
				loginUserNo = loginUser.no;
				if(!laterSuccess){
					$("#wrapper").empty();
					$("#wrapper").append("<p>목록이 없습니다.</p>");
					//$("#wrapper").append(rowHtml(testItem, 1));
					$("#update-btns strong").empty().append(loginUser.nick);
					$(".sidenav p span:first").text(listCount);
					$(".sidenav p span:last").text(lastDay);
					$(".sidenav div:last img").attr("src", loginUser.profileSmallImgUrl==null?"/resources/temp/junsung/images/duckduckIcon.png":loginUser.profileSmallImgUrl);
					titleImgChange();
					return;
				}
				
				laterList = result.laterList;
				lastDay = laterList[0].createDateStr;
				listCount = laterList.length;
				
				$("#update-btns strong").empty().append(loginUser.nick);
				$(".sidenav p span:first").text(listCount);
				$(".sidenav div:last img").attr("src", loginUser.profileSmallImgUrl==null?"/resources/temp/junsung/images/duckduckIcon.png":loginUser.profileSmallImgUrl);
				$(".sidenav p span:last").text(lastDay);
				$("#wrapper").empty();
				$.each(laterList, function(index, items){
					$("#wrapper").append(rowHtml(items, boxNo));
					boxNo++;
					listNo++;
					if(listNo==20){
						return false;
					}
				});
				titleImgChange();
				
			}
		});
	}
	
	 AppManager.getMainDiv().scroll(function(event){
		var docHeight = $(document).height();
		var divHeight = $("#wrapper").height();
		var divScroll = $(this).scrollTop();
		
		if(listNo >= listCount-1){
			return;
		}
		
		if((docHeight + divScroll + 150) >= divHeight){
			for(var i = 0; i < 6; i++){
				$("#wrapper").append(rowHtml(laterList[listNo], boxNo));
				if(listNo>=listCount-1){
					break;
				}
				listNo++;
				boxNo++;
			}
		}
	});
	
	function rowHtml(item, count){
		var row = '<div id="row-'+item.videoNo+'" class="col-sm-12">'
        		   +'<div class="col-sm-1">'
        		    +'<p style="line-height: 65px;">'+count+'</p>'
    			   +'</div>'
    			   +'<div class="col-sm-11">'
    			   +'<div class="col-sm-2" style="padding: 0; position: relative;">'
            	    +'<a href="#" class="later-movie">'
            	     +'<img src="'+item.preview_a1_url+'" width="120px" height="70px"/>'
            	    +'</a>'
            	    +'<p style="background-color: black; position: absolute; top: 47px; left: -24px; opacity: 0.7;">'
	        	     +'<span style="color: white;">'+item.durationStr+'</span>'
	        	    +'</p>'
        		   +'</div>'
        		   +'<div class="col-sm-6" style="padding-left: 0;">'
            	    +'<h4 style="margin-left: 0; margin-top: 0;"><a href="#" class="later-movie" style="color: black">'+item.title+'</a></h4>'
                    +'<p style="margin-left: 0;"><a href="#" id="master-id-'+item.masterNo+'" style="color: darkgray">'+item.masterNick+'</a></p>'
                   +'</div>'
        		   +'<div class="col-sm-3" style="height: 100px;">'
            	    +'<div class="dropdown">'
                     +'<button id="btn-drop" class="btn btn-link" style="opacity: 0;">'
                      +'<img src="/resources/temp/junsung/images/coron.png" width="6px" height="24px"/>'
                     +'</button>'
                  	 +'<ul id="btn-menu-'+item.videoNo+'" class="dropdown-menu">'
                      +'<li><a href="#" id="play-menu">재생목록</a></li>'
                      +'<li><a href="#" id="play-del">삭제</a></li>'
                     +'</ul>'
                    +'</div>'
        		   +'</div>'
    			  +'</div>' 
				 +'</div>'
				 +'<div class="col-sm-12"><hr class="hr"></div>';
				 
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
		var titleImg = $("#wrapper img:first").attr("src");
		if(!titleImg){
			$("#title-img").attr("src","/resources/temp/junsung/images/no-image.png");
			return;
		}
		$("#title-img").attr("src",titleImg);
	}
	
	//재생목록 클릭했을때
    $("#wrapper").on('click','[id^="play-menu"]', function(){
    	var no = $(this).parents("[id^=row]").attr("id").replace("row-","");
    	//var src = $(this).parents("[id^=row]").find("img:first").attr("src");
    	//$("#pjs-video-src").val(src);
    	$("#pjs-video-no").val(no);
    	$("#playlist-modal").modal('show');
    	$(this).parent().parent().hide();
    });

  	//다른 사람 아이디 클릭시 다른사람 홈으로 이동
  	$("#wrapper").on("click", "[id^=master-id]", function(){
    	var no = $(this).attr("id").replace("master-id-","");
    	console.log("master: "+no);
    	AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
    });
	
	//내아이디 클릭시 내 홈으로 이동
	$(".side-my").click(function(){
		console.log("내아이디,아이콘 클릭,userNo: " + loginUserNo);
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+loginUserNo);
	});
	
	//단일 플레이 리스트 화면으로 이동
	$("#wrapper").on("click", ".later-movie", function(){
		var no = $(this).parents("[id^=row]").attr("id").replace("row-","");
		console.log("단일 플레이어 no : " + no);
		//event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+no);

	});
	
	//나중에볼동영상 목록 플레이리스트 화면으로 이동
	$(".later-list").click(function(event){
		if(!laterSuccess){
			alert("나중에볼동영상을 추가해주세요.");
			return;
		}
		console.log("나중에볼동영상 리스트를 재생시킨다.userNo: "+loginUserNo);
		//event.preventDefault();
		//AppManager.changeMainDiv(AppManager.div.video.player);
		var listArray = [];
		$.each(laterList, function(index, item){
			listArray.push(item.videoNo);
		});
		//console.log(listArray);
		AppManager.changeMainDiv(AppManager.div.video.player+"?allList="+listArray);
		
	});
	
	function deleteWatchLater(){
		var no = $("#pjs-video-no").val();
		$.ajax({
			type:"POST",
			url:"/library/laterRemove",
			data:{videoNo : no}
		});
	}
    //삭제버튼 클릭
    $("#wrapper").on('click', '[id^=play-del]', function(){
    	var $row = $(this).parents("[id^=row]");
    	var no = $(this).parents("[id^=row]").attr("id").replace("row-","");
    	$("#pjs-video-no").val(no);
    	deleteWatchLater();
    	
    	$(this).parents('ul').hide();
    	$row.next().remove();
    	$row.remove();
    	rowNumSort();
    	titleImgChange();
    });
    
    //... 버튼 클릭시 보여주고 없애기
    $("#wrapper").on('click', '[id^="btn-drop"]',function(){
    	$("[id=btn-menu-"+rowVideoNo+"]").toggle();
    });
    
   //목록에 마우스가 들어갔을시 나왔을시
   $("#wrapper").on('mouseenter',"[id^='row']", function(){
	   var no = $(this).attr("id").replace("row-","");
	   rowVideoNo = no;
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