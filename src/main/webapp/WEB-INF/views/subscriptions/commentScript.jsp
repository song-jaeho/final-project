<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function changeCss($this, target, value) {
	$this.css(target, value);
}

function getNumber($target, removeText) {
	var first = $target.attr('id').replace(removeText, '');
	var second = 1;
	if (first.includes('-')) {
		second = first.substr(first.lastIndexOf('-')+1);
		first = first.slice(0,first.lastIndexOf('-'));
	}
	var total = {
		front: parseInt(first),
		back: parseInt(second)
	}
	return total;
}

function getCommentNo(first, second) {
	return $('#comment-hidden-no-box-'+first+"-"+second).val();
}

function getReplyNo(first, second) {
	return $('#reply-hidden-no-box-'+first+"-"+second).val();
}

var commentReportHtml = '<form action="#" class="formName">' +
						    '<div class="form-group">' +
						    '<label>어떤 점이 마음에 안 드셨나요?</label>' +
						    '<input type="text" placeholder="신고 사유" class="name form-control" required />' +
						    '</div>' +
						    '</form>';
var commentReplyHtml = '<form action="#" class="formName">' +
						    '<div class="form-group">' +
						    '<input type="text" placeholder="입력..." class="name form-control" required />' +
						    '</div>' +
						    '</form>';

$('[id^=comment-report-text]').hide();
$('[id^=reply-report-text]').hide();
$('[id^=comment-report-button]').hover(function() {
	changeCss($(this), 'color', 'black');
	var first = getNumber($(this), 'comment-report-button-').front;
	var second = getNumber($(this), 'comment-report-button-').back;
	$('#comment-report-text-'+first+'-'+second).show();
},
function() {
	changeCss($(this), 'color', '#707070');
	var first = getNumber($(this), 'comment-report-button-').front;
	var second = getNumber($(this), 'comment-report-button-').back;
	$('#comment-report-text-'+first+'-'+second).hide();
});

$('[id^=reply-report-button]').hover(function() {
	changeCss($(this), 'color', 'black');
	var first = getNumber($(this), 'reply-report-button-').front;
	var second = getNumber($(this), 'reply-report-button-').back;
	$('#reply-report-text-'+first+'-'+second).show();
},
function() {
	changeCss($(this), 'color', '#707070');
	var first = getNumber($(this), 'reply-report-button-').front;
	var second = getNumber($(this), 'reply-report-button-').back;
	$('#reply-report-text-'+first+'-'+second).hide();
});

function removeThumbsClass(first, second, which) {
	if (which == 'comment') {
		$('#comment-thumbsup-'+first+'-'+second).removeClass('voted-thumbs');
		$('#comment-thumbsdown-'+first+'-'+second).removeClass('voted-thumbs');
	} else if (which == 'reply') {
		$('#reply-thumbsup-'+first+'-'+second).removeClass('voted-thumbs');
		$('#reply-thumbsdown-'+first+'-'+second).removeClass('voted-thumbs');
	}
}

function removeAndAddCount(first, second, result, which) {
	if (which == 'comment') { 
		removeThumbsClass(first, second, which);
		$('#comment-like-count-spans-'+first+'-'+second).text(result);
	} else if (which == 'reply') {
		removeThumbsClass(first, second, which);
		$('#reply-like-count-spans-'+first+'-'+second).text(result);
	}		
}

function getReplyerAndReplyNo(first, second) {
	
	var result = {
		replierNo : $('#reply-user-no-'+first+'-'+second).val(),
		replyNo : $('#reply-hidden-no-box-'+first+'-'+second).val()
	}
	return result;
}
</script>