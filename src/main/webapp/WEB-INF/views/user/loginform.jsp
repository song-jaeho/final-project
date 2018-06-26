<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#login-form {
		width: 1000px;
	}
</style>
<div id="login-form">
	<form class="well">
		<c:if test="${error eq 'deny' }">
			<div class="alert alert-danger" role="alert">
		 		로그인이 필요한 서비스입니다.
			</div>
		</c:if>
		<div class="form-group">
			<label>아이디</label>
			<input type="text" class="form-control" />
		</div>
		<div class="form-group">
			<label>비밀번호</label>
			<input type="password" class="form-control" />
		</div>
		<div class="text-right">
			<button class="btn btn-primary btn-sm">로그인</button>
		</div>
	</form>
</div>
<script>

	$.ajax ({

		url : AppManager.RequestURL.url.login +''
		
	})

</script>