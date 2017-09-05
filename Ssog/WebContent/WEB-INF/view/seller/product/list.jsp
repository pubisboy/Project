<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.border_none	{border-collapse:collapse;}
	.border_none td {border-bottom:1px solid gray;}
	.border_none th {text-align:left;}
	.border_none a	{color:black;}
	
	.small	 {font-size:14px;}
	#pro_num { color:gray; font-size:14px; }
</style>

<form method="post">
	<table class="border_none" width="90%">	
	<tr><th colspan="8">판매자 페이지 상품 목록</th></tr>
		<ul class="breadcrumb">
			<c:choose>
				<c:when test="${param.sort eq null or param.sort eq ''}">
				    <li><b>전체</b></li>
				</c:when>
				<c:otherwise>
					<li><a href="/seller/product/list.j">전체</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${param.sort eq '판매중'}">
				    <li><b>판매중</b></li>
				</c:when>
				<c:otherwise>
			 		<li><a href="/seller/product/list.j?sort=1">판매중</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${param.sort eq '판매완료'}">
				    <li><b>판매완료</b></li>
				</c:when>
				<c:otherwise>
					<li><a href="/seller/product/list.j?sort=0">판매완료</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	<tr align="center">
		<td bgcolor="gray" width="10%"><font color="white">상품번호</font></td>
		<td bgcolor="gray" width="10%"><font color="white">카테고리</font></td>
		<td bgcolor="gray" width="15%"><font color="white">상품명</font></td>
		<td bgcolor="gray" width="10%"><font color="white">판매수량</font></td>
		<td bgcolor="gray" width="10%"><font color="white">가격</font></td>
		<td bgcolor="gray" width="15%"><font color="white">상품등록일자</font></td>
		<td bgcolor="gray" width="10%"><font color="white">원산지</font></td>
		<td bgcolor="gray" width="10%"><font color="white">판매상태</font></td>
	</tr>
	
		<!-- 글 없을 때 -->
		<c:if test="${empty list}"><!-- ${list.size()==0} -->
			<tr>
				<td colspan="8" align="center">판매한 상품이 없습니다.</td>
			</tr>
		</c:if>
		
	<c:forEach var="i" items="${list}">
		<tr align="center" class="small">
			<td><a href="#?pro_num=${i.PRO_NUM}" id="pro_num">${i.PRO_NUM}</a></td>
			<td>${i.CATE}</td>
			<td><a href="#?pro_num=${i.PRO_NUM}">${i.PRO_NAME}</a></td>
			<td><fmt:formatNumber value="${i.PRO_QTY}" type="number"/></td>
			<td><fmt:formatNumber value="${i.PRICE}" type="number"/></td>
			<td><fmt:formatDate value="${i.PRO_DATE}"  pattern="yyyy-MM-dd"/></td>
			<td>${i.ORIGIN}</td>
			<td>${i.SELL_ON}</td>
		</tr>		
	</c:forEach>
	
	<tr>
		<th colspan="8"><br>
			<button type="button" onClick="location='#'" class="btn">버튼</button>
			<button type="button" onClick="location='#'" class="btn">버튼</button>
		</th>
	</tr>
	</table>
</form>


<!-- 페이지 -->
<div class="container">
	<ul class="pagination">
	<c:forEach var="i" begin="1" end="${total}">
		<c:choose>
			<c:when test="${i eq p}">
				<li class="active"><a href="#">${i}</a></li>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${param.search_type ne null}">
						 <li><a href="/seller/product/list.j?p=${i}&sort=${param.sort}&search_type=${param.search_type}&search_word=${param.search_word}">${i}</a>
					</c:when>
					<c:otherwise>
						 <li><a href="/seller/product/list.j?p=${i}&sort=${param.sort}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</ul>
</div>



	<!-- 검색창. form에 action 경로에는 실제 주소만 됨. 파라미터 추가 설정하고 싶을 땐 hidden 속성을 이용 -->
	<form action="/seller/product/list_search.j">
		검색 <select name="search_type">
			<c:forTokens items="상품번호,상품명,카테고리,일자별,원산지,판매상태" delims="," var="opt">
				<option value="${opt}" ${opt eq param.search_type? 'selected' : ''}>${opt}</option>
			</c:forTokens>
		</select>
		<input type="text" name="search_word" value="${param.search_word}">
	</form>
    