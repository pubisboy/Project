<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.navbar {
	border-radius: 0px;
}
</style>

<div style="min-height: 10%; display: block;">배너뜨는창</div>
<div>
	<div class="navbar navbar-inverse navbar-fixed-top"
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
				<li><a href="/chat/chat.sz" target="blank">로그인</a></li>
				<%-- target="blank"는 새탭을 연다. --%>
				<li><a href="/message/form.sz">회원가입</a></li>
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