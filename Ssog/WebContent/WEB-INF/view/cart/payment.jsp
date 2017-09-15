<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<div style="width: 58.5%; padding-top: 30px;">
		<div class="row">
			<div class="col-sm-12" style="border-bottom: 2px solid gray; border-left: 1px solid gray; border-right: 1px solid gray;">
				<div class="row">
					<div class="col-sm-8" style="border-top: 2px solid black; border-right: 1px solid #b3b3b3; padding: 0px;">
						<div style="padding-left: 40px; padding-top: 15px; padding-bottom: 15px; text-align: left;">
							<span class="glyphicon glyphicon-shopping-cart"	style="font-size: 30px; color: #b3b3b3;"></span> 
								<b style="font-size: 15px; color: #b3b3b3;">장바구니</b> 
								
							<span class="glyphicon glyphicon-chevron-right"	style="font-size: 30px; padding-left: 35px; padding-right: 35px; color: #b3b3b3;"></span>
							
							<span class="glyphicon glyphicon-credit-card" style="font-size: 30px; color: #b3b3b3;"></span>
								<b style="font-size: 15px; color: #b3b3b3;">주문/결제</b>
							
							<span class="glyphicon glyphicon-chevron-right" style="font-size: 30px; padding-left: 35px; padding-right: 35px;"></span>
							
							<span class="glyphicon glyphicon-gift" style="font-size: 45px;"></span>
								<b style="font-size: 30px;">주문완료</b>
						</div>
					</div>
					<div class="col-sm-4" style="border-top: 2px solid #ff0066;">
						<div style="height: 86px; padding-top: 35px; padding-left: 28px;"
							align="left">
							<b style="font-size: 18px; color: #4d4d4d;">${memberinfo.NAME }님</b>
							감사합니다!<br />
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-2">
					총결제금액
					</div>
					<div class="col-sm-10">
					총결제금액뜨는곳
					</div>
				</div>				
			</div>
			<div class="col-sm-12">
				<div align="left">
					<b style="font-size: 17px;">결제정보</b>
				</div>
				<table class="table">
					<tbody>
						<tr style="border-top: 2px solid black; font-size: 12px;">
							<td class="active" style="width: 16%;">주문일자</td>
							<td>(주문일자나오는곳)</td>
						</tr>
						<tr style="font-size: 12px;">
							<td class="active">결제금액</td>
							<td>(결제금액나오는곳)</td>
						</tr>
						<tr style="font-size: 12px;">
							<td class="active">결제방식</td>
							<td>(결제방식나오는곳)</td>
						</tr>
						<tr style="font-size: 12px;">
							<td class="active">배송지</td>
							<td>(배송지나오는곳)</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-12">
				<div align="left">
					<b style="font-size: 17px;">주문정보</b>
				</div>
				<table class="table table-hover">
					<thead>
						<tr	style="border-top: 2px solid black; background-color: #f2f2f2; height: 40px; font-size: 12.5px;">
							<th></th>
							<th>상품명</th>
							<th>수량</th>
							<th>할인금액</th>
							<th>결제금액</th>
						</tr>
					</thead>
					<tbody>
							<tr style="border-bottom: 1px solid #b3b3b3; font-size: 12.5px;">
								<td>상품이미지</td>
								<td>상품명뜨는곳</td>
								<td>0</td>
								<td>1000</td>
								<td>9000</td>
							</tr>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</div>