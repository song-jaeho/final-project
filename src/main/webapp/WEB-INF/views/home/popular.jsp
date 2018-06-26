<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .content {
        margin: 0px;
    }
    
</style>
<c:set var="menu" value="popular"/>
	<div class="row content">
        <div id="pupular-box" class="col-sm-10 col-sm-offset-1">
            
        </div>
    </div>

<script>
$(function(){
	var $box = $("#pupular-box");
	var boxNo = 0;
	var videos;
	var videoCount= 0;
	var pno = 1;
	var videoTotal = 99;
	var scrollIn = false;
	var loginUser;
	
	/* var testItem = {
    		no : 144,
    		previewA2Url : "/resources/temp/junsung/images/no-image.png",
    		title : "Hello Duck!",
    		nick : "김덕덕",
    		views : 11,
    		lastDate : "10일전",
    		time : "00:22:33",
    		detail : "두두두두라라두루루다루루루나나나"
    } */
	
	$.ajax({
		url:'/home/popularlist',
		data: {pageNo : pno},
		dataType:'json',
		contentType:"application/json",
		success:function(result){
			console.log(result);
			var isSuccess = result.success;
			loginUser = result.user;
			if(!isSuccess){
				$box.append("<p>기록이 없습니다.</p>");
				//$box.append(htmlDiv1(testItem));
				return;
			}
			
			videos = result.items;
			videoCount = videos.length;
			for(var i = 0; i < videoCount; i++){
				$box.append(htmlDiv1(videos[i]));
				boxNo++;
			}
			pno = 2;
		}
	});
    
    AppManager.getMainDiv().scroll(function(event){
    	var docHeight = $(document).height();
		var divHeight = $("#pupular-box").height();
		var divScroll = $(this).scrollTop();
        //console.log("doc h : " + docHeight);
        //console.log("div h : " + divHeight);
        //console.log("div s : " + divScroll);
        if(boxNo >= videoTotal){
        	return;
        }
        if((docHeight + divScroll + 150) >= divHeight && scrollIn==false){
        	scrollIn = true;
        	$.ajax({
        		url:'/home/popularlist',
        		data: {pageNo : pno},
        		dataType:'json',
        		contentType:"application/json",
        		success:function(result){
        			console.log(result);
        			videos = result.items;
        			videoCount = videos.length;
        			for(var i = 0; i < videoCount; i++){
        				$box.append(htmlDiv1(videos[i]));
        				if(boxNo >= videoTotal){
        					break;
        				}
        				boxNo++;
        			}
        			pno++;
        			scrollIn = false;
        		}
        	});
		}
    });
    
    function htmlDiv1(box){
        var row = '<div id="row-'+box.no+'" style="margin-top: 30px; position: relative;" class="col-sm-12">'
                 +'<div class="col-sm-2 text-center" style="margin-right: 30px;">'
                     +'<a class="popu-video-link" href="#"><img src="'+box.previewA2Url+'" width="250px" height="140px"/></a>'
                 +'</div>'
                 +'<div class="col-sm-7" style="margin-left: 10px;">'
                     +'<p>'
                     	+'<a class="popu-video-link" href="#" style="font-size: 24px; color:black;">'+box.title+'</a>'
                     +'</p>'
                     +'<p>'
                         +'<a id="userid-link-'+box.userNo+'" href="#">'+box.nick+'</a>, 조회수<span>'+box.views+'</span>, <span>'+box.lastDate+'</span>'
                     +'</p>'
                     +'<p>'+box.detailShort+'</p>'
                 +'</div>'
                 +'<p style="background-color: black; position: absolute; top: 110px; left: 40px; opacity: 0.7;">'
 		        	+'<span style="color: white;">'+box.time+'</span>'
 		        +'</p>'
                 +'<div class="col-sm-2">'
                     +'<div class="dropdown">'
                         +'<button id="btn-drop-1" class="btn btn-link" style="opacity: 0;">'
                             +'<img src="/resources/temp/junsung/images/coron.png" width="6px" height="24px"/>'
                         +'</button>'
                         +'<ul id="btn-menu-'+box.no+'" class="dropdown-menu">'
                             +'<li><a href="#" id="play-later">나중에볼동영상</a></li>'
                             +'<li><a href="#" id="play-menu">재생목록</a></li>'
                         +'</ul>'
                     +'</div>'
                 +'</div>'           
             +'</div>'
        return row;
    }
    
    //유저 아이디 클릭
    $("#pupular-box").on("click","[id^=userid-link]", function(){
    	var no = $(this).attr("id").replace("userid-link-", "");
    	console.log(no);
    	AppManager.changeMainDiv(AppManager.div.subscriptions.main+"?creatorNo="+no);
    	
    });
    //비디오 링크를 클릭했을때
    $("#pupular-box").on("click",".popu-video-link", function(){
    	var no = $(this).parents("[id^=row]").attr("id").replace("row-","");
    	console.log("비디오 링크를 클릭했습니다. video-no : " + no);
    	AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+no);
    });
    
  	//재생목록 클릭했을때
    $("#pupular-box").on('click','[id^="play-menu"]', function(){
    	var no = $(this).parents("[id^=row]").attr("id").replace("row-","");
    	//var src = $(this).parents("[id^=row]").find("img:first").attr("src");
    	//$("#pjs-video-src").val(src);
    	$("#pjs-video-no").val(no);
    	$("#playlist-modal").modal('show');
    	$(this).parent().parent().hide();
    });
    
  	//나중에보기에 넣는 버튼
    $("#pupular-box").on('click', '[id^=play-later]', function(){
    	var no = $(this).parents("[id^=row]").attr("id").replace("row-", "");
    	$("#pjs-video-no").val(no);
    	$("#watchlater-modal").modal('show');
    	$(this).parents('ul').hide();
    });
  	
    var pjsVideoNo = 0;
  	//... 버튼 클릭시 보여주고 없애기
    $("#pupular-box").on('click', '[id^="btn-drop"]',function(){
    	$("[id=btn-menu-"+pjsVideoNo+"]").toggle();
    });
    
    //목록에 마우스가 들어갔을시 나왔을시
	$("#pupular-box").on('mouseenter',"[id^='row']", function(){
		if(!loginUser){
			console.log("로그인을 하지 않은 상태입니다.")
			return;
		}
		var $row = $(this);
		pjsVideoNo = $row.attr("id").replace("row-","");
	    $row.find("div:last-child button").attr("style", "opacity:0.4");
	});
	$("#pupular-box").on("mouseleave","[id^='row']", function(){
		$(this).find("div:last-child button").attr("style", "opacity:0");
	    $(this).find(".dropdown-menu").hide();
	});

});
</script>