<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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

table, th, td, tr {
	border: 0px solid black;
	text-align: left;
}

li {
	display: inline;
}
</style>
<div class="container" align="center">
	<div class="row"
		style="border-top: 2px solid black; border-bottom: 1px solid black; height: 200px; padding: 0px;">
		<div class="col-sm-10"
			style="padding: 0px;  padding: 0px;"> 
			<div class="row"
				style="border-top: 1px solid black; height: 20%; width: 100%; padding: 10px;">조건
				검색</div>
			<div class="row"
				style="border-top: 1px solid black; border-bottom: 1px solid black; height: 65%; width: 100%">
				<div class="col-sm-3"
					style="border-right: 1px solid black; height: 100%; padding: 54px; margin: 0px;">원산지검색</div>
				<div class="col-sm-9"
					style="height: 100%; text-align: left; padding-top: 10px; overflow: hidden;">
					<table style="width: 100%;" border="0"> 
						<tr> 
							<th style="width: 33%;"></th>
							<th style="width: 33%"></th>
							<th style="width: 33%"></th>
						</tr>
						<c:forEach var="i" items="${originlist }" varStatus="vs">
							<c:if test="${vs.index eq 0 or vs.index eq 3 or vs.index eq 6}">
								<tr>
							</c:if>
							<td style="width: 33%;"><input type="checkbox" value="${i.NUM }" class="origin_group" >${i.NAME }</input></td>
							<c:if test="${vs.index eq 2 or vs.index eq 5 or vs.index eq 8}">
								</tr>
							</c:if>
						</c:forEach>


					</table>
				</div>
			</div>
			<div class="row" style="height: 15%; width: 100%; padding: 0px;">
				<div class="col-sm-3"
					style="border-right: 1px solid black; padding-top: 7px; padding-bottom: 5px;">선택한
					조건</div>
				<div class="col-sm-9 " style="padding-top: 7px; padding-bottom: 5px;"><span id="checked_origin">선택된거 나올곳</span></div>
			</div>
		</div>
		<div class="col-sm-2"
			style="padding: 0px; margin: 0px; border-bottom: 1px solid black;">
			<div class="row"
				style="height: 85%; border-bottom: 1px solid black; border-left: 1px solid black; padding: 0px; margin: 0px; vertical-align: bottom;">
				<div style="height: 80%;"></div>
				<div>
					<input type="text" style="width: 60px;"> ~ <input
						type="text" style="width: 60px;">
				</div>
			</div> 
			<div class="row" style="height: 15%; padding-top: 3px; padding-bottom:3px; margin: 0px;"> 
				<button type="button" id="origin_btn" class="btn-custom" style="font-size: 13px; width: 100%"> 검색 </button>    
				</div>
		</div>
	</div>
	<h2>판매 품목들</h2>
	<div align="right" style="margin-top: 25px;">
		<a
			href="/product/list.j?search=${param.search }&category=${param.category}&sort=date">
			최신순</a> | <a
			href="/product/list.j?search=${param.search }&category=${param.category}&sort=bestseller">
			판매순 </a> | <a
			href="/product/list.j?search=${param.search }&category=${param.category}&sort=price_a">
			낮은가격순</a> | <a
			href="/product/list.j?search=${param.search }&category=${param.category}&sort=price_d">
			높은가격순 </a>
	</div>

	<div style="margin-top: 25px;" align="left">
		<span style="color: red; font-size: 20px;">${total } 개</span> 의 상품이
		있습니다.
	</div>
	<c:forEach items="${list }" var="i">
		<div class="gallery">
			<a target="_blank" href="fjords.jpg"> <img src="/image/다운로드.jpg"
				alt="Fjords" width="300" height="200">
			</a>
			<div class="desc">
				<div>${i.PRO_NAME }</div>
				<div>${i.PRO_DATE }${i.PRICE }</div>
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
<script>

if($(".origin_group").prop("checked")){
	
}


</script>