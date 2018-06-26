var AppManager = {
	
	$mainDiv : null,

	div : {
		
		home : {
			
			list : '/home/list',
			
			popular : '/home/popular',
			
			subscription : '/home/subscription',
			
			home : '/home/home',
			
			search : '/home/search-page'
			
		},
		
		library: {
			
			history: '/library/history', 
			
			likesMovies: '/library/likes-movies',
			
			watchLater: '/library/watch-later',
			
			playList: '/library/playlist'
				
		},
		
		subscriptions: {
			
			subscribe: '/subscriptions/subscribe',
			
			main: '/subscriptions/main',
			
			home:'/subscriptions/home',
			
			comments: '/subscriptions/comments',
			
			playlist: '/subscriptions/playlist',
			
			search: '/subscriptions/search',
			
			videos: '/subscriptions/videos',
			
			community: '/subscriptions/community',
			
			channels: '/subscriptions/channels'	,
			
			reply: '/subscriptions/reply'
			
		},
		
		video : {
			
			player : '/video/player',
				
		},
		
		user : {
			
			loginForm : '/user/login-form',
			
			registerForm : '/user/register-form'
			
		},
		
		creator : {
			
			movieUploadForm : '/creator/movie-upload-form'
			
		}
		
	},
	
	data : {
		
		subscriptions  : {
			
			notice: '/subscriptions/noticeStatus.do',
			
			report: '/subscriptions/report.do',
				
			comment: '/subscriptions/addComment.do',
			
			updateComment: '/subscriptions/updateComment.do',
			
			thumbs: '/subscriptions/thumbs.do',
			
			reply: '/subscriptions/reply.do',
			
			modifyReply: '/subscriptions/modifyReply.do',
			
			subscribe: '/subscriptions/subscribe.do',
			
			addPlaylist: '/subscriptions/addPlaylist.do',
			
			writing: '/subscriptions/writing.do',
			
			removeWriting: '/subscriptions/removeWriting.do'
				
		}
		
	},
	
	setMainDiv : function($div){
		this.$mainDiv = $div;
	},
	
	getMainDiv : function(){
		return this.$mainDiv;
	},

	changeMainDiv : function(divURL){
		var manager = this;
		manager.$mainDiv.unbind().empty().load(divURL, function(){
			manager.$mainDiv.scrollTop(0);
		});
	},
	
	changeDiv : function(queryString, divURL){
		$(queryString).load(divURL);
	},

	showAlert : function(title, content){
		$.alert({
		    title: title,
		    content: content,
		});
	},
	
	showConfirm : function (title, contents, confirm, cancel){
		$.confirm({
		    title: title,
		    content: contents,
		    buttons: {
		        confirm: confirm,
		        cancel: cancel
		    }
		});
	},
	
	makeSubListHtml : function (statusCount, ownerNo, imgUrl, title, unsightVideoCount) {
		
		title = title.replace('님의 채널', '');
		if (title.length > 8) {
			title = title.substring(0, 8);
			title += '..';
		}
		
		var subListHtml = '<li style="cursor: pointer;" id="subscription-list-li-'+statusCount+'">' +
						'<a class="subscription-list-buttons" id="subscription-list-button-'+statusCount+'">'+
						'<input type="hidden" value="'+ownerNo+'" id="subscription-list-hiddenbox-'+statusCount+'">' +
						'<img alt="mini-profile" src="'+imgUrl+'" class="img-circle">' +
						'<span style="padding-left: 5px;"> ' +
						title +			            				
						'</span>';
						
		if (unsightVideoCount != 0) {
			subListHtml += '<span class="badge pull-right">'+unsightVideoCount+'</span>';		            				
		}
			subListHtml += '</a>'+
							'</li>';
		return subListHtml;
	}
};