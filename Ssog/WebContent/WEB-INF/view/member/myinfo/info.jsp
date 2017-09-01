<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-sm-6" style="height: 200px;">
		1:1 문의
		<hr style="margin: 0px; margin-top: 10px;" />
		<br /> 등록된 내용이 없습니다.
	</div>
	<div class="col-sm-6" style="height: 200px;">
		<table class="table table-condensed">
		<thead>
			<tr>
				<th>상품 Q&A</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="obj" items="${qlist }">
			<tr>
				<td>${obj.CONTENT }</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<div class="col-sm-12" style="height: 100px;">
		<b>최근 주문현황</b> <small>(최근 2개월 기준)</small>
		<hr style="margin: 0px; margin-top: 10px;" />
		주문완료 > 상품준비중 > 배송중 > 배송완료<br /> 0건 0건 0건 0건
	</div>
	<div class="col-sm-12" style="height: 100px;">
		<b>최근 주문내역</b> <small>(최근 2개월 기준)</small>
		<button>전체 주문내역 보기</button>
		<hr style="margin: 0px; margin-top: 10px;" />
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>주문일자</th>
						<th>주문번호</th>
						<th>주문상품</th>
						<th>결제금액</th>
						<th>상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="obj" items="${llist }">
						<tr>
							<td>${obj.ORDER_DATE }</td>
							<td>${obj.ORDER_NUM }</td>
							<td>${obj.PRO_NAME}</td>
							<td>${obj.PRICE }</td>
							<td>${obj.S }</td>
							<td><button>구매확정</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr />
		</div>
	</div>
</div>
