<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div class="container">
	<div class="row">
		<div class="col-sm-2">
			<div class="well">
			<a href="/member/myinfo/info.j" >마이페이지</a>
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
						할인쿠폰<br />적립금<br />
					</div>
				</div>
				<li class="${ac eq 'mycontents' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse2">나의
						컨텐츠</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						1:1 문의<br /> 상품 Q&A<br /> 상품평<br />
					</div>
				</div>
				<li class="${ac eq 'mypage' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse3">나의정보</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">
						회원정보수정<br />비밀번호수정<br />회원탈퇴<br/>
					</div>
				</div>
			</ul>
		</div>
		
		<div class="col-sm-8" >
		<div class="well">
			<div class="row">
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-6">
							<dl>
								<dt>온라인등급</dt>
								<h4>${grade.GRADE }</h4>
							</dl>
						</div>
						<div class="col-sm-6">
							<button style="font-size: 12px; width: 65px; height: 65px">
								자세히<br />보기
							</button>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-6">
							<dl>
								<dt>My Wallet</dt>
								<dd>할인쿠폰</dd>
								<dd>적립금</dd>
							</dl>
						</div>
						<div class="col-sm-6">
							<button style="font-size: 12px; width: 65px; height: 65px">
								쿠폰<br />다운로드
							</button>
						</div>
					</div>
 				</div>
			</div>
			<div>
				<p data-toggle="collapse" data-target="#demo" align="center">상세정보</p>
				<div id="demo" class="collapse in">
					<p>이름　　 ${memberinfo.NAME }</p>
					<p>전화번호 ${memberinfo.PHONE }</p>
					<p>메일주소 ${memberinfo.EMAIL }</p>
					<p>주소　　 ${memberinfo.ADDRESS }</p>
				</div>
			</div>
		</div>
	<tiles:insertAttribute name="section" />
	</div>
	</div>
	
</div>