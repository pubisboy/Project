<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div class="container"> 
	<div class="row">
		<div class="col-sm-2">
			<div class="well">
				<a href="/member/myinfo/info.j">마이페이지</a>
			</div>
			<ul class="nav nav-stacked nav-pills" style="margin-top: 20px;">
				<li class="${ac eq 'orderlist' ? 'ac' : '' }"><a href="/">주문내역</a></li>
				<hr style="margin: 0px;" />
				<li class="${ac eq 'shoppingbasket' ? 'ac' : '' }"><a href="/">장바구니</a></li>
				<hr style="margin: 0px;" />
				<li class="${ac eq 'coupon' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse1">쿠폰/적립금</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="/member/myinfo/couponlist.j">할인쿠폰</a><br /> <a
							href="/member/myinfo/save.j">적립금</a><br />
					</div>
				</div>
				<li class="${ac eq 'mycontents' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse2">나의
						컨텐츠</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="/member/myinfo/counsel_detail.j">1:1 문의</a><br /> <a
							href="/member/myinfo/qna.j">상품 Q&A</a><br /> 상품평<br />
					</div>
				</div>
				<li class="${ac eq 'mypage' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse3">나의정보</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="/member/myinfo/info_revise.j">회원정보수정</a><br /> <a
							href="/member/myinfo/userpass.j">비밀번호수정</a><br /> <a
							href="/member/myinfo/leave.j">회원탈퇴</a><br />
					</div>
				</div>
			</ul> 
		
		</div>
		<div class="col-sm-8">
		<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-6">
				<h4>고객센터</h4>
				<br /> <small>쏙쇼핑몰에서 즐거운 쇼핑되세요!<br /> 언제나 고객님들의 편리한 쇼핑을 위해
					노력하겠습니다.
				</small>
			</div>
			<div class="col-sm-6">
				고객센터 1234-5678 대표번호 <small>연중무휴 09:00~20:30</small>
			</div>
		</div>
		<div class="row" style="border-bottom: 2px solid #595959; border-top: 2px solid #ff1a66;">
			<div class="col-xs-2" style="border-right: 2px dotted grey;">자주 묻는 질문</div>
			<div class="col-xs-2" style="border-right: 2px dotted grey;">준비중</div>
			<div class="col-xs-2" style="border-right: 2px dotted grey;">1:1 상담내역</div>
			<div class="col-xs-2" style="border-right: 2px dotted grey;">주문내역확인</div>
			<div class="col-xs-2" style="border-right: 2px dotted grey;">당첨자발표</div>
			<div class="col-xs-2">아이디/비밀번호찾기</div>
		</div>
	</div>
		<tiles:insertAttribute name="section" /> 
		</div>
	</div>
</div>
