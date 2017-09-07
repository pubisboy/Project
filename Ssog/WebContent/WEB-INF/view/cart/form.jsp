<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<span class="glyphicon glyphicon-shopping-cart" style="font-size: 50px;"></span>
							<b style="font-size: 26px;">장바구니</b>
							<span class="glyphicon glyphicon-chevron-right" style="font-size: 30px; padding-left: 20px; padding-right: 20px; color: #b3b3b3;"></span>
							<span class="glyphicon glyphicon-credit-card" style="font-size: 30px; color: #b3b3b3;"></span>
							<b style="font-size: 15px; color: #b3b3b3;">주문/결제</b>
							<span class="glyphicon glyphicon-chevron-right" style="font-size: 30px; padding-left: 20px; padding-right: 20px; color: #b3b3b3;"></span>
							<span class="glyphicon glyphicon-gift" style="font-size: 30px; color: #b3b3b3;"></span>
							<b style="font-size: 15px; color: #b3b3b3;">주문완료</b>
						</div>
						<div style="padding-top: 15px;">
						<ul style="text-align: left; font-size: 12px;">
						<li>장바구니에 담긴 상품은 <b style="color: #ff0066;">3일간</b> 저장됩니다. (구매한 상품은 장바구니에서 자동삭제 됩니다)</li>
						<li>상품수량 수정은	수정버튼을 클릭해서 수정하시면 됩니다.</li>
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
			<div class="col-sm-12">장바구니에 담은 상품</div>
			<div class="col-sm-12">
				<div>상품합계 / 할인금액 / 총 구매금액</div>
				<div>
					<div class="row">
						<div class="col-sm-4">
							상품종류<br /> 상품수량
						</div>
						<div class="col-sm-4">
							회원등급할인<br /> 이벤트할인
						</div>
						<div class="col-sm-4">
							상품 적립금<br />
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
var cookie = getCookie()
$("#order").on("click",function(){
	window.alert("눌림");
	window.alert(cookie.indexOf("cart")); 
});
 

</script>
