<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
table, th, td {
	font-size: 13px;
}
</style>
<div class="row">
	<div class="col-sm-6" style="height: 200px;">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th style="border-bottom: 2px solid #595959;">1:1 문의</th>
					<th style="padding-left: 150px; border-bottom: 2px solid #595959;"><a
						href="/member/myinfo/counsel.j"><small>+ 더보기</small></a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${clist }">
					<tr>
						<td style="width: 120px;">${obj.CONTENT }</td>
						<td align="center" style="padding-left: 80px; width: 80px;"><fmt:formatDate
								value="${obj.COUNSEL_DATE }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${clist.size() eq 0 }">
			등록된 내용이 없습니다.
		</c:if>
	</div>
	<div class="col-sm-6" style="height: 200px;">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th style="border-bottom: 2px solid #595959;">상품 Q&A</th>
					<th style="padding-left: 150px; border-bottom: 2px solid #595959;"><a
						href="/member/myinfo/qna.j"><small>+ 더보기</small></a>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${qlist }">
					<tr>
						<td style="width: 120px;">${obj.CONTENT }</td>
						<td align="center" style="padding-left: 100px; width: 80px;"><fmt:formatDate
								value="${obj.QANDADATE }" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${qlist.size() eq 0 }">
			등록된 내용이 없습니다.
		</c:if>
	</div>
	<div class="col-sm-12" style="height: 100px;">
		<div style="padding-bottom: 10px;">
		<b>최근 주문현황</b> <small>(최근 2개월 기준)</small>
		</div>
		<div style="border-top: 2px solid #595959; border-bottom: 1px solid #a6a6a6; padding-top: 10px; padding-bottom: 10px;"> 
			주문완료 > 상품준비중 > 배송중 > 배송완료<br /> 0건 0건 0건 0건
		</div>
		
	</div>
	<div class="col-sm-12" style="height: 100px;">
		<div style=" padding-bottom: 10px;">
		<b>최근 주문내역</b> <small>(최근 2개월 기준)</small>
		<button>전체 주문내역 보기</button>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr style="border-top: 2px solid #595959;">
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
