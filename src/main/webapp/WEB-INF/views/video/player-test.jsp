<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	video {
		width: 424px;
		height: 320px;
		overflow: hidden;
		background-color: black;
	}
</style>
</head>
<body>
<div class="container">

	<video poster="http://192.168.10.250/ducktube/media/video.file?fn=test&fm=png" preload="none" controls controlsList="nodownload" >
		<source src="http://192.168.10.250/ducktube/media/video.file?fn=test&fm=mp4" type="video/mp4">
		<source src="http://192.168.10.250/ducktube/media/video.file?fn=test&fm=ogg" type="video/ogg">
	</video>
	
	<video poster="http://192.168.10.250/ducktube/media/video.file?fn=test&fm=png" preload="none" controls controlsList="nodownload" >
		<source src="http://192.168.10.250/ducktube/media/video.file?fn=test&fm=mp4" type="video/mp4">
		<source src="http://192.168.10.250/ducktube/media/video.file?fn=test&fm=ogg" type="video/ogg">
	</video>
	
</div>
</body>
<script>
$(function(){
	
	var $video = $('video');
	
	var autoPlay = true;
	
	$video.on('seeked', function(){
		console.log('seeked');
	});
	
	$video.on('seeking' , function(){
		console.log('seeking');
	});
	
	$video.on('durationchange', function(){
		console.log('durationchange');
	});
	
	$video.on('timeupdate', function(){
		console.log('timeupdate');
	});
	
	$video.on('ended', function(){
		console.log('movie ended');
		if(autoPlay){
			this.play();
		}
	});
	
});
</script>
</html>