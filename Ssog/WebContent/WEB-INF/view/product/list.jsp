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
table ,th ,td , tr{
	border: 1px solid black	;
}
</style>
<div class="container" align="center">
	<div class="row">
		<div class="col-sm-9"
			style="border-top: 2px solid #404040; padding-right: 0px; padding-left: 37px; border-right: 1px solid #bfbfbf; border-bottom: ">
			<div style="border-bottom: 1px solid #bfbfbf; width: 570px;">
				<b>조건검색</b>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-2"
						style="border-bottom: 1px solid #bfbfbf; border-right: 1px solid #bfbfbf; width: 120px;">
						원산지선택</div>
					<div class="col-sm-10"
						style="border-bottom: 1px solid #bfbfbf; width: 449px;">
						체크박스있는곳들</div>
				</div>
				<div class="col-sm-12">
					<div class="col-sm-2"
						style="border-bottom: 1px solid #bfbfbf; border-right: 1px solid #bfbfbf; width: 120px">
						선택 조건</div>
					<div class="col-sm-10"
						style="border-bottom: 1px solid #bfbfbf; width: 449px;">
						<a href="">전체해제</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"
			style="border-top: 2px solid #404040;; width: 202px;">
			<br/>
			
			<input type="text"> <div>~</div>	<input type="text">
			<button>검색</button>
		</div>
		<div class="col-sm-12"></div>
	</div>
	<h2>판매 품목들</h2> 
	<div align="right" style="margin-top: 25px;">
		<a href="/product/list.j?search=${param.search }&category=${param.category}&sort=date"> 최신순</a> | 
		<a href="/product/list.j?search=${param.search }&category=${param.category}&sort=bestseller"> 판매순 </a> |
		<a href="/product/list.j?search=${param.search }&category=${param.category}&sort=price_a"> 낮은가격순</a> |
		<a href="/product/list.j?search=${param.search }&category=${param.category}&sort=price_d"> 높은가격순 </a>
	</div>
	
	<div style="margin-top: 25px;" align="left"><span style="color: red; font-size: 20px;">${total } 개</span> 의 상품이 있습니다.</div>
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