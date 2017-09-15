<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
li{
	text-align: left;
}
.type{
	text-align: center;
	width: 20%;
}
td{
	text-align: left;
}
</style>

<div class="container">
	<div class="row">
		<div class="col-xs-6">
			<table class="table table-bordered"
				style="text-align: center; height: 47%;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">주문정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="type">주문번호</th>
						<td id="num">${list[0].ORDER_NUM }</td>
					</tr>
					<tr>
						<th class="type">상품번호</th>
						<td>${list[0].PRO_NUM }</td>
					</tr>
					<tr>
						<th class="type">상품이름</th>
						<td>${list[0].PNAME }</td>
					</tr>
					<tr>
						<th class="type">구매자</th>
						<td>${list[0].USER_ID }</td>
					</tr>
					<tr>
						<th class="type">수령인</th>
						<td>${list[0].RECEIVER }</td>
					</tr>
					<tr>
						<th class="type">주문가격</th>
						<td>
							<fmt:formatNumber value="${list[0].PRICE }" pattern="#,###"/>원
						</td>
					</tr>
					<tr>
						<th class="type">할인율</th>
						<td>
						<c:choose>
							<c:when test="${empty list[0].CUPON_TYPE}">
								할인없음
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${list[0].RATE ne 0}">
										${list[0].RATE }%
									</c:when>
									<c:otherwise>
										할인없음
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th class='type'>주문개수</th>
						<td>
							<fmt:formatNumber value='${list[0].ORDER_QTY }' pattern='#,###'/>개
						</td>
					</tr>
					<tr>
						<th class='type'>주문상태</th>
						<td><input type="hidden" value="${list[0].STATE }" id="state"/><span id="st">${list[0].ST }</span>
						<span id="modify">
						<c:if test="${list[0].STATE ne 5}">
							<button id="mbutton" style="height: 25px;" onclick="modify();">수정</button>
						</c:if>
						</span>
						</td>
					</tr>
					<c:forTokens items="${list[0].ADDRESS }" delims="!" var="i" varStatus="vs">
						<tr>
							<c:if test="${vs.first }">
								<th rowspan="3" class="type">배송지</th>
							</c:if>
							<td>${i }</td>
						</tr>
					</c:forTokens>
					<tr>
						<th class="type">기타사항</th>
						<td>${list[0].ETC }</td>
					</tr>
					<tr>
						<th class="type">주문일자</th>
						<td><fmt:formatDate value="${list[0].ORDER_DATE }"
								pattern="yyyy년MM월dd일" var="i" />${i }</td>
					</tr>
					<tr>
						<th class="type">결제일자</th>
						<td>
						<c:choose>
							<c:when test="${empty list[0].PAY_DATE }">
								미결제
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${list[0].PAY_DATE }" pattern="yyyy년MM월dd일" var="i" />${i }
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-xs-6">
			<table class="table table-bordered"
				style="text-align: center; height: 47%;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="type">상품번호</th>
						<td>${list[0].PRO_NUM }</td>
					</tr>
					<tr>
						<th class="type">상품이름</th>
						<td>${list[0].PNAME }</td>
					</tr>
					<tr>
						<th class="type">판매자</th>
						<td>${list[0].SELLER_ID }</td>
					</tr>
					<tr>
						<th class="type">등록일자</th>
						<td>${list[0].PRO_DATE }</td>
					</tr>
					<tr>
						<th class="type">상품가격</th>
						<td>
							<fmt:formatNumber value="${list[0].PRICE_ORIGIN }" pattern="#,###"/>원
						</td>
					</tr>
					<tr>
						<th rowspan="2" class="type">카테고리</th>
						<td>${list[0].NAMEP }</td>
					</tr>
					<tr>
						<td>${list[0].NAME }</td>
					</tr>
					<tr>
						<th class="type">원산지</th>
						<td>${list[0].ORI }</td>
					</tr>
					<tr>
						<th class="type">남은수량</th>
						<td>
							<fmt:formatNumber value="${list[0].PRO_QTY }" pattern="#,###"/>개
						</td>
					</tr>
					<tr>
						<th class="type">판매여부</th>
						<td>${list[0].SELL_ON == 1 ? '판매중' : '판매중단' }</td>
					</tr>
				</tbody>
			</table>
<c:if test="${list[0].STATE ne 5}">
	<div style="float: left; width: 10%; text-align: left">
	<button type="button" class="btn btn-default" onclick="cancel('/admin/order/order_del.ja?num=${list[0].ORDER_NUM }');">삭제</button>
	</div>
</c:if>		
	<div style="float: right; width: 33%; text-align: right">
	<button type="button" class="btn btn-default" onclick="cancel('/admin/order/order_list.ja?p=${params.p }&type=${params.type }&value=${params.value}&state=${params.state}');">목록</button>
	</div>
		</div>
	</div>
</div>

<script>
var ori;
function modify(){
	ori =$("#st").html();
	$.ajax({
		'url':"/admin/order/order_modify.ja"
	}).done(function(rst){
		$("#st").html(rst.html);
		$("#modify").html("<button id='submit' style='height: 25px;' onclick='submit();'>변경</button><button id='cancel' style='height: 25px;' onclick='cancel();'>취소</button>");
	});
};
function submit(){
	window.alert("변경 작동");
	var tmp = $("#stsel").val();
	var state = $("#"+tmp).html();
	$.ajax({
		'url':"/admin/order/order_modifyExec.ja",
		'data':{
			'num':$("#num").html(),
			'state':$("#stsel").val()
		}
	}).done(function(rst){
		if(rst){
			$("#st").html(state);
			if(tmp != 5){
				$("#modify").html("<button id='mbutton' style='height: 25px;' onclick='modify();'>수정</button>");
			}else{
				$("#modify").html("");
			}
		}
	});
};
function cancel(){
	window.alert("취소 작동");
	$("#modify").html("<button id='mbutton' style='height: 25px;' onclick='modify();'>수정</button>");
	$("#st").html(ori);
};
</script>