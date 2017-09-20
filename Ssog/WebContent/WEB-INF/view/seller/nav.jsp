<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.row ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    width: 200px;
	    background-color: #f1f1f1;
	}
	
	.row li a {
	    display: block;
	    color: #000;
	    padding: 8px 16px;
	    font-size: 12px;
	    color: gray;
	    text-decoration: none;
	    
	}
	
	.row li a.active {
		color: lightgray;
		font-weight:bold;
		font-size: 12px;
		background: rgb(46,61,68); /* Old browsers */
background: -moz-linear-gradient(top, rgba(46,61,68,1) 0%, rgba(43,58,65,1) 50%, rgba(42,53,60,1) 51%, rgba(43,57,71,1) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgba(46,61,68,1) 0%,rgba(43,58,65,1) 50%,rgba(42,53,60,1) 51%,rgba(43,57,71,1) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgba(46,61,68,1) 0%,rgba(43,58,65,1) 50%,rgba(42,53,60,1) 51%,rgba(43,57,71,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2e3d44', endColorstr='#2b3947',GradientType=0 ); /* IE6-9 */
		
	}
	
	.row li a:hover:not(.active) {
	    text-decoration:underline;
	}
</style>
<div class="wrap">
	<div style="border-top: 2px solid black; height: 100px; width: 200px;">
		<button style="width: 100%; height: 100%; " onClick="location='/seller/main.j'">
			<span class="glyphicon glyphicon-home" style="font-size: 18px;"></span>
				<c:choose>
					<c:when test="${sessionScope.seller_id ne null }">
						<b style="font-size: 20px;">${sessionScope.seller_id}님</b><br>
							<small style="color: #999999;">판매등급 : <br /> 
							<b style="font-size: 9px; color: #8c8c8c;">
							고객과 함께하는 쏙쇼핑몰</b>
							</small>
					</c:when>
					<c:otherwise>
						<b style="font-size: 20px;">판매자 페이지</b><br>
							<b style="font-size: 9px;color: #8c8c8c;">
							고객과 함께하는 쏙쇼핑몰</b>
					</c:otherwise>
				</c:choose>
		</button>
	</div>
	
	<ul class="nav nav-stacked nav-pills"
				style="margin-top: 0px; border-left: 1px solid #d9d9d9; border-right: 1px solid #d9d9d9; border-bottom: 1px solid #d9d9d9; width: 200px; text-align: left;">
		<li class="active"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1"
						style="color: #404040; font-size: 13px; border-top: 2px dotted #d9d9d9;">기본정보 관리</a></li>
		<li>
			<div id="collapse1" class="panel-collapse collapse in">
				<div class="panel-body" >
					<ul>
						<li><a href="/seller/info/info.j" >회원 정보</a></li>
						<li><a href="/seller/info/info_edit.j">회원 정보 변경</a></li>
						<li><a href="/seller/info/pass_edit.j">비밀번호 변경</a></li>
						<li><a href="/seller/delete.j">회원 탈퇴</a></li>
					</ul>
				</div>
			</div>
		</li>
		
		<li><a class="active">상품관리</a></li>
		<li><a href="/seller/product/productReg.j">상품등록</a></li>
		<li><a href="/seller/product/list.j">상품 목록</a></li>
		
		<li><a class="active">주문관리</a></li>
		<li><a href="/seller/order/list.j">주문/클레임 현황</a></li>
		<li><a href="#">매출 현황 보기</a></li>
		
		<li><a class="active">상담관리</a></li>
		<li><a href="#">상품 Q&A</a></li>
		<li><a href="/seller/counsel/review/list.j">상품 리뷰 보기</a></li>
		<li><a href="/seller/counsel/list.j">관리자에게 1:1 문의</a></li>
	</ul>
</div>
