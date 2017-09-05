<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<div class="row">
		<div class="col-sm-2">
			<div>
				<a href="/member/myinfo/info.j"
					style="text-decoration: none; color: black;"><span
					class="glyphicon glyphicon-home" style="font-size: 18px;"></span><b
					style="font-size: 20px;">마이페이지</b><small style="color: #999999;">My
						Page<br /> <b
						style="font-size: 9px; padding-left: 20px; color: #8c8c8c;">고객과
							함께하는 쏙쇼핑몰</b>
				</small></a>
			</div>
			<ul class="nav nav-stacked nav-pills" style="margin-top: 20px;">
				<li class="${ac eq 'orderlist' ? 'ac' : '' }"><a href="/member/myinfo/orderlist.j"
					style="text-decoration: none; color: #404040;">주문내역</a></li>
				<hr style="margin: 0px;" />
				<li class="${ac eq 'shoppingbasket' ? 'ac' : '' }"><a href="/cart/form.j"
					style="text-decoration: none; color: #404040;">장바구니</a></li>
				<hr style="margin: 0px;" />
				<li class="${ac eq 'coupon' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse1"
					style="text-decoration: none; color: #404040;">쿠폰/적립금</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="/member/myinfo/couponlist.j"
							style="text-decoration: none; color: #999999;">할인쿠폰</a><br /> <a
							href="/member/myinfo/save.j"
							style="text-decoration: none; color: #999999;">적립금</a><br />
					</div>
				</div>
				<li class="${ac eq 'mycontents' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse2"
					style="text-decoration: none; color: #404040;">나의 컨텐츠</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="/member/myinfo/counsel.j"
							style="text-decoration: none; color: #999999;">1:1 문의</a><br />
						<a href="/member/myinfo/qna.j"
							style="text-decoration: none; color: #999999;">상품 Q&A</a><br />
						상품평<br />
					</div>
				</div>
				<li class="${ac eq 'mypage' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse3"
					style="text-decoration: none; color: #404040;">나의정보</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="/member/myinfo/info_revise.j"
							style="text-decoration: none; color: #999999;">회원정보수정</a><br />
						<a href="/member/myinfo/userpass.j"
							style="text-decoration: none; color: #999999;">비밀번호수정</a><br />
						<a href="/member/myinfo/leave.j"
							style="text-decoration: none; color: #999999;">회원탈퇴</a><br />
					</div>
				</div>
			</ul>
		</div>

		<div class="col-sm-8">

			<div class="row"
				style="border-top: 4px solid black; border-bottom: 1px solid grey; height: 90px; width: 100%; margin: 0px;">

				<div class="col-sm-6"
					style="border-left: 1px solid grey; border-right: 2px dotted grey; height: 85px;">
					<div class="row">
						<div class="col-xs-3 col-sm-6"
							style="width: 50%; margin-top: 10px;">
							<dl>
								<dt style="font-size: 15px;">온라인등급</dt>
								<h4>${grade.GRADE }</h4>
							</dl>
						</div>
						<div class="col-xs-3 col-sm-6"
							style="width: 50%; margin-top: 10px;" align="center">
							<a href="javascript:popupOpen();" style="color: #262626">
								<button style="font-size: 12px; width: 65px; height: 65px">
									자세히<br />보기
								</button>
							</a>
						</div>
					</div>
				</div>

				<div class="col-sm-6"
					style="border-right: 1px solid grey; height: 85px;">
					<div class="row">
						<div class="col-xs-3 col-sm-6"
							style="width: 50%; margin-top: 10px;">
							<dl>
								<dt style="font-size: 15px; padding-bottom: 7px;">My Wallet</dt>
								<dd>
									<li style="font-size: 13px;">할인쿠폰</li>
								</dd>
								<dd>
									<li style="font-size: 13px;">적립금</li>
								</dd>
							</dl>
						</div>
						<div class="col-xs-3 col-sm-6"
							style="width: 50%; margin-top: 10px;" align="center">
							<a href="/member/myinfo/info.j" style="color: #262626;"><button
									style="font-size: 12px; width: 65px; height: 65px">
									쿠폰<br />다운로드
								</button></a>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div
					style="margin-bottom: 10px; padding: 0px; background-color: #f2f2f2; width: 100%;">
					<p data-toggle="collapse" data-target="#demo" align="center"
						style="font-size: 12px; padding-bottom: 2px; padding-top: 2px;">상세정보</p>
				</div>
				<div id="demo" class="collapse in">
					<b style="padding-left: 10px; padding-right: 408px;">가입기간 : <fmt:formatDate
							value="${memberinfo.JOINDATE }" pattern="yyyy-MM-dd" /></b> <a
						href="/member/myinfo/info_revise.j" style="color: #262626;"><button
							style="height: 20px; font-size: 12px;">회원정보 수정</button></a> <a
						href="/member/myinfo/userpass.j" style="color: #262626;"><button
							style="height: 20px; font-size: 12px;">비밀번호 수정</button></a>
					<ul style="padding-left: 25px; padding-top: 10px;">
						<li style="color: grey; font-size: 13px;">회원이름<b
							style="padding-left: 10px; color: #404040"> ${memberinfo.NAME }</b></li>
						<li style="color: grey; font-size: 13px;">전화번호 <b
							style="padding-left: 10px; color: #404040">${memberinfo.PHONE }</b></li>
						<li style="color: grey; font-size: 13px;">메일주소 <b
							style="padding-left: 10px; color: #404040">${memberinfo.EMAIL }</b></li>
						<li style="color: grey; font-size: 13px;">회원주소 <b
							style="padding-left: 10px; color: #404040">${memberinfo.ADDRESS }</b></li>
					</ul>
				</div>
			</div>

			<tiles:insertAttribute name="section" />
		</div>
	</div>
</div>
<script type="text/javascript">
	function popupOpen() {
		var popUrl = "popup_grade.j";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl, "SSOG", popOption);
	}
</script>