<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<div style="width: 65%; padding-top: 30px;">
		<div class="row">
			<div class="col-sm-12"
				style="border-bottom: 2px solid gray; border-left: 1px solid gray; border-right: 1px solid gray;">
				<div class="row">
					<div class="col-sm-8"
						style="border-top: 2px solid black; border-right: 1px solid gray; padding: 0px;">
						<div
							style="border-bottom: 1px dotted black; padding-left: 40px; padding-top: 15px; padding-bottom: 15px; text-align: left;">
							<span class="glyphicon glyphicon-shopping-cart"
								style="font-size: 50px;"></span> <b style="font-size: 26px;">장바구니</b>
							<span class="glyphicon glyphicon-chevron-right"
								style="font-size: 30px; padding-left: 20px; padding-right: 20px; color: #b3b3b3;"></span>
							<span class="glyphicon glyphicon-credit-card"
								style="font-size: 30px; color: #b3b3b3;"></span> <b
								style="font-size: 15px; color: #b3b3b3;">주문/결제</b> <span
								class="glyphicon glyphicon-chevron-right"
								style="font-size: 30px; padding-left: 20px; padding-right: 20px; color: #b3b3b3;"></span>
							<span class="glyphicon glyphicon-gift"
								style="font-size: 30px; color: #b3b3b3;"></span> <b
								style="font-size: 15px; color: #b3b3b3;">주문완료</b>
						</div>
						<div style="padding-top: 15px;">
							<ul style="text-align: left; font-size: 12px;">
								<li>장바구니에 담긴 상품은 <b style="color: #ff0066;">3일간</b> 저장됩니다.
									(구매한 상품은 장바구니에서 자동삭제 됩니다)
								</li>
								<li>상품수량 수정은 수정버튼을 클릭해서 수정하시면 됩니다.</li>
								<li>장바구니에 담긴 상품은 재고가 소진될 경우 [주문불가]로 표기됩니다. 구매할 수 없습니다.</li>
								<li>장바구니에 담긴 상품은 판매금액 또는 할인율은 변경될 수 있습니다.</li>
							</ul>
						</div>
					</div>
					<div class="col-sm-4" style="border-top: 2px solid pink;">
						<div style="border-bottom: 1px dotted black;">
							(ID)님 반갑습니다!<br />
						</div>
						<div>
							등급<br /> 할인쿠폰<br /> 적립금<br />
						</div>
					</div>
				</div>

			</div>
			<div class="col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" /></th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>주문금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${list }">
							<tr>
								<td><input type="checkbox" /></td>
								<td>${c.PRO_NUM }</td>
								<td>${c.PRICE }</td>
								<td>
									<button class="mi">-</button> <input type="text"
									style="width: 40px;" value="${number }" class="qu" />
									<button class="pl">+</button>
									<button id="revise">수정</button>
								</td>
								<td class="price">${c.PRICE * number }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-sm-12" style="border: 1px solid #a6a6a6">
				<div>
					<div class="row" align="left">
						<div class="col-sm-4"
							style="border-top: 2px solid black; border-right: 1px solid #a6a6a6; padding: 0px;">
							<div style="border-bottom: 1px solid #a6a6a6">상품합계</div>
							<div>
								<ul>
									<li>상품종류</li>
									<li>상품수량</li>
								</ul>
							</div>
						</div>
						<div class="col-sm-4"
							style="border-top: 2px solid black; border-right: 1px solid #a6a6a6; padding: 0px;">
							<div style="border-bottom: 1px solid #a6a6a6">할인금액</div>
							<div>
								<ul>
									<li>회원등급할인</li>
									<li>이벤트할인</li>
								</ul>
							</div>
						</div>
						<div class="col-sm-4"
							style="border-top: 2px solid #ff0066; padding: 0px;">
							<div style="border-bottom: 1px solid #a6a6a6">
								총 구매예상금액<b style="font-size: 20px;"><span id="totalprice"></span></b>
							</div>
							<div>
								<ul>
									<li>상품 적립금</li>
								</ul>
								* 쿠폰 사용시 적용금액은 변동될 수 있습니다.
							</div>
						</div>
					</div>
					<div style="background-color: black;"></div>
				</div>
			</div>
		</div>
		<div align="center">
			<button style="background-color: #ff3399;" id="order">주문서 작성</button>
			<button>계속 쇼핑하기</button>
		</div>
	</div>
</div>
<script>
	var tot = 0;
	$('.price').each(function() {
		tot += parseInt($(this).html());
	});
	$("#totalprice").html(tot);

	$(".mi").on("click", function() {
		if ($(this).next().val() > 1) {
			$(this).next().val(parseInt($(this).next().val()) - 1)
		}
		var c = $(this).next().val()*$(this).parent().prev().html();
		$(this).parent().next().html(c);
		
	});

	$(".pl").on("click", function() {
		$(this).prev().val(parseInt($(this).prev().val()) + 1);
		var c = $(this).prev().val()*$(this).parent().prev().html();
		$(this).parent().next().html(c);
	});

	$("#order").on("click", function() {
	});
	
	
	
	$("#revise").on("click", function() {

		var cName = $(this).parent().prev().prev().html(); 
		var cValue = "addcart"+$(this).prev().prev().val();
		var d = new Date();
		d.setTime(d.getTime() + (3 * 24 * 60 * 60 * 1000));
		var expires = "expires=" + d.toUTCString();

		cookies = cName + '=' + escape(cValue) + '; path=/ ';
		if (typeof cDay != 'undefined')
			cookies += ';' + expires + ';';
		document.cookie = cookies;
		

	});
</script>
