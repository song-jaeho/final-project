<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
  <div class="col-sm-1"></div>
  <div class="col-sm-10">
  	<div class="col-sm-12">
	  <div id="date-text-1">
	  <hr> 
      <h4>오늘</h4>
	  <hr> 
	  </div>	  
	  <div id="date-box-1">
       <c:forEach var="subList" items="${subList }"  >
	       <c:if test="${'오늘' eq subList.whenToday}">
	      	 <div id="list-sub" class="col-sm-2">
	        <a id="btn-mediaplay-${subList.videoNo }" href="">
	           <img src="${subList.priviewA4URL}" width="200" height="120"/>
	             <div style = "color:black;">
	               ${subList.title}
	             </div>
	        </a>
	        	<div>
	                 <span style="opacity: 0;" id="drop-sub" class="pull-right">
	                 <span class="dropdown">
	                      <span class="dropdown-toggle" type="button" data-toggle="dropdown">
	                      <span class="glyphicon glyphicon-option-vertical"></span></span>
	                      <ul class="dropdown-menu">
	                        <li><a id="" href="#">나중에 볼 동영상에 추가</a></li>
	                        <li><a href="#">재생 목록에 추가</a></li>
	                        <li><a href="#">숨기기</a></li>
	                      </ul>
	                </span>
	                 </span>
	             </div>
	             <p><small>${subList.creatorNick}</small></p>
	             <p><small><span>${subList.viewCount}회</span><sapn class="glyphicon glyphicon-time"></sapn><span>${subList.lastDate }</span></small></p>
	         </div>	
			</c:if>
	    </c:forEach>
	    </div>
  	</div>
	<div class="col-sm-12">
	  <div id="date-text-2">
	  <hr> 
      <h4>어제</h4>
	  <hr> 
	  </div>
	  <div id="date-box-2">
       <c:forEach var="subList" items="${subList }"  >
	       <c:if test="${'어제' eq subList.whenToday }">
	      	 <div id="list-sub" class="col-sm-2">
	        <a id="btn-mediaplay-${subList.videoNo }" href="">
	           <img src="${subList.priviewA4URL}" width="200" height="120"/>
	             <div style = "color:black;">
	               ${subList.title}
	             </div>
	        </a>
	        	<div>
	                 <span style="opacity: 0;" id="drop-sub" class="pull-right">
	                 <span class="dropdown">
	                      <span class="dropdown-toggle" type="button" data-toggle="dropdown">
	                      <span class="glyphicon glyphicon-option-vertical"></span></span>
	                      <ul class="dropdown-menu">
	                        <li><a id="" href="#">나중에 볼 동영상에 추가</a></li>
	                        <li><a href="#">재생 목록에 추가</a></li>
	                        <li><a href="#">숨기기</a></li>
	                      </ul>
	                </span>
	                 </span>
	             </div>
	             <p><small>${subList.creatorNick}</small></p>
	             <p><small><span>${subList.viewCount}회</span><sapn class="glyphicon glyphicon-time"></sapn><span>${subList.lastDate }</span></small></p>
	         </div>	
			</c:if>
	    </c:forEach>
	    </div>
	</div>  	
	<div class="col-sm-12">
	  <div id="date-text-3">
	  <hr> 
      <h4>이번주</h4>
	  <hr> 
	  </div>
	  <div id="date-box-3">
       <c:forEach var="subList" items="${subList }"  >
	       <c:if test="${'이번주' eq subList.whenToday }">
	      	 <div id="list-sub" class="col-sm-2">
	        <a id="btn-mediaplay-${subList.videoNo }" href="">
	           <img src="${subList.priviewA4URL}" width="200" height="120"/>
	             <div style = "color:black;">
	               ${subList.title}
	             </div>
	        </a>
	        	<div>
	                 <span style="opacity: 0;" id="drop-sub" class="pull-right">
	                 <span class="dropdown">
	                      <span class="dropdown-toggle" type="button" data-toggle="dropdown">
	                      <span class="glyphicon glyphicon-option-vertical"></span></span>
	                      <ul class="dropdown-menu">
	                        <li><a id="" href="#">나중에 볼 동영상에 추가</a></li>
	                        <li><a href="#">재생 목록에 추가</a></li>
	                        <li><a href="#">숨기기</a></li>
	                      </ul>
	                </span>
	                 </span>
	             </div>
	             <p><small>${subList.creatorNick}</small></p>
	             <p><small><span>${subList.viewCount}회</span><sapn class="glyphicon glyphicon-time"></sapn><span>${subList.lastDate }</span></small></p>
	         </div>	
			</c:if>
	    </c:forEach>
	    </div>
	</div>
	<div class="col-sm-12">
	  <div id="date-text-4">
	  <hr> 
      <h4>이번달</h4>
	  <hr> 
	  </div>
	  <div id="date-box-4">
       <c:forEach var="subList" items="${subList }"  >
	       <c:if test="${'이번달' eq subList.whenToday }">
	      	 <div id="list-sub" class="col-sm-2">
	        <a id="btn-mediaplay-${subList.videoNo }" href="">
	           <img src="${subList.priviewA4URL}" width="200" height="120"/>
	             <div style = "color:black;">
	               ${subList.title}
	             </div>
	        </a>
	        	<div>
	                 <span style="opacity: 0;" id="drop-sub" class="pull-right">
	                 <span class="dropdown">
	                      <span class="dropdown-toggle" type="button" data-toggle="dropdown">
	                      <span class="glyphicon glyphicon-option-vertical"></span></span>
	                      <ul class="dropdown-menu">
	                        <li><a id="" href="#">나중에 볼 동영상에 추가</a></li>
	                        <li><a href="#">재생 목록에 추가</a></li>
	                        <li><a href="#">숨기기</a></li>
	                      </ul>
	                </span>
	                 </span>
	             </div>
	             <p><small>${subList.creatorNick}</small></p>
	             <p><small><span>${subList.viewCount}회</span><sapn class="glyphicon glyphicon-time"></sapn><span>${subList.lastDate }</span></small></p>
	         </div>	
			</c:if>
	    </c:forEach>
	    </div>
	</div>
	<div class="col-sm-12">
	  <div id="date-text-5">
	  <hr> 
      <h4>이전</h4>
	  <hr> 
	  </div>
	  <div id="date-box-5">
       <c:forEach var="subList" items="${subList }"  >
	       <c:if test="${'이전' eq subList.whenToday }">
	      	 <div id="list-sub" class="col-sm-2">
	        <a id="btn-mediaplay-${subList.videoNo }" href="">
	           <img src="${subList.priviewA4URL}" width="200" height="120"/>
	             <div style = "color:black;">
	               ${subList.title}
	             </div>
	        </a>
	        	<div>
	                 <span style="opacity: 0;" id="drop-sub" class="pull-right">
	                 <span class="dropdown">
	                      <span class="dropdown-toggle" type="button" data-toggle="dropdown">
	                      <span class="glyphicon glyphicon-option-vertical"></span></span>
	                      <ul class="dropdown-menu">
	                        <li><a id="" href="#">나중에 볼 동영상에 추가</a></li>
	                        <li><a href="#">재생 목록에 추가</a></li>
	                        <li><a href="#">숨기기</a></li>
	                      </ul>
	                </span>
	                 </span>
	             </div>
	             <p><small>${subList.creatorNick}</small></p>
	             <p><small><span>${subList.viewCount}회</span><sapn class="glyphicon glyphicon-time"></sapn><span>${subList.lastDate }</span></small></p>
	         </div>	
			</c:if>
	    </c:forEach>
	    </div>
	</div>
	    <hr/> 
  </div>
  <div class="col-sm-1"></div>
</div>
<script type="text/javascript">
$(function() {
	
	$("[id^='drop-sub']").click(function(){
    	$("[id='drop-sub']").find(".dropdown-menu").toggle();	
    });
	
	$('[id^=btn-mediaplay]').click(function(event){
		event.preventDefault();
		console.log($(this).attr("id"));
    	var no = $(this).attr("id").replace("btn-mediaplay-","");
    	console.log(no);
		AppManager.changeMainDiv(AppManager.div.video.player+"?videoNo="+no+"&userNo=${LOGIN_USER.no}");
	});
	
	$("[id^='list-sub']").hover(function() {
		 var $listSub = $(this);
	        $listSub.find("[id^='drop-sub']").attr("style", "opacity:1"); 
	    }, function(){
	        $(this).find("[id^='drop-sub']").attr("style", "opacity:0");
	    	$("[id='drop-sub']").find(".dropdown-menu").hide();		
	});
	if ($('#date-box-1 div').length == 0) {
		$("[id=date-text-1]").hide();
	}
	if ($('#date-box-2 div').length == 0) {
		$("[id=date-text-2]").hide();
	}
	if ($('#date-box-3 div').length == 0) {
		$("[id=date-text-3]").hide();
	}
	if ($('#date-box-4 div').length == 0) {
		$("[id=date-text-4]").hide();
	}
	if ($('#date-box-5 div').length == 0) {
		$("[id=date-text-5]").hide();
	}
	
	
});
</script>