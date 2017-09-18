<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<style>
	table, th, td {
		font-size: 13px;
	}
	.btn-custom {
	  background-color: hsl(0, 0%, 16%) !important;
	  background-repeat: repeat-x;
	  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#5b5b5b", endColorstr="#282828");
	  background-image: -khtml-gradient(linear, left top, left bottom, from(#5b5b5b), to(#282828));
	  background-image: -moz-linear-gradient(top, #5b5b5b, #282828);
	  background-image: -ms-linear-gradient(top, #5b5b5b, #282828);
	  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #5b5b5b), color-stop(100%, #282828));
	  background-image: -webkit-linear-gradient(top, #5b5b5b, #282828);
	  background-image: -o-linear-gradient(top, #5b5b5b, #282828);
	  background-image: linear-gradient(#5b5b5b, #282828);
	  border-color: #282828 #282828 hsl(0, 0%, 11%);
	  color: #fff !important;
	  border-radius: 0px;
	  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.33);
	  -webkit-font-smoothing: antialiased;
	}
	
	.wrap {
		width:80%; margin-left:10%;
	}
	.wrap .table {
		table-layout: fixed;
	}
	.wrap .table td {
	    overflow: hidden;
	    text-overflow:ellipsis; /*overflow: hidden; 속성과 같이 써줘야 말줄임 기능이 적용된다.*/
	    white-space:nowrap; /*<td>보다 내용이 길경우 줄바꿈 되는것을 막아준다.*/
	}
	
	
	#btn { width: 85px; height: 22px; font-size: 11px; padding: 0px; }
	small { color:gray; }
	.table a {color:black;}
</style>
<div class="wrap">
	<div style="text-align:right">
		<div style="margin-top: 20px; text-align:left">
				<span class="glyphicon glyphicon-info-sign" style="padding-right: 10px;"></span>
				<b style="padding-right:10px; ">주문 현황</b>
				<small style="font-size: 12px;">고객님께서 판매한 상품의 주문 현황 페이지입니다</small><br>
		</div>
		<b style="padding-right:6%;">총 <font color="#ff4d4d">${total}</font>건</b>
	</div>
	
		<table class="table" style="margin-top: 10px;" >
			<thead>
				<tr style="border-top: 3px solid black;">
					<th width="10%">주문번호</th>
					<th width="10%">상품번호</th>
					<th width="10%">주문수량</th>
					<th width="10%">주문상태</th>
					<th width="20%">주문일자</th>
					<th width="20%">결제일자</th>
					<th width="10%">가격</th>
					<th width="10%">쿠폰타입</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr><td colspan="8" align="center">사용자가 주문한 상품이 없습니다.</td></tr>
				</c:if>
				<c:forEach var="i" items="${list}">
					<tr>
						<td width="10%">${i.ORDER_NUM}</td>
						<td width="10%">${i.PRO_NUM }</td>
						<td width="5%"><fmt:formatNumber value="${i.ORDER_QTY}" type="number"/></td>
						<td width="5%">${i.ST}</td>
						<td width="10%"><fmt:formatDate value="${i.ORDER_DATE}" pattern="yyyy-MM-dd"/></td>
						<td width="10%"><fmt:formatDate value="${i.PAY_DATE}"  pattern="yyyy-MM-dd"/></td>
						<td width="10%"><fmt:formatNumber value="${i.PRICE}"  type="number"/></td>
						<td width="5%">${i.CUPON_TYPE}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			
						<%-- <td width="10%">${i.ETC }</td>
						<td width="10%">${i.ADDRESS }</td>
						<td width="10%">${i.RECEIVER }</td> 
						<td width="5%">${i.CHARGE}</td>--%>
	
	
	
		<!-- 페이지 -->
		<div align="center">
			<ul class="pagination">
				<c:if test="${page.startPageNo ne 1}"><!-- 이전 -->
					<li><a href="/seller/order/list.j?p=${page.startPageNo-1}">&laquo;</a></li>
				</c:if>
			<c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}">
				<c:choose>
					<c:when test="${i eq p}">
						<li class="active"><a href="#">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/seller/order/list.j?p=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:if test="${page.endPageNo ne page.finalPageNo}"><!-- 다음 -->
					<li><a href="/seller/order/list.j?p=${page.endPageNo+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
</div>	