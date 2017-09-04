<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
div.gallery {
	margin: 2.5%;
	border: 1px solid #ccc;
	float: left;
	width: 220px;
	height: 250px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: 70%;
}

div.desc {
	padding: 15px;
	text-align: center;
}
</style>
<div class="container" align="center">
	<h2>판매 품목들</h2>
	<div align="right">
		<a href="/product/list.j?search=${param.search }&category=${param.category}&sort=date"> 최신순</a> | 
		<a href="/product/list.j?search=${param.search }&category=${param.category}&sort=bestseller"> 판매순 </a> |
		<a href="/product/list.j?search=${param.search }&category=${param.category}&sort=price_a"> 낮은가격순</a> |
		<a href="/product/list.j?search=${param.search }&category=${param.category}&sort=price_d"> 높은가격순 </a>
	</div>
	<c:forEach items="${list }" var="i">
		<div class="gallery">
			<a target="_blank" href="fjords.jpg"> <img src="/image/다운로드.jpg"
				alt="Fjords" width="300" height="200">
			</a>
			<div class="desc"><div>${i.PRO_NAME }</div>
			<div>${i.PRO_DATE }   ${i.PRICE }</div>
			 </div>
		</div>
	</c:forEach>

</div>

<div class="container" style="margin-top: 20px;" align="center">
	<ul class="pager">

		<ul class="pagination pagination-lg">
			<c:if test="${paging.startPageNo ne 1 }">
				<li><a
					href="/product/list.j?category=${param.category }&page=${paging.startPageNo-1}&search=${param.search}&sort=${param.sort}">&lt;</a></li>
			</c:if>
			<c:forEach begin="${paging.startPageNo }" end="${paging.endPageNo }"
				var="i">
				<li><a
					href="/product/list.j?category=${param.category }&page=${i}&search=${param.search}&sort=${param.sort}">${i }</a></li>
			</c:forEach>
			<c:if test="${paging.endPageNo ne paging.finalPageNo }">
				<li><a
					href="/product/list.j?category=${param.category }&page=${paging.endPageNo+1}&search=${param.search}&sort=${param.sort}">&gt;</a></li>
			</c:if>
		</ul>
	</ul>
</div>