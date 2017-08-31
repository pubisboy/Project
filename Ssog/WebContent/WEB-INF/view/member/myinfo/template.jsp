<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="container">
	<div class="row">
		<div class="col-sm-2">
			<div>마이페이지</div>
			<ul class="nav nav-stacked nav-pills" style="margin-top: 20px;">
				<li class="${ac eq 'orderlist' ? 'ac' : '' }"><a href="/">주문내역</a></li>
				<li class="${ac eq 'shoppingbasket' ? 'ac' : '' }"><a href="/">장바구니</a></li>
				<li class="${ac eq 'coupon' ? 'ac' : '' }"><a href="/">쿠폰/적립금</a></li>
				<li class="${ac eq 'mycontents' ? 'ac' : '' }" data-toggle="collapse" data-target="#demo">나의컨텐츠</li>
				<div  id="demo" class="collapse in">
				<ul>
					<li><a href="/">첫번쨰!</a></li> 
					<li><a href="/">두번쨰</a></li>
				</ul>
				</div>
			</ul>

		</div>
		<div class="col-sm-8">
			<div class="row">
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-6">
							<dl>
								<dt>온라인등급</dt>
								<h4>SILVER</h4>
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
		</div>

	</div>
	<div class="col-sm-2"></div>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4"></div>
		<div class="col-sm-4"></div>
	</div>
	<tiles:insertAttribute name="section" />
</div>