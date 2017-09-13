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
						<td>${list['0'].ORDER_NUM }</td>
					</tr>
					<tr>
						<th class="type">상품번호</th>
						<td>${list['0'].PRO_NUM }</td>
					</tr>
					<tr>
						<th class="type">상품이름</th>
						<td>${list['0'].PNAME }</td>
					</tr>
					<tr>
						<th class="type">구매자</th>
						<td>${list['0'].USER_ID }</td>
					</tr>
					<tr>
						<th class="type">주문가격</th>
						<td>${list['0'].PRICE }</td>
					</tr>
					<tr>
						<th class="type">할인율</th>
						<td>
						<c:choose>
							<c:when test="${list['0'].RATE eq 0}">
								할인없음
							</c:when>
							<c:otherwise>
								${list['0'].RATE }%
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th class="type">주문개수</th>
						<td>${list['0'].ORDER_QTY }</td>
					</tr>
					<tr>
						<th class="type">주문상태</th>
						<td>${list['0'].ST }</td>
					</tr>
					<c:forTokens items="${list['0'].ADDRESS }" delims="!" var="i" varStatus="vs">
						<tr>
							<c:if test="${vs.first }">
								<th rowspan="3" class="type">배송지</th>
							</c:if>
							<td>${i }</td>
						</tr>
					</c:forTokens>
					<tr>
						<th class="type">기타사항</th>
						<td>${list['0'].ETC }</td>
					</tr>
					<tr>
						<th class="type">주문일자</th>
						<td><fmt:formatDate value="${list['0'].ORDER_DATE }"
								pattern="yyyy년MM월dd일" var="i" />${i }</td>
					</tr>
					<tr>
						<th class="type">결제일자</th>
						<td>
						<c:choose>
							<c:when test="${empty list['0'].PAY_DATE }">
								미결제
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${list['0'].PAY_DATE }" pattern="yyyy년MM월dd일" var="i" />${i }
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
						<td>${list['0'].PRO_NUM }</td>
					</tr>
					<tr>
						<th class="type">상품이름</th>
						<td>${list['0'].PNAME }</td>
					</tr>
					<tr>
						<th class="type">판매자</th>
						<td>${list['0'].SELLER_ID }</td>
					</tr>
					<tr>
						<th class="type">등록일자</th>
						<td>${list['0'].PRO_DATE }</td>
					</tr>
					<tr>
						<th class="type">상품가격</th>
						<td>${list['0'].PRICE_ORIGIN }</td>
					</tr>
					<tr>
						<th rowspan="2" class="type">카테고리</th>
						<td>${list['0'].NAMEP }</td>
					</tr>
					<tr>
						<td>${list['0'].NAME }</td>
					</tr>
					<tr>
						<th class="type">원산지</th>
						<td>${list['0'].ORI }</td>
					</tr>
					<tr>
						<th class="type">남은수량</th>
						<td>${list['0'].PRO_QTY }</td>
					</tr>
					<tr>
						<th class="type">판매여부</th>
						<td>${list['0'].SELL_ON == 1 ? '판매중' : '판매중단' }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>