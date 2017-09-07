<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row" align="center">
	<div style="width: 67%;">
		<div class="col-sm-12" style="border: 1px solid gray;">
			<div class="row">
				<div class="col-sm-8">
					<div>이미지들어가는곳</div>
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
									<th style="padding-left: 60px;">${map.PRICE }</th>
								</tr>
								<tr>
									<th>행사할인가</th>
									<th style="padding-left: 60px;">-</th>
								</tr>
								<tr>
									<th>적립금</th>
									<th style="padding-left: 60px;">-</th>
								</tr>
								<tr>
									<th>생산지</th>
									<th style="padding-left: 60px;">${map.NAME }</th>
								</tr>
								<tr>
									<th>판매자</th>
									<th style="padding-left: 60px;">-</th>
								</tr>
								<tr>
									<th>수령</th>
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
							<b>합계금액</b><span id="total"><b
								style="padding-left: 80px; font-size: 28px;">${map.PRICE }</b></span><br />
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
		$("#quantity").val(parseInt($("#quantity").val()) - 1)
		$("#total").html(($("#quantity").val() * "${map.PRICE}"))
		if($("#total").val()>0){
			$("#total").html(0)
		}
		if($("#quantity").val()==-1){
			$("#quantity").val(0)
		}
	});
	$("#plus").on("click", function() {
		$("#quantity").val(1 + parseInt($("#quantity").val()))
		$("#total").html($("#quantity").val() * "${map.PRICE}")
	});
	$("#order").on("click", function() {
		if ($("#quantity").val() * "${map.PRICE}" < 0) {
			($("#quantity").val() * "${map.PRICE}") * -1
		}
	});
	$("#cartadd").on("click", function() {

		var cName = "cart"+"${map.PRO_NUM}";
		var cValue = "addcart";
		
		var d = new Date();
		d.setTime(d.getTime() + (3 * 24 * 60 * 60 * 1000));
		var expires = "expires=" + d.toUTCString();
		
		cookies = cName + '=' + escape(cValue) + '; path=/ ';
		if (typeof cDay != 'undefined')
			cookies += ';' + expires + ';';
		document.cookie = cookies;

	});
</script>
