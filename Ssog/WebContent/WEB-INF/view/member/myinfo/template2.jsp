<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div align="center">
<div style="width: 63%;">    
	<div class="row">
		<div class="col-sm-3"> 
			<div class="well">
				<span class="glyphicon glyphicon-home" style="font-size: 20px;"></span><a
					href="/member/myinfo/info.j">고객센터</a>
			</div>
			<ul class="nav nav-stacked nav-pills" style="margin-top: 20px;">
			<li class="${ac eq 'note' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse1"
					style="text-decoration: none; color: #404040;">공지사항</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="/cccenter/notice.j"
							style="text-decoration: none; color: #999999;">공지사항</a><br /> <a
							href="/"
							style="text-decoration: none; color: #999999;">이벤트 당첨자발표</a><br />
					</div>
				</div>
				<hr style="margin: 0px;" />
				<li class="${ac eq 'faq' ? 'ac' : '' }"><a href="/cccenter/faq.j"style="text-decoration: none; color: #404040;">자주 묻는
						질문(FAQ)</a></li>
				<hr style="margin: 0px;" />
				<li class="${ac eq 'coupon' ? 'ac' : '' }"><a
					href="/member/myinfo/counsel_detail.j"style="text-decoration: none; color: #404040;">1:1 문의</a></li>
				<hr style="margin: 0px;" />

				<li class="${ac eq 'membership' ? 'ac' : '' }"><a
					data-toggle="collapse" data-parent="#accordion" href="#collapse2">멤버십안내</a></li>
				<hr style="margin: 0px;" />
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="/">온라인회원 등급안내</a><br /> <a
							href="/">적립금 안내</a><br /> 회원이용약관<br /> 개인정보취급(처리)방침<br/>
					</div>
				</div>
			</ul>

		</div>
		<div class="col-sm-9">
			<div class="col-sm-12" style="padding-bottom: 40px;">
				<div class="row">
					<div class="col-sm-6">
						<h4 style="font-size: 25px; text-align: left;">
							<b style="padding-right: 10px;">고객센터</b>
							<p style="padding-bottom: 3px;"></p>
							<small style="font-size: 12px;">쏙쇼핑몰에서 즐거운 쇼핑되세요!<br />
								언제나 고객님들의 편리한 쇼핑을 위해 노력하겠습니다.
							</small>
						</h4>
					</div>
					<div class="col-sm-6"
						style="padding-top: 35px; padding-bottom: 10px; padding-left: 162px;">
						<b style="font-size: 18px;">고객센터</b> <b
							style="color: #ff1a66; font-size: 25px;">1234-5678</b> <br />
						<b style="font-size: 18px;">대표번호</b><small
							style="padding-left: 3px;">연중무휴 09:00~20:30</small>
					</div>
				</div>
				<div class="row"
					style="border-bottom: 2px solid #f2f2f2; border-top: 2px solid #ff1a66; padding-bottom: 22px; padding-top: 25px;">
					<div class="col-xs-2" style="border-right: 1px dotted grey;"
						align="center">
						<a href="/cccenter/faq.j" style="text-decoration: none; color: #595959;"> <span class="glyphicon glyphicon-book"
							style="font-size: 35px; padding-bottom: 10px;"></span><br /> <b
							style="font-size: 12px;">자주 묻는 질문</b></a>
					</div>
					<div class="col-xs-2" style="border-right: 1px dotted grey;"
						align="center">
						<a href=""> <span class="glyphicon glyphicon-gift"
							style="font-size: 35px; padding-bottom: 10px;"></span><br /> <b
							style="font-size: 12px;">준비중</b></a>
					</div>
					<div class="col-xs-2" style="border-right: 1px dotted grey;"
						align="center">
						<a href="/member/myinfo/counsel.j"
							style="text-decoration: none; color: #595959;"> <span
							class="glyphicon glyphicon-inbox"
							style="font-size: 35px; padding-bottom: 10px;"></span><br /> <b
							style="font-size: 12px;">1:1 상담내역</b></a>
					</div>
					<div class="col-xs-2" style="border-right: 1px dotted grey;"
						align="center">
						<a href="/member/myinfo/orderlist.j" style="text-decoration: none; color: #595959;"> <span class="glyphicon glyphicon-list-alt"
							style="font-size: 35px; padding-bottom: 10px;"></span><br /> <b
							style="font-size: 12px;">주문내역확인</b></a>
					</div>
					<div class="col-xs-2" style="border-right: 1px dotted grey;"
						align="center">
						<a href=""> <span class="glyphicon glyphicon-envelope"
							style="font-size: 35px; padding-bottom: 10px;"></span><br /> <b
							style="font-size: 12px;">당첨자발표</b></a>
					</div>
					<div class="col-xs-2" align="center">
						<a href=""> <span class="glyphicon glyphicon-user"
							style="font-size: 35px; padding-bottom: 10px;"></span><br /> <b
							style="font-size: 12px;">아이디/비밀번호찾기</b></a>
					</div>
				</div>
			</div>
			<tiles:insertAttribute name="section" />
		</div>
	</div>
	</div>
</div>
