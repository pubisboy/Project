<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row" align="center">
	<div style="width: 67%;">
		<div class="col-sm-12" style="border: 1px solid gray;">
			<div class="row">
				<div class="col-sm-8" style="padding-left: 20px;"> 
					<div  style="border: 1px solid black; height: 425px; width: 648px;">
					<img src="/img/pro_img/${map.IMG_UUID }" style="height: 100% ; width: 100%;">
					
					</div> 
					상품만족도
				</div>
				<div class="col-sm-4">
					<div style="border-bottom: 2px solid black;">${map.PRO_NAME }
					</div>
					<div align="left">
						<table style="margin-left: 0px;">
							<tbody>
								<tr>
									<th>판매가</th>
									<th style="padding-left: 60px;">
									<fmt:formatNumber value="${map.PRICE }" pattern="#,###"/></th>
								</tr>
								<tr>
									<th>행사할인가</th>
									<th style="padding-left: 60px;">
									
									<c:choose> 
										<c:when test="${empty elist }">-</c:when> 
										<c:otherwise>
										<fmt:formatNumber value="${map.PRICE-((elist.RATE*0.01) *map.PRICE) }" pattern="#,###"/>
										</c:otherwise>     
									</c:choose>
									
									</th>
								</tr> 
								<tr>
									<th>적립금</th>
									<th style="padding-left: 60px;">
									<c:choose> 
										<c:when test="${empty elist }">${map.PRICE*0.1 }</c:when> 
										<c:otherwise> 
										<fmt:formatNumber value="${(map.PRICE-((elist.RATE*0.01) *map.PRICE))*0.1 }" pattern="#,###"/>
										</c:otherwise>     
									</c:choose>
									</th>
								</tr>
								<tr>
									<th>생산지</th>
									<th style="padding-left: 60px;">${map.ORIGIN_NAME }</th>
								</tr>
								<tr>
									<th>판매자</th>
									<th style="padding-left: 60px;">${map.SELLER_ID }</th>
								</tr>
								<tr> 
									<th>수량<small>(잔여수량<span id="qty">${map.PRO_QTY }</span>)</small></th>    
									<th style="padding-left: 60px;">
										<div>
											<button id="minus">-</button>
											<input value="1" style="width: 40px;" id="quantity" />
											<button id="plus">+</button>
										</div>
									</th>
								</tr>
							</tbody>
						</table>
						<div style="border-top: 1px solid #8c8c8c;" align="center">
							<b>합계금액</b><b style="padding-left: 80px; font-size: 28px;"><span
								id="total">${map.PRICE }</span></b><br />
							<button id="cartadd">장바구니</button>
							<button id="order"
								style="background-color: #ff0066; color: white;" class="btn">주문하기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="col-sm-12"></div>
	</div>
</div>
<script>

		$("#minus").on("click", function() {
	if ($("#quantity").val() > 1) {
			$("#quantity").val(parseInt($("#quantity").val()) - 1)
			$("#total").html($("#quantity").val() * "${map.PRICE}")
	} 
		});
	$("#plus").on("click", function() {
		$("#quantity").val(1 + parseInt($("#quantity").val()))
		$("#total").html($("#quantity").val() * "${map.PRICE}")
		if(parseInt($("#qty").html())<parseInt($("#quantity").val())){ 
			window.alert("재고가 부족합니다.");
			$("#quantity").val(parseInt($("#quantity").val()) - 1)
			
		}
	});
	$("#order").on("click", function() {
		if ($("#quantity").val() * "${map.PRICE}" < 0) {
			($("#quantity").val() * "${map.PRICE}") * -1
		}
	});
	$("#cartadd").on("click", function() {

		var cName = "${map.PRO_NUM}";
		window.alert(cName);
		var cValue = "addcart"+$("#quantity").val();
		window.alert(cValue);
		var d = new Date();
		d.setTime(d.getTime() + (3 * 24 * 60 * 60 * 1000));
		var expires = "expires=" + d.toUTCString();
		cookies = cName + '=' + escape(cValue) + '; path=/ ';
		cookies += ';' + expires + ';';
		document.cookie = cookies;
	});
		
</script>
