<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.modal-header, h4, .close {
	background-color: #ffffff;
	color: black !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

.navbar {
	border-radius: 0px;
}
</style>

<div style="min-height: 10%; display: block;">배너뜨는창</div>
<div>
	<div class="navbar navbar-inverse navbar-fixed"
		style="margin-bottom: 0px;">
		<div class="navbar-header" style="padding-left: 17%;">
			<a href="/" class="navbar-brand">SSOG</a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNav">
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="myNav"
			style="padding-right: 17%;">
			<ul class="nav navbar-nav navbar-right">
				<li id="log"><a id="myBtn">로그인</a></li>
				<%-- target="blank"는 새탭을 연다. --%>
				<li><a href="/member/join.j">회원가입</a></li>
				<li><a href="/message/form.sz">나의정보</a></li>
				<li><a href="/message/form.sz">고객센터</a></li>
				<li><a href="/message/form.sz">장바구니</a></li>
				<li style="margin-right: 15px;" class="dropdown"><a
					class="dropdown-toggle" data-toggle="dropdown" href="#">${sessionScope.key }<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/my/profile.sz">즐겨찾기</a></li>
						<li><a href="/my/profile.sz">프로필</a></li>
						<li><a href="#">개인정보변경</a></li>
						<li><a href="/user/logout.sz">로그아웃</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<div>
		<div align="center" style="padding-top: 30px;">
			<input type="text" placeholder="검색">
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header" style="padding: 35px 50px;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4>
					<span class="glyphicon glyphicon-lock"></span> 로그인
				</h4>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form role="form">
					<div class="form-group">
						<label for="usrname"> SSOG STORE 로그인</label> <input type="text"
							class="form-control" id="id" placeholder="아이디">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="pass"
							placeholder="암호">
					</div>
					<div class="checkbox">
						<label><input type="checkbox" value="" checked>아이디저장</label>
					</div>
					<button type="submit" class="btn btn-info btn-block">
						<span class="glyphicon glyphicon-off"></span> 로그인
					</button>
				</form>
			</div>
			<div class="modal-footer">
				<p>
					<a href="#">SSOG 계정이 없으신가요? </a>
				</p>
				<p>
					<a href="#">ID또는 암호를 잊으셨습니까? </a>
				</p>
			</div>
		</div>

	</div>
</div>
