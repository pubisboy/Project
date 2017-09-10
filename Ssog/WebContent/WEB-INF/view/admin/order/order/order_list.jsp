<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>총 건수 : ${total }</div>
<div>
	<form action="/admin/order/order_list.ja" method="get" id="stateForm">
		<input type="hidden" name="type" value="${empty params.type ? '' : params.type}"/>
		<input type="hidden" name="value" value="${empty params.value ? '' : params.value}"/>
		<select id="state" name="state">
			<option value="">전체</option>
			<c:forEach items="${stateKo }" var="i" varStatus="vs">
				<option value="${stateNum[vs.index] }" ${params.state eq stateNum[vs.index] ? 'selected' : ''}>${i }</option>
			</c:forEach>
		</select>
	</form>
</div>
<table class="table table-bordered" style="text-align: center;">
	<thead>
		<tr>
			<th width="25%;" style="text-align: center;">주문번호</th>
	       	<th width="25%;" style="text-align: center;">상품번호</th>
	       	<th width="20%;" style="text-align: center;">구매자</th>
	       	<th width="20%;" style="text-align: center;">판매자</th>
	       	<th width="10%;" style="text-align: center;">상태</th>
    	</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="i" varStatus="vs">
			<tr>
				<td><a href="/admin/order/order_detail.ja?order_num=${i.ORDER_NUM }">${i.ORDER_NUM }</a></td>
				<td>${i.PRO_NUM }</td>
				<td>${i.USER_ID }</td>
				<td>${i.SELLER_ID }</td>
				<td>${i.ST }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div align="center">
	<c:if test="${paging.startPageNo ne paging.firstPageNo }">
		<a href="/admin/order/order_list.ja?p=${paging.startPageNo - 1}&type=${params.type }&value=${params.value}&state=${params.state}">&lt;</a>
	</c:if>
	
	<c:forEach begin="${paging.startPageNo }" end="${paging.endPageNo }" var="i">
		<a href="/admin/order/order_list.ja?p=${i}&type=${params.type }&value=${params.value}&state=${params.state}" ${paging.currentPageNo eq i ? 'style="font-weight:bold"' : '' }>${i }</a>
	</c:forEach>
	
	<c:if test="${paging.endPageNo ne paging.finalPageNo }">
		<a href="/admin/order/order_list.ja?p=${paging.endPageNo + 1}&type=${params.type }&value=${params.value}&state=${params.state}">&gt;</a>
	</c:if>
</div>

<div align="center">
	<form action="/admin/order/order_list.ja" method="get">
		<select name="type">
			<option value="">전체</option>
			<c:forEach items="${typesKo }" var="i" varStatus="vs">
				<option value="${typesEn[vs.index] }" ${params.type eq typesEn[vs.index] ? 'selected' : ''}>${i }</option>
			</c:forEach>
		</select>
		<input type="text" name="value" value="${empty params.value ? '' : params.value}"/>
	</form>
</div>

<script>
	$("#state").on("change", function(){
		$("#stateForm").submit();
	})
</script>