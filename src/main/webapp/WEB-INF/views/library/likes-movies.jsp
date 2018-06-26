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
	
</style>

	<div class="row content">
        <div class="col-sm-4 sidenav">
            <div id="av" class="text-center">
                <a class="likelist" href="#"><img id="title-img" src="/resources/temp/junsung/images/no-image.png" /></a>
            </div>
            <div>
                <a class="likelist" href="#" id="text-h1" style="color: black">좋아요 표시한 동영상</a>
            </div>
            <p style="color:gray">
               	 동영상 <span>0</span>개 , 업데이트:<span>0</span>
            </p>
            <div>
                <a class="likelist" href="#">
                    <img id="shuffle" src="/resources/temp/junsung/images/shuffle_icon.png" width="20px" height="20px" style="opacity: 0.3;"/>
                </a>
            </div>
            <hr>
            <div id="update-btns" class="col-sm-12" style="margin: 0">
                <div class='col-sm-6' style="margin: 0">
                    <a href="#" class="side-my"><img src="/resources/temp/junsung/images/no-image.png" width="40px" height="40px"/></a>
                    <a href="#" class="side-my" style="color: black"><strong>conerstone</strong></a>
                </div>
            </div>
        </div>
       
        <div class="col-sm-8 rightdiv" >
            <div class="row" style="background-color: #167ac6; color: white; margin-right: 140px; padding: 10px; margin-top: 10px; margin-bottom: 10px;">
               	 다른 언어(한국어)로 표시되는 내 재생목록 모습입니다.
            </div>
            <div id="wrapper" class="row">
	            
            </div>

        </div>
    </div>
 
<script>
$(function(){
	var testItem = {
			videoNo : 144,
    		preview_a1_url : "/resources/temp/junsung/images/no-image.png",
    		title : "Hello Duck!",
    		masterNo: 81,
    		masterNick : "박덕덕",
    		count : 11,
    		lastDay : "14일전",
    		duration : "00:22:33",
    		detail : "두두두두라라두루루다루루루나나나"
    }
	
	var listNo = 0;
	var boxNo = 1;
	var loginUserNo = 0;
	var likeList;
	var listCount = 0;
	var lastDayCount = 0;
	var listSuccess = false;
	
	getLikeMovieList();
	
	function getLikeMovieList(){
		
		$.ajax({
			url:'/library/likeList',
			dataType:'json',
			success:function(result){
				console.log(result);
				var loginUser = result.user;
				listSuccess = result.success;
				loginUserNo = loginUser.no;
				console.log(loginUserNo);
				if(!listSuccess){
					$("#wrapper").empty();
					$("#wrapper").append("<p>정보가 없습니다.</p>")
					//$("#wrapper").append(rowHtml(testItem, 1));
					$("#update-btns strong").empty().append(loginUser.nick);
					$(".sidenav p span:first").text(listCount);
					$(".sidenav p span:last").text(lastDayCount);
					$(".sidenav div:last img").attr("src", loginUser.profileSmallImgUrl==null?"/resources/temp/junsung/images/duckduckIcon.png":loginUser.profileSmallImgUrl);
					
					titleImgChange();
					return;
				}
				
				likeList = result.list;
				lastDayCount = likeList[0].createDateStr;
				listCount = likeList.length;
				
				$("#update-btns strong").empty().append(loginUser.nick);
				$(".sidenav p span:first").text(listCount);
				$(".sidenav p span:last").text(lastDayCount);
				$(".sidenav div:last img").attr("src", loginUser.profileSmallImgUrl==null?"/resources/temp/junsung/images/duckduckIcon.png":loginUser.profileSmallImgUrl);
				$("#wrapper").empty();
				
				$.each(likeList, function(index, items){
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
				$("#wrapper").append(rowHtml(likeList[listNo], boxNo));
				if(listNo>=listCount-1){
					break;
				}
				listNo++;
				boxNo++;
			}
		}
	});
	
	function rowHtml(item, count){
		var row = '<div id="row-'+item.videoNo+'" class="row">'
        		   +'<div class="col-sm-1">'
        		   	+'<p style="line-height: 65px" >'+count+'</p>'
    			   +'</div>'
    			    +'<div class="col-sm-11">'
    				 +'<div class="col-sm-2" style="padding: 0; position: relative;">'
            		  +'<a href="#" class="likemovie">'
            		   +'<img src="'+item.preview_a1_url+'" width="120px" height="70px"/>'
            		  +'</a>'
            		  +'<p style="background-color: black; position: absolute; top: 47px; left: -24px; opacity: 0.7;">'
	        		   +'<span style="color: white;">'+item.durationStr+'</span>'
	        		  +'</p>'
        			 +'</div>'
        			 +'<div class="col-sm-6" style="padding-left: 0;">'
                      +'<h4 style="margin-left: 0; margin-top: 0;"><a href="#" class="likemovie" style="color: black">'+item.title+'</a></h4>'
            		  +'<p style="margin-left: 0;"><a href="#" id="master-no-'+item.masterNo+'" style="color: darkgray">'+item.masterNick+'</a></p>'
        			 +'</div>'
        		    +'<div>'
        			 +'<a href="#">'
        			  +'<span id="remove" class="glyphicon glyphicon-remove" style="color: darkgray; font-size: 20px; opacity: 0;"></span>'
        			 +'</a>'
        			+'</div>'
    			   +'</div>' 
				  +'</div>'
 				  +'<div class="row"><hr class="hr"></div>';		
		
		return row;
	}
	
	//대표 이미지 교체
	function titleImgChange(){
		var titleImg = $("#wrapper div:first img").attr("src");
		if(!titleImg){
			$("#title-img").attr("src","/resources/temp/junsung/images/no-image.png");
			return;
		}
		$("#title-img").attr("src",titleImg);
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
	
	//다른 사람 아이디 클릭시 다른사람 홈으로 이동
	$("#wrapper").on("click", "[id^=master-no]", function(){
    	var no = $(this).attr("id").replace("master-no-","");
    	console.log("비디오 마스터 아이디 클릭 , master: "+no);
    	AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
    });
	
	//내아이디 클릭시 내 홈으로 이동
	$(".side-my").click(function(){
		console.log("내아이디,아이콘 클릭,userNo: " + loginUserNo);
		AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+loginUserNo);
	});
	
	//단일 플레이 리스트 화면으로 이동
	$("#wrapper").on("click", ".likemovie", function(){
		var no = $(this).parents("[id^=row]").attr("id").replace("row-","");
		console.log("단일 플레이어 no : " + no);
		//event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+no);
	});
	
	//좋아요 목록 플레이리스트 화면으로 이동
	$(".likelist").click(function(event){
		if(!listSuccess){
			alert("좋아요를 추가해주세요.");
			return;
		}
		//console.log("재생목록 리스트를 재생시킨다.userNo: "+likeList);
		var listArray = [];
		$.each(likeList, function(index, item){
			listArray.push(item.videoNo);
		});
		//console.log(listArray);
		//event.preventDefault();
		AppManager.changeMainDiv(AppManager.div.video.player+"?allList="+listArray);
	});
	
	//삭제버튼을 눌렀을 시
	$("#wrapper").on("click", "[id^=remove]", function(){
		var $row = $(this).parents("[id^=row]");
		var videoNo = $(this).parents("[id^=row]").attr("id").replace("row-","");
		$.ajax({
			type:"POST",
			url:"/library/likeRemove",
			data:{videoNo : videoNo},
			success: function(result){
				console.log(result);
			}
		});
		$row.next().remove();
		$row.remove();
		rowNumSort();
		titleImgChange();
	});
	
	//목록에 마우스가 들어갔을시 나왔을시
	$("#wrapper").on('mouseenter',"[id^='row']", function(){
		$(this).find(".glyphicon-remove").css("opacity","0.4");
	});
	$("#wrapper").on("mouseleave","[id^='row']", function(){
		$(this).find(".glyphicon-remove").css("opacity","0.0");
	});
	
	//셔플 애니메이션.
    $("#shuffle").hover(function(){
        $(this).attr("style", "opacity:1");
    }, function(){
        $(this).attr("style", "opacity:0.3");
    });
    
});
</script>