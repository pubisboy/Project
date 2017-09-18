<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<canvas id="myChart" width="100%;" height="20%;"></canvas>
</div>

<div>검색 : ${total }건</div>

<table class="table table-bordered" style="text-align: center;">
	<thead>
		<tr>
			<th width="30%;" style="text-align: center;">날짜</th>
	       	<th style="text-align: center;">매출액</th>
    	</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="i" varStatus="vs">
			<tr>
				<td>${i.PAY_DATE }</td>
				<td>
					<fmt:formatNumber value="${i.PRICE }" pattern="#,###"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div align="center">
	<c:if test="${paging.startPageNo ne paging.firstPageNo }">
		<a href="/admin/sales/sales/chart.ja?p=${paging.startPageNo - 1}&sort=${params.sort}">&lt;</a>
	</c:if>
	
	<c:forEach begin="${paging.startPageNo }" end="${paging.endPageNo }" var="i">
		<a href="/admin/sales/sales/chart.ja?p=${i}&sort=${params.sort}" ${paging.currentPageNo eq i ? 'style="font-weight:bold"' : '' }>${i }</a>
	</c:forEach>
	
	<c:if test="${paging.endPageNo ne paging.finalPageNo }">
		<a href="/admin/sales/sales/chart.ja?p=${paging.endPageNo + 1}&sort=${params.sort}">&gt;</a>
	</c:if>
</div>

<script src="<c:url value="/etc.js" />"></script>