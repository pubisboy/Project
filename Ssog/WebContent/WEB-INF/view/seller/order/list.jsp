<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<style>
	table, th, td {
		font-size: 13px;
		white-space: nowrap;
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
	
	/* 검색창 */
	input[type=text] {
	    width: 150px;
	    box-sizing: border-box;
	    font-size: 16px;
	    padding: 5px 5px;
	    -webkit-transition: width 0.4s ease-in-out;
	    transition: width 0.4s ease-in-out;
	}
	
	.search { 
		vertical-align:bottom; 
		height:26px; 
		border:1px solid #ccc; 
		border-radius: 3px;
	}
	
	#search_form { margin-top:80px;}
	#tab_state li { list-style: none; float:left; margin:1px; display:inline-block;}
	
	.chk { cursor:pointer; color:gray; font-weight:bold; }
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
	
	
	<ul id="tab_state" style="width:40%;">
			<c:choose>
				<c:when test="${param.state eq null or param.state eq ''}">
				    <li><b>전체</b></li>
				</c:when>
				<c:otherwise>
					<li><a href="/seller/order/list.j">전체</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.state eq 2}">
				   <li><b>결제완료</b></li>
				</c:when>
				<c:otherwise>
			 		<li><a href="/seller/order/list.j?state=2">결제완료</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.state eq 4}">
				    <li><b>배송완료</b></li>
				</c:when>
				<c:otherwise>
					<li><a href="/seller/order/list.j?state=4">배송완료</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.state eq 5}">
				    <li><b>구매확정</b></li>
				</c:when>
				<c:otherwise>
					<li><a href="/seller/order/list.j?state=5">구매확정</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		
		
		<table class="table" style="margin-top: 10px;" border=1>
			<thead>
				<tr style="border-top: 3px solid black;">
					<th width="10%">주문번호</th>
					<th width="10%">상품번호</th>
					<th width="15%">주문일자</th>
					<th width="15%">결제일자</th>
					<th width="11%">가격</th>
					<th width="8%">할인율</th>
					<th width="5%">수량</th>
					<th width="10%">주문상태</th>
					<th width="11%">상태</th>
					<th width="5%"></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr><td colspan="10" align="center">사용자가 주문한 상품이 없습니다.</td></tr>
				</c:if>
				<c:forEach var="i" items="${list}">
					<tr id="parent">
						<td class="order_num" id="${i.ORDER_NUM}">[${i.ORDER_NUM}]</td>
						<td>[${i.PRO_NUM }]</td>
						<td><fmt:formatDate value="${i.ORDER_DATE}" pattern="yyyy/MM/dd"/></td>
						<td><fmt:formatDate value="${i.PAY_DATE}"  pattern="yyyy/MM/dd"/></td>
						<td><fmt:formatNumber value="${i.PRICE-(i.PRICE*i.RATE*0.01)}"  type="number" pattern="#,###"/>원</td>
						<c:choose>
							<c:when test="${i.CUPON_TYPE eq null}">
								<td><font color="red">(없음)</font></td>
							</c:when>
							<c:otherwise>
								<td align="center"><font color="red">(${i.RATE}%)</font></td>
							</c:otherwise>
						</c:choose>
						<td align="center"><fmt:formatNumber value="${i.ORDER_QTY}" type="number"/>kg</td>
						<!-- 주문상태 표시 -->
						<td><b class="st">${i.ST}</b></td>
						<td id="sub-parent">
							<c:choose>
								<c:when test="${i.ST eq '배송완료'}">
									<font class="chk" color="green">배송완료</font>
								</c:when>
								<c:otherwise>
									<font class="chk" color="gray">배송중</font>
								</c:otherwise>
							</c:choose>
							
						</td>
						<td><span class="glyphicon glyphicon-plus-sign btn"></span></td>
					</tr>
				 	<tr id="parent" style="display:none;">
				 		<td>
				 			<div id="sub">
					 		${i.ETC }
							${i.ADDRESS }
							${i.RECEIVER } 
							${i.CHARGE}
							</div>
				 		</td>
				 	</tr>
				</c:forEach>
			</tbody>
		</table>
			
						
		
		<!-- 검색창. form에 action 경로에는 실제 주소만 됨. 파라미터 추가 설정하고 싶을 땐 hidden 속성을 이용 -->
		<form action="/seller/order/list.j" id="search_form"  style="align:center;">
			<input type="hidden" value="${param.state}" name="state">
			<table align="center">
				<tr>
					<td>
						<select name="search_type" class="search" style="width:90px">
							<c:forTokens items="receiver,order_num" delims="," var="opt">
								<option value="${opt}" ${opt eq param.search_type? 'selected' : ''}><custom:ordersearch message="${opt}"/></option>
							</c:forTokens>
						</select>
						<input type="text" name="search_word" value="${param.search_word}" class="search">
					</td>
					<td>
						 <button type="submit" class="btn btn-default btn-sm search btn-custom search" style="width:30px; padding:2px; margin-left:2px; border-radius: 3px;">
						 	<span class="glyphicon glyphicon-search"></span>
				         </button>
					</td>
				</tr>
			</table>
		</form>
		
		
	
	
		<!-- 페이지 -->
		<div align="center" style="margin-top:5%">
			<ul class="pagination">
				<c:if test="${page.startPageNo ne 1}"><!-- 이전 -->
					<li><a href="/seller/order/list.j?p=${page.startPageNo-1}&state=${param.state}&search_type=${param.search_type}&search_word=${param.search_word}">&laquo;</a></li>
				</c:if>
			<c:forEach var="i" begin="${page.startPageNo}" end="${page.endPageNo}">
				<c:choose>
					<c:when test="${i eq p}">
						<li class="active"><a href="#">${i}</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${param.search_type ne null}">
								 <li><a href="/seller/order/list.j?p=${i}&state=${param.state}&search_type=${param.search_type}&search_word=${param.search_word}">${i}</a></li>
							</c:when>
							<c:otherwise>
								 <li><a href="/seller/order/list.j?p=${i}&state=${param.state}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:if test="${page.endPageNo ne page.finalPageNo}"><!-- 다음 -->
					<li><a href="/seller/product/list.j?p=${page.endPageNo+1}&state=${param.state}&search_type=${param.search_type}&search_word=${param.search_word}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
</div>	

<script>
	$(".chk").on("click", function(){
		var t = $(this);
		var order_num = $(this).parent().parent().children().attr("id");
		
		$.ajax({
			url : "/seller/order/stateAjax.j",
			method: "get",
			data : { 
					"order_num" : order_num,
					"state" : 3,
					"flag" : false,
			}
		}).done(function(obj){ 
			obj.state
			if(obj.flag){
				t.text("배송완료");
			} else {
				t.text("배송중");
			}
		});
		location.reload();
	});
	
	$(document).ready(function(){
	    $(".btn").click(function(){
	        $("#sub").slideToggle("slow");
	    });
	});
</script>