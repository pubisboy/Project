<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<div style="width: 58.5%; padding-top: 30px;">
		<div class="row">
			<div class="col-sm-12"
				style="border-bottom: 2px solid gray; border-left: 1px solid gray; border-right: 1px solid gray;">
				<div class="row">
					<div class="col-sm-8" style="border-top: 2px solid black; border-right: 1px solid #b3b3b3; padding: 0px;">
						<div style="padding-left: 40px; padding-top: 15px; padding-bottom: 15px; text-align: left;">
							<span class="glyphicon glyphicon-shopping-cart"	style="font-size: 30px; color: #b3b3b3;"></span>
							<b style="font-size: 15px; color: #b3b3b3;">장바구니</b> <span
								class="glyphicon glyphicon-chevron-right"
								style="font-size: 30px; padding-left: 55px; padding-right: 55px; color: #b3b3b3;"></span>
							<span class="glyphicon glyphicon-credit-card"
								style="font-size: 45px;"></span> <b style="font-size: 26px;">주문/결제</b>
							<span class="glyphicon glyphicon-chevron-right"
								style="font-size: 30px; padding-left: 55px; padding-right: 55px; color: #b3b3b3;"></span>
							<span class="glyphicon glyphicon-gift"
								style="font-size: 30px; color: #b3b3b3;"></span> <b
								style="font-size: 15px; color: #b3b3b3;">주문완료</b>
						</div>
					</div>
					<div class="col-sm-4" style="border-top: 2px solid #ff0066;">
						<div style="height: 86px; padding-top: 35px; padding-left: 28px;"
							align="left">
							<b style="font-size: 18px; color: #4d4d4d;">${memberinfo.NAME }님</b>
							반갑습니다!<br />
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12"
				style="padding-top: 40px; padding-left: 0px; padding-right: 0px; padding-bottom: 20px;">
				<div align="left">
					<b style="font-size: 17px;">주문상품</b>
				</div>
				<table class="table table-hover">
					<thead>
						<tr	style="border-top: 2px solid black; background-color: #f2f2f2; height: 40px; font-size: 12.5px;">
							<th></th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>할인금액</th>
							<th>구매예정금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${list }">
							<tr style="border-bottom: 1px solid #b3b3b3; font-size: 12.5px;">
								<td>상품이미지</td>
								<td>${c.PRO_NUM }</td>
								<td>${c.PRICE }</td>
								<td>${number }</td>
								<td></td>
								<td class="price">${c.PRICE * number }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-sm-12" style="padding: 0px;">
				<div align="left">
					<b style="font-size: 17px;">고객정보</b>
				</div>
				<table class="table">
					<tbody>
						<tr style="border-top: 2px solid black; font-size: 12px;">
							<td class="active" style="width: 16%;">수령인</td>
							<td><input type="text" id="name" /><input type="checkbox"
								id="equal" />주문자와 동일</td>
						</tr>
						<tr style=" font-size: 12px;">
							<td class="active">휴대전화</td>
							<td><select name="phone1" id="phone1"
								style="width: 60px; height: 25px;">
									<c:forTokens var="i" items="010,011,016,017,018,019" delims=",">
										<option value="${i }" ${i eq  phone1 ? 'selected' : ''}>${i }</option>
									</c:forTokens>
							</select> - <input type="text" style="width: 60px; height: 25px;"
								value="${memberinfo.phone2 }" id="phone2" /> - <input
								type="text" style="width: 60px; height: 25px;"
								value="${memberinfo.phone3 }" id="phone3" /><br /></td>
						</tr>
						<tr style=" font-size: 12px;">
							<td class="active">주소입력</td>
							<td style="padding-left: 0px;">
								<div class="navbar-form" style="padding-left: 8px;">
									<input type="text" name="postcode" id="postcode"
										style="width: 140px;"> <input type="button"
										onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
										style="width: 100px; font-size: 13px;"><br />
								</div>
								<div class="navbar-form" style="padding-left: 8px;">
									<input type="text" name="address1" id="address1"
										style="width: 240px;"> <input type="text"
										name="address2" id="address2" style="width: 240px;"> <br />
								</div>
							</td>
						</tr>
						<tr style=" font-size: 12px;"> 
							<td class="active" style="width: 16%;" id="etc">배송시<br />요구사항
							</td>
							<td><textarea style="width: 484px;height: 66px;"></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-12" style="padding-top: 20px;">
				<div align="left">
					<b style="font-size: 17px;">할인 정보</b>
				</div>
				<div class="row"
					style="border: 1px solid #d9d9d9; border-top: 2px solid black; font-size: 12px;">
					<div class="col-xs-2" style="padding: 0px;">
						<div style="background-color: #f1f1f1;height: 43px;padding-top: 10px; padding-left: 20px;"align="left"><b style="font-size: 14px; color: #666666;letter-spacing: -1px;">상품 합계금액</b></div>
						<div>(합계금액뜨는곳)</div>
					</div>
					<div class="col-xs-8" style="padding: 0px; border-right: 1px solid #d9d9d9; border-left: 1px solid #d9d9d9;">
						<div style="background-color: #f1f1f1;height: 43px;padding-top: 10px; padding-left: 20px;"align="left"><b style="font-size: 14px; color: #666666;letter-spacing: -1px;">할인 / 적립금 사용 금액</b></div>
						<div style="background-color: #e6e6e6; padding-left: 45px; height: 30px; font-size: 12.5px; padding-top: 7px;" align="left"><b style="color:#404040;">할인 금액</b></div>
						<div style="padding: 10px; border-bottom: 1px solid #d9d9d9; width: 90%; font-size: 11.5px;" align="left" ><b style="color:#737373;">기본할인</b> 이벤트 할인(0)원0원</div>
							<div style="padding: 10px;width: 90%; font-size: 11.5px" align="left">
								<b style="color:#737373;">쿠폰할인</b> 
								<input type="text">
								<a href="javascript:popupOpen();" style="color: #262626">
								<button id="couponlist">쿠폰조회 및 적용</button>
								</a> 사용가능한 쿠폰 <b style="color: #ff1a75;">${clist.size() }</b>장    <span id="discount"></span> 
							</div>
						<div style="background-color: #e6e6e6;padding-left: 45px; height: 30px;color: #ff1a75; font-size: 12.5px; padding-top: 7px;" align="left"><b style="color: #404040;">적립금 사용 금액</b><small style="font-size: 11px;">사용가능 적립금 0원</small></div>
						<div align="left"
							style="width: 90%; padding: 10px; border-bottom: 1px solid #d9d9d9; font-size: 11.5px">
							<b style="color:#737373;">상품 적립금</b> <input type="radio" />적립 <input type="radio" />즉시사용(상품
							적립금(0)원)
						</div>
						<div align="left" style="width: 90%; padding: 10px; font-size: 11.5px">
							<b style="color:#737373;">보유 적립금</b> <input type="text">원<input type="checkbox">전액사용(보유적립금(0)원)
						</div>
						<div></div>
					</div>
					<div class="col-xs-2" style="padding: 0px;">
						<div style="background-color: #f1f1f1;height: 43px;padding-top: 10px; padding-left: 20px;"align="left">
						<b style="font-size: 14px; color: #666666;letter-spacing: -1px;">최종 결제금액</b>
						</div>
						<div id="finishcash">(최종결제금액뜨는곳)</div>
					</div>
				</div>

			</div>
			<div class="col-sm-12" style="padding-top: 40px;">  
				<div align="left">
					<b style="font-size: 17px;">결제 정보</b>
				</div>
				<div class="row" style="border-bottom: 2px solid gray; border-top: 2px solid black; font-size: 12px;">
					<div class="col-xs-2" style="background-color: #f2f2f2; height: 80px; padding-top: 10px; padding-left: 20px;"align="left"> 
					<b style="color: #666666;">결제수단 선택</b>
					</div>
					<div class="col-xs-10" align="left" style="padding-top: 15px;">
						<button class="btn btn-default" style="width: 145px;height: 45px;">무통장입금</button>
						<button class="btn btn-default" style="width: 145px;height: 45px;">이메일인증</button>
					</div>
				</div>
			</div>
			<div class="col-sm-12" style="padding-top: 40px;">
				<div align="left" style="border-bottom: 2px solid black;">
					<b style="font-size: 17px;">기타 정보</b>
				</div>
				<div class="row">
					<div class="col-xs-2">구매 시 유의사항</div>
					<div class="col-xs-10"></div>
				</div>
			</div>
			<div align="center">
				<button style="background-color: #ff3399;" id="order">결제하기</button>
				<button>주문취소</button>
			</div>
		</div>
	</div>
</div>
<script>
	var tot = 0;
	$('.price').each(function() {
		tot += parseInt($(this).html());
	});
	$("#equal").on("click", function() {
		window.alert(tot);
		$("#name").val("${memberinfo.NAME}");
		$("#postcode").val("${postcode}");
		$("#address1").val("${address1}");
		$("#address2").val("${address2}");
		$("#phone2").val("${phone2}");
		$("#phone3").val("${phone3}");

	});
	$.ajax({
		url : "/cart/order_rst.j",
		method : "post",
		data : {
			"name" : $("#name").val(),
			"phone" : $("#phone1").val() + "-" + $("#phone2").val() + "-"
					+ $("#phone3").val(),
			"address" : $("#postcode").val() + "!" + $("#address1").val() + "!"
					+ $("#address2").val(),
			"etc" : $("#etc").val()
		}
	});

	function popupOpen() {
		var popUrl = "popup_couponlist.j";
		var popOption = "width=500, height=660, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl+"?price="+tot, "SSOG", popOption);
	}
</script>
