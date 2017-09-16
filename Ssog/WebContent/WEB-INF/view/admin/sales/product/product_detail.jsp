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
.type2{
	text-align: center;
	width: 40%;
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
						<th colspan="2" style="text-align: center;">상품정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="type">상품번호</th>
						<td id="num">${list[0].PRO_NUM }</td>
					</tr>
					<tr>
						<th class="type">상품이름</th>
						<td>${list[0].PRO_NAME }</td>
					</tr>
					<tr>
						<th class="type">카테(대)</th>
						<td>
							<input type="hidden" value="${list[0].PARENT }" id="stateb"/><span id="bc">${list[0].BC }</span>
						</td>
					</tr>
					<tr>
						<th class="type">카테(소)</th>
						<td>
							<input type="hidden" value="${list[0].CATE }" id="states"/><span id="sc">${list[0].SC }</span>
							<span id="modify">
								<button id="mbutton" style="height: 25px;" onclick="modify();">수정</button>
							</span>
						</td>
					</tr>
					<tr>
						<th class="type">원산지</th>
						<td>${list[0].ORI }</td>
					</tr>
					<tr>
						<th class="type">가격</th>
						<td>
							<fmt:formatNumber value="${list[0].PRICE }" pattern="#,###"/>원
							<c:if test="${!empty rateMoney }">
								<sub>(할인가 : <fmt:formatNumber value="${ratePrice }" pattern="#,###"/>원)</sub>
							</c:if>
						</td>
					</tr>
					<tr>
						<th class="type">할인여부</th>
						<td>
							<c:choose>
								<c:when test="${rate eq -1}">
									할인없음
								</c:when>
								<c:otherwise>
									${rate }%<sub>(할인 : ${rateMoney }원)</sub>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th class='type'>개수</th>
						<td>
							<fmt:formatNumber value='${list[0].PRO_QTY }' pattern='#,###'/>개
						</td>
					</tr>
					<tr>
						<th class="type">판매자</th>
						<td>${list[0].SELLER_ID }</td>
					</tr>
					<tr>
						<th class="type">등록일</th>
						<td>
							<fmt:formatDate value="${list[0].PRO_DATE }" pattern="yyyy년MM월dd일" var="i" />${i }
						</td>
					</tr>
					<tr>
						<th class="type">판매여부</th>
						<td>
							${SELL_ON eq 1 ? '판매중' : '중지'}
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-xs-2"></div>
		<div class="col-xs-4">
			<table class="table table-bordered"
				style="text-align: center; height: 30%;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">기타</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="type2">등급</th>
						<td>
							${grade}
						</td>
					</tr>
					<tr>
						<th class="type2">누적 판매 개수</th>
						<td>
							<c:choose>
								<c:when test="${qty ne -1 }">
									<fmt:formatNumber value='${qty }' pattern='#,###'/>개
								</c:when>
								<c:otherwise>
									0개
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th class="type2">누적 판매 금액</th>
						<td>
						
							<c:choose>
								<c:when test="${sum ne -1 }">
									<fmt:formatNumber value='${sum }' pattern='#,###'/>원
								</c:when>
								<c:otherwise>
									0원
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th class="type2">평점</th>
						<td>${cnt ne 0 ? star : '없음'}
							<c:if test="${cnt ne 0 }">
								<sub>(${cnt }명 참여)</sub>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
<c:if test="${list[0].STATE ne 5}">
	<div style="float: left; width: 10%; text-align: left">
	<button type="button" class="btn btn-default" onclick="cancel('/admin/sales/product/product_del.ja?num=${list[0].ORDER_NUM }');">삭제</button>
	</div>
</c:if>		
	<div style="float: right; width: 33%; text-align: right">
	<button type="button" class="btn btn-default" onclick="cancel('/admin/sales/product/product_list.ja?&p=${params.p}&type=${params.type }&value=${params.value}&first=${params.first}&second=${params.second}&on=${params.on}&sort=${params.sort}');">목록</button>
	</div>
		</div>
	</div>
</div>

<script>
var ori;
function modify(){
	orib =$("#stateb").html();
	oris =$("#states").html();
	nowb = $("#stateb").val();
	nows = $("#states").val();
	$.ajax({
		'url':"/admin/sales/product/product_modify.ja",
		'data':{
			'nowb':$("#stateb").val(),
			'nows':$("#states").val()
		}
	}).done(function(rst){
		$("#bc").html(rst.htmlb);
		$("#sc").html(rst.htmls);
		$("#modify").html("<button id='submit' style='height: 25px;' onclick='submit();'>변경</button><button id='cancels' style='height: 25px;' onclick='cancels();'>취소</button>");
		
	});
};

function sel(){
	$.ajax({
		'url':"/admin/sales/product/product_modify2.ja",
		'data':{
			'sel':$(this).val()
		}
	}).done(function(rst){
		$("#sc").html(rst.html);
	});
}
function submit(){
	var tmp = $("#stsel").val();
	var state = $("#"+tmp).html();
	$.ajax({
		'url':"/admin/sales/order/order_modifyExec.ja",
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
function cancels(){
	$("#modify").html("<button id='mbutton' style='height: 25px;' onclick='modify();'>수정</button>");
	$("#st").html(ori);
};
</script>
<script src="<c:url value="/etc.js" />"></script>