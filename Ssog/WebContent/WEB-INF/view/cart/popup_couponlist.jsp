<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" style="padding-top: 10px;">
	<div class="col-sm-12">
		<div class="tab-content">
	<div id="home" class="tab-pane fade in active">
		<table class="table table-hover">
			<thead>
				<tr style="border-bottom: 2px solid #595959;">
					<th>구분</th>
					<th>쿠폰종류</th>
					<th>쿠폰선택</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="i" items="${list }">
				<tr>
					<td>${i.CUPON_LIST_ID }</td>
					<td>${i.CUPON_TYPE }</td>
					<td><button>사용하기</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="menu1" class="tab-pane fade">
		과거 사용하셨거나 발급 후 유효기간이 종료되어 더 이상 사용이 불가능한 쿠폰 내역입니다.
		<table class="table table-hover">
			<thead>
				<tr>
					<th>쿠폰ID</th>
					<th>쿠폰명</th>
					<th>할인액(율)</th>
					<th>상태</th>
					<th>발급일<br />(유효기간)
					</th>
					<th>사용조건</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1000</td>
					<td>15% 쿠폰</td>
					<td>6,000원</td>
					<td></td>
					<td>2016-10-09<br />~2017-09-01
					</td>
					<td>50만원이상</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
	</div>
	</div>